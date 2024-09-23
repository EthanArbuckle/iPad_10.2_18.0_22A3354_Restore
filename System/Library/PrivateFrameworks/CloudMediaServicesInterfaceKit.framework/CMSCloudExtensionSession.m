@implementation CMSCloudExtensionSession

- (CMSCloudExtensionSession)init
{
  CMSCloudExtensionConfiguration *v3;
  CMSCloudExtensionSession *v4;

  v3 = objc_alloc_init(CMSCloudExtensionConfiguration);
  v4 = -[CMSCloudExtensionSession initWithConfiguration:authProviderDelegate:](self, "initWithConfiguration:authProviderDelegate:", v3, 0);

  return v4;
}

- (CMSCloudExtensionSession)initWithConfiguration:(id)a3 authProviderDelegate:(id)a4
{
  id v7;
  id v8;
  CMSCloudExtensionSession *v9;
  CMSCloudExtensionSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMSCloudExtensionSession;
  v9 = -[CMSCloudExtensionSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeWeak((id *)&v10->_authProvider, v8);
    v10->_requestQueueLock._os_unfair_lock_opaque = 0;
    v10->_timeoutInterval = 10.0;
  }

  return v10;
}

- (void)setQosClass:(unsigned int)a3
{
  NSObject *v4;

  if (self->_connected)
  {
    _CMSILogingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession setQosClass:].cold.1(a2, v4);

  }
  else
  {
    self->_qosClass = a3;
  }
}

- (void)setCloseCompletion:(id)a3
{
  void *v4;
  id closeCompletion;

  v4 = (void *)MEMORY[0x2207A4EA0](a3, a2);
  closeCompletion = self->_closeCompletion;
  self->_closeCompletion = v4;

}

- (BOOL)_updateDynamicHeadersOnRequest:(id)a3 withDeadline:(id)a4
{
  id v6;
  id v7;
  void (**prepareRequestHook)(id, CMSCloudExtensionSession *, id);
  double v9;
  double timeoutInterval;
  double v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  prepareRequestHook = (void (**)(id, CMSCloudExtensionSession *, id))self->_prepareRequestHook;
  if (prepareRequestHook)
    prepareRequestHook[2](prepareRequestHook, self, v6);
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    timeoutInterval = v9 + 2.0;
  }
  else
  {
    timeoutInterval = self->_timeoutInterval;
  }
  v11 = timeoutInterval;
  if (timeoutInterval < 1.0)
  {
    _CMSILogingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:]";
      v18 = 2048;
      v19 = timeoutInterval;
      _os_log_impl(&dword_21DE4E000, v12, OS_LOG_TYPE_DEFAULT, "%s already near or past deadline by %fs", buf, 0x16u);
    }

    v11 = 1.0;
  }
  v13 = 0x24BDD1000uLL;
  LODWORD(v13) = vcvtpd_s64_f64(v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v14, CFSTR("Request-timeout"));

  objc_msgSend(v6, "setTimeoutInterval:", v11 + 1.0);
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", self->_sessionIdentifier, CFSTR("x-applecloudextension-session-id"));
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", self->_authHeader, CFSTR("Authorization"));

  return timeoutInterval >= 1.0;
}

- (id)_requestForMethods:(id)a3 before:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    CreateDataWithSerializedJSON(v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("method"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      CMSExtensionEndpointForProtocolMethodName(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[CMSCloudExtensionConfiguration configForEndpoint:](self->_config, "configForEndpoint:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "request");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-type"));
        objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
        objc_msgSend(v16, "setHTTPBody:", v10);
        -[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:](self, "_updateDynamicHeadersOnRequest:withDeadline:", v16, v9);
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 11, 0);
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 12, 0);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 6, 0);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_parsedObjectFromData:(id)a3 inResponse:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (a5 && !*a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("x-applecloudextension-session-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (-[CMSCloudExtensionSession sessionIdentifier](self, "sessionIdentifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "isEqualToString:", v11),
          v11,
          (v12 & 1) != 0))
    {

      goto LABEL_6;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 3, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v13;
}

- (id)_resultsFromData:(id)a3 inResponse:(id)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[CMSCloudExtensionSession _parsedObjectFromData:inResponse:error:](self, "_parsedObjectFromData:inResponse:error:", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a5 && !v6 && *a5)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_21;
  }
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a5)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0, v15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          v13 = 0;
          goto LABEL_20;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  v13 = v8;
LABEL_20:

LABEL_21:
  return v13;
}

- (void)_connectSession
{
  NSError *closeError;
  void *v4;
  NSString *v5;
  NSString *sessionIdentifier;
  NSMutableArray *v7;
  NSMutableArray *requestQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *results;
  NSMutableDictionary *v11;
  NSMutableDictionary *exceptions;
  NSMutableDictionary *v13;
  NSMutableDictionary *completions;
  NSMutableDictionary *v15;
  NSMutableDictionary *durations;
  id v17;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *requestDispatch;
  void *v20;
  NSURLSession *v21;
  NSURLSession *session;
  NSObject *attr;

  if (!self->_connected)
  {
    closeError = self->_closeError;
    self->_closeError = 0;

    if (!self->_sessionIdentifier)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      sessionIdentifier = self->_sessionIdentifier;
      self->_sessionIdentifier = v5;

    }
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    requestQueue = self->_requestQueue;
    self->_requestQueue = v7;

    v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 8);
    results = self->_results;
    self->_results = v9;

    v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    exceptions = self->_exceptions;
    self->_exceptions = v11;

    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    completions = self->_completions;
    self->_completions = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    durations = self->_durations;
    self->_durations = v15;

    self->_totalDuration = 0.0;
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)self->_qosClass, 0);
    attr = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.cloudextension.session.%@"), self->_sessionIdentifier);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), attr);
    requestDispatch = self->_requestDispatch;
    self->_requestDispatch = v18;

    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v20, self, 0);
    v21 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v21;

    self->_connected = 1;
  }
}

