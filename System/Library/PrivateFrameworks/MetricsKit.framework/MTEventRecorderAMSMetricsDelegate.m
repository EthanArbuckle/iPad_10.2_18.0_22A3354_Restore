@implementation MTEventRecorderAMSMetricsDelegate

void __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  MTMetricsKitOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Failed recording %@ event with error: %@", (uint8_t *)&v13, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (v8)
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Finished recording %@ event", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
  }

}

- (id)recordEvent:(id)a3 toTopic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  MTPromise *v11;
  AMSPromise *metricsBagPromise;
  MTPromise *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  MTPromise *v18;
  _QWORD v20[4];
  MTPromise *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MTMetricsKitOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v27 = (id)objc_opt_class();
    v28 = 2112;
    v29 = v8;
    v10 = v27;
    _os_log_impl(&dword_20D758000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Start recording %@ event", buf, 0x16u);

  }
  v11 = objc_alloc_init(MTPromise);
  objc_initWeak((id *)buf, self);
  metricsBagPromise = self->_metricsBagPromise;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke;
  v20[3] = &unk_24C7A0008;
  objc_copyWeak(&v25, (id *)buf);
  v13 = v11;
  v21 = v13;
  v14 = v6;
  v22 = v14;
  v15 = v7;
  v23 = v15;
  v16 = v8;
  v24 = v16;
  -[AMSPromise addFinishBlock:](metricsBagPromise, "addFinishBlock:", v20);
  v17 = v24;
  v18 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

  return v18;
}

