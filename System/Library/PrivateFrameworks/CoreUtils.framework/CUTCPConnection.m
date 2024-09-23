@implementation CUTCPConnection

- (CUTCPConnection)init
{
  CUTCPConnection *v2;
  int v3;
  CUTCPConnection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUTCPConnection;
  v2 = -[CUTCPConnection init](&v6, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    if (_os_feature_enabled_impl())
      v3 = 50;
    else
      v3 = 9;
    v2->_rawIOLogLevel = v3;
    v2->_socketFD = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUTCPConnection;
    pthread_mutex_init(&v2->_mutex, 0);
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  pthread_mutex_destroy(&self->_mutex);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUTCPConnection;
  -[CUTCPConnection dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  NSString *label;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t trafficFlags;
  __CFString *v34;
  uint64_t v36;
  CFMutableStringRef v37;
  CFMutableStringRef v38;
  CFMutableStringRef v39;
  CFMutableStringRef v40;

  v40 = 0;
  NSAppendPrintF(&v40, (uint64_t)"CUTCPConnection ", v2, v3, v4, v5, v6, v7, v36);
  v9 = v40;
  v16 = v9;
  label = self->_label;
  if (label)
  {
    v39 = v9;
    v18 = label;
    NSAppendPrintF(&v39, (uint64_t)"'%@' ", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    v25 = v39;

    v16 = v25;
  }
  v38 = v16;
  NSAppendPrintF(&v38, (uint64_t)"%##a -> %##a", v10, v11, v12, v13, v14, v15, (uint64_t)&self->_selfAddr);
  v26 = v38;

  trafficFlags = self->_trafficFlags;
  if ((_DWORD)trafficFlags)
  {
    v37 = v26;
    NSAppendPrintF(&v37, (uint64_t)", TF %#{flags}", v27, v28, v29, v30, v31, v32, trafficFlags);
    v34 = v37;

    v26 = v34;
  }
  return v26;
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE067C20;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)setTrafficFlags:(unsigned int)a3
{
  _opaque_pthread_mutex_t *p_mutex;
  NSObject *dispatchQueue;
  _QWORD block[5];

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_activateCalled && !self->_trafficFlagsPending)
    {
      self->_trafficFlagsPending = 1;
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__CUTCPConnection_setTrafficFlags___block_invoke;
      block[3] = &unk_1E25DF2A0;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  pthread_mutex_unlock(p_mutex);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_mutex;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  self->_activateCalled = 1;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CUTCPConnection_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E25DE600;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);
  pthread_mutex_unlock(p_mutex);

}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  pthread_mutex_lock(&self->_mutex);
  self->_activateCalled = 1;
  pthread_mutex_unlock(&self->_mutex);
  return -[CUTCPConnection _activateDirectAndReturnError:](self, "_activateDirectAndReturnError:", a3);
}

- (BOOL)_activateDirectAndReturnError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t socketFD;
  LogCategory *ucat;
  CUBonjourDevice *destinationBonjour;
  unsigned int flags;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *destinationString;
  NSString *v23;
  id v24;
  void (**activateCompletion)(id, _QWORD);
  NSMutableArray *v26;
  NSMutableArray *readRequests;
  NSMutableArray *v28;
  NSMutableArray *writeRequests;
  BOOL v30;
  LogCategory *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36[2];
  id v37;

  self->_activateTicks = mach_absolute_time();
  socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_15;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_15:
        v37 = 0;
        -[CUTCPConnection _setupIOAndReturnError:](self, "_setupIOAndReturnError:", &v37);
        v24 = v37;
        if (!v24)
        {
          activateCompletion = (void (**)(id, _QWORD))self->_activateCompletion;
          if (!activateCompletion)
          {
LABEL_19:
            v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            readRequests = self->_readRequests;
            self->_readRequests = v26;

            v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            writeRequests = self->_writeRequests;
            self->_writeRequests = v28;

            v16 = 0;
LABEL_20:
            v30 = 1;
            goto LABEL_21;
          }
          activateCompletion[2](activateCompletion, 0);
          v14 = self->_activateCompletion;
          self->_activateCompletion = 0;
LABEL_18:

          goto LABEL_19;
        }
        goto LABEL_23;
      }
      ucat = self->_ucat;
      socketFD = self->_socketFD;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate with socket %d\n", v6, v7, v8, v9, socketFD);
    goto LABEL_15;
  }
  destinationBonjour = self->_destinationBonjour;
  if (destinationBonjour)
  {
    flags = self->_flags;
    self->_flags = flags | 0x200;
    if ((flags & 0x100) != 0)
    {
      v36[1] = 0;
      -[CUTCPConnection _startConnectingToBonjourDevice:error:](self, "_startConnectingToBonjourDevice:error:");
      v24 = 0;
      if (!v24)
        goto LABEL_19;
LABEL_23:
      v16 = v24;
      goto LABEL_26;
    }
    v36[0] = 0;
    v14 = -[CUBonjourDevice copyConnectionStringWithFlags:error:](destinationBonjour, "copyConnectionStringWithFlags:error:", 0, v36);
    v15 = v36[0];
    v16 = v15;
    if (v14)
    {
      v35 = v15;
      -[CUTCPConnection _startConnectingToDestination:error:](self, "_startConnectingToDestination:error:", v14, &v35);
      v17 = v35;

      if (!v17)
        goto LABEL_18;
      v16 = v17;
    }

    goto LABEL_25;
  }
  destinationString = self->_destinationString;
  if (!destinationString)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No destination or socket", 0, v5, v6, v7, v8, v9, v33);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    if (!v16)
      goto LABEL_20;
    goto LABEL_26;
  }
  self->_flags |= 0x200u;
  v34 = 0;
  v23 = destinationString;
  -[CUTCPConnection _startConnectingToDestination:error:](self, "_startConnectingToDestination:error:", v23, &v34);
  v16 = v34;

  if (!v16)
    goto LABEL_19;
LABEL_26:
  v32 = self->_ucat;
  if (v32->var0 > 60)
    goto LABEL_30;
  if (v32->var0 != -1)
    goto LABEL_28;
  if (_LogCategory_Initialize((uint64_t)v32, 0x3Cu))
  {
    v32 = self->_ucat;
LABEL_28:
    LogPrintF((uint64_t)v32, (uint64_t)"-[CUTCPConnection _activateDirectAndReturnError:]", 0x3Cu, (uint64_t)"### Activate direct failed: %{error}\n", v18, v19, v20, v21, (uint64_t)v16);
  }
LABEL_30:
  if (a3)
  {
    v16 = objc_retainAutorelease(v16);
    v30 = 0;
    *a3 = v16;
  }
  else
  {
    v30 = 0;
  }