- (id)_constraintsDefinition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("shuffledPlayback");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shuffledPlayback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("updateUserTasteProfile");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_updateUserTasteProfile);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("allowExplicitContent");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowExplicitContent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("maximumQueueSegmentItemCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_sessionDescriptionWithDeadline:(id)a3
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
  void *v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16[0] = self->_sessionIdentifier;
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("version");
  CMSCloudExtensionSpecVersion();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  v15[2] = CFSTR("constraints");
  -[CMSCloudExtensionSession _constraintsDefinition](self, "_constraintsDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("playerContext");
  -[CMSPlayerContext cmsCoded](self->_intentPlayerContext, "cmsCoded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v7;
  v15[4] = CFSTR("requested");
  cmsDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v10;
  v15[5] = CFSTR("deadline");
  if (v4)
  {
    cmsDateFormatter();
    self = (CMSCloudExtensionSession *)objc_claimAutoreleasedReturnValue();
    -[CMSCloudExtensionSession stringFromDate:](self, "stringFromDate:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v11 = self;
  }

  if (!v6)
  return v12;
}

- (void)_retryRequest:(id)a3 before:(id)a4 networkActivity:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  os_unfair_lock_s *p_requestQueueLock;
  void *v16;
  int v17;
  void *v18;
  NSURLSessionDataTask *v19;
  NSURLSessionDataTask *dataTask;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  p_requestQueueLock = &self->_requestQueueLock;
  os_unfair_lock_lock(&self->_requestQueueLock);
  if (!self->_connected || !self->_session)
  {
    if (!v14)
      goto LABEL_12;
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = 2;
LABEL_11:
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), v22, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, v31);

    goto LABEL_12;
  }
  if (-[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:](self, "_updateDynamicHeadersOnRequest:withDeadline:", v11, v12))
  {
    objc_msgSend(v11, "allHTTPHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "cmsIntegerForKey:withDefault:", CFSTR("x-applecloudextension-retry-count"), 0);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (v17 + 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", v18, CFSTR("x-applecloudextension-retry-count"));

    objc_storeStrong((id *)&self->_lastRequest, a3);
    -[NSURLSession dataTaskWithRequest:completionHandler:](self->_session, "dataTaskWithRequest:completionHandler:", v11, v14);
    v19 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
    dataTask = self->_dataTask;
    self->_dataTask = v19;

    objc_msgSend(v13, "associateWithTask:", self->_dataTask);
    -[NSURLSessionDataTask resume](self->_dataTask, "resume");
    goto LABEL_12;
  }
  _CMSILogingFacility();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[CMSCloudExtensionSession _retryRequest:before:networkActivity:completionHandler:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  if (v14)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = 10;
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(p_requestQueueLock);

}

- (void)_retryRequestAfterAuthTokenRenewal:(id)a3 parentNetworkActivity:(id)a4 before:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  NSString *sessionIdentifier;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_authProvider);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v15 = objc_loadWeakRetained((id *)&self->_authProvider);
    sessionIdentifier = self->_sessionIdentifier;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke;
    v25[3] = &unk_24E1CCDC8;
    objc_copyWeak(&v30, &location);
    v26 = v10;
    v27 = v12;
    v28 = v11;
    v29 = v13;
    objc_msgSend(v15, "authRenewalForSessionIdentifier:parentNetworkActivity:completion:", sessionIdentifier, v28, v25);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    _CMSILogingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession _retryRequestAfterAuthTokenRenewal:parentNetworkActivity:before:completionHandler:].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 9, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v24);

  }
}

void __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v11 = WeakRetained;
  if (!WeakRetained
    || (objc_msgSend(WeakRetained, "sessionIdentifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "compare:", v7),
        v12,
        v13))
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 3, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_15;
  }
  if (!v8)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 9, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    _CMSILogingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke_cold_1();

    goto LABEL_14;
  }
  _CMSILogingFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[CMSCloudExtensionSession _retryRequestAfterAuthTokenRenewal:parentNetworkActivity:before:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_21DE4E000, v14, OS_LOG_TYPE_DEFAULT, "%s: session %@ retrieved new authorization", (uint8_t *)&v16, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)v11 + 4);
  objc_storeStrong((id *)v11 + 12, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)v11 + 4);
  objc_msgSend(v11, "_retryRequest:before:networkActivity:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_15:

}

- (BOOL)_handleURLResponseCode:(int64_t)a3 error:(id)a4 before:(id)a5 request:(id)a6 networkActivity:(id)a7 retryHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  uint64_t v24;
  BOOL v25;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  dispatch_time_t v31;
  NSObject *requestDispatch;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  double v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v18)
  {
    _CMSILogingFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:].cold.1();
    goto LABEL_17;
  }
  objc_msgSend(v16, "allHTTPHeaderFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "cmsIntegerForKey:withDefault:", CFSTR("x-applecloudextension-retry-count"), 0);

  if (v20 >= 4)
  {
    _CMSILogingFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:].cold.2(v21);
LABEL_17:

    v25 = 0;
    goto LABEL_18;
  }
  if (!v14)
    goto LABEL_13;
  objc_msgSend(v14, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD1308]);

  if (!v23)
    goto LABEL_13;
  v24 = objc_msgSend(v14, "code");
  if (v24 != -1005)
  {
    if (v24 == -1013)
    {
LABEL_14:
      -[CMSCloudExtensionSession _retryRequestAfterAuthTokenRenewal:parentNetworkActivity:before:completionHandler:](self, "_retryRequestAfterAuthTokenRenewal:parentNetworkActivity:before:completionHandler:", v16, v17, v15, v18);
      v25 = 1;
      goto LABEL_18;
    }
LABEL_13:
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0x191)
    {
      _CMSILogingFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:].cold.3();
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  objc_initWeak(&location, self);
  if (!v15
    || (objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)v20 * 0.5),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = objc_msgSend(v27, "compare:", v15) == -1,
        v27,
        v28))
  {
    _CMSILogingFacility();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "-[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]";
      v42 = 1024;
      v43 = v20 + 1;
      v44 = 2048;
      v45 = (double)v20 * 0.5;
      v46 = 2112;
      v47 = v15;
      _os_log_impl(&dword_21DE4E000, v30, OS_LOG_TYPE_DEFAULT, "%s: NSURLErrorNetworkConnectionLost, will retry #%d after a delay of %f seconds, deadline %@", buf, 0x26u);
    }

    v31 = dispatch_time(0, (uint64_t)((double)v20 * 0.5 * 1000000000.0));
    requestDispatch = self->_requestDispatch;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __101__CMSCloudExtensionSession__handleURLResponseCode_error_before_request_networkActivity_retryHandler___block_invoke;
    v33[3] = &unk_24E1CCDF0;
    objc_copyWeak(&v38, &location);
    v34 = v16;
    v35 = v15;
    v36 = v17;
    v37 = v18;
    dispatch_after(v31, requestDispatch, v33);

    objc_destroyWeak(&v38);
    v25 = 1;
  }
  else
  {
    _CMSILogingFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]";
      v42 = 1024;
      v43 = v20 + 1;
      v44 = 2112;
      v45 = *(double *)&v15;
      _os_log_impl(&dword_21DE4E000, v29, OS_LOG_TYPE_DEFAULT, "%s: NSURLErrorNetworkConnectionLost, will not attempt retry after %d attempt(s): expecting to miss deadline %@", buf, 0x1Cu);
    }

    v25 = 0;
  }
  objc_destroyWeak(&location);
LABEL_18:

  return v25;
}

