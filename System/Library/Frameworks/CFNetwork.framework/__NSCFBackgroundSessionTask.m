@implementation __NSCFBackgroundSessionTask

- (__NSCFBackgroundSessionTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  __NSCFBackgroundSessionTask *v6;
  void *v7;
  const char *v8;
  id Property;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)__NSCFBackgroundSessionTask;
  v6 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v11, sel_initWithOriginalRequest_ident_taskGroup_, objc_msgSend(a3, "originalRequest"), a5, a4);
  if (v6)
  {
    -[NSURLSessionTask updateCurrentRequest:](v6, "updateCurrentRequest:", objc_msgSend(a3, "currentRequest"));
    -[NSURLSessionTask setResponse:](v6, "setResponse:", objc_msgSend(a3, "response"));
    -[NSURLSessionTask setEarliestBeginDate:](v6, "setEarliestBeginDate:", objc_msgSend(a3, "earliestBeginDate"));
    -[NSURLSessionTask setCountOfBytesClientExpectsToSend:](v6, "setCountOfBytesClientExpectsToSend:", objc_msgSend(a3, "countOfBytesClientExpectsToSend"));
    -[NSURLSessionTask setCountOfBytesClientExpectsToReceive:](v6, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(a3, "countOfBytesClientExpectsToReceive"));
    -[NSURLSessionTask setCountOfBytesReceived:](v6, "setCountOfBytesReceived:", objc_msgSend(a3, "countOfBytesReceived"));
    -[NSURLSessionTask setCountOfBytesSent:](v6, "setCountOfBytesSent:", objc_msgSend(a3, "countOfBytesSent"));
    -[NSURLSessionTask setCountOfBytesExpectedToSend:](v6, "setCountOfBytesExpectedToSend:", objc_msgSend(a3, "countOfBytesExpectedToSend"));
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](v6, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "countOfBytesExpectedToReceive"));
    -[NSURLSessionTask setState:](v6, "setState:", objc_msgSend(a3, "state"));
    -[NSURLSessionTask setError:](v6, "setError:", objc_msgSend(a3, "error"));
    -[__NSCFBackgroundSessionTask setTaskDescription:](v6, "setTaskDescription:", objc_msgSend(a3, "taskDescription"));
    -[NSURLSessionTask set_uniqueIdentifier:](v6, "set_uniqueIdentifier:", objc_msgSend(a3, "uniqueIdentifier"));
    -[NSURLSessionTask set_metrics:](v6, "set_metrics:", objc_msgSend(a3, "taskMetrics"));
    v7 = (void *)objc_msgSend(a3, "taskMetrics");
    if (v7)
      Property = objc_getProperty(v7, v8, 96, 1);
    else
      Property = 0;
    -[NSURLSessionTask set_backgroundTransactionMetrics:](v6, "set_backgroundTransactionMetrics:", Property);
    -[NSURLSessionTask set_trailers:](v6, "set_trailers:", objc_msgSend(a3, "_backgroundTrailers"));
    -[NSURLSessionTask set_extractor:](v6, "set_extractor:", 0);
    -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:](v6, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(a3, "_doesSZExtractorConsumeExtractedData"));
    -[NSURLSessionTask set_hasSZExtractor:](v6, "set_hasSZExtractor:", objc_msgSend(a3, "_hasSZExtractor"));
  }
  return v6;
}

- (void)setTaskDescription:(id)a3
{
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[6];

  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50____NSCFBackgroundSessionTask_setTaskDescription___block_invoke;
    block[3] = &unk_1E14FDE88;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  -[NSURLSessionTask setTaskDescription:](&v6, sel_setTaskDescription_, a3);
}