LABEL_21:

  return v30;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUTCPConnection_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CUNANDataSession *nanDataSession;
  CUNetLinkManager *netLinkManager;
  CUNetLinkManager *v24;
  id errorHandler;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  AsyncConnection *connector;
  NSObject *readSource;
  NSObject *writeSource;
  NSObject *socketEventsSource;
  uint64_t v36;
  void *v37;
  id v38;

  if (self->_invalidateCalled)
    return;
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      NSPrintF((uint64_t)"%##a", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)&self->_peerAddr);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF((uint64_t)"%##a", v11, v12, v13, v14, v15, v16, v17, (uint64_t)&self->_selfAddr);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _invalidate]", 0x1Eu, (uint64_t)"Invalidating: peer=%@, self=%@", v18, v19, v20, v21, (uint64_t)v10);

      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  -[CUTCPConnection _logMetrics](self, "_logMetrics");
  -[CUNANDataSession invalidate](self->_nanDataSession, "invalidate");
  nanDataSession = self->_nanDataSession;
  self->_nanDataSession = 0;

  netLinkManager = self->_netLinkManager;
  if (netLinkManager && self->_netLinkEndpoint)
  {
    -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
    v24 = self->_netLinkManager;
    self->_netLinkManager = 0;

  }
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (I)", v26, v27, v28, v29, v30, v31, v36);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  -[CUTCPConnection _abortReadsWithError:](self, "_abortReadsWithError:", v38);
  -[CUTCPConnection _abortWritesWithError:](self, "_abortWritesWithError:", v38);
  connector = self->_connector;
  if (connector)
    dispatch_async_f(*((dispatch_queue_t *)connector + 13), connector, (dispatch_function_t)_AsyncConnection_UserRelease);
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    if (self->_readSuspended)
    {
      self->_readSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_readSource);
    }
  }
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_source_cancel(writeSource);
    if (self->_writeSuspended)
    {
      self->_writeSuspended = 0;
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
  }
  socketEventsSource = self->_socketEventsSource;
  if (socketEventsSource)
    dispatch_source_cancel(socketEventsSource);
  -[CUTCPConnection _invalidated](self, "_invalidated");

}

- (void)_invalidated
{
  int socketFD;
  CUWiFiManager *wifiTrafficManager;
  void (**serverInvalidationHandler)(void);
  void (**invalidationHandler)(void);
  id errorHandler;
  id flowControlChangedHandler;
  id v9;
  id v10;
  id socketEventHandler;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *ucat;
  uint64_t v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone
    && !self->_connector
    && !self->_readSource
    && !self->_writeSource
    && !self->_socketEventsSource
    && !self->_readRequestCurrent
    && !-[NSMutableArray count](self->_readRequests, "count")
    && !self->_writeRequestCurrent
    && !-[NSMutableArray count](self->_writeRequests, "count")
    && !self->_netLinkEndpoint)
  {
    socketFD = self->_socketFD;
    if ((socketFD & 0x80000000) == 0)
    {
      if (close(socketFD) && *__error())
        __error();
      self->_socketFD = -1;
    }
    -[CUWiFiManager invalidate](self->_wifiTrafficManager, "invalidate");
    wifiTrafficManager = self->_wifiTrafficManager;
    self->_wifiTrafficManager = 0;

    serverInvalidationHandler = (void (**)(void))self->_serverInvalidationHandler;
    if (serverInvalidationHandler)
      serverInvalidationHandler[2]();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    flowControlChangedHandler = self->_flowControlChangedHandler;
    self->_flowControlChangedHandler = 0;

    v9 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v10 = self->_serverInvalidationHandler;
    self->_serverInvalidationHandler = 0;

    socketEventHandler = self->_socketEventHandler;
    self->_socketEventHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_22:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v12, v13, v14, v15, v17);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_22;
      }
    }
  }
}

- (BOOL)_startConnectingToBonjourDevice:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  LogCategory *ucat;
  NSString *interfaceName;
  void *v13;
  id v14;
  void *v15;
  int v16;
  unsigned int v17;
  double connectTimeoutSecs;
  unint64_t v19;
  CUTCPConnection *v20;
  OS_dispatch_queue *dispatchQueue;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  id v33;

  v10 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _startConnectingToBonjourDevice:error:]", 0x1Eu, (uint64_t)"Connecting to '%@'\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  interfaceName = self->_interfaceName;
  v33 = 0;
  v13 = (void *)objc_msgSend(v10, "copyConnectionInfoWithFlags:interfaceName:error:", 0, interfaceName, &v33);
  v14 = v33;
  v15 = v14;
  if (v13)
  {
    if ((self->_flags & 0x10) != 0)
      v16 = 1536;
    else
      v16 = 1024;
    v17 = self->_flags & 1 | (4 * ((self->_flags >> 5) & 1)) | v16;
    connectTimeoutSecs = self->_connectTimeoutSecs;
    if (connectTimeoutSecs <= 0.0)
      v19 = -1;
    else
      v19 = (unint64_t)(connectTimeoutSecs * 1000000000.0);
    v20 = self;
    v23 = 0u;
    v24 = 0u;
    v29 = 0u;
    v30 = 0u;
    v32 = 0;
    v31 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    DWORD2(v23) = v20->_defaultPort;
    HIDWORD(v23) = v17;
    *(_QWORD *)&v24 = v19;
    *((_QWORD *)&v24 + 1) = -1;
    *((_QWORD *)&v29 + 1) = _connectCompletion;
    *(_QWORD *)&v30 = v13;
    dispatchQueue = v20->_dispatchQueue;
    *((_QWORD *)&v28 + 1) = 152;
    *((_QWORD *)&v26 + 1) = v20;
    *(_QWORD *)&v27 = dispatchQueue;
    *(_QWORD *)&v29 = -[NSString UTF8String](v20->_label, "UTF8String");
    if (AsyncConnection_ConnectEx(&v20->_connector, (uint64_t)&v23))
      CFRelease(v20);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v14);
  }

  return v13 != 0;
}

- (BOOL)_startConnectingToDestination:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  LogCategory *ucat;
  int v12;
  unsigned int v13;
  double connectTimeoutSecs;
  unint64_t v15;
  CUTCPConnection *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  BOOL v27;
  uint64_t v29;
  uint64_t v30;
  int defaultPort;
  unsigned int v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v10 = a3;
  ucat = self->_ucat;
  if (ucat->var0 > 30)
    goto LABEL_5;
  if (ucat->var0 != -1)
    goto LABEL_3;
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_3:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _startConnectingToDestination:error:]", 0x1Eu, (uint64_t)"Connecting to '%@'\n", v6, v7, v8, v9, (uint64_t)v10);
  }
LABEL_5:
  if ((self->_flags & 0x10) != 0)
    v12 = 1536;
  else
    v12 = 1024;
  v13 = self->_flags & 1 | (4 * ((self->_flags >> 5) & 1)) | v12;
  connectTimeoutSecs = self->_connectTimeoutSecs;
  if (connectTimeoutSecs <= 0.0)
    v15 = -1;
  else
    v15 = (unint64_t)(connectTimeoutSecs * 1000000000.0);
  v16 = self;
  v43 = 0;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v38 = 0;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v39 = 152;
  v17 = objc_retainAutorelease(v10);
  v30 = objc_msgSend(v17, "UTF8String");
  defaultPort = v16->_defaultPort;
  v32 = v13;
  v33 = v15;
  v34 = -1;
  *(_QWORD *)&v36 = _connectHandler;
  *((_QWORD *)&v36 + 1) = v16;
  *(_QWORD *)&v37 = v16->_dispatchQueue;
  *(_QWORD *)&v40 = -[NSString UTF8String](v16->_label, "UTF8String");
  v18 = AsyncConnection_ConnectEx(&v16->_connector, (uint64_t)&v30);
  if ((_DWORD)v18)
  {
    NSErrorWithOSStatusF(v18, (uint64_t)"Start connect failed", v19, v20, v21, v22, v23, v24, v29);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v16);
    v25 = v26 != 0;
    if (a4 && v26)
    {
      v26 = objc_retainAutorelease(v26);
      *a4 = v26;
      v25 = 1;
    }
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  v27 = !v25;

  return v27;
}