void __101__CMSCloudExtensionSession__handleURLResponseCode_error_before_request_networkActivity_retryHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_retryRequest:before:networkActivity:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_handleURLResponse:(id)a3 before:(id)a4 networkActivity:(id)a5 request:(id)a6 data:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *requestDispatch;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id location;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v29 = a5;
  v30 = a6;
  v16 = a7;
  v17 = a8;
  objc_initWeak(&location, self);
  v18 = v14;
  v19 = objc_msgSend(v18, "statusCode");
  v20 = v19;
  if (v17 || v19 != 200)
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke;
    v37[3] = &unk_24E1CCE18;
    objc_copyWeak(&v41, &location);
    v38 = v15;
    v39 = v29;
    v40 = v30;
    v22 = -[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:](self, "_handleURLResponseCode:error:before:request:networkActivity:retryHandler:", v20, v17, v38, v40, v39, v37);

    objc_destroyWeak(&v41);
    if (v22)
    {
      v21 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_16;
    }
    if (!v17)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v43 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Service Error: HTTP statusCode %d"), v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 14, v25);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v36 = 0;
    -[CMSCloudExtensionSession _resultsFromData:inResponse:error:](self, "_resultsFromData:inResponse:error:", v16, v18, &v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v36;
  }
  _CMSILogingFacility();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[CMSCloudExtensionSession _handleURLResponse:before:networkActivity:request:data:error:].cold.2();

  if (v17)
  {
    _CMSILogingFacility();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession _handleURLResponse:before:networkActivity:request:data:error:].cold.1();

    requestDispatch = self->_requestDispatch;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_78;
    block[3] = &unk_24E1CCE68;
    objc_copyWeak(&v35, &location);
    block[4] = self;
    v17 = v17;
    v34 = v17;
    dispatch_async(requestDispatch, block);

    objc_destroyWeak(&v35);
  }
  else
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3;
    v31[3] = &unk_24E1CCEB8;
    v31[4] = self;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v31);
    objc_destroyWeak(&v32);
    v17 = 0;
  }
LABEL_16:

  objc_destroyWeak(&location);
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 7);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleURLResponse:before:networkActivity:request:data:error:", v9, a1[4], a1[5], a1[6], v10, v8);

}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_78(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  _QWORD v8[6];
  id v9;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained + 4;
    v7 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    v4 = (void *)objc_msgSend(v7[22], "copy");
    objc_msgSend(v7[22], "removeAllObjects");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_2;
    v8[3] = &unk_24E1CCE40;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8[4] = v7;
    v8[5] = v5;
    v9 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
    os_unfair_lock_unlock(v3);

    WeakRetained = (os_unfair_lock_s *)v7;
  }

}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void (**v6)(id, _QWORD, id, id, uint64_t);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = *(void **)(a1[4] + 152);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v11 = (id)v8;
  if (v8)
  {
    objc_msgSend(*(id *)(v9 + 152), "removeObjectForKey:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    v10 = 0;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 16));
    v10 = a1[6];
  }
  v6[2](v6, a1[5], v7, v11, v10);

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  const __CFString *v46;
  _QWORD block[4];
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[4];
  _QWORD v62[4];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[5];

  v66[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cmsOptionalStringForKey:", CFSTR("method"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("(Not Provided)");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("exception"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cmsOptionalStringForKey:", CFSTR("debug"));
  v45 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = 0;
  }
  else
  {
    if (!v11)
    {
      v66[0] = v10;
      v65[0] = CFSTR("methodName");
      v65[1] = CFSTR("methodIndex");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = CFSTR("reason");
      v66[1] = v13;
      v66[2] = CFSTR("invalid_result");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = 5;
  }
  if (!_isValidMethod(v10))
  {
    if (!v11 || (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("ProtocolException")) & 1) == 0)
    {
      v64[0] = v10;
      v63[0] = CFSTR("methodName");
      v63[1] = CFSTR("methodIndex");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3, v45);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v63[2] = CFSTR("reason");
      v64[1] = v18;
      v64[2] = CFSTR("invalid_method");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 6;
      goto LABEL_30;
    }
    v14 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    objc_msgSend(v15, "cmsOptionalStringForKey:", CFSTR("reason"), v45);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      if ((objc_msgSend(CFSTR("unsupported"), "isEqualToString:", v16) & 1) != 0
        || (objc_msgSend(CFSTR("unauthorized"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("unexpected"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("invalid"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("unparseable"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("deprecated"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("internal"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("complex"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("busy"), "isEqualToString:", v17) & 1) != 0
        || (objc_msgSend(CFSTR("invalid_result"), "isEqualToString:", v17) & 1) != 0
        || objc_msgSend(CFSTR("invalid_exception"), "isEqualToString:", v17))
      {

LABEL_27:
        objc_msgSend(v14, "cmsOptionalStringForKey:", CFSTR("methodName"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!_isValidMethod(v18))
        {
          v12 = 8;
          goto LABEL_31;
        }
        v18 = v18;
        v12 = 8;
        v11 = v10;
        v10 = v18;
LABEL_30:

LABEL_31:
        v6 = 0;
        v11 = v14;
        goto LABEL_32;
      }
      v44 = objc_msgSend(CFSTR("invalid_method"), "isEqualToString:", v17);

      if ((v44 & 1) != 0)
        goto LABEL_27;
    }
    else
    {

    }
    v62[0] = v10;
    v61[0] = CFSTR("methodName");
    v61[1] = CFSTR("methodIndex");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v62[1] = v18;
    v62[2] = CFSTR("invalid_exception");
    v61[2] = CFSTR("reason");
    v61[3] = CFSTR("x-originalException");
    v62[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
    v11 = v14;
    v12 = 7;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
LABEL_32:
  objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("metrics"), v45);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "cmsDoubleForKey:withDefault:", CFSTR("duration"), NAN);
    v22 = v21;
    _CMSILogingFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_3((uint64_t)v10, v23, v24, v25, v26, v27, v28, v29);

    v30 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v31, v10);

    *(double *)(*(_QWORD *)(a1 + 32) + 192) = v22 + *(double *)(*(_QWORD *)(a1 + 32) + 192);
  }
  if (!v11)
  {
    v35 = 0;
    v33 = (__CFString *)v46;
    if (!v46)
      goto LABEL_45;
    goto LABEL_42;
  }
  v32 = CFSTR("<No debug string>");
  v33 = (__CFString *)v46;
  if (v46)
    v32 = v46;
  v59[0] = CFSTR("com.apple.cloudextension.errors.session.debug");
  v59[1] = CFSTR("com.apple.cloudextension.errors.session.exception");
  v60[0] = v32;
  v60[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), v12, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
LABEL_42:
    _CMSILogingFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v43 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138412802;
      v54 = v43;
      v55 = 2112;
      v56 = v10;
      v57 = 2112;
      v58 = v33;
      _os_log_debug_impl(&dword_21DE4E000, v36, OS_LOG_TYPE_DEBUG, "Debug URL for %@:%@: %@", buf, 0x20u);
    }

  }
LABEL_45:
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      goto LABEL_51;
  }
  _CMSILogingFacility();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_2();

LABEL_51:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    _CMSILogingFacility();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeObjectForKey:", v10);
    v42 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_102;
    block[3] = &unk_24E1CCE90;
    objc_copyWeak(&v52, (id *)(a1 + 40));
    v51 = v40;
    v48 = v10;
    v49 = v6;
    v50 = v35;
    dispatch_async(v42, block);

    objc_destroyWeak(&v52);
    v33 = (__CFString *)v46;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setObject:forKeyedSubscript:", v6, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKeyedSubscript:", v35, v10);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_102(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    WeakRetained = v3;
  }

}

