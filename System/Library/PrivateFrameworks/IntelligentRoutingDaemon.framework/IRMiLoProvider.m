@implementation IRMiLoProvider

- (void)setNumberOfConsecutiveMiLoFailAttempts:(int)a3
{
  self->_numberOfConsecutiveMiLoFailAttempts = a3;
}

- (void)_serviceReset
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[IRMiLoProvider setIsMiLoServiceStateRunning:](self, "setIsMiLoServiceStateRunning:", 0);
  -[IRMiLoProvider setConnection:](self, "setConnection:", 0);
  -[IRMiLoProvider setMiLoConnectionProgressStatus:](self, "setMiLoConnectionProgressStatus:", 0);
  -[IRMiLoProvider observer](self, "observer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[IRMiLoProvider numberOfConsecutiveMiLoFailAttempts](self, "numberOfConsecutiveMiLoFailAttempts");
    +[IRPreferences shared](IRPreferences, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 >= v5)
      -[IRMiLoProvider _connectToLslService](self, "_connectToLslService");
  }
}

- (int)numberOfConsecutiveMiLoFailAttempts
{
  return self->_numberOfConsecutiveMiLoFailAttempts;
}

- (void)setIsMiLoServiceStateRunning:(BOOL)a3
{
  self->_isMiLoServiceStateRunning = a3;
}

- (void)setMiLoConnectionProgressStatus:(int)a3
{
  self->_miLoConnectionProgressStatus = a3;
}

- (int)miLoConnectionProgressStatus
{
  return self->_miLoConnectionProgressStatus;
}

- (IRMiLoProviderObserverProtocol)observer
{
  return (IRMiLoProviderObserverProtocol *)objc_loadWeakRetained((id *)&self->_observer);
}

- (id)getMiloServiceStatusStringQEWithPrediction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[IRMiLoProvider miloServiceStatusStringQE](self, "miloServiceStatusStringQE");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IRMiLoProvider isLowLatency](self, "isLowLatency"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "confidence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictionTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", (double)objc_msgSend(v10, "secondsFromGMT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = objc_msgSend(v4, "confidenceReasonBitmap");

  objc_msgSend(v12, "numberWithLongLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" predictionId: %@\n isLowLatency: %@\n confidence: %@\n predictionTime: %@ \n confidenceReasons: %@"), v6, v7, v8, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)miloServiceStatusStringQE
{
  return self->_miloServiceStatusStringQE;
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (int64_t)highConfidenceValue
{
  return 30;
}

+ (BOOL)deleteServiceWithToken:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE66930], "createServiceIdentifierForToken:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)MEMORY[0x24BE66930];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__IRMiLoProvider_deleteServiceWithToken___block_invoke;
    v11[3] = &unk_251044C60;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "deleteServiceWithIdentifier:reply:", v4, v11);
    v8 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v7, v8);
    v9 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

intptr_t __41__IRMiLoProvider_deleteServiceWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isQualityValid:(int64_t)a3
{
  return a3 > 10;
}

+ (BOOL)isInMotion:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

+ (BOOL)isConfidenceValid:(int64_t)a3
{
  return a3 > 1;
}

- (IRMiLoProvider)initWithQueue:(id)a3
{
  id v4;
  IRMiLoProvider *v5;
  IRMiLoProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IRMiLoProvider;
  v5 = -[IRMiLoProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IRMiLoProvider setQueue:](v5, "setQueue:", v4);
    -[IRMiLoProvider setMiloServiceStatusStringQE:](v6, "setMiloServiceStatusStringQE:", CFSTR("MiLo State:nil"));
  }

  return v6;
}