- (id)amsContainerIdForTopic:(id)a3
{
  id v4;
  NSString *containerId;
  NSString *v6;
  void *v7;
  void *v8;

  v4 = a3;
  containerId = self->_containerId;
  if (containerId)
  {
    v6 = containerId;
  }
  else
  {
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metricsKitBundleIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __64__MTEventRecorderAMSMetricsDelegate_initWithContainerId_amsBag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("postFrequency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("postFrequency"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5 / 1000.0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setFlushTimeInterval:", v6);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("maxBatchSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("maxBatchSize"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    v11 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v11, "setMaximumBatchSize:", v10);

  }
}

- (id)flushUnreportedEvents
{
  MTEventRecorderAMSMetricsDelegate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MTPromise *v8;
  void *v9;
  MTPromise *v10;
  _QWORD v12[4];
  MTPromise *v13;

  v2 = self;
  objc_sync_enter(v2);
  -[MTEventRecorderAMSMetricsDelegate amsMetricsByTopic](v2, "amsMetricsByTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v2, "periodicQueuesByTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  if ((objc_msgSend(v4, "count") || objc_msgSend(v6, "count"))
    && (objc_msgSend(v6, "makeObjectsPerformSelector:", sel_flushObjects), objc_msgSend(v4, "count")))
  {
    objc_msgSend(v4, "mt_map:", &__block_literal_global_47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MTPromise);
    objc_msgSend(MEMORY[0x24BE08338], "promiseWithAll:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__MTEventRecorderAMSMetricsDelegate_flushUnreportedEvents__block_invoke_2;
    v12[3] = &unk_24C7A00B8;
    v10 = v8;
    v13 = v10;
    objc_msgSend(v9, "addFinishBlock:", v12);

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", &unk_24C7B81D8);
    v10 = (MTPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSMutableDictionary)amsMetricsByTopic
{
  return self->_amsMetricsByTopic;
}

- (void)setFlushTimeInterval:(double)a3
{
  MTEventRecorderAMSMetricsDelegate *v4;
  void *v5;
  void *v6;
  id v7;

  self->_flushTimeInterval = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v4, "periodicQueuesByTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("flushTimeInterval"));

}

- (NSMutableDictionary)periodicQueuesByTopic
{
  return self->_periodicQueuesByTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_periodicQueuesByTopic, 0);
  objc_storeStrong((id *)&self->_amsMetricsByTopic, 0);
  objc_storeStrong((id *)&self->_metricsBagPromise, 0);
  objc_storeStrong((id *)&self->_amsBag, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
}

void __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = objc_opt_class();
    objc_msgSend(WeakRetained, "_recordEvent:toTopic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke_2;
    v5[3] = &unk_24C79FFE0;
    v8 = v3;
    v6 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "addFinishBlock:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x24BDBD1B8]);
  }

}

- (id)_recordEvent:(id)a3 toTopic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  int64_t flushMode;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08270]), "initWithTopic:", v7);
  if ((isKindOfClass & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setAnonymous:", 1);
  }
  else if (-[MTEventRecorderAMSMetricsDelegate personalizedWithItunesAccount](self, "personalizedWithItunesAccount"))
  {
    if (!v8
      || (-[MTEventRecorderAMSMetricsDelegate lookupItunesAccount:](self, "lookupItunesAccount:", v8),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[MTEventRecorderAMSMetricsDelegate activeItunesAccount](self, "activeItunesAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "setAccount:", v11);

  }
  +[MTReflectUtil removeNullValuesFromDictionary:](MTReflectUtil, "removeNullValuesFromDictionary:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPropertiesWithDictionary:", v12);
  flushMode = self->_flushMode;
  switch(flushMode)
  {
    case 2:
      -[MTEventRecorderAMSMetricsDelegate setNumberOfPendingEvents:](self, "setNumberOfPendingEvents:", -[MTEventRecorderAMSMetricsDelegate numberOfPendingEvents](self, "numberOfPendingEvents") + 1);
      v25 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTEventRecorderAMSMetricsDelegate _flushEvents:topic:](self, "_flushEvents:topic:", v18, v7);
LABEL_19:

      break;
    case 1:
      MTMetricsKitOSLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = (void *)objc_opt_class();
        v21 = v20;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v20;
        v28 = 2112;
        v29 = v22;
        _os_log_impl(&dword_20D758000, v19, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: enqueue %@ event using in-memory queue", buf, 0x16u);

      }
      -[MTEventRecorderAMSMetricsDelegate setNumberOfPendingEvents:](self, "setNumberOfPendingEvents:", -[MTEventRecorderAMSMetricsDelegate numberOfPendingEvents](self, "numberOfPendingEvents") + 1);
      -[MTEventRecorderAMSMetricsDelegate periodicQueueForTopic:](self, "periodicQueueForTopic:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendObject:", v10);
      goto LABEL_19;
    case 0:
      MTMetricsKitOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v15;
        v28 = 2112;
        v29 = v17;
        _os_log_impl(&dword_20D758000, v14, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: enqueue %@ event using AMSMetrics", buf, 0x16u);

      }
      -[MTEventRecorderAMSMetricsDelegate amsMetricsForTopic:](self, "amsMetricsForTopic:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "enqueueEvent:", v10);
      goto LABEL_19;
  }
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (MTEventRecorderAMSMetricsDelegate)initWithContainerId:(id)a3 amsBag:(id)a4
{
  id v7;
  id v8;
  MTEventRecorderAMSMetricsDelegate *v9;
  MTEventRecorderAMSMetricsDelegate *v10;
  void *v11;
  uint64_t v12;
  AMSPromise *metricsBagPromise;
  AMSPromise *v14;
  uint64_t v15;
  NSMutableDictionary *amsMetricsByTopic;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = -[MTEventRecorderAMSMetricsDelegate init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerId, a3);
    *(_DWORD *)&v10->_monitorsLifecycleEvents = 16843009;
    v10->_flushTimeInterval = 60.0;
    v10->_maximumBatchSize = 500;
    objc_msgSend(v8, "dictionaryForKey:", CFSTR("metrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valuePromise");
    v12 = objc_claimAutoreleasedReturnValue();
    metricsBagPromise = v10->_metricsBagPromise;
    v10->_metricsBagPromise = (AMSPromise *)v12;

    objc_initWeak(&location, v10);
    v14 = v10->_metricsBagPromise;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __64__MTEventRecorderAMSMetricsDelegate_initWithContainerId_amsBag___block_invoke;
    v25 = &unk_24C79FF48;
    objc_copyWeak(&v26, &location);
    -[AMSPromise addFinishBlock:](v14, "addFinishBlock:", &v22);
    objc_storeStrong((id *)&v10->_amsBag, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1, v22, v23, v24, v25);
    v15 = objc_claimAutoreleasedReturnValue();
    amsMetricsByTopic = v10->_amsMetricsByTopic;
    v10->_amsMetricsByTopic = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BE08058], "registerBagKeySetForMetricsRecorder:", v8);
    MTMetricsKitOSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (id)objc_opt_class();
      -[MTEventRecorderAMSMetricsDelegate containerId](v10, "containerId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "profile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_20D758000, v17, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Created new object with container: %@ bag profile: %@", buf, 0x20u);

    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)amsMetricsForTopic:(id)a3
{
  id v4;
  MTEventRecorderAMSMetricsDelegate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  MTEventRecorderAMSMetricsDelegate *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTEventRecorderAMSMetricsDelegate amsMetricsByTopic](v5, "amsMetricsByTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MTEventRecorderAMSMetricsDelegate amsContainerIdForTopic:](v5, "amsContainerIdForTopic:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEventRecorderAMSMetricsDelegate amsMetricsObjectCache](MTEventRecorderAMSMetricsDelegate, "amsMetricsObjectCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[MTEventRecorderAMSMetricsDelegate amsBag](v5, "amsBag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%lu"), v8, objc_msgSend(v11, "hash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __56__MTEventRecorderAMSMetricsDelegate_amsMetricsForTopic___block_invoke;
    v23[3] = &unk_24C79FF90;
    v13 = v8;
    v24 = v13;
    v25 = v5;
    objc_msgSend(v9, "objectForKeyedSubscript:creation:", v12, v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFlushTimerEnabled:", v5->_flushTimerEnabled);
    objc_msgSend(v7, "setMaxBatchSize:", v5->_maximumBatchSize);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setMonitorsLifecycleEvents:", -[MTEventRecorderAMSMetricsDelegate monitorsLifecycleEvents](v5, "monitorsLifecycleEvents"));
    -[MTEventRecorderAMSMetricsDelegate amsMetricsByTopic](v5, "amsMetricsByTopic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, v4);

    MTMetricsKitOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (id)objc_opt_class();
      -[MTEventRecorderAMSMetricsDelegate amsBag](v5, "amsBag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "profile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v16;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_20D758000, v15, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Created new AMSMetrics for containerId: %@ bag profile: %@", buf, 0x20u);

    }
  }
  objc_sync_exit(v5);

  if (!v7)
  {
    MTMetricsKitOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      v21 = v20;
      _os_log_impl(&dword_20D758000, v19, OS_LOG_TYPE_ERROR, "MetricsKit: %@: Failed to create AMSMetrics, check to make sure AMSBag is provided.", buf, 0xCu);

    }
  }

  return v7;
}

id __56__MTEventRecorderAMSMetricsDelegate_amsMetricsForTopic___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BE08258]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "amsBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithContainerID:bag:", v3, v4);

  return v5;
}

- (AMSBagProtocol)amsBag
{
  return self->_amsBag;
}

- (BOOL)monitorsLifecycleEvents
{
  return self->_monitorsLifecycleEvents;
}

+ (id)amsMetricsObjectCache
{
  if (amsMetricsObjectCache_onceToken != -1)
    dispatch_once(&amsMetricsObjectCache_onceToken, &__block_literal_global);
  return (id)amsMetricsObjectCache_cache;
}

- (MTEventRecorderAMSMetricsDelegate)initWithContainerId:(id)a3 profileName:(id)a4 profileVersion:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  MTEventRecorderAMSMetricsDelegate *v11;

  v8 = (void *)MEMORY[0x24BE08048];
  v9 = a3;
  objc_msgSend(v8, "bagForProfile:profileVersion:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MTEventRecorderAMSMetricsDelegate initWithContainerId:amsBag:](self, "initWithContainerId:amsBag:", v9, v10);

  return v11;
}

void __58__MTEventRecorderAMSMetricsDelegate_amsMetricsObjectCache__block_invoke()
{
  MTNonretainedCache *v0;
  void *v1;

  v0 = objc_alloc_init(MTNonretainedCache);
  v1 = (void *)amsMetricsObjectCache_cache;
  amsMetricsObjectCache_cache = (uint64_t)v0;

}

- (id)periodicQueueForTopic:(id)a3
{
  id v4;
  MTEventRecorderAMSMetricsDelegate *v5;
  void *v6;
  void *v7;
  void *v8;
  MTPeriodicQueue *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v5, "periodicQueuesByTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEventRecorderAMSMetricsDelegate setPeriodicQueuesByTopic:](v5, "setPeriodicQueuesByTopic:", v7);

  }
  -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v5, "periodicQueuesByTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (MTPeriodicQueue *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MTPeriodicQueue);
    -[MTPeriodicQueue setFlushTimeInterval:](v9, "setFlushTimeInterval:", v5->_flushTimeInterval);
    -[MTPeriodicQueue setFlushTimerEnabled:](v9, "setFlushTimerEnabled:", v5->_flushTimerEnabled);
    -[MTPeriodicQueue setMaximumBatchSize:](v9, "setMaximumBatchSize:", v5->_maximumBatchSize);
    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__MTEventRecorderAMSMetricsDelegate_periodicQueueForTopic___block_invoke;
    v13[3] = &unk_24C79FFB8;
    objc_copyWeak(&v15, &location);
    v10 = v4;
    v14 = v10;
    -[MTPeriodicQueue setFlushHandler:](v9, "setFlushHandler:", v13);
    -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v5, "periodicQueuesByTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);

  return v9;
}

void __59__MTEventRecorderAMSMetricsDelegate_periodicQueueForTopic___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_flushEvents:topic:", v4, *(_QWORD *)(a1 + 32));

}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  _BOOL8 v3;
  MTEventRecorderAMSMetricsDelegate *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  self->_monitorsLifecycleEvents = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTEventRecorderAMSMetricsDelegate amsMetricsByTopic](v4, "amsMetricsByTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "setMonitorsLifecycleEvents:", v3, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)setTransactionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  MTEventRecorderAMSMetricsDelegate *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  v4->_transactionEnabled = v3;
  if (v3)
  {
    if (v4->_numberOfPendingEvents >= 1)
      -[MTEventRecorderAMSMetricsDelegate _beginTransaction](v4, "_beginTransaction");
  }
  else
  {
    -[MTEventRecorderAMSMetricsDelegate _endTransaction](v4, "_endTransaction");
  }
  MTMetricsKitOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = (id)objc_opt_class();
    v9 = 1024;
    v10 = v3;
    v6 = v8;
    _os_log_impl(&dword_20D758000, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Updated transactionEnabled to %d", (uint8_t *)&v7, 0x12u);

  }
  objc_sync_exit(v4);

}