- (id)peekResponseForMethod:(id)a3 exception:(id *)a4
{
  os_unfair_lock_s *p_requestQueueLock;
  id v7;
  void *v8;
  void *v9;

  p_requestQueueLock = &self->_requestQueueLock;
  v7 = a3;
  os_unfair_lock_lock(p_requestQueueLock);
  -[NSMutableDictionary objectForKey:](self->_results, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_exceptions, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_requestQueueLock);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (void)performMethod:(id)a3 withParams:(id)a4 networkActivity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, CMSCloudExtensionSession *, id, void *, void *);
  _BOOL4 isValidMethod;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *requestDispatch;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  void (**v39)(id, CMSCloudExtensionSession *, id, void *, void *);
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, CMSCloudExtensionSession *, id, void *, void *))a6;
  isValidMethod = _isValidMethod(v10);
  if (v11)
  {
    if (isValidMethod)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        os_unfair_lock_lock(&self->_requestQueueLock);
        -[NSMutableDictionary objectForKey:](self->_results, "objectForKey:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_results, "removeObjectForKey:", v10);
        -[NSMutableDictionary objectForKey:](self->_exceptions, "objectForKey:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_exceptions, "removeObjectForKey:", v10);
        if (v15)
        {
          os_unfair_lock_unlock(&self->_requestQueueLock);
          if (v13)
            v13[2](v13, self, v10, v15, v16);
        }
        else if (v16)
        {
          os_unfair_lock_unlock(&self->_requestQueueLock);
          if (v13)
            v13[2](v13, self, v10, 0, v16);
        }
        else if (self->_connected
               || (-[CMSCloudExtensionSession _connectSession](self, "_connectSession"), self->_connected))
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", self->_timeoutInterval);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMSCloudExtensionSession requestQueue](self, "requestQueue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v17, "count");

          -[CMSCloudExtensionSession requestQueue](self, "requestQueue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v40[0] = CFSTR("method");
            v40[1] = CFSTR("params");
            v41[0] = v10;
            v41[1] = v11;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v31;
            objc_msgSend(v31, "addObject:", v18);
          }
          else
          {
            v42[0] = CFSTR("session");
            -[CMSCloudExtensionSession _sessionDescriptionWithDeadline:](self, "_sessionDescriptionWithDeadline:", v34);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v43[0] = v18;
            v43[1] = v10;
            v42[1] = CFSTR("method");
            v42[2] = CFSTR("params");
            v43[2] = v11;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v31;
            objc_msgSend(v31, "addObject:", v33);

          }
          _CMSILogingFacility();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[CMSCloudExtensionSession performMethod:withParams:networkActivity:completion:].cold.1((uint64_t)self, v20, v21, v22, v23, v24, v25, v26);

          if (v13)
          {
            -[CMSCloudExtensionSession completions](self, "completions");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x2207A4EA0](v13);
            objc_msgSend(v27, "setObject:forKey:", v28, v10);

          }
          if (!self->_waiting)
          {
            self->_waiting = 1;
            requestDispatch = self->_requestDispatch;
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke;
            block[3] = &unk_24E1CCF08;
            block[4] = self;
            v36 = v10;
            v39 = v13;
            v37 = v34;
            v38 = v12;
            dispatch_async(requestDispatch, block);

          }
          os_unfair_lock_unlock(&self->_requestQueueLock);

        }
        else
        {
          os_unfair_lock_unlock(&self->_requestQueueLock);
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 2, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v13[2](v13, self, v10, 0, v30);

          }
        }

        goto LABEL_13;
      }
    }
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, self, v10, 0, v15);
LABEL_13:

  }
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  v6 = (void *)MEMORY[0x2207A4EA0](*(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  _CMSILogingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_cold_1();

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v30 = 0;
  objc_msgSend(v8, "_requestForMethods:before:error:", v2, v9, &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;
  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v10);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_2;
    v20[3] = &unk_24E1CCE18;
    objc_copyWeak(&v24, &location);
    v21 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v23 = v10;
    objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v23, v20);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = v13;

    objc_msgSend(*(id *)(a1 + 56), "associateWithTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resume");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 64);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v16 + 16))(v16, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, v11);
    v17 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_110;
    v26[3] = &unk_24E1CCEE0;
    v18 = *(_QWORD *)(a1 + 32);
    v27 = v17;
    v28 = v18;
    v29 = v11;
    v19 = v17;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v26);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

  }
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_110(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "removeObjectForKey:", v4);
    ((void (**)(_QWORD, _QWORD, id, _QWORD, _QWORD))v3)[2](v3, *(_QWORD *)(a1 + 40), v4, 0, *(_QWORD *)(a1 + 48));
  }

}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleURLResponse:before:networkActivity:request:data:error:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11, v8);

}

- (id)_queuePlayMediaForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11[0] = self->_sessionIdentifier;
  v10[0] = CFSTR("identifier");
  v10[1] = CFSTR("version");
  CMSCloudExtensionSpecVersion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("userActivity");
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v6;
  v10[3] = CFSTR("constraints");
  -[CMSCloudExtensionSession _constraintsDefinition](self, "_constraintsDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  return v8;
}

- (void)requestQueueForActivity:(id)a3 networkActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *requestDispatch;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  id v34[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CMSCloudExtensionConfiguration configForEndpoint:](self->_config, "configForEndpoint:", CFSTR("queues/playMedia"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected)
      -[CMSCloudExtensionSession _connectSession](self, "_connectSession");
    os_unfair_lock_unlock(&self->_requestQueueLock);
    -[CMSCloudExtensionSession _queuePlayMediaForActivity:](self, "_queuePlayMediaForActivity:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = 0;
    CreateDataWithSerializedJSON(v12, v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34[0];

    if (v13)
    {
      objc_msgSend(v11, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-type"));
      objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
      objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v16, "setHTTPBody:", v13);
      -[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:](self, "_updateDynamicHeadersOnRequest:withDeadline:", v16, 0);
      objc_initWeak(&location, self);
      v24 = v8;
      v17 = v9;
      v18 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke;
      v30[3] = &unk_24E1CCF30;
      objc_copyWeak(&v32, &location);
      v31 = v10;
      v19 = (void *)MEMORY[0x2207A4EA0](v30);
      requestDispatch = self->_requestDispatch;
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_114;
      block[3] = &unk_24E1CCF80;
      objc_copyWeak(&v29, &location);
      v26 = v16;
      v27 = v17;
      v28 = v19;
      v21 = v19;
      v22 = v16;
      dispatch_async(requestDispatch, block);

      v9 = v17;
      v8 = v24;
      objc_destroyWeak(&v29);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, id))v10 + 2))(v10, self, 0, v14);
    }

  }
  else
  {
    _CMSILogingFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession requestQueueForActivity:networkActivity:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 1, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, id))v10 + 2))(v10, self, 0, v14);
  }

}

void __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 32))
    {
      _CMSILogingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CMSCloudExtensionSession requestQueueForActivity:networkActivity:completion:]_block_invoke";
        _os_log_impl(&dword_21DE4E000, v12, OS_LOG_TYPE_DEFAULT, "%s no longer connected, discarding response", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 2, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v9 = (id)v13;
    }
    v14 = v8;
    if (objc_msgSend(v14, "statusCode") == 204)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 15, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v15;
    }
    if (!v7 || v9)
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v18 = 0;
      objc_msgSend(v11, "_parsedObjectFromData:inResponse:error:", v7, v14, &v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
      cmsSafeDictionary(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

void __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_114(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *, void *);
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (void *)WeakRetained[18];
  v4 = *(void **)(a1 + 32);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_2;
  v9 = &unk_24E1CCF58;
  v10 = WeakRetained;
  v11 = v4;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v3, "dataTaskWithRequest:completionHandler:", v11, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "associateWithTask:", v5, v6, v7, v8, v9, v10);
  objc_msgSend(v5, "resume");

}