- (BOOL)_setupIOAndReturnError:(id *)a3
{
  int socketFD;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t InterfaceInfo;
  int v13;
  int v14;
  double dataTimeoutSecs;
  int keepAliveIdleSeconds;
  int v17;
  int *v18;
  const char *v19;
  int keepAliveSeconds;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LogCategory *ucat;
  unsigned int *p_netTransportType;
  unsigned int v28;
  LogCategory *v29;
  id v30;
  BOOL v31;
  uint64_t v32;
  CUNetLinkEndpoint *v33;
  CUNetLinkEndpoint *netLinkEndpoint;
  OS_dispatch_source *v35;
  OS_dispatch_source *readSource;
  NSObject *v37;
  NSObject *v38;
  OS_dispatch_source *v39;
  OS_dispatch_source *writeSource;
  NSObject *v41;
  NSObject *v42;
  uintptr_t v43;
  dispatch_source_t v44;
  BOOL v45;
  uint64_t v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD handler[5];
  _QWORD v54[5];
  _OWORD v55[2];
  int v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;

  socketFD = self->_socketFD;
  v60 = 1;
  if (setsockopt(socketFD, 0xFFFF, 4130, &v60, 4u))
  {
    if (*__error())
    {
      InterfaceInfo = *__error();
      if (!(_DWORD)InterfaceInfo)
        goto LABEL_4;
    }
    else
    {
      InterfaceInfo = 4294960596;
    }
    v19 = "Set SO_NOSIGPIPE failed";
    goto LABEL_58;
  }
LABEL_4:
  InterfaceInfo = SocketSetNonBlocking(self->_socketFD, 1);
  if ((_DWORD)InterfaceInfo)
  {
    v19 = "Make non-blocking failed";
    goto LABEL_58;
  }
  v13 = self->_socketFD;
  v59 = 1;
  if (setsockopt(v13, 6, 1, &v59, 4u))
  {
    if (*__error())
    {
      InterfaceInfo = *__error();
      if (!(_DWORD)InterfaceInfo)
        goto LABEL_8;
    }
    else
    {
      InterfaceInfo = 4294960596;
    }
    v19 = "Set TCP_NODELAY failed";
    goto LABEL_58;
  }
LABEL_8:
  InterfaceInfo = SocketSetNotSentLowWatermark(self->_socketFD, 0x4000uLL);
  if ((_DWORD)InterfaceInfo)
  {
    v19 = "Set TCP_NOTSENT_LOWAT failed";
    goto LABEL_58;
  }
  if ((self->_flags & 8) != 0)
  {
    v14 = self->_socketFD;
    v58 = 1;
    if (setsockopt(v14, 0xFFFF, 4131, &v58, 4u))
    {
      if (*__error())
      {
        InterfaceInfo = *__error();
        if (!(_DWORD)InterfaceInfo)
          goto LABEL_13;
      }
      else
      {
        InterfaceInfo = 4294960596;
      }
      v19 = "Set SO_NOADDRERR failed";
      goto LABEL_58;
    }
  }
LABEL_13:
  dataTimeoutSecs = self->_dataTimeoutSecs;
  if (dataTimeoutSecs > 0.0)
  {
    InterfaceInfo = SocketSetTCPTimeout(self->_socketFD, (int)dataTimeoutSecs);
    if ((_DWORD)InterfaceInfo)
    {
      v19 = "Set TCP timeout failed";
      goto LABEL_58;
    }
  }
  keepAliveIdleSeconds = self->_keepAliveIdleSeconds;
  if (keepAliveIdleSeconds >= 1)
  {
    InterfaceInfo = SocketSetKeepAliveEx(self->_socketFD, keepAliveIdleSeconds, self->_keepAliveIntervalSeconds, self->_keepAliveMaxCount);
    if (!(_DWORD)InterfaceInfo)
    {
      if ((self->_flags & 2) == 0)
        goto LABEL_40;
      v17 = self->_socketFD;
      v57 = 1;
      v18 = &v57;
      goto LABEL_27;
    }
LABEL_77:
    v19 = "Set TCP keepalive failed";
    goto LABEL_58;
  }
  keepAliveSeconds = self->_keepAliveSeconds;
  if (keepAliveSeconds < 1)
    goto LABEL_40;
  if (keepAliveSeconds <= 3)
    keepAliveSeconds = 3;
  InterfaceInfo = SocketSetKeepAliveEx(self->_socketFD, (1431655766 * (unint64_t)keepAliveSeconds) >> 32, (1431655766 * (unint64_t)keepAliveSeconds) >> 32, 3);
  if ((_DWORD)InterfaceInfo)
    goto LABEL_77;
  if ((self->_flags & 2) == 0)
    goto LABEL_40;
  v17 = self->_socketFD;
  v56 = 1;
  v18 = &v56;
LABEL_27:
  if (!setsockopt(v17, 6, 529, v18, 4u))
    goto LABEL_40;
  if (!*__error())
  {
    v25 = 4294960596;
LABEL_36:
    ucat = self->_ucat;
    if (ucat->var0 > 60)
      goto LABEL_40;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        goto LABEL_40;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _setupIOAndReturnError:]", 0x3Cu, (uint64_t)"### Set TCP_KEEPALIVE_OFFLOAD failed: %#m\n", v21, v22, v23, v24, v25);
    goto LABEL_40;
  }
  v25 = *__error();
  if ((_DWORD)v25)
    goto LABEL_36;
LABEL_40:
  HIDWORD(v60) = 28;
  if (!getsockname(self->_socketFD, &self->_selfAddr.sa, (socklen_t *)&v60 + 1))
    goto LABEL_43;
  if (!*__error())
  {
    InterfaceInfo = 4294960596;
    goto LABEL_55;
  }
  InterfaceInfo = *__error();
  if ((_DWORD)InterfaceInfo)
  {
LABEL_55:
    v19 = "Get self address failed";
    goto LABEL_58;
  }
LABEL_43:
  HIDWORD(v60) = 28;
  if (!getpeername(self->_socketFD, &self->_peerAddr.sa, (socklen_t *)&v60 + 1))
    goto LABEL_46;
  if (!*__error())
  {
    InterfaceInfo = 4294960596;
    goto LABEL_57;
  }
  InterfaceInfo = *__error();
  if ((_DWORD)InterfaceInfo)
  {
LABEL_57:
    v19 = "Get peer address failed";
    goto LABEL_58;
  }
LABEL_46:
  p_netTransportType = &self->_netTransportType;
  InterfaceInfo = SocketGetInterfaceInfo(self->_socketFD, 0, self->_ifName, &self->_ifIndex, 0, &self->_ifMedia, (int *)&self->_ifFlags, &self->_ifExtendedFlags, 0, (uint64_t)&self->_netTransportType);
  if ((_DWORD)InterfaceInfo)
  {
    v19 = "Get interface info failed";
    goto LABEL_58;
  }
  v28 = *p_netTransportType;
  if (*p_netTransportType != 4 && v28 != 64 && v28 != 128)
    SocketSetP2P(self->_socketFD, 0);
  v29 = self->_ucat;
  if (v29->var0 > 30)
    goto LABEL_63;
  if (v29->var0 != -1)
    goto LABEL_53;
  if (_LogCategory_Initialize((uint64_t)v29, 0x1Eu))
  {
    v29 = self->_ucat;
LABEL_53:
    LogPrintF((uint64_t)v29, (uint64_t)"-[CUTCPConnection _setupIOAndReturnError:]", 0x1Eu, (uint64_t)"Connected to %##a from %##a, %s\n", v8, v9, v10, v11, (uint64_t)&self->_peerAddr);
  }