- (void)addObserver:(id)a3 withToken:(id)a4 withLegacyServiceUUID:(id)a5 isLowLatency:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (char *)a4;
  v12 = a5;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    v16 = v14;
    objc_msgSend(v15, "numberWithBool:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136316162;
    v22 = "#milo-provider, ";
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_INFO, "%s[%@], Adding MiLo observer with token: %@, legacyServiceUUID: %@, isLowLatency: %@", (uint8_t *)&v21, 0x34u);

  }
  -[IRMiLoProvider observer](self, "observer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[IRMiLoProvider setNumberOfConsecutiveMiLoFailAttempts:](self, "setNumberOfConsecutiveMiLoFailAttempts:", 0);
    -[IRMiLoProvider setObserver:](self, "setObserver:", v10);
    -[IRMiLoProvider setLegacyServiceUUID:](self, "setLegacyServiceUUID:", v12);
    -[IRMiLoProvider setIsLowLatency:](self, "setIsLowLatency:", v6);
    objc_msgSend(MEMORY[0x24BE66930], "createServiceIdentifierForToken:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRMiLoProvider setServiceUUID:](self, "setServiceUUID:", v19);

    -[IRMiLoProvider serviceUUID](self, "serviceUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      -[IRMiLoProvider addObserver:withToken:withLegacyServiceUUID:isLowLatency:].cold.1(v11);
    -[IRMiLoProvider _connectToLslService](self, "_connectToLslService");
  }

}

- (void)removeObserver
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "#milo-provider, ";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_INFO, "%s[%@], Removing MiLo observer", (uint8_t *)&v6, 0x16u);
  }

  -[IRMiLoProvider observer](self, "observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IRMiLoProvider setObserver:](self, "setObserver:", 0);
    -[IRMiLoProvider setServiceUUID:](self, "setServiceUUID:", 0);
    -[IRMiLoProvider setLegacyServiceUUID:](self, "setLegacyServiceUUID:", 0);
    -[IRMiLoProvider setIsLowLatency:](self, "setIsLowLatency:", 0);
    -[IRMiLoProvider setNumberOfConsecutiveMiLoFailAttempts:](self, "setNumberOfConsecutiveMiLoFailAttempts:", 0);
    -[IRMiLoProvider _serviceReset](self, "_serviceReset");
  }
}

- (void)labelPredictionUuid:(id)a3 withEventUuid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v12 = 136315906;
    v13 = "#milo-provider, ";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_INFO, "%s[%@], Labeling MiLo observation: predictionUuid: %@, eventUuid: %@", (uint8_t *)&v12, 0x2Au);
  }

  -[IRMiLoProvider connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "labelRequestIdentifier:withPlaceIdentifier:", v6, v7);

}

- (id)requestSinglePrediction
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[IRMiLoProvider isMiLoServiceStateRunning](self, "isMiLoServiceStateRunning")
    && (-[IRMiLoProvider observer](self, "observer"), (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v4 = (void *)v3,
        -[IRMiLoProvider requestSinglePredictionIdentifier](self, "requestSinglePredictionIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    -[IRMiLoProvider connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestPrediction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRMiLoProvider setRequestSinglePredictionIdentifier:](self, "setRequestSinglePredictionIdentifier:", v15);

    v6 = CFSTR("YES");
  }
  else
  {
    v6 = CFSTR("NO");
  }
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    -[IRMiLoProvider requestSinglePredictionIdentifier](self, "requestSinglePredictionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "#milo-provider, ";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_INFO, "%s[%@], Single prediction requested, complied = %@, request-id (updated if complied): %@", (uint8_t *)&v16, 0x2Au);

  }
  -[IRMiLoProvider requestSinglePredictionIdentifier](self, "requestSinglePredictionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)recoverServiceIfRequired
{
  uint64_t v3;
  void *v4;
  int v5;

  -[IRMiLoProvider observer](self, "observer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[IRMiLoProvider miLoConnectionProgressStatus](self, "miLoConnectionProgressStatus");

    if (!v5)
      -[IRMiLoProvider _connectToLslService](self, "_connectToLslService");
  }
}

- (BOOL)startLowLatencyMiLo
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[IRMiLoProvider miLoConnectionProgressStatus](self, "miLoConnectionProgressStatus") != 2)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = v5;
      objc_msgSend(v6, "numberWithUnsignedInt:", -[IRMiLoProvider miLoConnectionProgressStatus](self, "miLoConnectionProgressStatus"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "#milo-provider, ";
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - MiLo start low latency] MiLo connection status is not connected: %@", (uint8_t *)&v15, 0x20u);

    }
    goto LABEL_7;
  }
  if (-[IRMiLoProvider isLowLatency](self, "isLowLatency"))
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "#milo-provider, ";
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - MiLo start low latency] API was called after low latency is already enabled", (uint8_t *)&v15, 0x16u);
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v9 = 1;
  -[IRMiLoProvider setIsLowLatency:](self, "setIsLowLatency:", 1);
  -[IRMiLoProvider connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66990]), "initWithIsLowLatency:", -[IRMiLoProvider isLowLatency](self, "isLowLatency"));
  v13 = (id)objc_msgSend(v11, "startUpdatingWithConfiguration:", v12);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "#milo-provider, ";
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_INFO, "%s[%@], Starting LowLatency connection for MiLo", (uint8_t *)&v15, 0x16u);
  }