void __79__CMSCloudExtensionSession_requestQueueForActivity_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "statusCode");
  if (!v9 && (v11 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8)
  {
    v12 = 0;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v9 = (id)v12;
    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_handleURLResponseCode:error:before:request:networkActivity:retryHandler:", v11, v9, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    if (v9)
    {
      v15 = *MEMORY[0x24BDD1398];
      v16[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 14, v14);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v9)
    goto LABEL_10;
  }
LABEL_11:

}

- (void)getQueueSegmentFromURL:(id)a3 referrer:(id)a4 networkActivity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *requestDispatch;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[CMSCloudExtensionConfiguration configForEndpoint:](self->_config, "configForEndpoint:", CFSTR("queues/playMedia"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected)
      -[CMSCloudExtensionSession _connectSession](self, "_connectSession");
    os_unfair_lock_unlock(&self->_requestQueueLock);
    objc_msgSend(v14, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setURL:", v10);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v11, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "setPassword:", 0);
        objc_msgSend(v18, "setUser:", 0);
        objc_msgSend(v18, "setQuery:", 0);
        objc_msgSend(v18, "setFragment:", 0);
        objc_msgSend(v18, "string");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setValue:forHTTPHeaderField:", v19, CFSTR("Referer"));

      }
    }
    objc_msgSend(v16, "setHTTPMethod:", CFSTR("GET"));
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
    -[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:](self, "_updateDynamicHeadersOnRequest:withDeadline:", v16, 0);
    objc_initWeak(&location, self);
    v20 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke;
    v32[3] = &unk_24E1CCF30;
    objc_copyWeak(&v34, &location);
    v33 = v13;
    v21 = (void *)MEMORY[0x2207A4EA0](v32);
    requestDispatch = self->_requestDispatch;
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_118;
    block[3] = &unk_24E1CCF80;
    objc_copyWeak(&v31, &location);
    v28 = v16;
    v29 = v12;
    v30 = v21;
    v23 = v21;
    v24 = v16;
    dispatch_async(requestDispatch, block);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    _CMSILogingFacility();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[CMSCloudExtensionSession getQueueSegmentFromURL:referrer:networkActivity:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, void *))v13 + 2))(v13, self, 0, v26);

  }
}

void __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 32))
    {
      _CMSILogingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CMSCloudExtensionSession getQueueSegmentFromURL:referrer:networkActivity:completion:]_block_invoke";
        _os_log_impl(&dword_21DE4E000, v12, OS_LOG_TYPE_DEFAULT, "%s no longer connected, discarding response", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 2, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v9 = (id)v13;
    }
    v14 = v8;
    if (objc_msgSend(v14, "statusCode") == 204)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 15, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v15;
    }
    if (!v7 || v9)
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v18 = 0;
      objc_msgSend(v11, "_parsedObjectFromData:inResponse:error:", v7, v14, &v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
      cmsSafeDictionary(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

void __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_118(id *a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = (void *)WeakRetained[18];
  v5 = a1[4];
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_2;
  v10 = &unk_24E1CCFA8;
  objc_copyWeak(&v14, v2);
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  objc_msgSend(v4, "dataTaskWithRequest:completionHandler:", v5, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "associateWithTask:", v6, v7, v8, v9, v10);
  objc_msgSend(v6, "resume");

  objc_destroyWeak(&v14);
}

void __87__CMSCloudExtensionSession_getQueueSegmentFromURL_referrer_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  char v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = objc_msgSend(v9, "statusCode");
  v11 = v10;
  if (!v8 && (v10 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8
    || (WeakRetained = objc_loadWeakRetained((id *)(a1 + 56)),
        v13 = objc_msgSend(WeakRetained, "_handleURLResponseCode:error:before:request:networkActivity:retryHandler:", v11, v8, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), WeakRetained, (v13 & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_performActivityUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double timeoutInterval;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *requestDispatch;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  id v44[2];

  v6 = a3;
  v7 = a4;
  -[CMSCloudExtensionConfiguration configForEndpoint:](self->_config, "configForEndpoint:", CFSTR("queues/updateActivity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _CMSILogingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      -[CMSCloudExtensionSession _performActivityUpdate:completion:].cold.3();

    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected)
      -[CMSCloudExtensionSession _connectSession](self, "_connectSession");
    os_unfair_lock_unlock(&self->_requestQueueLock);
    -[CMSCloudExtensionSession _constraintsDefinition](self, "_constraintsDefinition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstraints:", v11);

    objc_msgSend(v6, "setSessionIdentifier:", self->_sessionIdentifier);
    objc_msgSend(v6, "cmsCoded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v44[0] = 0;
      CreateDataWithSerializedJSON(v12, v44);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v44[0];
      if (v14)
      {
        timeoutInterval = self->_timeoutInterval;
        if (timeoutInterval < 120.0)
          timeoutInterval = 120.0;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", timeoutInterval);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "request");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-type"));
        objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
        objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v19, "setHTTPBody:", v14);
        -[CMSCloudExtensionSession _updateDynamicHeadersOnRequest:withDeadline:](self, "_updateDynamicHeadersOnRequest:withDeadline:", v19, v17);
        objc_initWeak(&location, self);
        v20 = MEMORY[0x24BDAC760];
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke;
        v40[3] = &unk_24E1CCF30;
        objc_copyWeak(&v42, &location);
        v41 = v7;
        v34 = v14;
        block[0] = v20;
        v21 = (void *)MEMORY[0x2207A4EA0](v40);
        requestDispatch = self->_requestDispatch;
        block[1] = 3221225472;
        block[2] = __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_121;
        block[3] = &unk_24E1CCF80;
        objc_copyWeak(&v39, &location);
        v36 = v19;
        v37 = v17;
        v38 = v21;
        v23 = v21;
        v24 = v17;
        v25 = v19;
        dispatch_async(requestDispatch, block);

        v14 = v34;
        objc_destroyWeak(&v39);

        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);
      }
      else
      {
        (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, _QWORD, id))v7 + 2))(v7, self, 0, 0, v15);
      }

    }
    else
    {
      _CMSILogingFacility();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CMSCloudExtensionSession _performActivityUpdate:completion:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 12, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, _QWORD, id))v7 + 2))(v7, self, 0, 0, v15);
    }

  }
  else
  {
    if (v10)
      -[CMSCloudExtensionSession _performActivityUpdate:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, _QWORD, void *))v7 + 2))(v7, self, 0, 0, v13);
  }

}