- (void)setFlushMode:(int64_t)a3
{
  MTEventRecorderAMSMetricsDelegate *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (-[NSMutableDictionary count](v4->_amsMetricsByTopic, "count")
    || -[NSMutableDictionary count](v4->_periodicQueuesByTopic, "count"))
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Flush mode cannot be changed after recording events for the class %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  objc_sync_exit(v4);

  v4->_flushMode = a3;
  MTMetricsKitOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v14 = (id)objc_opt_class();
    v15 = 2048;
    v16 = a3;
    v6 = v14;
    _os_log_impl(&dword_20D758000, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Updated flushMode to %ld", buf, 0x16u);

  }
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  MTEventRecorderAMSMetricsDelegate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_flushTimerEnabled = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTEventRecorderAMSMetricsDelegate amsMetricsByTopic](v4, "amsMetricsByTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v4, "periodicQueuesByTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("flushTimerEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("flushTimerEnabled"));

}

- (void)setMaximumBatchSize:(int64_t)a3
{
  MTEventRecorderAMSMetricsDelegate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  self->_maximumBatchSize = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTEventRecorderAMSMetricsDelegate amsMetricsByTopic](v4, "amsMetricsByTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[MTEventRecorderAMSMetricsDelegate periodicQueuesByTopic](v4, "periodicQueuesByTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("maxBatchSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("maximumBatchSize"));

}

- (void)setNumberOfPendingEvents:(int64_t)a3
{
  int64_t numberOfPendingEvents;
  MTEventRecorderAMSMetricsDelegate *obj;

  obj = self;
  objc_sync_enter(obj);
  numberOfPendingEvents = obj->_numberOfPendingEvents;
  obj->_numberOfPendingEvents = a3;
  if (a3 != 1 || numberOfPendingEvents)
  {
    if (!a3)
      -[MTEventRecorderAMSMetricsDelegate _endTransaction](obj, "_endTransaction");
  }
  else
  {
    -[MTEventRecorderAMSMetricsDelegate _beginTransaction](obj, "_beginTransaction");
  }
  objc_sync_exit(obj);

}

- (void)_beginTransaction
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_transactionEnabled)
  {
    objc_msgSend(CFSTR("com.apple.amp-ae.metricskit.amsqueue"), "UTF8String");
    v3 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v3;

    MTMetricsKitOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = (id)objc_opt_class();
      v6 = v8;
      _os_log_impl(&dword_20D758000, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: begin transaction", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)_endTransaction
{
  OS_os_transaction *transaction;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;

    MTMetricsKitOSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = (id)objc_opt_class();
      v4 = v6;
      _os_log_impl(&dword_20D758000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: end transaction", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (id)lookupItunesAccount:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "integerValue"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x24BDB43A0], "ams_sharedAccountStore", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_iTunesAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "ams_DSID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && (objc_msgSend(v11, "isEqualToNumber:", v3) & 1) != 0)
        {
          v7 = v10;

          goto LABEL_14;
        }

      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v7;
}

- (id)activeItunesAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB43A0], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_flushEvents:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  MTEventRecorderAMSMetricsDelegate *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  MTMetricsKitOSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2048;
    v25 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Start flushing %lu in-memory events", buf, 0x16u);

  }
  -[MTEventRecorderAMSMetricsDelegate _sortedEventsFromBatch:](self, "_sortedEventsFromBatch:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventRecorderAMSMetricsDelegate amsMetricsForTopic:](self, "amsMetricsForTopic:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flushEvents:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__MTEventRecorderAMSMetricsDelegate__flushEvents_topic___block_invoke;
  v17[3] = &unk_24C7A0030;
  v18 = v11;
  v19 = self;
  v20 = v6;
  v21 = v7;
  v14 = v7;
  v15 = v6;
  v16 = v11;
  objc_msgSend(v13, "addFinishBlock:", v17);

}

void __56__MTEventRecorderAMSMetricsDelegate__flushEvents_topic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(v5, "integerValue") <= 0 && objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    MTMetricsKitOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 138412546;
      *(_QWORD *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v6;
      v8 = *(id *)&v18[4];
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: %@: Failed to flush events with error: %@", v18, 0x16u);

    }
    v9 = *(void **)(a1 + 40);
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
  }
  else
  {
    MTMetricsKitOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 48);
      v14 = v12;
      *(_DWORD *)v18 = 138412546;
      *(_QWORD *)&v18[4] = v12;
      *(_WORD *)&v18[12] = 2048;
      *(_QWORD *)&v18[14] = objc_msgSend(v13, "count");
      _os_log_impl(&dword_20D758000, v11, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Finished flushing %lu in-memory events", v18, 0x16u);

    }
    v15 = objc_msgSend(v5, "integerValue");
    if (v15 != objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", objc_msgSend(v5, "integerValue"), objc_msgSend(*(id *)(a1 + 32), "count") - objc_msgSend(v5, "integerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "periodicQueueForTopic:", *(_QWORD *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertObjects:", v16);

    }
    v9 = *(void **)(a1 + 40);
    v10 = objc_msgSend(v5, "integerValue");
  }
  objc_msgSend(v9, "setNumberOfPendingEvents:", objc_msgSend(v9, "numberOfPendingEvents", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19) - v10);

}