LABEL_8:

  return v9;
}

- (void)setSpotOnLocation
{
  _BOOL4 v3;
  const void **v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = -[IRMiLoProvider spotOnLocationRequested](self, "spotOnLocationRequested");
  v4 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x24BE5B270];
  v7 = *MEMORY[0x24BE5B270];
  v8 = *MEMORY[0x24BE5B270];
  if (v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "#milo-provider, ";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - MiLo provider got setSpotOnLocation twice] MiLo already waiting for spotOn response", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "#milo-provider, ";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_INFO, "%s[%@], MiLo provider got setSpotOnLocation", buf, 0x16u);
    }

    if (-[IRMiLoProvider miLoConnectionProgressStatus](self, "miLoConnectionProgressStatus") == 2)
    {
      -[IRMiLoProvider connection](self, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enableMicrolocationAtCurrentLocation");

      -[IRMiLoProvider setSpotOnLocationRequested:](self, "setSpotOnLocationRequested:", 1);
    }
    else
    {
      dispatch_get_specific(*v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "#milo-provider, ";
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_INFO, "%s[%@], MiLo not connected, responding to setSpotOnLocation with error", buf, 0x16u);
      }

      -[IRMiLoProvider observer](self, "observer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE5B268];
      v17 = *MEMORY[0x24BDD0FD8];
      v18 = CFSTR("MiLo Unavailable");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -12899, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didSpotOnLocationCompleteWithError:", v16);

    }
  }
}

- (void)resetSpotOnLocationRequest
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "#milo-provider, ";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_INFO, "%s[%@], resetting spotOnLocationRquest", (uint8_t *)&v5, 0x16u);
  }

  -[IRMiLoProvider setSpotOnLocationRequested:](self, "setSpotOnLocationRequested:", 0);
}

- (void)_connectToLslService
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    -[IRMiLoProvider serviceUUID](self, "serviceUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315650;
    v17 = "#milo-provider, ";
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "%s[%@], Connecting to LSL service for identifier: %@", (uint8_t *)&v16, 0x20u);

  }
  -[IRMiLoProvider connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x24BE66930]);
    -[IRMiLoProvider serviceUUID](self, "serviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDelegate:serviceIdentifier:", self, v9);
    -[IRMiLoProvider setConnection:](self, "setConnection:", v10);

    -[IRMiLoProvider legacyServiceUUID](self, "legacyServiceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[IRMiLoProvider connection](self, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRMiLoProvider legacyServiceUUID](self, "legacyServiceUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateLegacyServiceIdentifier:", v13);

    }
  }
  -[IRMiLoProvider connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "connect");

  -[IRMiLoProvider setMiLoConnectionProgressStatus:](self, "setMiLoConnectionProgressStatus:", 1);
}

- (id)_miloServiceStatusLogStringFromStatus:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
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
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "serviceSuspendReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v9 = CFSTR("<");
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "suspendReasonEnum");
        ULServiceSuspendReasonToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v12);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v9;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }
  else
  {
    v9 = CFSTR("<");
  }

  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(">"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "serviceDescriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serviceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceState");
  ULServiceStateToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "serviceQualityInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "serviceQuality"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v3, "code"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v4, "currentLocationOfInterestUuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("MiLo State:\n milo service id: %@\n State: %@\n Suspend reasons:%@\n Quality index:%@\n error:%@\n currentGroupId %@\n"), v14, v15, v26, v18, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {

  }
  return v23;
}