void __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 32))
    {
      _CMSILogingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CMSCloudExtensionSession _performActivityUpdate:completion:]_block_invoke";
        _os_log_impl(&dword_21DE4E000, v12, OS_LOG_TYPE_DEFAULT, "%s no longer connected, discarding queues/activityUpdate response", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 2, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = 0;
      v7 = 0;
      v9 = (id)v13;
    }
    v8 = v8;
    if (objc_msgSend(v8, "statusCode") != 204)
    {
      if (v7 && !v9)
      {
        v18 = 0;
        objc_msgSend(v11, "_parsedObjectFromData:inResponse:error:", v7, v8, &v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        cmsSafeDictionary(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "cmsOptionalDictionaryForKey:", CFSTR("queue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cmsOptionalDictionaryForKey:", CFSTR("userActivity"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_13:
        goto LABEL_14;
      }
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_13;
  }
LABEL_14:

}

void __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_121(id *a1)
{
  _QWORD *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *, void *);
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3 = (void *)WeakRetained[18];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_2;
  v9 = &unk_24E1CCF58;
  v10 = WeakRetained;
  v4 = a1[4];
  v11 = a1[5];
  v12 = a1[4];
  v13 = a1[6];
  objc_msgSend(v3, "dataTaskWithRequest:completionHandler:", v4, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume", v6, v7, v8, v9, v10);

}

void __62__CMSCloudExtensionSession__performActivityUpdate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = objc_msgSend(v9, "statusCode");
  if (!v8 && (v10 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8
    || (objc_msgSend(*(id *)(a1 + 32), "_handleURLResponseCode:error:before:request:networkActivity:retryHandler:", v10, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)report:(unint64_t)a3 forActivity:(id)a4 nowPlaying:(id)a5 previous:(id)a6 timestamp:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = -[CMSUpdateActivityRequest initForActivity:report:nowPlaying:previouslyPlaying:]([CMSUpdateActivityRequest alloc], "initForActivity:report:nowPlaying:previouslyPlaying:", v17, a3, v16, v15);

  if (v19)
    objc_msgSend(v18, "setTimestamp:", v19);
  -[CMSCloudExtensionSession _performActivityUpdate:completion:](self, "_performActivityUpdate:completion:", v18, v14);

}

- (void)reportContentFailure:(id)a3 forActivity:(id)a4 whilePlaying:(id)a5 timestamp:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v17 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[CMSUpdateActivityRequest initForActivity:failure:whilePlaying:]([CMSUpdateActivityRequest alloc], "initForActivity:failure:whilePlaying:", v14, v15, v13);

  if (v17)
    objc_msgSend(v16, "setTimestamp:", v17);
  -[CMSCloudExtensionSession _performActivityUpdate:completion:](self, "_performActivityUpdate:completion:", v16, v12);

}

- (void)publishContentFailure:(id)a3 forActivity:(id)a4 whilePlaying:(id)a5 previousContentURL:(id)a6 nextContentURL:(id)a7 networkActivity:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  CMSContentFailureRequest *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  OS_dispatch_queue *requestDispatch;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  CMSCloudExtensionSession *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id location;
  id v51;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v42 = a8;
  v20 = a9;
  -[CMSCloudExtensionConfiguration configForEndpoint:](self->_config, "configForEndpoint:", CFSTR("queues/contentPlaybackFailure"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v41 = v15;
    v22 = -[CMSContentFailureRequest initWithContentFailure:whilePlaying:previousContentURL:nextContentURL:userActivityDictionary:]([CMSContentFailureRequest alloc], "initWithContentFailure:whilePlaying:previousContentURL:nextContentURL:userActivityDictionary:", v15, v17, v18, v19, v16);
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (!self->_connected)
      -[CMSCloudExtensionSession _connectSession](self, "_connectSession");
    os_unfair_lock_unlock(&self->_requestQueueLock);
    -[CMSCloudExtensionSession _constraintsDefinition](self, "_constraintsDefinition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMSContentFailureRequest setConstraints:](v22, "setConstraints:", v23);

    -[CMSContentFailureRequest setSessionIdentifier:](v22, "setSessionIdentifier:", self->_sessionIdentifier);
    -[CMSContentFailureRequest cmsCoded](v22, "cmsCoded");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v40 = v19;
      v51 = 0;
      CreateDataWithSerializedJSON(v24, &v51);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v51;
      if (v26)
      {
        objc_initWeak(&location, self);
        v39 = v17;
        requestDispatch = self->_requestDispatch;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke;
        block[3] = &unk_24E1CCFF8;
        objc_copyWeak(&v49, &location);
        v48 = v20;
        v44 = v21;
        v45 = self;
        v46 = v26;
        v47 = v42;
        v29 = requestDispatch;
        v17 = v39;
        dispatch_async(v29, block);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&location);
      }
      else if (v20)
      {
        (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, id))v20 + 2))(v20, self, 0, v27);
      }

      v19 = v40;
    }
    else
    {
      _CMSILogingFacility();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CMSCloudExtensionSession publishContentFailure:forActivity:whilePlaying:previousContentURL:nextContentURL:networkActivity:completion:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

      if (!v20)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 13, 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, id))v20 + 2))(v20, self, 0, v27);
    }

LABEL_19:
    goto LABEL_20;
  }
  _CMSILogingFacility();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[CMSCloudExtensionSession publishContentFailure:forActivity:whilePlaying:previousContentURL:nextContentURL:networkActivity:completion:].cold.1();

  if (v20)
  {
    v41 = v15;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 11, 0);
    v22 = (CMSContentFailureRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CMSCloudExtensionSession *, _QWORD, CMSContentFailureRequest *))v20 + 2))(v20, self, 0, v22);
LABEL_20:

    v15 = v41;
  }

}

void __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  _QWORD *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-type"));
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
    objc_msgSend(*(id *)(a1 + 40), "_updateDynamicHeadersOnRequest:withDeadline:", v4, 0);
    objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v4, "setHTTPBody:", *(_QWORD *)(a1 + 48));
    v5 = (void *)WeakRetained[18];
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke_2;
    v12 = &unk_24E1CCFD0;
    v6 = *(id *)(a1 + 64);
    v13 = WeakRetained;
    v14 = v6;
    objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v4, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "associateWithTask:", v7, v9, v10, v11, v12);
    objc_msgSend(v7, "resume");

LABEL_5:
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v4);
    goto LABEL_5;
  }
LABEL_6:

}

void __136__CMSCloudExtensionSession_publishContentFailure_forActivity_whilePlaying_previousContentURL_nextContentURL_networkActivity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "statusCode");
  if (v7 && !v9 && v10 == 200)
  {
    v11 = *(void **)(a1 + 32);
    v17 = 0;
    objc_msgSend(v11, "_parsedObjectFromData:inResponse:error:", v7, v8, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    cmsSafeDictionary(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, void *, id))(v15 + 16))(v15, *(_QWORD *)(a1 + 32), v14, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v16 + 16))(v16, *(_QWORD *)(a1 + 32), 0, v13);
  }

}