LABEL_63:
  -[CUTCPConnection _updateTrafficRegistration](self, "_updateTrafficRegistration");
  v32 = MEMORY[0x1E0C809B0];
  if ((self->_flags & 4) != 0 && self->_netLinkManager && (self->_ifExtendedFlags & 0x40000) == 0)
  {
    v33 = objc_alloc_init(CUNetLinkEndpoint);
    netLinkEndpoint = self->_netLinkEndpoint;
    self->_netLinkEndpoint = v33;

    v55[0] = self->_peerAddr.sa;
    *(in6_addr *)((char *)v55 + 12) = *(in6_addr *)((char *)&self->_peerAddr.v6.sin6_addr + 4);
    -[CUNetLinkEndpoint setIpAddr:](self->_netLinkEndpoint, "setIpAddr:", v55);
    v54[0] = v32;
    v54[1] = 3221225472;
    v54[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke;
    v54[3] = &unk_1E25DF2A0;
    v54[4] = self;
    -[CUNetLinkEndpoint setStateChangedHandler:](self->_netLinkEndpoint, "setStateChangedHandler:", v54);
    -[CUNetLinkManager addEndpoint:](self->_netLinkManager, "addEndpoint:", self->_netLinkEndpoint);
  }
  v35 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], self->_socketFD, 0, (dispatch_queue_t)self->_dispatchQueue);
  readSource = self->_readSource;
  self->_readSource = v35;

  v37 = self->_readSource;
  if (v37)
  {
    handler[0] = v32;
    handler[1] = 3221225472;
    handler[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_2;
    handler[3] = &unk_1E25DF2A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v37, handler);
    v38 = self->_readSource;
    v52[0] = v32;
    v52[1] = 3221225472;
    v52[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_3;
    v52[3] = &unk_1E25DF2A0;
    v52[4] = self;
    dispatch_source_set_cancel_handler(v38, v52);
    dispatch_resume((dispatch_object_t)self->_readSource);
    v39 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DF0], self->_socketFD, 0, (dispatch_queue_t)self->_dispatchQueue);
    writeSource = self->_writeSource;
    self->_writeSource = v39;

    v41 = self->_writeSource;
    if (v41)
    {
      v51[0] = v32;
      v51[1] = 3221225472;
      v51[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_4;
      v51[3] = &unk_1E25DF2A0;
      v51[4] = self;
      dispatch_source_set_event_handler(v41, v51);
      v42 = self->_writeSource;
      v50[0] = v32;
      v50[1] = 3221225472;
      v50[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_5;
      v50[3] = &unk_1E25DF2A0;
      v50[4] = self;
      dispatch_source_set_cancel_handler(v42, v50);
      self->_writeSuspended = 1;
      self->_flowControlState = 10;
      v43 = (self->_flags >> 2) & 0x100 | (((self->_flags >> 11) & 1) << 15);
      if ((_DWORD)v43)
      {
        v44 = dispatch_source_create(MEMORY[0x1E0C80DC8], self->_socketFD, v43, (dispatch_queue_t)self->_dispatchQueue);
        objc_storeStrong((id *)&self->_socketEventsSource, v44);
        if (v44)
        {
          v49[0] = v32;
          v49[1] = 3221225472;
          v49[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_6;
          v49[3] = &unk_1E25DF2A0;
          v49[4] = self;
          dispatch_source_set_event_handler(v44, v49);
          v48[0] = v32;
          v48[1] = 3221225472;
          v48[2] = __42__CUTCPConnection__setupIOAndReturnError___block_invoke_7;
          v48[3] = &unk_1E25DF2A0;
          v48[4] = self;
          dispatch_source_set_cancel_handler(v44, v48);
          dispatch_activate(v44);
        }

      }
      v31 = 0;
      v30 = 0;
      goto LABEL_74;
    }
    v19 = "Create write source failed";
  }
  else
  {
    v19 = "Create read source failed";
  }
  InterfaceInfo = 4294960596;
LABEL_58:
  NSErrorWithOSStatusF(InterfaceInfo, (uint64_t)v19, v6, v7, v8, v9, v10, v11, v47);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = v30 != 0;
  if (a3 && v30)
  {
    v30 = objc_retainAutorelease(v30);
    *a3 = v30;
    v31 = 1;
  }
LABEL_74:
  v45 = !v31;

  return v45;
}

- (void)_netLinkStateChanged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CUTCPConnection__netLinkStateChanged__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_processSocketEvents
{
  NSObject *socketEventsSource;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uintptr_t data;
  uint64_t v12;
  LogCategory *ucat;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  socketEventsSource = self->_socketEventsSource;
  if (!socketEventsSource)
    return;
  data = dispatch_source_get_data(socketEventsSource);
  v12 = (data >> 4) & 0x800 | (((data >> 8) & 1) << 10);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      NSPrintF((uint64_t)"%#{flags}", v4, v5, v6, v7, v8, v9, v10, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _processSocketEvents]", 0x1Eu, (uint64_t)"Socket events: raw 0x%llX, flags %@", v14, v15, v16, v17, data);

      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  if ((_DWORD)v12)
  {
    v18 = _Block_copy(self->_socketEventHandler);
    if (v18)
    {
      v20 = v18;
      (*((void (**)(void *, uint64_t))v18 + 2))(v18, v12);
      v18 = v20;
    }

  }
}

- (void)_logMetrics
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSError *firstError;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *label;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  LogCategory *ucat;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  if (CoreAnalyticsLibrary_sOnce_8496 != -1)
    dispatch_once(&CoreAnalyticsLibrary_sOnce_8496, &__block_literal_global_8497);
  if (CoreAnalyticsLibrary_sLib_8498 && dlsym((void *)CoreAnalyticsLibrary_sLib_8498, "AnalyticsSendEvent"))
  {
    v30[0] = CFSTR("connectTimeoutSecs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)self->_connectTimeoutSecs);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v4;
    v30[1] = CFSTR("dataTimeoutSecs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)self->_dataTimeoutSecs);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v5;
    v30[2] = CFSTR("durationSecs");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = mach_absolute_time();
    objc_msgSend(v6, "numberWithUnsignedLongLong:", UpTicksToSeconds(v7 - self->_activateTicks));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v8;
    v30[3] = CFSTR("error");
    firstError = self->_firstError;
    if (firstError)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[NSError domain](self->_firstError, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@:%d"), v2, -[NSError code](self->_firstError, "code"));
    }
    else
    {
      v11 = CFSTR("nil");
    }
    v31[3] = v11;
    v30[4] = CFSTR("ifname");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_ifName);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    label = CFSTR("?");
    if (v12)
      v15 = (const __CFString *)v12;
    else
      v15 = CFSTR("?");
    v30[5] = CFSTR("label");
    if (self->_label)
      label = (const __CFString *)self->_label;
    v31[4] = v15;
    v31[5] = label;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (firstError)
    {

    }
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_19;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        goto LABEL_19;
      ucat = self->_ucat;
    }
    NSPrintF((uint64_t)"%##@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _logMetrics]", 0x1Eu, (uint64_t)"Metrics: %@", v26, v27, v28, v29, (uint64_t)v25);

LABEL_19:
    softLinkAnalyticsSendEvent_8506(CFSTR("com.apple.cutcp"), v16);

  }
}