- (void)_serviceResetAndIncreaseFailCount
{
  -[IRMiLoProvider setNumberOfConsecutiveMiLoFailAttempts:](self, "setNumberOfConsecutiveMiLoFailAttempts:", -[IRMiLoProvider numberOfConsecutiveMiLoFailAttempts](self, "numberOfConsecutiveMiLoFailAttempts") + 1);
  -[IRMiLoProvider _serviceReset](self, "_serviceReset");
}

- (int64_t)_bitmapFromServiceQualityReasonArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "qualityReasonEnum");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_bitmapFromServiceSuspendedReasonArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "suspendReasonEnum");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)_locationTypeToIRLocationSemantic:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v5 = objc_msgSend(v3, "locationType");
  if (v5 > 1)
  {
    if (v5 == 2)
    {
      v6 = 5;
      goto LABEL_12;
    }
    if (v5 == 30)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (!v5)
  {
    v6 = 1;
    goto LABEL_12;
  }
  if (v5 != 1)
  {
LABEL_8:
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_FAULT))
    {
      v9 = v8;
      v11 = 136315650;
      v12 = "#milo-provider, ";
      v13 = 2112;
      v14 = v7;
      v15 = 2048;
      v16 = objc_msgSend(v4, "locationType");
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - Milo location type unsupported] Milo provided LOI type not handled [%lu]", (uint8_t *)&v11, 0x20u);

    }
    goto LABEL_11;
  }
  v6 = 2;
LABEL_12:

  return v6;
}

- (void)connection:(id)a3 didUpdateServiceStatus:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[IRMiLoProvider queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__IRMiLoProvider_connection_didUpdateServiceStatus___block_invoke;
  v8[3] = &unk_251044C88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __52__IRMiLoProvider_connection_didUpdateServiceStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const void **v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _BYTE v34[24];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_20;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentLocationOfInterestType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_locationTypeToIRLocationSemantic:", v6);

  objc_msgSend(*(id *)(a1 + 40), "currentLocationOfInterestUuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "onUpdateLOIType:WithLOIIdentifier:", v7, v9);
  if (objc_msgSend(v3, "miLoConnectionProgressStatus") == 1)
  {
    objc_msgSend(v3, "setMiLoConnectionProgressStatus:", 2);
    objc_msgSend(v3, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66990]), "initWithIsLowLatency:", objc_msgSend(v3, "isLowLatency"));
    v12 = (id)objc_msgSend(v10, "startUpdatingWithConfiguration:", v11);

    objc_msgSend(v3, "setNumberOfConsecutiveMiLoFailAttempts:", 0);
  }
  objc_msgSend(v3, "setIsMiLoServiceStateRunning:", 0);
  v13 = objc_msgSend(*(id *)(a1 + 40), "serviceState");
  v14 = (const void **)MEMORY[0x24BE5B328];
  if (v13 == 1)
  {
    objc_msgSend(v4, "onPrediction:", 0);
    objc_msgSend(v3, "setRequestSinglePredictionIdentifier:", 0);
    dispatch_get_specific(*v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)*MEMORY[0x24BE5B270];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
LABEL_13:

      goto LABEL_14;
    }
    v18 = v20;
    *(_DWORD *)v34 = 136315650;
    *(_QWORD *)&v34[4] = "#milo-provider, ";
    *(_WORD *)&v34[12] = 2112;
    *(_QWORD *)&v34[14] = v16;
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = objc_msgSend(v3, "miLoConnectionProgressStatus");
    v19 = "%s[%@], Milo service state suspended, %d";