- (void)getAlbumArtDataFromURL:(id)a3 networkActivity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v12;
  _BOOL4 connected;
  NSObject *requestDispatch;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (!v8)
  {
    if (!v10)
      goto LABEL_11;
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 0;
LABEL_10:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v11)[2](v11, 0, 0, v17);

    goto LABEL_11;
  }
  _CMSILogingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CMSCloudExtensionSession getAlbumArtDataFromURL:networkActivity:completionHandler:].cold.1();

  os_unfair_lock_lock(&self->_requestQueueLock);
  connected = self->_connected;
  os_unfair_lock_unlock(&self->_requestQueueLock);
  if (!connected)
  {
    if (!v11)
      goto LABEL_11;
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 2;
    goto LABEL_10;
  }
  objc_initWeak(&location, self);
  requestDispatch = self->_requestDispatch;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke;
  block[3] = &unk_24E1CD020;
  objc_copyWeak(&v22, &location);
  v21 = v11;
  v19 = v8;
  v20 = v9;
  dispatch_async(requestDispatch, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_11:

}

void __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "configForEndpoint:", CFSTR("queues/playMedia"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("image/png,image/jpeg"), CFSTR("Accept"));
    v7 = (void *)v3[18];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke_2;
    v11[3] = &unk_24E1CC718;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "associateWithTask:", v8);
    objc_msgSend(v8, "resume");

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v10);

    }
  }

}

void __85__CMSCloudExtensionSession_getAlbumArtDataFromURL_networkActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (objc_msgSend(v9, "statusCode") == 204)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 15, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  if (!v14 || v8)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, v8);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("Content-type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, _QWORD))(v11 + 16))(v11, v14, v12, 0);

    }
    v8 = 0;
  }

}

- (double)durationForMethod:(id)a3
{
  os_unfair_lock_s *p_requestQueueLock;
  id v5;
  void *v6;
  double v7;
  double v8;

  p_requestQueueLock = &self->_requestQueueLock;
  v5 = a3;
  os_unfair_lock_lock(p_requestQueueLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_durations, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_requestQueueLock);
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)totalDuration
{
  os_unfair_lock_s *p_requestQueueLock;
  double totalDuration;

  p_requestQueueLock = &self->_requestQueueLock;
  os_unfair_lock_lock(&self->_requestQueueLock);
  totalDuration = self->_totalDuration;
  os_unfair_lock_unlock(p_requestQueueLock);
  return totalDuration;
}

- (void)closeWithForce:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_requestQueueLock;
  NSURLSession *session;

  v3 = a3;
  p_requestQueueLock = &self->_requestQueueLock;
  os_unfair_lock_lock(&self->_requestQueueLock);
  if (self->_connected)
  {
    *(_WORD *)&self->_connected = 256;
    session = self->_session;
    if (v3)
      -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
    else
      -[NSURLSession finishTasksAndInvalidate](session, "finishTasksAndInvalidate");
  }
  os_unfair_lock_unlock(p_requestQueueLock);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  NSURLSession *v8;
  NSURLSession *session;
  NSObject *requestDispatch;
  _QWORD block[5];

  v7 = a4;
  v8 = (NSURLSession *)a3;
  os_unfair_lock_lock(&self->_requestQueueLock);
  session = self->_session;

  if (session == v8)
  {
    *(_WORD *)&self->_connected = 256;
    objc_storeStrong((id *)&self->_closeError, a4);
    requestDispatch = self->_requestDispatch;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CMSCloudExtensionSession_URLSession_didBecomeInvalidWithError___block_invoke;
    block[3] = &unk_24E1CD048;
    block[4] = self;
    dispatch_async(requestDispatch, block);
  }
  os_unfair_lock_unlock(&self->_requestQueueLock);

}

uint64_t __65__CMSCloudExtensionSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t result;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 168);
  *(_QWORD *)(v10 + 168) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v14 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v14 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v14, *(_QWORD *)(v14 + 56));
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n{\n config: %@,\n sessionIdentifier: %@\n}"), self->_config, self->_sessionIdentifier);
}

- (void)getFairplayCertificateUsingNetworkActivity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *requestDispatch;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  _CMSILogingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CMSCloudExtensionSession getFairplayCertificateUsingNetworkActivity:completionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  objc_initWeak(&location, self);
  requestDispatch = self->_requestDispatch;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke;
  v19[3] = &unk_24E1CD070;
  objc_copyWeak(&v22, &location);
  v20 = v6;
  v21 = v7;
  v17 = v6;
  v18 = v7;
  dispatch_async(requestDispatch, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke(id *a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void (**v14)(id, _QWORD, void *);
  _QWORD v15[4];
  id v16;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "configForEndpoint:", CFSTR("queues/contentProtectionKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "fairPlayKeySystemCertificateUrl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "request");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "mutableCopy");

        objc_msgSend(v5, "fairPlayKeySystemCertificateUrl");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setURL:", v9);

        objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
        v10 = (void *)v3[18];
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke_2;
        v15[3] = &unk_24E1CC718;
        v16 = a1[5];
        objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v8, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "associateWithTask:", v11);
        objc_msgSend(v11, "resume");

      }
      else
      {
        v14 = (void (**)(id, _QWORD, void *))a1[5];
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 1, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, 0, v8);
      }

    }
    else
    {
      v12 = (void (**)(id, _QWORD, void *))a1[5];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v13);

    }
  }

}

void __89__CMSCloudExtensionSession_getFairplayCertificateUsingNetworkActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a4;
  v8 = objc_msgSend(a3, "statusCode");
  if (v10 && !v7 && v8 == 200)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)getContentProtectionKeyForAssetIdentifier:(id)a3 usingKeySystem:(id)a4 andKeyRequest:(id)a5 playerContext:(id)a6 userActivityDictionary:(id)a7 networkActivity:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *requestDispatch;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  _CMSILogingFacility();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[CMSCloudExtensionSession getContentProtectionKeyForAssetIdentifier:usingKeySystem:andKeyRequest:playerContext:userActivityDictionary:networkActivity:completionHandler:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

  objc_initWeak(&location, self);
  requestDispatch = self->_requestDispatch;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke;
  block[3] = &unk_24E1CD098;
  objc_copyWeak(&v46, &location);
  v39 = v17;
  v40 = v16;
  v44 = v20;
  v45 = v21;
  v41 = v15;
  v42 = v18;
  v43 = v19;
  v31 = v20;
  v32 = v19;
  v33 = v18;
  v34 = v15;
  v35 = v21;
  v36 = v16;
  v37 = v17;
  dispatch_async(requestDispatch, block);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

void __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
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
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[6];
  _QWORD v29[6];
  uint64_t v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "configForEndpoint:", CFSTR("queues/contentProtectionKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x24BDB1BB8];
    v31[0] = CFSTR("ContentKeySystemFairPlayStreaming");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v24 = v4;
      v28[0] = CFSTR("version");
      CMSCloudExtensionSpecVersion();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v10;
      v29[1] = v9;
      v28[1] = CFSTR("keySystem");
      v28[2] = CFSTR("assetIdentifier");
      v28[3] = CFSTR("keyRequest");
      v28[4] = CFSTR("context");
      v11 = *(void **)(a1 + 56);
      v29[2] = *(_QWORD *)(a1 + 48);
      v29[3] = v7;
      v23 = v7;
      objc_msgSend(v11, "cmsCoded");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[4] = v12;
      v28[5] = CFSTR("userActivity");
      v13 = *(void **)(a1 + 64);
      v14 = v13;
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v29[5] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)

      v27 = 0;
      CreateDataWithSerializedJSON(v15, &v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v27;
      if (v16)
      {
        objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-type"));
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
        objc_msgSend(v6, "setHTTPBody:", v16);
        v18 = (void *)v3[18];
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke_2;
        v25[3] = &unk_24E1CCFD0;
        v19 = *(id *)(a1 + 80);
        v25[4] = v3;
        v26 = v19;
        objc_msgSend(v18, "dataTaskWithRequest:completionHandler:", v6, v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "associateWithTask:", v20);
        objc_msgSend(v20, "resume");

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 13, 0);
        v22 = objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        v17 = (id)v22;
      }
      v4 = v24;

      v7 = v23;
    }
    else
    {
      v21 = *(_QWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v21 + 16))(v21, 0, 0, v15);
    }

  }
}