- (void)_onqueue_resume
{
  void *v3;
  NSUInteger v4;
  id v5;
  STExtractor *v6;
  double v7;
  void *v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (self->_immediateError)
  {
    -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:");
  }
  else
  {
    v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session"));
    v4 = -[NSURLSessionTask taskIdentifier](self, "taskIdentifier");
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[NSURLSessionTask _authenticatorConfiguredViaTaskProperty](self, "_authenticatorConfiguredViaTaskProperty")
      && -[NSURLSessionTaskHTTPAuthenticator statusCodes](-[NSURLSessionTask authenticator](self, "authenticator"), "statusCodes"))
    {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTaskHTTPAuthenticator statusCodes](-[NSURLSessionTask authenticator](self, "authenticator"), "statusCodes"), CFSTR("StatusCodes"));
    }
    if (-[NSURLSessionTask _publishingURL](self, "_publishingURL"))
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask _publishingURL](self, "_publishingURL"), CFSTR("PublishingURL"));
    if (-[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"))
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"), CFSTR("EarliestBeginDate"));
    if (-[NSURLSessionTask countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend") != -1)
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend")), CFSTR("CountOfBytesClientExpectsToSend"));
    if (-[NSURLSessionTask countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive") != -1)
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSURLSessionTask countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive")), CFSTR("CountOfBytesClientExpectsToReceive"));
    if (-[NSURLSessionTask _extractor](self, "_extractor"))
    {
      v6 = -[NSURLSessionTask _extractor](self, "_extractor");
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0), CFSTR("SZExtractor"));
      objc_msgSend(v5, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLSessionTask _hasSZExtractor](self, "_hasSZExtractor")), CFSTR("HasSZExtractor"));
      objc_msgSend(v5, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSURLSessionTask _doesSZExtractorConsumeExtractedData](self, "_doesSZExtractorConsumeExtractedData")), CFSTR("DoesSZExtractorConsumeExtractedData"));
    }
    if (-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"))
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), CFSTR("pathToDownloadTaskFile"));
    -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
    if (v7 != 0.0)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "numberWithDouble:"), CFSTR("TimeoutIntervalForResource"));
    }
    if (-[NSURLSessionTask _private_nw_activity](self, "_private_nw_activity"))
    {
      v10[0] = 0;
      v10[1] = 0;
      -[NSURLSessionTask _private_nw_activity](self, "_private_nw_activity");
      nw_activity_get_token();
      objc_msgSend(v5, "setObject:forKey:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v10), CFSTR("nw_activityUUID"));
    }
    if (!-[NSURLSessionTask _isAVAssetTask](self, "_isAVAssetTask") && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), CFSTR("effectiveConfig"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", -[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset](self, "_sourceApplicationBundleIdentifierForMobileAsset"), CFSTR("sourceApplicationBundleIdentifierForMobileAsset"));
    if (-[NSURLSessionTask _preconnect](self, "_preconnect"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("preconnect"));
    v9 = -[__NSCFBackgroundSessionTask cookiesForCurrentRequest](self, "cookiesForCurrentRequest");
    if (v9)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("cookies"));
    objc_msgSend(v3, "resumeTaskWithIdentifier:withProperties:", v4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5));
  }
}

- (__NSCFBackgroundSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  __NSCFBackgroundSessionTask *v5;
  __NSCFBackgroundSessionTask *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__NSCFBackgroundSessionTask;
  v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v8, sel_initWithOriginalRequest_ident_taskGroup_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[NSURLSessionTask setState:](v5, "setState:", 1);
  return v6;
}

- (void)dealloc
{
  NSMutableSet *secKeyProxies;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self)
    objc_setProperty_atomic(self, a2, 0, 776);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  secKeyProxies = self->_secKeyProxies;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](secKeyProxies, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(secKeyProxies);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "invalidate");
        objc_msgSend(v8, "setClientDisconnectionHandler:", 0);
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](secKeyProxies, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)__NSCFBackgroundSessionTask;
  -[NSURLSessionTask dealloc](&v9, sel_dealloc);
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  if (!self->_sentDidFinish)
  {
    self->_sentDidFinish = 1;
    -[NSURLSessionTask setError:](self, "setError:", a3);
    -[NSURLSessionTask setState:](self, "setState:", 3);
    -[NSURLSession _onqueue_didCompleteTask:withError:]((uint64_t)-[NSURLSessionTask session](self, "session"), self, -[NSURLSessionTask error](self, "error"));
  }
}

- (void)_onSessionQueue_disavow
{
  NSURLSession *v3;

  v3 = -[NSURLSessionTask session](self, "session");
  if (v3)
    -[__shared_weak_count removeObjectForKey:](v3[1]._nwContext.__cntrl_, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")));
}

- (__NSCFBackgroundSessionTask)initWithBackgroundTask:(id)a3
{
  __NSCFBackgroundSessionTask *v3;
  __NSCFBackgroundSessionTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  v3 = -[NSURLSessionTask initWithTask:](&v6, sel_initWithTask_, a3);
  v4 = v3;
  if (v3)
    -[NSURLSessionTask setState:](v3, "setState:", 0);
  return v4;
}

- (id)cookiesForCurrentRequest
{
  return (id)-[__NSCFBackgroundSessionTask cookiesForRequest:](self, -[NSURLSessionTask currentRequest](self, "currentRequest"));
}

- (id)requestWithCookiesApplied:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = -[__NSCFBackgroundSessionTask cookiesForRequest:](self, a3);
  if (!v4)
    return a3;
  v5 = v4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v5, 0x1EDCFCF28);
  return v6;
}

- (void)addSecKeyProxy:(id)a3
{
  os_unfair_lock_s *p_proxyLock;
  NSMutableSet *secKeyProxies;

  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  secKeyProxies = self->_secKeyProxies;
  if (!secKeyProxies)
  {
    secKeyProxies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->_secKeyProxies = secKeyProxies;
  }
  -[NSMutableSet addObject:](secKeyProxies, "addObject:", a3);
  os_unfair_lock_unlock(p_proxyLock);
}