- (id)_sortedEventsFromBatch:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_38);
}

uint64_t __60__MTEventRecorderAMSMetricsDelegate__sortedEventsFromBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_DSID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_24C7B81D8;
  v10 = v9;

  objc_msgSend(v5, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_DSID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &unk_24C7B81D8;
  v15 = v14;

  v16 = objc_msgSend(v10, "compare:", v15);
  if (!v16)
  {
    objc_msgSend(v4, "canaryIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_24C7A22D0;
    v20 = v19;

    objc_msgSend(v5, "canaryIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_24C7A22D0;
    v24 = v23;

    v16 = -[__CFString compare:](v20, "compare:", v24);
  }

  return v16;
}

- (id)sendMethod
{
  return CFSTR("amsmetrics");
}

uint64_t __58__MTEventRecorderAMSMetricsDelegate_flushUnreportedEvents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "flush");
}

void __58__MTEventRecorderAMSMetricsDelegate_flushUnreportedEvents__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithResult:", v8);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v9);
          v12 += objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "integerValue", (_QWORD)v17);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", v16);

  }
}

- (NSString)containerId
{
  return self->_containerId;
}

- (void)setContainerId:(id)a3
{
  objc_storeStrong((id *)&self->_containerId, a3);
}

- (BOOL)isTransactionEnabled
{
  return self->_transactionEnabled;
}

- (int64_t)flushMode
{
  return self->_flushMode;
}

- (double)flushTimeInterval
{
  return self->_flushTimeInterval;
}

- (BOOL)isFlushTimerEnabled
{
  return self->_flushTimerEnabled;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (BOOL)personalizedWithItunesAccount
{
  return self->_personalizedWithItunesAccount;
}

- (void)setPersonalizedWithItunesAccount:(BOOL)a3
{
  self->_personalizedWithItunesAccount = a3;
}

- (void)setAmsBag:(id)a3
{
  objc_storeStrong((id *)&self->_amsBag, a3);
}

- (AMSPromise)metricsBagPromise
{
  return self->_metricsBagPromise;
}

- (void)setMetricsBagPromise:(id)a3
{
  objc_storeStrong((id *)&self->_metricsBagPromise, a3);
}

- (void)setAmsMetricsByTopic:(id)a3
{
  objc_storeStrong((id *)&self->_amsMetricsByTopic, a3);
}

- (void)setPeriodicQueuesByTopic:(id)a3
{
  objc_storeStrong((id *)&self->_periodicQueuesByTopic, a3);
}

- (int64_t)numberOfPendingEvents
{
  return self->_numberOfPendingEvents;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

@end