- (void)_updateTrafficRegistration
{
  _opaque_pthread_mutex_t *p_mutex;
  uint64_t trafficFlags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  CUWiFiManager *v10;
  CUWiFiManager *wifiTrafficManager;
  CUWiFiTrafficPeer *v12;
  void *v13;
  _OWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  trafficFlags = self->_trafficFlags;
  self->_trafficFlagsPending = 0;
  pthread_mutex_unlock(p_mutex);
  if ((self->_flags & 0x200) == 0 || self->_netTransportType != 4 || (_DWORD)trafficFlags == self->_trafficFlagsApplied)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_8;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _updateTrafficRegistration]", 0x1Eu, (uint64_t)"Update traffic: %##a, %#{flags}\n", v5, v6, v7, v8, (uint64_t)&self->_peerAddr);
  }
LABEL_8:
  if (!self->_wifiTrafficManager)
  {
    v10 = objc_alloc_init(CUWiFiManager);
    wifiTrafficManager = self->_wifiTrafficManager;
    self->_wifiTrafficManager = v10;

    if (self->_label)
      -[CUWiFiManager setLabel:](self->_wifiTrafficManager, "setLabel:");
    -[CUWiFiManager activateWithCompletion:](self->_wifiTrafficManager, "activateWithCompletion:", 0);
  }
  v12 = objc_alloc_init(CUWiFiTrafficPeer);
  v14[0] = self->_peerAddr.sa;
  *(in6_addr *)((char *)v14 + 12) = *(in6_addr *)((char *)&self->_peerAddr.v6.sin6_addr + 4);
  -[CUWiFiTrafficPeer setPeerIP:](v12, "setPeerIP:", v14);
  -[CUWiFiTrafficPeer setTrafficFlags:](v12, "setTrafficFlags:", trafficFlags);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWiFiManager setTrafficPeers:](self->_wifiTrafficManager, "setTrafficPeers:", v13);

  self->_trafficFlagsApplied = trafficFlags;
}

- (void)readWithRequest:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CUTCPConnection_readWithRequest___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_processReads:(BOOL)a3
{
  int v4;
  CUReadRequest **p_readRequestCurrent;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Data;
  unsigned int rawIOLogLevel;
  LogCategory *ucat;
  uint64_t socketFD;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CUReadRequest *readRequestCurrent;
  const char *v23;
  void *v24;
  uint64_t *v25;
  int readSuspended;
  _BOOL4 v27;
  uint64_t v28;
  _BOOL4 v29;
  id obja;
  uint64_t *obj;

  v29 = a3;
  v4 = 0;
  p_readRequestCurrent = &self->_readRequestCurrent;
  do
  {
    v6 = *p_readRequestCurrent;
    if (v6)
      goto LABEL_5;
    -[NSMutableArray firstObject](self->_readRequests, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (v29)
      {
        if (v4)
        {
          readSuspended = self->_readSuspended;
        }
        else
        {
          v27 = -[CUTCPConnection _readStatus](self, "_readStatus");
          readSuspended = self->_readSuspended;
          if (v27)
          {
            if (!self->_readSuspended)
            {
              self->_readSuspended = 1;
              dispatch_suspend((dispatch_object_t)self->_readSource);
            }
            goto LABEL_36;
          }
        }
        if (readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
LABEL_36:
      v25 = 0;
LABEL_24:

      return;
    }
    obja = (id)v7;
    -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0);
    -[CUTCPConnection _prepareReadRequest:](self, "_prepareReadRequest:", obja);
    objc_storeStrong((id *)p_readRequestCurrent, obja);
    v6 = (uint64_t *)obja;
LABEL_5:
    obj = v6;
    Data = SocketReadDataEx(self->_socketFD, v6[1], objc_msgSend(v6, "minLength"), objc_msgSend(v6, "maxLength"), v6 + 3);
    rawIOLogLevel = self->_rawIOLogLevel;
    ucat = self->_ucat;
    if (ucat->var0 > rawIOLogLevel)
      goto LABEL_9;
    if (ucat->var0 != -1)
      goto LABEL_7;
    if (_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      rawIOLogLevel = self->_rawIOLogLevel;
LABEL_7:
      socketFD = self->_socketFD;
      objc_msgSend(obj, "minLength");
      objc_msgSend(obj, "maxLength");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _processReads:]", rawIOLogLevel, (uint64_t)"Read socket %d, %zu min, %zu max, %zu offset, %zu nread, %#m\n", v18, v19, v20, v21, socketFD);
    }
LABEL_9:
    if ((_DWORD)Data)
    {
      if ((_DWORD)Data == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }
      else
      {
        if ((_DWORD)Data == -6753)
          v23 = "Read EOF";
        else
          v23 = "Read error";
        NSErrorWithOSStatusF(Data, (uint64_t)v23, v8, v9, v10, v11, v12, v13, v28);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUTCPConnection _abortReadsWithError:](self, "_abortReadsWithError:", v24);

      }
      v25 = obj;
      goto LABEL_24;
    }
    if ((self->_flags & 0x80) != 0 && -[CUTCPConnection _readableData](self, "_readableData"))
      objc_msgSend(obj, "setStatusFlags:", objc_msgSend(obj, "statusFlags") | 1);
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CUTCPConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0);
    ++v4;
  }
  while (v4 != 4);
  if (self->_readSuspended)
  {
    self->_readSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_readSource);
  }
}

- (void)_prepareReadRequest:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int rawIOLogLevel;
  LogCategory *ucat;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;

  v22 = a3;
  if (objc_msgSend(v22, "bufferBytes"))
  {
    v22[1] = objc_msgSend(v22, "bufferBytes");
    objc_msgSend(v22, "setData:", 0);
  }
  else
  {
    objc_msgSend(v22, "bufferData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v22, "bufferData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");
      v7 = objc_msgSend(v22, "maxLength");

      if (v6 < v7)
      {
        v8 = objc_msgSend(v22, "maxLength");
        objc_msgSend(v22, "bufferData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLength:", v8);

      }
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v22, "maxLength"));
      objc_msgSend(v22, "setBufferData:", v10);

    }
    objc_msgSend(v22, "bufferData");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[1] = objc_msgSend(v11, "mutableBytes");

    objc_msgSend(v22, "bufferData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setData:", v12);

  }
  v13 = (void *)v22[2];
  v22[2] = 0;
  v22[3] = 0;

  objc_msgSend(v22, "setStatusFlags:", 0);
  rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    v16 = v22;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
        goto LABEL_12;
      ucat = self->_ucat;
      rawIOLogLevel = self->_rawIOLogLevel;
      v16 = v22;
    }
    v17 = objc_msgSend(v16, "minLength");
    objc_msgSend(v22, "maxLength");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _prepareReadRequest:]", rawIOLogLevel, (uint64_t)"Read prepared (%zu min, %zu max)\n", v18, v19, v20, v21, v17);
  }