LABEL_12:
    _os_log_impl(&dword_23FFBA000, v18, OS_LOG_TYPE_INFO, v19, v34, 0x1Cu);

    goto LABEL_13;
  }
  if (!v13)
  {
    objc_msgSend(v3, "legacyServiceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "deleteLegacyServiceIdentifier");
      objc_msgSend(v3, "setLegacyServiceUUID:", 0);
    }
    objc_msgSend(v3, "setIsMiLoServiceStateRunning:", 1);
    dispatch_get_specific(*v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)*MEMORY[0x24BE5B270];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v18 = v17;
    *(_DWORD *)v34 = 136315650;
    *(_QWORD *)&v34[4] = "#milo-provider, ";
    *(_WORD *)&v34[12] = 2112;
    *(_QWORD *)&v34[14] = v16;
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = objc_msgSend(v3, "miLoConnectionProgressStatus");
    v19 = "%s[%@], Milo service state running, %d";
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(v3, "_miloServiceStatusLogStringFromStatus:", *(_QWORD *)(a1 + 40), *(_OWORD *)v34, *(_QWORD *)&v34[16], v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMiloServiceStatusStringQE:", v21);

  dispatch_get_specific(*v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    objc_msgSend(v3, "miloServiceStatusStringQE");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 136315650;
    *(_QWORD *)&v34[4] = "#milo-provider, ";
    *(_WORD *)&v34[12] = 2112;
    *(_QWORD *)&v34[14] = v22;
    *(_WORD *)&v34[22] = 2112;
    v35 = v25;
    _os_log_impl(&dword_23FFBA000, v24, OS_LOG_TYPE_DEFAULT, "%s[%@], Milo status changed: %@", v34, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "serviceQualityInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMiLoServiceQuality:", objc_msgSend(v26, "serviceQuality"));

  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceQualityInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "serviceQualityReasons");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMiLoServiceQualityReasonBitmap:", objc_msgSend(v27, "_bitmapFromServiceQualityReasonArray:", v29));

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceSuspendReasons");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMiLoServiceSuspendedReasonBitmap:", objc_msgSend(v30, "_bitmapFromServiceSuspendedReasonArray:", v31));

  if (objc_msgSend(v3, "isMiLoServiceStateRunning") && objc_msgSend(v3, "isLowLatency"))
  {
    objc_msgSend(v3, "connection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v32, "requestPrediction");

  }
LABEL_20:

}

- (void)connection:(id)a3 didUpdatePrediction:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRMiLoProvider queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__IRMiLoProvider_connection_didUpdatePrediction___block_invoke;
  v8[3] = &unk_251044CB0;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __49__IRMiLoProvider_connection_didUpdatePrediction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  IRMiLoProviderLslPredictionResults *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    objc_msgSend(v6, "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "places");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315906;
    v18 = "#milo-provider, ";
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_INFO, "%s[%@], MiLo prediction received, request ID is: %@, num events is: %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_msgSend(v3, "requestSinglePredictionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
    objc_msgSend(v3, "setRequestSinglePredictionIdentifier:", 0);
  if (objc_msgSend(v3, "isLowLatency"))
  {
    v15 = -[IRMiLoProviderLslPredictionResults initWithMiloPrediction:withMiLoServiceQuality:withMiLoServiceQualityReasonBitmap:]([IRMiLoProviderLslPredictionResults alloc], "initWithMiloPrediction:withMiLoServiceQuality:withMiLoServiceQualityReasonBitmap:", *(_QWORD *)(a1 + 32), objc_msgSend(v3, "miLoServiceQuality"), objc_msgSend(v3, "miLoServiceQualityReasonBitmap"));
    objc_msgSend(v3, "observer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "onPrediction:", v15);

  }
}

- (void)connection:(id)a3 didCompleteRequest:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[IRMiLoProvider queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__IRMiLoProvider_connection_didCompleteRequest_withError___block_invoke;
  v12[3] = &unk_251044C88;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  IRDispatchAsyncWithStrongSelf(v9, self, v12);

}

void __58__IRMiLoProvider_connection_didCompleteRequest_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4 || objc_msgSend(v4, "code") == -1)
    v5 = 0;
  else
    v5 = *(void **)(a1 + 32);
  v6 = v5;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v12 = 136315906;
    v13 = "#milo-provider, ";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], didCompleteRequest: requestIdentifier: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v3, "requestSinglePredictionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11);

  if ((_DWORD)v10 && v6)
    objc_msgSend(v3, "setRequestSinglePredictionIdentifier:", 0);

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRMiLoProvider queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__IRMiLoProvider_connection_didFailWithError___block_invoke;
  v8[3] = &unk_251044CB0;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __46__IRMiLoProvider_connection_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  const void **v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "code");
  v6 = (const void **)MEMORY[0x24BE5B328];
  v7 = (os_log_t *)MEMORY[0x24BE5B270];
  if (v5 == 19 || objc_msgSend(*(id *)(a1 + 32), "code") == 20)
  {
    dispatch_get_specific(*v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_FAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v14 = 136315650;
      v15 = "#milo-provider, ";
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - IRMiLoProvider:connection:didFailWithError] IRMiLoProvider:connection:didFailWithError: %@", (uint8_t *)&v14, 0x20u);
    }

  }
  dispatch_get_specific(*v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 136315650;
    v15 = "#milo-provider, ";
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - didFailWithError] didFailWithError: %@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(v4, "_serviceResetAndIncreaseFailCount");
}