void __170__CMSCloudExtensionSession_getContentProtectionKeyForAssetIdentifier_usingKeySystem_andKeyRequest_playerContext_userActivityDictionary_networkActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "statusCode");
  if (v7 && !v9 && v10 == 200)
  {
    v11 = *(void **)(a1 + 32);
    v19 = 0;
    objc_msgSend(v11, "_parsedObjectFromData:inResponse:error:", v7, v8, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    cmsSafeDictionary(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "cmsOptionalStringForKey:", CFSTR("keyResponse"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cmsOptionalNumberForKey:", CFSTR("leaseRenewalDeadline"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && objc_msgSend(v15, "length"))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
      v18 = objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v13 = (id)v18;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.session"), 4, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (CMSCloudExtensionConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)authHeader
{
  return self->_authHeader;
}

- (void)setAuthHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (BOOL)updateUserTasteProfile
{
  return self->_updateUserTasteProfile;
}

- (void)setUpdateUserTasteProfile:(BOOL)a3
{
  self->_updateUserTasteProfile = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

- (BOOL)shuffledPlayback
{
  return self->_shuffledPlayback;
}

- (void)setShuffledPlayback:(BOOL)a3
{
  self->_shuffledPlayback = a3;
}

- (CMSPlayerContext)intentPlayerContext
{
  return self->_intentPlayerContext;
}

- (void)setIntentPlayerContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)prepareRequestHook
{
  return self->_prepareRequestHook;
}

- (void)setPrepareRequestHook:(id)a3
{
  self->_prepareRequestHook = a3;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)requesterHomeUserID
{
  return self->_requesterHomeUserID;
}

- (void)setRequesterHomeUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSMutableDictionary)exceptions
{
  return self->_exceptions;
}

- (void)setExceptions:(id)a3
{
  objc_storeStrong((id *)&self->_exceptions, a3);
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (NSMutableDictionary)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (NSMutableDictionary)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
  objc_storeStrong((id *)&self->_durations, a3);
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_exceptions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_requesterHomeUserID, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_intentPlayerContext, 0);
  objc_storeStrong((id *)&self->_authHeader, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong(&self->_closeCompletion, 0);
  objc_destroyWeak((id *)&self->_authProvider);
  objc_storeStrong((id *)&self->_closeError, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_requestDispatch, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setQosClass:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21DE4E000, a2, OS_LOG_TYPE_ERROR, "%@: already connected, can't change qosClass", v4, 0xCu);

  OUTLINED_FUNCTION_9();
}

- (void)_retryRequest:(uint64_t)a3 before:(uint64_t)a4 networkActivity:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21DE4E000, a1, a3, "%s: retry unlikely to meet deadline, not retrying.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_retryRequestAfterAuthTokenRenewal:(uint64_t)a3 parentNetworkActivity:(uint64_t)a4 before:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21DE4E000, a2, a3, "%s: session %@ Error: No authProvider configured", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __110__CMSCloudExtensionSession__retryRequestAfterAuthTokenRenewal_parentNetworkActivity_before_completionHandler___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_5();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_21DE4E000, v2, OS_LOG_TYPE_ERROR, "%s: session %@ retrieved no new authorization, error %@", (uint8_t *)v3, 0x20u);
  OUTLINED_FUNCTION_9();
}

- (void)_handleURLResponseCode:error:before:request:networkActivity:retryHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_21DE4E000, v0, v1, "%s: not retrying request, no retry handler provided. statusCode: %d error:%@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)_handleURLResponseCode:(os_log_t)log error:before:request:networkActivity:retryHandler:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[CMSCloudExtensionSession _handleURLResponseCode:error:before:request:networkActivity:retryHandler:]";
  v3 = 1024;
  v4 = 4;
  _os_log_error_impl(&dword_21DE4E000, log, OS_LOG_TYPE_ERROR, "%s: Maximum retry count reached: %d", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleURLResponseCode:error:before:request:networkActivity:retryHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_21DE4E000, v0, v1, "%s: not retrying request. statusCode: %d error:%@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)_handleURLResponse:before:networkActivity:request:data:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21DE4E000, v0, v1, "Unrecoverable error performing request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleURLResponse:before:networkActivity:request:data:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_21DE4E000, v1, OS_LOG_TYPE_DEBUG, "methodResponses: %@ error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21DE4E000, v0, v1, "Scheduling completion for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21DE4E000, v0, v1, "Result returned for %@ overriding preceeding result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__CMSCloudExtensionSession__handleURLResponse_before_networkActivity_request_data_error___block_invoke_3_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21DE4E000, a2, a3, "Duration for %@ is %.3f", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)performMethod:(uint64_t)a3 withParams:(uint64_t)a4 networkActivity:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21DE4E000, a2, a3, "%s on _requestQueue: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __80__CMSCloudExtensionSession_performMethod_withParams_networkActivity_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21DE4E000, v0, v1, "requestQueue: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestQueueForActivity:networkActivity:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_21DE4E000, v0, v1, "%s no support in configuration for endpoint %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getQueueSegmentFromURL:referrer:networkActivity:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_21DE4E000, v0, v1, "%s no support in configuration for endpoint %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_performActivityUpdate:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_21DE4E000, v0, v1, "%s optional endpoint %{public}@ not supported by service", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_performActivityUpdate:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21DE4E000, a1, a3, "%s can't serialize request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_performActivityUpdate:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21DE4E000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)publishContentFailure:forActivity:whilePlaying:previousContentURL:nextContentURL:networkActivity:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_21DE4E000, v0, v1, "%s optional endpoint %{public}@ not supported by service", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)publishContentFailure:(uint64_t)a3 forActivity:(uint64_t)a4 whilePlaying:(uint64_t)a5 previousContentURL:(uint64_t)a6 nextContentURL:(uint64_t)a7 networkActivity:(uint64_t)a8 completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21DE4E000, a1, a3, "%s can't serialize request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getAlbumArtDataFromURL:networkActivity:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21DE4E000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getFairplayCertificateUsingNetworkActivity:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21DE4E000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getContentProtectionKeyForAssetIdentifier:(uint64_t)a3 usingKeySystem:(uint64_t)a4 andKeyRequest:(uint64_t)a5 playerContext:(uint64_t)a6 userActivityDictionary:(uint64_t)a7 networkActivity:(uint64_t)a8 completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21DE4E000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