LABEL_12:

}

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v5;
  CUNetLinkEndpoint *netLinkEndpoint;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CUNetLinkManager *netLinkManager;
  CUNetLinkManager *v14;
  LogCategory *ucat;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CUReadRequest *v36;
  CUReadRequest *readRequestCurrent;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CUReadRequest *v43;
  NSObject *readSource;
  void (**errorHandler)(id, id);
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!self->_invalidateCalled && !self->_firstError)
    objc_storeStrong((id *)&self->_firstError, a3);
  netLinkManager = self->_netLinkManager;
  if (netLinkManager)
  {
    netLinkEndpoint = self->_netLinkEndpoint;
    if (netLinkEndpoint)
    {
      -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
      v14 = self->_netLinkManager;
      self->_netLinkManager = 0;

    }
  }
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        NSPrintF((uint64_t)"%##a", v5, (uint64_t)netLinkEndpoint, v7, v8, v9, v10, v11, (uint64_t)&self->_peerAddr);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF((uint64_t)"%##a", v17, v18, v19, v20, v21, v22, v23, (uint64_t)&self->_selfAddr);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF((uint64_t)"%{error}", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v12);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _abortReadsWithError:]", 0x1Eu, (uint64_t)"Abort reads: peer=%@, self=%@, error=%@", v32, v33, v34, v35, (uint64_t)v16);

        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }
LABEL_13:
  v36 = self->_readRequestCurrent;
  if (v36)
  {
    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0;

    -[CUTCPConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v36, v12);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = self->_readRequests;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v49;
    do
    {
      v42 = 0;
      v43 = v36;
      do
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(v38);
        v36 = (CUReadRequest *)*(id *)(*((_QWORD *)&v48 + 1) + 8 * v42);

        -[CUTCPConnection _completeReadRequest:error:](self, "_completeReadRequest:error:", v36, v12);
        ++v42;
        v43 = v36;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v40);
  }

  -[NSMutableArray removeAllObjects](self->_readRequests, "removeAllObjects");
  readSource = self->_readSource;
  if (readSource && !self->_readSuspended)
  {
    self->_readSuspended = 1;
    dispatch_suspend(readSource);
  }
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
  {
    errorHandler[2](errorHandler, v12);
    v46 = self->_errorHandler;
  }
  else
  {
    v46 = 0;
  }
  self->_errorHandler = 0;

  -[CUTCPConnection _invalidated](self, "_invalidated");
}

- (BOOL)_readableData
{
  ssize_t v3;
  char v5;

  do
    v3 = recv(self->_socketFD, &v5, 1uLL, 2);
  while (v3 < 0 && *__error() && *__error() == 4);
  return v3 > 0;
}

- (BOOL)_readStatus
{
  ssize_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**errorHandler)(id, void *);
  const char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  char v17;

  while (1)
  {
    v3 = recv(self->_socketFD, &v17, 1uLL, 2);
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!*__error())
    {
      v10 = 4294960596;
      goto LABEL_11;
    }
    v10 = *__error();
    if ((_DWORD)v10 != 4)
    {
      if (!(_DWORD)v10)
        return 1;
      if ((_DWORD)v10 == 35)
        return 0;
LABEL_11:
      errorHandler = (void (**)(id, void *))self->_errorHandler;
      if (errorHandler)
      {
        v13 = "Read status error";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
  if (v3)
    return 1;
  errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    v13 = "Read status EOF";
    v10 = 4294960543;
LABEL_13:
    NSErrorWithOSStatusF(v10, (uint64_t)v13, v4, v5, v6, v7, v8, v9, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    errorHandler[2](errorHandler, v14);

    v15 = self->_errorHandler;
    goto LABEL_15;
  }
LABEL_14:
  v15 = 0;
LABEL_15:
  self->_errorHandler = 0;

  return 1;
}

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  id v6;
  unsigned int rawIOLogLevel;
  LogCategory *ucat;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(_QWORD);
  _QWORD *v17;

  v17 = a3;
  v6 = a4;
  rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    v9 = v17;
    if (ucat->var0 != -1)
    {
LABEL_3:
      v10 = objc_msgSend(v9, "length");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _completeReadRequest:error:]", rawIOLogLevel, (uint64_t)"Read completed: %zu byte(s), %{error}\n", v11, v12, v13, v14, v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      rawIOLogLevel = self->_rawIOLogLevel;
      v9 = v17;
      goto LABEL_3;
    }
  }
LABEL_5:
  v15 = (void *)v17[2];
  v17[2] = v6;

  objc_msgSend(v17, "completion");
  v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCompletion:", 0);
  if (v16)
    v16[2](v16);

}

- (void)writeWithRequest:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CUTCPConnection_writeWithRequest___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)writeEndOfDataWithCompletion:(id)a3
{
  id v4;
  CUWriteRequest *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  CUWriteRequest *v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(CUWriteRequest);
  -[CUWriteRequest setEndOfData:](v5, "setEndOfData:", 1);
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __48__CUTCPConnection_writeEndOfDataWithCompletion___block_invoke;
    v9 = &unk_1E25DE600;
    v11 = v4;
    v10 = v5;
    -[CUWriteRequest setCompletion:](v10, "setCompletion:", &v6);

  }
  -[CUTCPConnection writeWithRequest:](self, "writeWithRequest:", v5, v6, v7, v8, v9);

}

- (void)_processWrites:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int flowControlState;
  unsigned int rawIOLogLevel;
  LogCategory *ucat;
  const char *v11;
  void *v12;
  void *v13;
  int v14;
  CUWriteRequest *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  LogCategory *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  LogCategory *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CUWriteRequest *writeRequestCurrent;
  int v41;
  unsigned int v42;
  LogCategory *v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;

  if (a3)
  {
    flowControlState = self->_flowControlState;
    if (flowControlState != 10)
    {
      rawIOLogLevel = self->_rawIOLogLevel;
      ucat = self->_ucat;
      if (ucat->var0 <= rawIOLogLevel)
      {
        if (ucat->var0 != -1)
        {
          if (flowControlState)
            goto LABEL_6;
          goto LABEL_11;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
        {
          ucat = self->_ucat;
          rawIOLogLevel = self->_rawIOLogLevel;
          flowControlState = self->_flowControlState;
          if (flowControlState)
          {
LABEL_6:
            if (flowControlState == 20)
            {
              v11 = "Closed";
            }
            else if (flowControlState == 10)
            {
              v11 = "Open";
            }
            else
            {
              v11 = "?";
            }
            goto LABEL_14;
          }
LABEL_11:
          v11 = "Unknown";
LABEL_14:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _processWrites:]", rawIOLogLevel, (uint64_t)"Flow control changed: %s -> %s\n", v3, v4, v5, v6, (uint64_t)v11);
        }
      }
      self->_flowControlState = 10;
      v12 = _Block_copy(self->_flowControlChangedHandler);
      v13 = v12;
      if (v12)
        (*((void (**)(void *))v12 + 2))(v12);

    }
  }
  v14 = 4;
  do
  {
    v15 = self->_writeRequestCurrent;
    if (!v15)
    {
      -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        if ((!self->_flowControlChangedHandler || self->_flowControlState == 10) && !self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }
        v15 = 0;
        goto LABEL_72;
      }
      v15 = (CUWriteRequest *)v24;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0);
      v49 = 0;
      -[CUTCPConnection _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v15, &v49);
      v25 = v49;
      if (v25)
      {
        v26 = v25;
        goto LABEL_41;
      }
      objc_storeStrong((id *)&self->_writeRequestCurrent, v15);
    }
    v21 = SocketWriteData(self->_socketFD, (const iovec **)&v15->_iop, &v15->_ion);
    v22 = self->_rawIOLogLevel;
    v23 = self->_ucat;
    if (v23->var0 <= v22)
    {
      if (v23->var0 != -1)
        goto LABEL_22;
      if (_LogCategory_Initialize((uint64_t)v23, self->_rawIOLogLevel))
      {
        v23 = self->_ucat;
        LODWORD(v22) = self->_rawIOLogLevel;
LABEL_22:
        LogPrintF((uint64_t)v23, (uint64_t)"-[CUTCPConnection _processWrites:]", v22, (uint64_t)"Write socket %d, pre-ion %d, post-ion %d, %#m\n", v17, v18, v19, v20, self->_socketFD);
      }
    }
    if ((_DWORD)v21)
    {
      if ((_DWORD)v21 != 35)
      {
        NSErrorWithOSStatusF(v21, (uint64_t)"Write failed", v22, v16, v17, v18, v19, v20, v48);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUTCPConnection _abortWritesWithError:](self, "_abortWritesWithError:", v45);

LABEL_72:
        return;
      }
      v41 = self->_flowControlState;
      if (v41 == 20)
      {
LABEL_70:
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
        goto LABEL_72;
      }
      v42 = self->_rawIOLogLevel;
      v43 = self->_ucat;
      if (v43->var0 <= v42)
      {
        if (v43->var0 != -1)
        {
LABEL_49:
          if (v41)
          {
            if (v41 == 20)
            {
              v44 = "Closed";
            }
            else if (v41 == 10)
            {
              v44 = "Open";
            }
            else
            {
              v44 = "?";
            }
          }
          else
          {
            v44 = "Unknown";
          }
          LogPrintF((uint64_t)v43, (uint64_t)"-[CUTCPConnection _processWrites:]", v42, (uint64_t)"Flow control changed: %s -> %s\n", v17, v18, v19, v20, (uint64_t)v44);
          goto LABEL_67;
        }
        if (_LogCategory_Initialize((uint64_t)v43, self->_rawIOLogLevel))
        {
          v43 = self->_ucat;
          v42 = self->_rawIOLogLevel;
          v41 = self->_flowControlState;
          goto LABEL_49;
        }
      }