- (void)connection:(id)a3 didEnableMicrolocationAtCurrentLocationWithError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRMiLoProvider queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__IRMiLoProvider_connection_didEnableMicrolocationAtCurrentLocationWithError___block_invoke;
  v8[3] = &unk_251044CB0;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __78__IRMiLoProvider_connection_didEnableMicrolocationAtCurrentLocationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4 || objc_msgSend(v4, "code") == -1)
    v5 = 0;
  else
    v5 = *(void **)(a1 + 32);
  v6 = v5;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "#milo-provider, ";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], didEnableMicrolocationAtCurrentLocationWithError: error: %@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(v3, "resetSpotOnLocationRequest");
  objc_msgSend(v3, "observer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didSpotOnLocationCompleteWithError:", v6);

}

- (int64_t)miLoServiceSuspendedReasonBitmap
{
  return self->_miLoServiceSuspendedReasonBitmap;
}

- (void)setMiLoServiceSuspendedReasonBitmap:(int64_t)a3
{
  self->_miLoServiceSuspendedReasonBitmap = a3;
}

- (ULConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)isMiLoServiceStateRunning
{
  return self->_isMiLoServiceStateRunning;
}

- (int64_t)miLoServiceQuality
{
  return self->_miLoServiceQuality;
}

- (void)setMiLoServiceQuality:(int64_t)a3
{
  self->_miLoServiceQuality = a3;
}

- (int64_t)miLoServiceQualityReasonBitmap
{
  return self->_miLoServiceQualityReasonBitmap;
}

- (void)setMiLoServiceQualityReasonBitmap:(int64_t)a3
{
  self->_miLoServiceQualityReasonBitmap = a3;
}

- (NSUUID)legacyServiceUUID
{
  return self->_legacyServiceUUID;
}

- (void)setLegacyServiceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_legacyServiceUUID, a3);
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceUUID, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void)setMiloServiceStatusStringQE:(id)a3
{
  objc_storeStrong((id *)&self->_miloServiceStatusStringQE, a3);
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

- (NSUUID)requestSinglePredictionIdentifier
{
  return self->_requestSinglePredictionIdentifier;
}

- (void)setRequestSinglePredictionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestSinglePredictionIdentifier, a3);
}

- (BOOL)spotOnLocationRequested
{
  return self->_spotOnLocationRequested;
}

- (void)setSpotOnLocationRequested:(BOOL)a3
{
  self->_spotOnLocationRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSinglePredictionIdentifier, 0);
  objc_storeStrong((id *)&self->_miloServiceStatusStringQE, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_legacyServiceUUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)addObserver:(const char *)a1 withToken:withLegacyServiceUUID:isLowLatency:.cold.1(const char *a1)
{
  const void **v2;
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)MEMORY[0x24BE5B270];
  v5 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_FAULT))
  {
    v8 = 136315650;
    v9 = "#milo-provider, ";
    v10 = 2112;
    v11 = v3;
    v12 = 2112;
    v13 = a1;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_FAULT, "%s[%@], [ErrorId - MiLo provider error - Unknown token] addObserver, unknown token: %@", (uint8_t *)&v8, 0x20u);
  }

  dispatch_get_specific(*v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136316162;
    v9 = "#milo-provider, ";
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/IntelligentRouting/IntelligentRoutingDaemon/DataProviders/MiLo/IRMiLoProvider.m";
    v14 = 1024;
    v15 = 229;
    v16 = 2080;
    v17 = "-[IRMiLoProvider addObserver:withToken:withLegacyServiceUUID:isLowLatency:]";
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_INFO, "%s[%@], %s:%d: assertion failure in %s", (uint8_t *)&v8, 0x30u);
  }

  abort();
}

@end