- (void)removeSecKeyProxy:(id)a3
{
  os_unfair_lock_s *p_proxyLock;

  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  -[NSMutableSet removeObject:](self->_secKeyProxies, "removeObject:", a3);
  os_unfair_lock_unlock(p_proxyLock);
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  __NSCFBackgroundSessionTask **v4;
  _QWORD v5[5];

  v4 = (__NSCFBackgroundSessionTask **)self;
  if (self)
  {
    self = (__NSCFBackgroundSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v4[87];
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95____NSCFBackgroundSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
  v5[3] = &unk_1E14F9A58;
  v5[4] = a4;
  -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]((uint64_t)self, v4, a3, v5);
}

- (void)_onqueue_didReceiveInformationalResponse:(id)a3
{
  __NSCFBackgroundSessionTask **v3;

  v3 = (__NSCFBackgroundSessionTask **)self;
  if (self)
  {
    self = (__NSCFBackgroundSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v3[87];
  }
  -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)self, v3, a3);
}

- (void)_onqueue_didReceiveResponse:(id)a3
{
  -[NSURLSessionTask setResponse:](self, "setResponse:");
  if (!-[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive"))
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "expectedContentLength"));
}

- (void)_onqueue_suspend
{
  objc_msgSend((id)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session")), "suspendTaskWithIdentifier:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
}

- (void)_onqueue_cancel
{
  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateCanceling && !self->_sentCancel)
  {
    self->_sentCancel = 1;
    -[NSURLSessionTask setState:](self, "setState:", 2);
    objc_msgSend((id)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session")), "cancelTaskWithIdentifier:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
  }
}

- (void)_onqueue_adjustPoolPriority
{
  objc_msgSend((id)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session")), "setPriority:forTaskWithIdentifier:", -[NSURLSessionTask _priorityValue](self, "_priorityValue"), -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
}

- (void)_onqueue_adjustLoadingPoolPriority
{
  void *v3;
  double v4;

  v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session"));
  -[NSURLSessionTask _loadingPriorityValue](self, "_loadingPriorityValue");
  objc_msgSend(v3, "setLoadingPoolPriority:forTaskWithIdentifier:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"), v4);
}

- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3
{
  objc_msgSend((id)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session")), "setBytesPerSecondLimit:forTaskWithIdentifier:", a3, -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
}

- (void)setDelegate:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Task delegate is not supported on background session task"), 0));
}

- (id)_timingData
{
  return -[__CFN_TransactionMetrics legacyStaticMetrics]((uint64_t)-[NSURLSessionTask _backgroundTransactionMetrics](self, "_backgroundTransactionMetrics"));
}

- (void)set_discretionaryOverride:(int64_t)a3
{
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[6];

  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57____NSCFBackgroundSessionTask_set_discretionaryOverride___block_invoke;
    block[3] = &unk_1E14FE140;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  -[NSURLSessionTask set_discretionaryOverride:](&v6, sel_set_discretionaryOverride_, a3);
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  uint64_t v3;
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[5];
  __int16 v8;

  v3 = a3;
  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70____NSCFBackgroundSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke;
    block[3] = &unk_1E14FE168;
    block[4] = self;
    v8 = v3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](&v6, sel_set_TLSMinimumSupportedProtocolVersion_, v3);
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  uint64_t v3;
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[5];
  __int16 v8;

  v3 = a3;
  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70____NSCFBackgroundSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke;
    block[3] = &unk_1E14FE168;
    block[4] = self;
    v8 = v3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](&v6, sel_set_TLSMaximumSupportedProtocolVersion_, v3);
}

- (uint64_t)cookiesForRequest:(void *)a1
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (!a1
    || !objc_msgSend(a2, "URL")
    || objc_msgSend(a2, "valueForHTTPHeaderField:", 0x1EDCFCF28)
    || !objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPCookieStorage")
    || !objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPShouldSetCookies")
    || !objc_msgSend(a2, "HTTPShouldHandleCookies"))
  {
    return 0;
  }
  if (objc_msgSend(a1, "_siteForCookies"))
  {
    v18[0] = CFSTR("_kCFHTTPCookiePolicyPropertySiteForCookies");
    v19[0] = objc_msgSend(a1, "_siteForCookies");
    v18[1] = CFSTR("_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation");
    v19[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_isTopLevelNavigation"));
    v18[2] = CFSTR("_kCFHTTPCookiePolicyPropertyIsSafeRequest");
    v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "_isIdempotent"));
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  }
  else
  {
    v6 = 0;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__6654;
  v16 = __Block_byref_object_dispose__6655;
  v17 = 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPCookieStorage");
  v8 = objc_msgSend(a2, "URL");
  v9 = objc_msgSend(a2, "mainDocumentURL");
  v10 = objc_msgSend(a1, "_storagePartitionIdentifier");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49____NSCFBackgroundSessionTask_cookiesForRequest___block_invoke;
  v11[3] = &unk_1E14FE2A8;
  v11[4] = &v12;
  objc_msgSend(v7, "_getCookiesForURL:mainDocumentURL:partition:policyProperties:completionHandler:", v8, v9, v10, v6, v11);
  v4 = objc_msgSend((id)v13[5], "objectForKeyedSubscript:", 0x1EDCFCF28);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)_onqueue_connectionWaitingWithReason:(_QWORD *)a1
{
  uint64_t v2;

  if (a1)
  {
    v2 = a1[88];
    if (!v2)
      v2 = a1[87];
    -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](v2, a1, (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSTCPConnectionConditionsUnmetReasonErrorDomain"), a2, 0));
  }
}

@end