LABEL_67:
      self->_flowControlState = 20;
      v46 = _Block_copy(self->_flowControlChangedHandler);
      v47 = v46;
      if (v46)
        (*((void (**)(void *))v46 + 2))(v46);

      goto LABEL_70;
    }
    if (!-[CUWriteRequest endOfData](v15, "endOfData"))
      goto LABEL_37;
    v31 = self->_rawIOLogLevel;
    v32 = self->_ucat;
    if (v32->var0 <= v31)
    {
      if (v32->var0 != -1)
        goto LABEL_31;
      if (_LogCategory_Initialize((uint64_t)v32, self->_rawIOLogLevel))
      {
        v32 = self->_ucat;
        v31 = self->_rawIOLogLevel;
LABEL_31:
        LogPrintF((uint64_t)v32, (uint64_t)"-[CUTCPConnection _processWrites:]", v31, (uint64_t)"Shutdown socket %d\n", v27, v28, v29, v30, self->_socketFD);
      }
    }
    if (shutdown(self->_socketFD, 1))
    {
      if (!*__error())
      {
        v39 = 4294960596;
LABEL_39:
        NSErrorWithOSStatusF(v39, (uint64_t)"shutdown() failed", v33, v34, v35, v36, v37, v38, v48);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      v39 = *__error();
      if ((_DWORD)v39)
        goto LABEL_39;
    }
LABEL_37:
    v26 = 0;
LABEL_40:
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

LABEL_41:
    -[CUTCPConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v15, v26);

    --v14;
  }
  while (v14);
  if (self->_writeSuspended)
  {
    self->_writeSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_writeSource);
  }
}

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  char *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int rawIOLogLevel;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unsigned int v38;
  LogCategory *ucat;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  objc_msgSend(v6, "dataArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    *((_QWORD *)v6 + 34) = v6 + 16;
    LODWORD(v18) = objc_msgSend(v6, "bytesIOCount");
    goto LABEL_14;
  }
  v9 = objc_msgSend(v7, "count");
  if (v9 <= objc_msgSend(v6, "bytesIOMaxCount"))
  {
    v19 = v6 + 16;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v22 = v6 + 16;
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v42;
      v22 = v6 + 16;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(v20);
          v26 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i));
          *(_QWORD *)v22 = objc_msgSend(v26, "bytes");
          *((_QWORD *)v22 + 1) = objc_msgSend(v26, "length");
          v22 += 16;
        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v23);
    }

    *((_QWORD *)v6 + 34) = v19;
    v18 = (unint64_t)(v22 - v19) >> 4;
LABEL_14:
    *((_DWORD *)v6 + 70) = v18;
    *((_QWORD *)v6 + 36) = 0;
    v27 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = 0;

    rawIOLogLevel = self->_rawIOLogLevel;
    if (gLogCategory_CUTCPConnection > rawIOLogLevel
      || gLogCategory_CUTCPConnection == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUTCPConnection, rawIOLogLevel))
    {
      goto LABEL_27;
    }
    v33 = *((unsigned int *)v6 + 70);
    if ((_DWORD)v33)
    {
      v34 = 0;
      v35 = 16 * (int)v33;
      v36 = (uint64_t *)(*((_QWORD *)v6 + 34) + 8);
      do
      {
        v37 = *v36;
        v36 += 2;
        v34 += v37;
        v35 -= 16;
      }
      while (v35);
    }
    v38 = self->_rawIOLogLevel;
    ucat = self->_ucat;
    if (ucat->var0 > v38)
      goto LABEL_27;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
        goto LABEL_27;
      ucat = self->_ucat;
      v38 = self->_rawIOLogLevel;
      v33 = *((unsigned int *)v6 + 70);
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _prepareWriteRequest:error:]", v38, (uint64_t)"Write prepared (%d iov, %zu total)\n", v28, v29, v30, v31, v33);
LABEL_27:
    v17 = 1;
    goto LABEL_28;
  }
  if (a4)
  {
    v10 = objc_msgSend(v6, "bytesIOMaxCount");
    NSErrorWithOSStatusF(4294960532, (uint64_t)"Too many write elements (%zu max)", v11, v12, v13, v14, v15, v16, v10);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_28:

  return v17;
}

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v5;
  CUNetLinkEndpoint *netLinkEndpoint;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CUNetLinkManager *netLinkManager;
  CUNetLinkManager *v14;
  LogCategory *ucat;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CUWriteRequest *v36;
  CUWriteRequest *writeRequestCurrent;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CUWriteRequest *v43;
  NSObject *writeSource;
  void (**errorHandler)(id, id);
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!self->_invalidateCalled && !self->_firstError)
    objc_storeStrong((id *)&self->_firstError, a3);
  netLinkManager = self->_netLinkManager;
  if (netLinkManager)
  {
    netLinkEndpoint = self->_netLinkEndpoint;
    if (netLinkEndpoint)
    {
      -[CUNetLinkManager removeEndpoint:](netLinkManager, "removeEndpoint:");
      v14 = self->_netLinkManager;
      self->_netLinkManager = 0;

    }
  }
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        NSPrintF((uint64_t)"%##a", v5, (uint64_t)netLinkEndpoint, v7, v8, v9, v10, v11, (uint64_t)&self->_peerAddr);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF((uint64_t)"%##a", v17, v18, v19, v20, v21, v22, v23, (uint64_t)&self->_selfAddr);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF((uint64_t)"%{error}", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v12);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _abortWritesWithError:]", 0x1Eu, (uint64_t)"Abort writes: peer=%@, self=%@, error=%@", v32, v33, v34, v35, (uint64_t)v16);

        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }
LABEL_13:
  v36 = self->_writeRequestCurrent;
  if (v36)
  {
    writeRequestCurrent = self->_writeRequestCurrent;
    self->_writeRequestCurrent = 0;

    -[CUTCPConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v36, v12);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = self->_writeRequests;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v49;
    do
    {
      v42 = 0;
      v43 = v36;
      do
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(v38);
        v36 = (CUWriteRequest *)*(id *)(*((_QWORD *)&v48 + 1) + 8 * v42);

        -[CUTCPConnection _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v36, v12);
        ++v42;
        v43 = v36;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v40);
  }

  -[NSMutableArray removeAllObjects](self->_writeRequests, "removeAllObjects");
  writeSource = self->_writeSource;
  if (writeSource && !self->_writeSuspended)
  {
    self->_writeSuspended = 1;
    dispatch_suspend(writeSource);
  }
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
  {
    errorHandler[2](errorHandler, v12);
    v46 = self->_errorHandler;
  }
  else
  {
    v46 = 0;
  }
  self->_errorHandler = 0;

  -[CUTCPConnection _invalidated](self, "_invalidated");
}

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unsigned int rawIOLogLevel;
  LogCategory *ucat;
  void *v13;
  void (**v14)(_QWORD);
  _QWORD *v15;

  v15 = a3;
  v10 = a4;
  rawIOLogLevel = self->_rawIOLogLevel;
  ucat = self->_ucat;
  if (ucat->var0 <= rawIOLogLevel)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUTCPConnection _completeWriteRequest:error:]", rawIOLogLevel, (uint64_t)"Write completed: %{error}\n", v6, v7, v8, v9, (uint64_t)v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, self->_rawIOLogLevel))
    {
      ucat = self->_ucat;
      rawIOLogLevel = self->_rawIOLogLevel;
      goto LABEL_3;
    }
  }
LABEL_5:
  v13 = (void *)v15[1];
  v15[1] = v10;

  objc_msgSend(v15, "completion");
  v14 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompletion:", 0);
  if (v14)
    v14[2](v14);

}

- ($9D4F243E34B80324A1B90A38B57CFE16)peerAddr
{
  retstr->var0 = *(sockaddr *)&self[15].var2.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[15].var2.sin6_addr + 8);
  return self;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)selfAddr
{
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[16].var2.sin6_addr + 8);
  retstr->var0 = *(sockaddr *)&self[16].var2.sin6_flowinfo;
  return self;
}

- (double)connectTimeoutSecs
{
  return self->_connectTimeoutSecs;
}

- (void)setConnectTimeoutSecs:(double)a3
{
  self->_connectTimeoutSecs = a3;
}

- (double)dataTimeoutSecs
{
  return self->_dataTimeoutSecs;
}

- (void)setDataTimeoutSecs:(double)a3
{
  self->_dataTimeoutSecs = a3;
}

- (CUBonjourDevice)destinationBonjour
{
  return self->_destinationBonjour;
}

- (void)setDestinationBonjour:(id)a3
{
  objc_storeStrong((id *)&self->_destinationBonjour, a3);
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int)defaultPort
{
  return self->_defaultPort;
}

- (void)setDefaultPort:(int)a3
{
  self->_defaultPort = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)flowControlChangedHandler
{
  return self->_flowControlChangedHandler;
}

- (void)setFlowControlChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (int)flowControlState
{
  return self->_flowControlState;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (int)keepAliveSeconds
{
  return self->_keepAliveSeconds;
}

- (void)setKeepAliveSeconds:(int)a3
{
  self->_keepAliveSeconds = a3;
}

- (int)keepAliveIdleSeconds
{
  return self->_keepAliveIdleSeconds;
}

- (void)setKeepAliveIdleSeconds:(int)a3
{
  self->_keepAliveIdleSeconds = a3;
}

- (int)keepAliveIntervalSeconds
{
  return self->_keepAliveIntervalSeconds;
}

- (void)setKeepAliveIntervalSeconds:(int)a3
{
  self->_keepAliveIntervalSeconds = a3;
}

- (int)keepAliveMaxCount
{
  return self->_keepAliveMaxCount;
}

- (void)setKeepAliveMaxCount:(int)a3
{
  self->_keepAliveMaxCount = a3;
}

- (NSString)label
{
  return self->_label;
}

- (CUNANDataSession)nanDataSession
{
  return self->_nanDataSession;
}

- (void)setNanDataSession:(id)a3
{
  objc_storeStrong((id *)&self->_nanDataSession, a3);
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
  objc_storeStrong((id *)&self->_netLinkManager, a3);
}

- (unsigned)netTransportType
{
  return self->_netTransportType;
}

- (id)socketEventHandler
{
  return self->_socketEventHandler;
}

- (void)setSocketEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (int)socketFD
{
  return self->_socketFD;
}

- (void)setSocketFD:(int)a3
{
  self->_socketFD = a3;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (id)serverInvalidationHandler
{
  return self->_serverInvalidationHandler;
}

- (void)setServerInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverInvalidationHandler, 0);
  objc_storeStrong(&self->_socketEventHandler, 0);
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_nanDataSession, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong(&self->_flowControlChangedHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong((id *)&self->_destinationBonjour, 0);
  objc_storeStrong((id *)&self->_wifiTrafficManager, 0);
  objc_storeStrong((id *)&self->_netLinkEndpoint, 0);
  objc_storeStrong((id *)&self->_socketEventsSource, 0);
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_writeRequestCurrent, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_readRequests, 0);
  objc_storeStrong((id *)&self->_readRequestCurrent, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
}

void __48__CUTCPConnection_writeEndOfDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __36__CUTCPConnection_writeWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 112))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (W)", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeWriteRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 72), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[76] & 0x80000000) == 0)
      objc_msgSend(v11, "_processWrites:", 0);
  }
}

void __35__CUTCPConnection_readWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 112))
  {
    v10 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated (R)", a3, a4, a5, a6, a7, a8, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_completeReadRequest:error:", v10, v13);

  }
  else
  {
    objc_msgSend(*(id *)(v9 + 40), "addObject:", *(_QWORD *)(a1 + 40));
    v11 = *(_DWORD **)(a1 + 32);
    if ((v11[76] & 0x80000000) == 0)
      objc_msgSend(v11, "_processReads:", 0);
  }
}

void __39__CUTCPConnection__netLinkStateChanged__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  if (!v2)
    return;
  v9 = objc_msgSend(v2, "state");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(int **)(v10 + 216);
  if (*v11 <= 20)
  {
    if (*v11 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUTCPConnection _netLinkStateChanged]_block_invoke", 0x14u, (uint64_t)"NetLink state changed: %##a, %s\n", v5, v6, v7, v8, v10 + 424);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)v11, 0x14u))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(int **)(v10 + 216);
      goto LABEL_4;
    }
  }
LABEL_7:
  if (v9 == 3)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352);
    if (v14)
    {
      NSErrorWithOSStatusF(4294960538, (uint64_t)"Unreachable", v3, v4, v5, v6, v7, v8, v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v16);

    }
  }
  else if (v9 == 1)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 200);
    *(_QWORD *)(v12 + 200) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  }
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_netLinkStateChanged");
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReads:", 1);
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processWrites:", 1);
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processSocketEvents");
}

uint64_t __42__CUTCPConnection__setupIOAndReturnError___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 192);
  *(_QWORD *)(v2 + 192) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __29__CUTCPConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __42__CUTCPConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  v5 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v5, "_activateDirectAndReturnError:", &v9);
  v6 = v9;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __35__CUTCPConnection_setTrafficFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTrafficRegistration");
}

@end
