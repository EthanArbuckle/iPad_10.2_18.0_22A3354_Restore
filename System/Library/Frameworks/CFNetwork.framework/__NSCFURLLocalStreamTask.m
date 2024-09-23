@implementation __NSCFURLLocalStreamTask

- (id)_effectiveConfiguration
{
  return (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration");
}

- (id)_initWithExistingTask:(id)a3 disavow:(id)a4
{
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;

  v5 = -[__NSCFURLLocalStreamTask _initCommonWithGroup:disavow:](self, objc_msgSend(a3, "_taskGroup"), a4);
  if (v5)
  {
    v6 = objc_msgSend(a3, "workQueue");
    v5[98] = v6;
    dispatch_retain(v6);
    *((_DWORD *)v5 + 194) = 0;
    v7 = (_QWORD *)operator new();
    *v7 = &off_1E14EC310;
    v5[95] = v7;
    objc_msgSend(v5, "setOriginalRequest:", objc_msgSend(a3, "originalRequest"));
    objc_msgSend(v5, "setCurrentRequest:", objc_msgSend(a3, "currentRequest"));
    objc_msgSend(v5, "setResponse:", objc_msgSend(a3, "response"));
    objc_msgSend(v5, "setCountOfBytesExpectedToSend:", 0);
    objc_msgSend(v5, "setCountOfBytesExpectedToReceive:", 0);
    -[__NSCFURLLocalStreamTask _init_setupTimeoutTimer]((dispatch_source_t *)v5);
  }
  return v5;
}

- (__NSCFURLLocalStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6
{
  __NSCFURLLocalStreamTask *v8;
  __NSCFURLLocalStreamTask *v9;

  v8 = (__NSCFURLLocalStreamTask *)-[__NSCFURLLocalStreamTask _initWithTaskGroup:disavow:](self, (uint64_t)a5, a6);
  v9 = v8;
  if (v8)
    (*((void (**)(BaseSocketStreamClient *, id, int64_t))v8->_socketStreamClient->var0 + 2))(v8->_socketStreamClient, a3, a4);
  return v9;
}

- (__NSCFURLLocalStreamTask)initWithNetService:(id)a3 taskGroup:(id)a4 disavow:(id)a5
{
  __NSCFURLLocalStreamTask *v6;
  __NSCFURLLocalStreamTask *v7;

  v6 = (__NSCFURLLocalStreamTask *)-[__NSCFURLLocalStreamTask _initWithTaskGroup:disavow:](self, (uint64_t)a4, a5);
  v7 = v6;
  if (v6)
    (*((void (**)(BaseSocketStreamClient *, id))v6->_socketStreamClient->var0 + 3))(v6->_socketStreamClient, a3);
  return v7;
}

- (id)workQueue
{
  id result;
  objc_super v4;

  result = self->_workQueueForStreamTask;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFURLLocalStreamTask;
    return -[NSURLSessionTask workQueue](&v4, sel_workQueue);
  }
  return result;
}

- (void)dealloc
{
  NSObject *workQueueForStreamTask;
  BaseSocketStreamClient *socketStreamClient;
  __CFReadStream *readStream;
  __CFWriteStream *writeStream;
  id disavow;
  objc_super v8;

  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)-[NSURLSessionTask session](self, "session"), (uint64_t)self);
  workQueueForStreamTask = self->_workQueueForStreamTask;
  if (workQueueForStreamTask)
  {
    dispatch_release(workQueueForStreamTask);
    self->_workQueueForStreamTask = 0;
  }
  socketStreamClient = self->_socketStreamClient;
  if (socketStreamClient)
  {
    (*((void (**)(BaseSocketStreamClient *))socketStreamClient->var0 + 1))(socketStreamClient);
    self->_socketStreamClient = 0;
  }
  readStream = self->_readStream;
  self->_readStream = 0;
  if (readStream)
    CFRelease(readStream);
  writeStream = self->_writeStream;
  self->_writeStream = 0;
  if (writeStream)
    CFRelease(writeStream);

  disavow = self->_disavow;
  if (disavow)
  {
    _Block_release(disavow);
    self->_disavow = 0;
  }
  -[__NSCFURLLocalStreamTask setOriginalRequest:](self, "setOriginalRequest:", 0);
  -[__NSCFURLLocalStreamTask setCurrentRequest:](self, "setCurrentRequest:", 0);
  -[__NSCFURLLocalStreamTask setResponse:](self, "setResponse:", 0);

  self->_uniqueIdentifier = 0;
  v8.receiver = self;
  v8.super_class = (Class)__NSCFURLLocalStreamTask;
  -[NSURLSessionTask dealloc](&v8, sel_dealloc);
}

- (int64_t)computeAdjustedPoolPriority
{
  double v3;
  double v4;

  v3 = (double)-[NSURLSessionTask _priorityValue](self, "_priorityValue");
  -[NSURLSessionTask _loadingPriorityValue](self, "_loadingPriorityValue");
  return (uint64_t)(v3 + (0.5 - v4) * 50.0);
}

- (BOOL)_cacheOnly
{
  return 0;
}

- (__CFDictionary)_copySocketStreamProperties
{
  void *v3;
  const __CFDictionary *v4;
  const __CFAllocator *v5;
  __CFDictionary *MutableCopy;
  __CFDictionary *v7;
  int v8;
  const void **v9;
  char v10;
  const void **v11;
  double v12;
  void *v13;
  const void **v14;
  const void **v15;
  const void **v16;
  const void **v17;
  uint64_t v18;
  const void *NetworkServiceTypeString;
  CFNumberRef v20;
  CFNumberRef v21;
  const __CFDictionary *Value;
  const __CFDictionary *Mutable;
  const __CFDictionary *v24;
  CFStringRef v25;
  uint64_t v26;
  double v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  id v35;
  NSURLRequest *v37;
  const __CFURL *v38;
  void *key;
  void *keya;
  void *v41;
  void *v42;
  _QWORD v43[5];
  double v44;
  uint64_t valuePtr;

  v3 = (void *)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration");
  v4 = (const __CFDictionary *)objc_msgSend(v3, "_socketStreamProperties");
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v4)
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v4);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v7 = MutableCopy;
  key = &unk_1EDCFB788;
  CFDictionaryAddValue(MutableCopy, &unk_1EDCFB788, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "allowsExpensiveNetworkAccess")));
  v41 = &unk_1EDCFB750;
  CFDictionaryAddValue(v7, &unk_1EDCFB750, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "allowsConstrainedNetworkAccess")));
  v42 = &unk_1EDCFA090;
  CFDictionaryAddValue(v7, &unk_1EDCFA090, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "_allowsUCA")));
  CFDictionaryAddValue(v7, &unk_1EDCFA0C8, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "_allowsVirtualInterfaces")));
  if (objc_msgSend(v3, "_multipathAlternatePort"))
    CFDictionaryAddValue(v7, &unk_1EDCF9AA8, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "_multipathAlternatePort", &unk_1EDCFB788, &unk_1EDCFB750, 0x1EDCFA090)));
  if (objc_msgSend(v3, "_TCPAdaptiveReadTimeout", key))
    CFDictionaryAddValue(v7, &unk_1EDCFACD0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "_TCPAdaptiveReadTimeout")));
  if (objc_msgSend(v3, "_TCPAdaptiveWriteTimeout"))
    CFDictionaryAddValue(v7, &unk_1EDCFAD08, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "_TCPAdaptiveWriteTimeout")));
  v8 = objc_msgSend(v3, "_allowsPowerNapScheduling");
  v9 = (const void **)MEMORY[0x1E0C9AE50];
  if (v8)
    CFDictionaryAddValue(v7, &unk_1EDCFBD00, (const void *)*MEMORY[0x1E0C9AE50]);
  if (objc_msgSend(v3, "_tcpConnectionPoolName"))
  {
    CFDictionaryAddValue(v7, &unk_1EDCFA218, (const void *)objc_msgSend(v3, "_tcpConnectionPoolName"));
    CFDictionaryAddValue(v7, &unk_1EDCFA250, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[__NSCFURLLocalStreamTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority")));
  }
  if (objc_msgSend(v3, "_sourceApplicationBundleIdentifier"))
    CFDictionaryAddValue(v7, &unk_1EDCFBFA0, (const void *)objc_msgSend(v3, "_sourceApplicationBundleIdentifier"));
  if (objc_msgSend(v3, "_sourceApplicationSecondaryIdentifier"))
    CFDictionaryAddValue(v7, &unk_1EDCFB718, (const void *)objc_msgSend(v3, "_sourceApplicationSecondaryIdentifier"));
  if (objc_msgSend(v3, "_sourceApplicationAuditTokenData"))
    CFDictionaryAddValue(v7, &unk_1EDCFBF68, (const void *)objc_msgSend(v3, "_sourceApplicationAuditTokenData"));
  if (objc_msgSend(v3, "_preventsIdleSleepOnceConnected"))
    CFDictionaryAddValue(v7, &unk_1EDCF9C30, *v9);
  if (objc_msgSend(v3, "_forcesNewConnections"))
    CFDictionaryAddValue(v7, CFSTR("uniqueTaskIdentifier"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__NSCFURLLocalStreamTask taskIdentifier](self, "taskIdentifier")));
  if ((objc_msgSend(v3, "allowsCellularAccess") & 1) == 0)
    CFDictionarySetValue(v7, &unk_1EDCFBC58, *v9);
  if (objc_msgSend(v3, "shouldUseExtendedBackgroundIdleMode"))
    CFDictionarySetValue(v7, &unk_1EDCFBD70, *v9);
  if (objc_msgSend(v3, "_allowsMultipathTCP"))
    CFDictionarySetValue(v7, &unk_1EDCFBAD0, *v9);
  if (objc_msgSend(v3, "_allowsResponseMonitoringDuringBodyTranmission"))
    CFDictionarySetValue(v7, &unk_1EDCFE230, *v9);
  if ((objc_msgSend(v3, "waitsForConnectivity") & 1) != 0
    || objc_msgSend(v3, "_allowsIndefiniteConnections"))
  {
    CFDictionarySetValue(v7, &unk_1EDCFBB08, *v9);
  }
  if (objc_msgSend(v3, "_CTDataConnectionServiceType"))
    CFDictionarySetValue(v7, &unk_1EDCFB9F0, (const void *)objc_msgSend(v3, "_CTDataConnectionServiceType"));
  if (objc_msgSend(v3, "_allowsTCPFastOpen"))
    CFDictionarySetValue(v7, &unk_1EDCF9F40, *v9);
  if (objc_msgSend(v3, "_allowsTLSSessionTickets"))
    CFDictionarySetValue(v7, &unk_1EDCF9F08, *v9);
  v10 = objc_msgSend(v3, "_allowsTLSSessionResumption");
  v11 = (const void **)MEMORY[0x1E0C9AE40];
  if ((v10 & 1) == 0)
    CFDictionarySetValue(v7, &unk_1EDCF9ED0, (const void *)*MEMORY[0x1E0C9AE40]);
  if (objc_msgSend(v3, "_tlsTrustPinningPolicyName"))
    CFDictionarySetValue(v7, &unk_1EDCFAC60, (const void *)objc_msgSend(v3, "_tlsTrustPinningPolicyName"));
  if (objc_msgSend(v3, "_allowsTLSECH"))
    CFDictionarySetValue(v7, &unk_1EDCF9F78, *v9);
  if (objc_msgSend(v3, "_customReadBufferSize"))
    CFDictionarySetValue(v7, &unk_1EDCFA918, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "_customReadBufferSize")));
  objc_msgSend(v3, "_customReadBufferTimeout");
  if (v12 > 0.0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "_customReadBufferTimeout");
    CFDictionarySetValue(v7, &unk_1EDCFA950, (const void *)objc_msgSend(v13, "numberWithDouble:"));
  }
  if (-[__NSCFURLLocalStreamTask _boundInterfaceIdentifier](self, "_boundInterfaceIdentifier"))
    CFDictionaryAddValue(v7, &unk_1EDCFB830, -[__NSCFURLLocalStreamTask _boundInterfaceIdentifier](self, "_boundInterfaceIdentifier"));
  if (-[__NSCFURLLocalStreamTask _allowsCellularOverride](self, "_allowsCellularOverride"))
  {
    if (-[__NSCFURLLocalStreamTask _allowsCellularOverride](self, "_allowsCellularOverride") == 2)
      v14 = v9;
    else
      v14 = v11;
    CFDictionarySetValue(v7, &unk_1EDCFBC58, *v14);
  }
  if (-[__NSCFURLLocalStreamTask _disallowCellular](self, "_disallowCellular"))
    CFDictionarySetValue(v7, &unk_1EDCFBC58, *v9);
  if (-[__NSCFURLLocalStreamTask _allowsExpensiveOverride](self, "_allowsExpensiveOverride"))
  {
    if (-[__NSCFURLLocalStreamTask _allowsExpensiveOverride](self, "_allowsExpensiveOverride") == 1)
      v15 = v9;
    else
      v15 = v11;
    CFDictionarySetValue(v7, keya, *v15);
  }
  if (-[__NSCFURLLocalStreamTask _allowsConstrainedOverride](self, "_allowsConstrainedOverride"))
  {
    if (-[__NSCFURLLocalStreamTask _allowsConstrainedOverride](self, "_allowsConstrainedOverride") == 1)
      v16 = v9;
    else
      v16 = v11;
    CFDictionarySetValue(v7, v41, *v16);
  }
  if (-[__NSCFURLLocalStreamTask _allowsUCAOverride](self, "_allowsUCAOverride"))
  {
    if (-[__NSCFURLLocalStreamTask _allowsUCAOverride](self, "_allowsUCAOverride") == 1)
      v17 = v9;
    else
      v17 = v11;
    CFDictionarySetValue(v7, v42, *v17);
  }
  v18 = objc_msgSend(v3, "_forcedNetworkServiceType");
  if (!v18)
    LODWORD(v18) = -[__NSCFURLLocalStreamTask _networkServiceType](self, "_networkServiceType");
  if ((_DWORD)v18)
  {
    NetworkServiceTypeString = (const void *)ClassicURLConnection::getNetworkServiceTypeString(v18);
    CFDictionarySetValue(v7, &unk_1EDCFB478, NetworkServiceTypeString);
  }
  if (-[NSURLRequest _requiresShortConnectionTimeout](-[__NSCFURLLocalStreamTask currentRequest](self, "currentRequest"), "_requiresShortConnectionTimeout"))
  {
    valuePtr = 0x4024000000000000;
    v20 = CFNumberCreate(v5, kCFNumberDoubleType, &valuePtr);
    if (v20)
    {
      v21 = v20;
      CFDictionarySetValue(v7, &unk_1EDCF94C0, v20);
      CFRelease(v21);
    }
  }
  if (self)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v7, &unk_1EDCFB868);
    if (Value)
      Mutable = CFDictionaryCreateMutableCopy(v5, 0, Value);
    else
      Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v24 = Mutable;
    if (Mutable
      && !CFDictionaryGetValue(Mutable, CFSTR("kConditionalConnectionIdentifier"))
      && CFDictionaryGetValue(v24, CFSTR("kConditionalConnectionLaunchOnDemand"))
      && (v37 = -[__NSCFURLLocalStreamTask currentRequest](self, "currentRequest")) != 0
      && (v38 = -[NSURLRequest URL](v37, "URL")) != 0)
    {
      v25 = CFURLGetString(v38);
    }
    else
    {
      v25 = 0;
    }
    -[__NSCFURLLocalStreamTask _timeWindowDelay](self, "_timeWindowDelay");
    valuePtr = v26;
    -[__NSCFURLLocalStreamTask _timeWindowDuration](self, "_timeWindowDuration");
    v44 = v27;
    if (v27 == 0.0)
    {
LABEL_97:
      if (v25)
        CFDictionarySetValue(v24, CFSTR("kConditionalConnectionIdentifier"), v25);
      if (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_requiresPowerPluggedIn"))CFDictionarySetValue(v24, CFSTR("kConditionalConnectionRequirementPowerPluggedIn"), *v9);
      if (v24)
      {
        if (CFDictionaryGetCount(v24))
          CFDictionarySetValue(v7, &unk_1EDCFB868, v24);
        CFRelease(v24);
      }
      goto LABEL_105;
    }
    v28 = CFNumberCreate(v5, kCFNumberDoubleType, &valuePtr);
    v29 = CFNumberCreate(v5, kCFNumberDoubleType, &v44);
    v30 = v29;
    if (v28 && v29)
    {
      CFDictionarySetValue(v24, CFSTR("kConditionalConnectionRequirementTimeWindowDelay"), v28);
      CFDictionarySetValue(v24, CFSTR("kConditionalConnectionRequirementTimeWindowDuration"), v30);
      v31 = (void *)MEMORY[0x1E0C99D68];
      -[NSURLSessionTask startTime](self, "startTime");
      v33 = v32;
      -[__NSCFURLLocalStreamTask _timeWindowDelay](self, "_timeWindowDelay");
      CFDictionarySetValue(v24, CFSTR("kConditionalConnectionRequirementTimeWindowStartTime"), (const void *)objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:", v33 + v34));
    }
    else if (!v28)
    {
      goto LABEL_95;
    }
    CFRelease(v28);
LABEL_95:
    if (v30)
      CFRelease(v30);
    goto LABEL_97;
  }
LABEL_105:
  if (-[__NSCFURLLocalStreamTask _legacySocketStreamProperties](self, "_legacySocketStreamProperties"))
  {
    v35 = -[__NSCFURLLocalStreamTask _legacySocketStreamProperties](self, "_legacySocketStreamProperties");
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __55____NSCFURLLocalStreamTask__copySocketStreamProperties__block_invoke;
    v43[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v43[4] = v7;
    objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v43);
  }
  return v7;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_pendingWork);
  v20 = (void *)MEMORY[0x1E0CB3940];
  v19 = objc_opt_class();
  v4 = -[__NSCFURLLocalStreamTask state](self, "state");
  if (v4 > 3)
    v5 = "UNKNOWN";
  else
    v5 = off_1E14FCFA0[v4];
  v18 = v5;
  v17 = objc_msgSend(v3, "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = objc_opt_class();
        if (v11)
          v14 = *(_QWORD *)(v11 + 8);
        else
          v14 = 0;
        objc_msgSend(v6, "addObject:", objc_msgSend(v12, "stringWithFormat:", CFSTR("%@(%s)"), v13, v14));
        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = v15;
    }
    while (v15);
  }
  return (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@%p state %s, pending %d { %@ }>"), v19, self, v18, v17, objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
}

- (void)suspend
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35____NSCFURLLocalStreamTask_suspend__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __35____NSCFURLLocalStreamTask_suspend__block_invoke_3;
  v5[3] = &unk_1E14FE118;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)-[__NSCFURLLocalStreamTask workQueue](self, "workQueue"), v5);
}

- (void)resume
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34____NSCFURLLocalStreamTask_resume__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __34____NSCFURLLocalStreamTask_resume__block_invoke_2;
  v5[3] = &unk_1E14FE118;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)-[__NSCFURLLocalStreamTask workQueue](self, "workQueue"), v5);
}

- (void)_onqueue_resume
{
  _QWORD v3[5];

  if (-[__NSCFURLLocalStreamTask state](self, "state") == 1)
  {
    -[__NSCFURLLocalStreamTask setState:](self, "setState:", 0);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43____NSCFURLLocalStreamTask__onqueue_resume__block_invoke;
    v3[3] = &unk_1E14FE118;
    v3[4] = self;
    -[__NSCFURLLocalStreamTask _onqueue_addBlockOpAtHead:description:]((uint64_t)self, v3, (uint64_t)"resume");
  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34____NSCFURLLocalStreamTask_cancel__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  unint64_t v10;
  NSObject *v11;
  _QWORD block[9];

  if (a4 <= a3)
    v10 = a3;
  else
    v10 = a4;
  v11 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84____NSCFURLLocalStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_1E14FCE10;
  block[6] = a3;
  block[7] = v10;
  *(double *)&block[8] = a5;
  block[4] = self;
  block[5] = a6;
  dispatch_async(v11, block);
}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  NSObject *v9;
  _QWORD v10[8];

  v9 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke;
  v10[3] = &unk_1E14FCE60;
  v10[5] = a3;
  v10[6] = a5;
  v10[4] = self;
  *(double *)&v10[7] = a4;
  dispatch_async(v9, v10);
}

- (void)captureStreams
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42____NSCFURLLocalStreamTask_captureStreams__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)closeWrite
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38____NSCFURLLocalStreamTask_closeWrite__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)closeRead
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37____NSCFURLLocalStreamTask_closeRead__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)startSecureConnection
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49____NSCFURLLocalStreamTask_startSecureConnection__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopSecureConnection
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFURLLocalStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48____NSCFURLLocalStreamTask_stopSecureConnection__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(BaseSocketStreamClient *, id, id))self->_socketStreamClient->var0 + 6))(self->_socketStreamClient, a3, a4);
}

- (void)_onSessionQueue_disavow
{
  void (**disavow)(id, __NSCFURLLocalStreamTask *);

  disavow = (void (**)(id, __NSCFURLLocalStreamTask *))self->_disavow;
  self->_disavow = 0;
  disavow[2](disavow, self);
  _Block_release(disavow);
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  NSObject *tickerTimeoutTimer;

  tickerTimeoutTimer = self->_tickerTimeoutTimer;
  if (tickerTimeoutTimer)
  {
    self->_tickerTimeoutTimer = 0;
    dispatch_source_set_timer(tickerTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel(tickerTimeoutTimer);
    dispatch_release(tickerTimeoutTimer);
  }
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)set_timeWindowDelay:(double)a3
{
  self->_timeWindowDelay = a3;
}

- (double)_timeWindowDelay
{
  return self->_timeWindowDelay;
}

- (void)set_timeWindowDuration:(double)a3
{
  self->_timeWindowDuration = a3;
}

- (double)_timeWindowDuration
{
  return self->_timeWindowDuration;
}

- (void)set_boundInterfaceIdentifier:(id)a3
{

  self->_boundInterfaceIdentifier = (NSString *)objc_msgSend(a3, "copy");
}

- (id)_boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (void)set_disallowCellular:(BOOL)a3
{
  self->_disallowCellular = a3;
}

- (BOOL)_disallowCellular
{
  return self->_disallowCellular;
}

- (void)set_allowsExpensiveOverride:(int)a3
{
  self->_allowsExpensiveOverride = a3;
}

- (int)_allowsExpensiveOverride
{
  return self->_allowsExpensiveOverride;
}

- (void)set_allowsConstrainedOverride:(int)a3
{
  self->_allowsConstrainedOverride = a3;
}

- (int)_allowsConstrainedOverride
{
  return self->_allowsConstrainedOverride;
}

- (void)set_allowsUCAOverride:(int)a3
{
  self->_allowsUCAOverride = a3;
}

- (int)_allowsUCAOverride
{
  return self->_allowsUCAOverride;
}

- (void)set_allowsCellularOverride:(int)a3
{
  self->_allowsCellularOverride = a3;
}

- (int)_allowsCellularOverride
{
  return self->_allowsCellularOverride;
}

- (void)set_networkServiceType:(int)a3
{
  self->_networkServiceType = a3;
}

- (int)_networkServiceType
{
  return self->_networkServiceType;
}

- (void)set_legacySocketStreamProperties:(id)a3
{

  self->_legacySocketStreamProperties = (NSDictionary *)objc_msgSend(a3, "copy");
}

- (id)_legacySocketStreamProperties
{
  return self->_legacySocketStreamProperties;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (BOOL)_goneSecure
{
  return self->_goneSecure;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 936, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 936);
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 928, 1);
}

- (void)setTaskDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 928);
}

- (float)priority
{
  return self->priority;
}

- (void)setPriority:(float)a3
{
  self->priority = a3;
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 984, 1);
}

- (void)setOriginalRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 984);
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 992, 1);
}

- (void)setCurrentRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 992);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1000);
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (NSData)_TCPConnectionMetadata
{
  return (NSData *)objc_getProperty(self, a2, 1128, 1);
}

- (void)set_TCPConnectionMetadata:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1128);
}

- (NSData)_initialDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 1136, 1);
}

- (void)set_initialDataPayload:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1136);
}

- (NSUUID)_uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 1152, 1);
}

- (void)_onqueue_ioTick
{
  _BYTE *v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  CFIndex v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const UInt8 *v21;
  CFIndex v22;
  CFIndex v23;
  unint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  id v32;
  _BOOL4 v33;
  double Current;
  void *v35;
  _BOOL4 v36;
  void *v37;
  unint64_t v38;
  _BOOL4 v39;
  double v40;
  CFErrorRef CFErrorWithStreamError;
  CFErrorRef v42;
  uint64_t v43;
  _BOOL4 v44;
  uint64_t v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  BOOL v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t j;
  uint64_t v64;
  double v65;
  NSObject *v68;
  dispatch_time_t v69;
  uint64_t v70;
  CFErrorRef v71;
  CFErrorRef v72;
  double v73;
  NSObject *v74;
  double v75;
  BOOL v76;
  double v77;
  __int128 v78;
  const __CFAllocator *alloc;
  int v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD block[5];
  _BYTE v96[128];
  _BYTE v97[128];
  UInt8 v98[128];
  UInt8 buffer[4];
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  uint64_t v103;

  v1 = (_BYTE *)MEMORY[0x1E0C80A78](a1);
  v103 = *MEMORY[0x1E0C80C00];
  if (v1)
  {
    v2 = (uint64_t)v1;
    if (v1[816])
    {
      v3 = objc_msgSend(v1, "workQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = v2;
      dispatch_async(v3, block);
      return;
    }
    if (objc_msgSend(v1, "state") != 1)
    {
      if (*(_BYTE *)(v2 + 816))
        __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_ioTick]", "LocalStreamTask.mm", 1699, "_doingWorkOnThisQueue == false");
      *(_BYTE *)(v2 + 816) = 1;
      v4 = *(void **)(v2 + 808);
      *(_QWORD *)(v2 + 808) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v5 = 0;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      if (!v6)
      {
        v81 = 0;
        v80 = 0;
        v8 = 0;
        goto LABEL_112;
      }
      v81 = 0;
      v80 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v92;
      alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      *(_QWORD *)&v7 = 138412546;
      v78 = v7;
      while (1)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v92 != v9)
            objc_enumerationMutation(v4);
          v11 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v10);
          v12 = objc_msgSend((id)v2, "state", v78);
          if (v8 >= 1)
            goto LABEL_12;
          if (v12 != 1)
          {
            v13 = objc_opt_class();
            if (v13 == objc_opt_class())
            {
              if (v11)
              {
                if (*(_BYTE *)(v2 + 832))
                {
                  if (*(_QWORD *)(v2 + 792))
                  {
                    *(_BYTE *)(v2 + 832) = 0;
                    if (CFReadStreamHasBytesAvailable(*(CFReadStreamRef *)(v2 + 792)))
                    {
                      v14 = CFReadStreamRead(*(CFReadStreamRef *)(v2 + 792), buffer, 0x20000);
                      v15 = v14;
                      if (v14)
                      {
                        if (v14 < 0)
                        {
                          *(CFStreamError *)(v2 + 840) = CFReadStreamGetError((CFReadStreamRef)*(_QWORD *)(v2 + 792));
                        }
                        else
                        {
                          v16 = *(void **)(v2 + 824);
                          if (v16)
                          {
                            v17 = (void *)objc_msgSend(v16, "mutableCopy");
                            objc_msgSend(v17, "appendBytes:length:", buffer, v15);

                            *(_QWORD *)(v2 + 824) = v17;
                          }
                          else
                          {
                            *(_QWORD *)(v2 + 824) = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buffer, v15);
                          }
                        }
                      }
                      else
                      {
                        *(_BYTE *)(v2 + 833) = 1;
                      }
                    }
                  }
                }
                v29 = objc_msgSend(*(id *)(v2 + 824), "length");
                v30 = v29;
                if (v29 && (v29 >= *(unsigned int *)(v11 + 44) || *(_BYTE *)(v2 + 833)))
                {
                  v31 = *(id *)(v2 + 824);
                  if (v29 >= *(unsigned int *)(v11 + 48))
                  {
                    v31 = (id)objc_msgSend(*(id *)(v2 + 824), "subdataWithRange:", 0);
                    v35 = (void *)objc_msgSend(*(id *)(v2 + 824), "subdataWithRange:", *(unsigned int *)(v11 + 48), v30 - *(unsigned int *)(v11 + 48));

                    v32 = v35;
                    *(_QWORD *)(v2 + 824) = v32;
                  }
                  else
                  {
                    v32 = 0;
                    *(_QWORD *)(v2 + 824) = 0;
                  }
                  if (objc_msgSend(v32, "length"))
                    v36 = 0;
                  else
                    v36 = *(_BYTE *)(v2 + 833) != 0;
                  objc_msgSend((id)v2, "setCountOfBytesReceived:", objc_msgSend(v31, "length") + objc_msgSend((id)v2, "countOfBytesReceived"));
                  (*(void (**)(void))(*(_QWORD *)(v11 + 56) + 16))();
                  if (v36)
                    -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((_QWORD *)v2);

                  goto LABEL_84;
                }
                if (*(double *)(v11 + 16) != 0.0 && !objc_msgSend((id)v2, "error") && !*(_QWORD *)(v2 + 840))
                {
                  v33 = *(double *)(v11 + 24) == 0.0;
                  Current = CFAbsoluteTimeGetCurrent();
                  if (v33)
                  {
                    *(double *)(v11 + 24) = Current + *(double *)(v11 + 16);
                  }
                  else if (Current > *(double *)(v11 + 24))
                  {
                    *(_QWORD *)(v2 + 840) = 1;
                    *(_DWORD *)(v2 + 848) = 60;
                  }
                }
                if (objc_msgSend((id)v2, "error"))
                {
LABEL_83:
                  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(v11 + 56) + 16))(*(_QWORD *)(v11 + 56), 0, 0, objc_msgSend((id)v2, "error"));
                  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((_QWORD *)v2);
                }
                else
                {
                  if (!*(_BYTE *)(v2 + 833) || objc_msgSend(*(id *)(v2 + 824), "length"))
                  {
                    if (!*(_QWORD *)(v2 + 840) || !*(_DWORD *)(v2 + 848))
                    {
                      HIDWORD(v81) = 1;
                      v5 = 1;
LABEL_12:
                      objc_msgSend(*(id *)(v2 + 808), "insertObject:atIndex:", v11, v8++);
                      goto LABEL_100;
                    }
                    CFErrorWithStreamError = __cfnCreateCFErrorWithStreamError(alloc, (int *)(v2 + 840));
                    objc_msgSend((id)v2, "setError:", CFErrorWithStreamError);
                    if (CFErrorWithStreamError)
                      CFRelease(CFErrorWithStreamError);
                    goto LABEL_83;
                  }
                  (*(void (**)(void))(*(_QWORD *)(v11 + 56) + 16))();
                  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((_QWORD *)v2);
                }
              }
LABEL_84:
              v5 = 0;
              HIDWORD(v81) = 1;
              goto LABEL_100;
            }
            if (v13 == objc_opt_class())
            {
              if (v11)
              {
                v18 = *(_QWORD *)(v2 + 888);
                if (!v18)
                  goto LABEL_34;
                *(_QWORD *)(v2 + 888) = 0;
                v19 = *(_QWORD *)(v11 + 56);
                v20 = v18 - v19;
                if (v18 >= v19)
                {
                  (*(void (**)(void))(*(_QWORD *)(v11 + 64) + 16))();
                  if (v20 > 0)
                  {
                    if (*(_QWORD *)(v2 + 888))
LABEL_188:
                      __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_processWriteWork:]", "LocalStreamTask.mm", 1550, "_writeBufferAlreadyWrittenForNextWrite == 0");
                    goto LABEL_45;
                  }
                }
                else
                {
                  *(_QWORD *)(v11 + 56) = v19 - v18;
                  if (v18 > 0)
                  {
                    if (*(_QWORD *)(v2 + 888))
                      goto LABEL_188;
                    *(_QWORD *)(v2 + 888) = v18;
                  }
LABEL_34:
                  if (*(_BYTE *)(v2 + 864) && objc_msgSend(*(id *)(v2 + 856), "length"))
                  {
                    *(_BYTE *)(v2 + 864) = 0;
                    v21 = (const UInt8 *)objc_msgSend(*(id *)(v2 + 856), "bytes");
                    v22 = objc_msgSend(*(id *)(v2 + 856), "length");
                    v23 = CFWriteStreamWrite(*(CFWriteStreamRef *)(v2 + 800), v21, v22);
                    v24 = v23;
                    if (!v23)
                    {
                      *(_BYTE *)(v2 + 865) = 1;
                      goto LABEL_72;
                    }
                    if (v23 < 0)
                    {
                      *(CFStreamError *)(v2 + 872) = CFWriteStreamGetError((CFWriteStreamRef)*(_QWORD *)(v2 + 800));
                      goto LABEL_72;
                    }
                    v25 = *(void **)(v2 + 856);
                    if (v22 == v24)
                    {

                      v26 = 0;
                    }
                    else
                    {
                      v37 = (void *)objc_msgSend(v25, "subdataWithRange:", v24, v22 - v24);

                      v26 = v37;
                    }
                    *(_QWORD *)(v2 + 856) = v26;
                    objc_msgSend((id)v2, "setCountOfBytesSent:", objc_msgSend((id)v2, "countOfBytesSent") + v24);
                    v38 = *(_QWORD *)(v11 + 56);
                    v20 = v24 - v38;
                    if (v24 < v38)
                    {
                      *(_QWORD *)(v11 + 56) = v38 - v24;
                      if (*(_QWORD *)(v2 + 888))
                        goto LABEL_189;
                      *(_QWORD *)(v2 + 888) = v24;
                      goto LABEL_72;
                    }
                    (*(void (**)(void))(*(_QWORD *)(v11 + 64) + 16))();
                    if (v20 >= 1)
                    {
                      if (*(_QWORD *)(v2 + 888))
LABEL_189:
                        __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_processWriteWork:]", "LocalStreamTask.mm", 1596, "_writeBufferAlreadyWrittenForNextWrite == 0");
LABEL_45:
                      LODWORD(v81) = 0;
                      *(_QWORD *)(v2 + 888) = v20;
LABEL_99:
                      v80 = 1;
                      goto LABEL_100;
                    }
                  }
                  else
                  {
LABEL_72:
                    if (*(double *)(v11 + 16) != 0.0 && !objc_msgSend((id)v2, "error") && !*(_QWORD *)(v2 + 872))
                    {
                      v39 = *(double *)(v11 + 24) == 0.0;
                      v40 = CFAbsoluteTimeGetCurrent();
                      if (v39)
                      {
                        *(double *)(v11 + 24) = v40 + *(double *)(v11 + 16);
                      }
                      else if (v40 > *(double *)(v11 + 24))
                      {
                        *(_QWORD *)(v2 + 872) = 1;
                        *(_DWORD *)(v2 + 880) = 60;
                      }
                    }
                    if (!objc_msgSend((id)v2, "error"))
                    {
                      if (!*(_QWORD *)(v2 + 872) || !*(_DWORD *)(v2 + 880))
                      {
                        v80 = 1;
                        LODWORD(v81) = 1;
                        goto LABEL_12;
                      }
                      v42 = __cfnCreateCFErrorWithStreamError(alloc, (int *)(v2 + 872));
                      objc_msgSend((id)v2, "setError:", v42);
                      if (v42)
                        CFRelease(v42);
                    }
                    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v11 + 64) + 16))(*(_QWORD *)(v11 + 64), objc_msgSend((id)v2, "error"));
                    -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp]((_QWORD *)v2);
                  }
                }
              }
              LODWORD(v81) = 0;
              goto LABEL_99;
            }
            if (v13 != objc_opt_class())
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                v28 = objc_opt_class();
                *(_DWORD *)buffer = v78;
                v100 = v28;
                v101 = 2112;
                v102 = v11;
                _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "class %@ not  known for %@", buffer, 0x16u);
              }
              goto LABEL_12;
            }
            if (v11)
            {
              v27 = *(_QWORD *)(v11 + 48);
              if (v27)
                (*(void (**)(void))(v27 + 16))();
            }
          }
LABEL_100:
          ++v10;
        }
        while (v6 != v10);
        v43 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
        v6 = v43;
        if (!v43)
        {
          if ((v5 & 1) != 0)
          {
LABEL_114:
            if (((v5 ^ v81) & 1) == 0)
              __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_ioTick]", "LocalStreamTask.mm", 1758, "readNotCompleted != writeNotCompleted");
            if ((v5 & 1) != 0)
            {
              v45 = objc_opt_class();
              v46 = -[__NSCFURLLocalStreamTask _onqueue_shufflePendingFor:](v2, v45);
            }
            else
            {
              v46 = 1;
            }
            if ((v81 & 1) != 0)
            {
              v47 = objc_opt_class();
              v46 = -[__NSCFURLLocalStreamTask _onqueue_shufflePendingFor:](v2, v47);
            }
            v44 = v46;
            goto LABEL_121;
          }
LABEL_112:
          if ((v81 & 1) != 0)
            goto LABEL_114;
          v44 = 0;
LABEL_121:

          if (((HIDWORD(v81) | v80) & 1) == 0)
          {
            if (!objc_msgSend((id)v2, "error"))
            {
              if (*(_QWORD *)(v2 + 840))
              {
                v71 = __cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (int *)(v2 + 840));
                objc_msgSend((id)v2, "setError:", v71);
                if (v71)
                  CFRelease(v71);
              }
            }
            if (!objc_msgSend((id)v2, "error"))
            {
              if (*(_QWORD *)(v2 + 872))
              {
                if (*(_DWORD *)(v2 + 880))
                {
                  v72 = __cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (int *)(v2 + 872));
                  objc_msgSend((id)v2, "setError:", v72);
                  if (v72)
                    CFRelease(v72);
                }
              }
            }
            if (objc_msgSend((id)v2, "error") || *(_BYTE *)(v2 + 833))
              -[__NSCFURLLocalStreamTask _onqueue_closeReadOp]((_QWORD *)v2);
            if (objc_msgSend((id)v2, "error") || *(_BYTE *)(v2 + 865))
              -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp]((_QWORD *)v2);
            if (*(_DWORD *)(v2 + 776) != 1)
              -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v2);
          }
          if (objc_msgSend(*(id *)(v2 + 768), "count"))
          {
            v48 = *(void **)(v2 + 768);
            *(_QWORD *)(v2 + 768) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
            v87 = 0u;
            v88 = 0u;
            v89 = 0u;
            v90 = 0u;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v88;
              do
              {
                for (i = 0; i != v49; ++i)
                {
                  if (*(_QWORD *)v88 != v50)
                    objc_enumerationMutation(v48);
                  v52 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
                  if (v52)
                  {
                    v53 = *(_QWORD *)(v52 + 48);
                    if (v53)
                      (*(void (**)(void))(v53 + 16))();
                  }
                }
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
              }
              while (v49);
            }

          }
          *(_BYTE *)(v2 + 816) = 0;
          v54 = objc_msgSend(*(id *)(v2 + 808), "count");
          if (v8)
            v55 = v44;
          else
            v55 = 1;
          if (v54)
            v56 = v55 == 0;
          else
            v56 = 1;
          if (!v56 && *(int *)(v2 + 776) >= 2)
          {
            v57 = objc_msgSend((id)v2, "workQueue");
            v86[0] = MEMORY[0x1E0C809B0];
            v86[1] = 3221225472;
            v86[2] = __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke_46;
            v86[3] = &unk_1E14FE118;
            v86[4] = v2;
            dispatch_async(v57, v86);
          }
          if (*(_BYTE *)(v2 + 1120) && objc_msgSend((id)v2, "state") != 1)
          {
            *(_BYTE *)(v2 + 1120) = 0;
            v58 = *(_QWORD *)(v2 + 704);
            if (!v58)
              v58 = *(_QWORD *)(v2 + 696);
            -[__NSCFURLSessionDelegateWrapper betterRouteDiscoveredForStreamTask:](v58, (void *)v2);
          }
          if (*(_QWORD *)(v2 + 968))
          {
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            v59 = *(void **)(v2 + 808);
            v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
            if (!v60)
              goto LABEL_175;
            v61 = *(_QWORD *)v83;
            v62 = 0.0;
            do
            {
              for (j = 0; j != v60; ++j)
              {
                if (*(_QWORD *)v83 != v61)
                  objc_enumerationMutation(v59);
                v64 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
                v65 = *(double *)(v64 + 24);
                if ((v65 < v62 || v62 == 0.0) && v65 > 0.0)
                  v62 = *(double *)(v64 + 24);
              }
              v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
            }
            while (v60);
            if (v62 != 0.0)
            {
              v73 = v62 - CFAbsoluteTimeGetCurrent();
              v74 = *(NSObject **)(v2 + 968);
              v75 = v73 * 1000000000.0;
              v76 = v73 < 0.0;
              v77 = 0.0;
              if (!v76)
                v77 = v75;
              v69 = dispatch_time(0x8000000000000000, (uint64_t)v77);
              v68 = v74;
              v70 = 1000000000;
            }
            else
            {
LABEL_175:
              v68 = *(NSObject **)(v2 + 968);
              v69 = -1;
              v70 = 0;
            }
            dispatch_source_set_timer(v68, v69, 0xFFFFFFFFFFFFFFFFLL, v70);
          }
          return;
        }
      }
    }
  }
}

- (BOOL)_onqueue_shufflePendingFor:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  _QWORD v10[5];

  v3 = *(void **)(a1 + 808);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55____NSCFURLLocalStreamTask__onqueue_shufflePendingFor___block_invoke;
  v10[3] = &unk_1E14FCED8;
  v10[4] = a2;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v10);
  v5 = v4;
  if (v4)
    v6 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 808), "objectAtIndex:", v4);
    objc_msgSend(*(id *)(a1 + 808), "removeObjectAtIndex:", v5);
    objc_msgSend(*(id *)(a1 + 808), "insertObject:atIndex:", v7, 0);

  }
  return v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != 0;
}

- (void)_onqueue_closeReadOp
{
  void *v2;
  id v3;
  __CFReadStream *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (a1)
  {
    v2 = (void *)a1[103];
    if (v2)
    {
      a1[103] = 0;
      v3 = v2;
    }
    v4 = (__CFReadStream *)a1[99];
    if (v4)
    {
      a1[99] = 0;
      CFReadStreamSetProperty(v4, (CFStreamPropertyKey)&unk_1EDCFA1A8, 0);
      CFReadStreamSetClient(v4, 0, 0, 0);
      MEMORY[0x186DB62D4](v4, 0);
      CFReadStreamClose(v4);
      CFRelease(v4);
      v5 = a1[88];
      if (!v5)
        v5 = a1[87];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48____NSCFURLLocalStreamTask__onqueue_closeReadOp__block_invoke;
      v6[3] = &unk_1E14FE118;
      v6[4] = a1;
      -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v5, a1, v6);
    }
  }
}

- (void)_onqueue_closeWriteOp
{
  __CFWriteStream *v2;
  uint64_t v3;
  _QWORD v4[5];

  if (a1)
  {
    v2 = (__CFWriteStream *)a1[100];
    if (v2)
    {
      a1[100] = 0;
      CFWriteStreamSetClient(v2, 0, 0, 0);
      MEMORY[0x186DB6A90](v2, 0);
      CFWriteStreamClose(v2);
      CFRelease(v2);
      v3 = a1[88];
      if (!v3)
        v3 = a1[87];
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __49____NSCFURLLocalStreamTask__onqueue_closeWriteOp__block_invoke;
      v4[3] = &unk_1E14FE118;
      v4[4] = a1;
      -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v3, a1, v4);
    }
  }
}

- (uint64_t)_onqueue_checkForCompletion
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)result, "state");
    if (result <= 2 && (!*(_QWORD *)(v1 + 792) && !*(_QWORD *)(v1 + 800) || *(int *)(v1 + 776) <= 0))
    {
      if (objc_msgSend((id)v1, "state") <= 1)
        objc_msgSend((id)v1, "setState:", 2);
      v2 = *(_QWORD *)(v1 + 760);
      if (v2)
        (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
      -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend((id)v1, "session"), (_QWORD *)v1, *(void **)(v1 + 936));
      -[__NSURLSessionLocal removeUnresumedTask:](objc_msgSend((id)v1, "session"), v1);
      objc_msgSend((id)v1, "setState:", 3);
      return -[__NSCFURLLocalStreamTask _onqueue_ioTick](v1);
    }
  }
  return result;
}

- (void)_onqueue_startSecureConnection
{
  const void *v2;
  __CFReadStream *v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 792) || *(_QWORD *)(a1 + 800))
    {
      if (objc_msgSend((id)a1, "state") <= 1)
      {
        v7 = &unk_1EDCFC588;
        v8[0] = *MEMORY[0x1E0C9AE40];
        v2 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
        v3 = *(__CFReadStream **)(a1 + 792);
        if (v3)
          CFReadStreamSetProperty(v3, CFSTR("kCFStreamPropertySSLSettings"), v2);
        else
          CFWriteStreamSetProperty(*(CFWriteStreamRef *)(a1 + 800), CFSTR("kCFStreamPropertySSLSettings"), v2);
        if (*(_BYTE *)(a1 + 864))
          *(_BYTE *)(a1 + 864) = 0;
        if (*(_BYTE *)(a1 + 832))
          *(_BYTE *)(a1 + 832) = 0;
        *(_BYTE *)(a1 + 960) = 1;
      }
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __58____NSCFURLLocalStreamTask__onqueue_startSecureConnection__block_invoke;
      v6[3] = &unk_1E14FE118;
      v6[4] = a1;
      v4 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v6, (uint64_t)"jumping back once we have streams");
      v5 = *(void **)(a1 + 904);
      if (!v5)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
        *(_QWORD *)(a1 + 904) = v5;
      }
      objc_msgSend(v5, "addObject:", v4);
    }
    -[__NSCFURLLocalStreamTask _onqueue_ioTick](a1);
  }
}

- (uint64_t)_onqueue_cancel
{
  uint64_t v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 1144))
    {
      *(_BYTE *)(result + 1144) = 1;
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __43____NSCFURLLocalStreamTask__onqueue_cancel__block_invoke;
      v2[3] = &unk_1E14FE118;
      v2[4] = result;
      -[__NSCFURLLocalStreamTask _onqueue_addBlockOpAtHead:description:](result, v2, (uint64_t)"cancel");
      -[__NSCFURLLocalStreamTask _onqueue_ioTick](v1);
      return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v1);
    }
  }
  return result;
}

- (void)_onqueue_captureStreams
{
  __CFReadStream *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[5];

  if (a1)
  {
    if (*((_QWORD *)a1 + 99) || *((_QWORD *)a1 + 100))
    {
      -[__NSCFURLLocalStreamTask _onqueue_unscheduleStreams](a1);
      v2 = (__CFReadStream *)*((_QWORD *)a1 + 99);
      *((_QWORD *)a1 + 99) = 0;
      if (v2)
        CFReadStreamSetProperty(v2, (CFStreamPropertyKey)&unk_1EDCFA1A8, 0);
      v3 = (void *)*((_QWORD *)a1 + 100);
      *((_QWORD *)a1 + 100) = 0;
      -[__CFWriteStream setState:](a1, "setState:", 3);
      v4 = *((_QWORD *)a1 + 88);
      if (!v4)
        v4 = *((_QWORD *)a1 + 87);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke_2;
      v7[3] = &unk_1E14FE1E0;
      v7[4] = a1;
      v7[5] = v2;
      v7[6] = v3;
      -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:](v4, a1, v2, v3, v7);
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke;
      v8[3] = &unk_1E14FE118;
      v8[4] = a1;
      v5 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v8, (uint64_t)"captureStreams");
      v6 = (void *)*((_QWORD *)a1 + 113);
      if (!v6)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
        *((_QWORD *)a1 + 113) = v6;
      }
      objc_msgSend(v6, "addObject:", v5);
    }
  }
}

- (__CFWriteStream)_onqueue_unscheduleStreams
{
  __CFWriteStream *v1;
  __CFReadStream *v2;

  if (result)
  {
    v1 = result;
    v2 = (__CFReadStream *)*((_QWORD *)result + 99);
    if (v2)
    {
      CFReadStreamSetClient(v2, 0, 0, 0);
      MEMORY[0x186DB62D4](*((_QWORD *)v1 + 99), 0);
    }
    result = (__CFWriteStream *)*((_QWORD *)v1 + 100);
    if (result)
    {
      CFWriteStreamSetClient(result, 0, 0, 0);
      JUMPOUT(0x186DB6A90);
    }
  }
  return result;
}

- (uint64_t)_onqueue_addBlockOpAtHead:(uint64_t)a3 description:
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v11 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, a2, a3);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(void **)(v3 + 808);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        v10 = v7 + v6;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = v7 + v9;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v7 = v10;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_13:
    if (v10 > objc_msgSend(*(id *)(v3 + 808), "count"))
      __assert_rtn("-[__NSCFURLLocalStreamTask _onqueue_addBlockOpAtHead:description:]", "LocalStreamTask.mm", 2047, "i <= [_pendingWork count]");
    return objc_msgSend(*(id *)(v3 + 808), "insertObject:atIndex:", v11, v10);
  }
  return result;
}

- (void)_onqueue_errorOrCancelError
{
  void *v1;

  if (result)
  {
    v1 = result;
    if (!objc_msgSend(result, "error"))
      objc_msgSend(v1, "setError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0));
    return (void *)objc_msgSend(v1, "error");
  }
  return result;
}

- (_QWORD)_onqueue_scheduleStreams
{
  _QWORD *v1;
  __CFReadStream *v2;
  CFStreamClientContext clientContext;

  if (result)
  {
    v1 = result;
    clientContext.version = 0;
    clientContext.info = result;
    clientContext.retain = _rr_retain;
    clientContext.release = _rr_release;
    clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))MEMORY[0x1E0C98350];
    v2 = (__CFReadStream *)result[99];
    if (v2)
    {
      CFReadStreamSetClient(v2, 0x1BuLL, (CFReadStreamClientCallBack)_onqueue_readStreamEvent, &clientContext);
      MEMORY[0x186DB62D4](v1[99], objc_msgSend(v1, "workQueue"));
    }
    result = (_QWORD *)v1[100];
    if (result)
    {
      CFWriteStreamSetClient((CFWriteStreamRef)result, 0x1DuLL, (CFWriteStreamClientCallBack)_onqueue_writeStreamEvent, &clientContext);
      return (_QWORD *)MEMORY[0x186DB6A90](v1[100], objc_msgSend(v1, "workQueue"));
    }
  }
  return result;
}

- (void)_onqueue_writeStreamEvent:(uint64_t)a1
{
  uint64_t v3;

  if (a1 && *(_QWORD *)(a1 + 800))
  {
    if (*(_DWORD *)(a1 + 776) == 1)
      *(_DWORD *)(a1 + 776) = 2;
    switch(a2)
    {
      case 16:
        v3 = 865;
        break;
      case 8:
        *(CFStreamError *)(a1 + 872) = CFWriteStreamGetError((CFWriteStreamRef)*(_QWORD *)(a1 + 800));
        goto LABEL_13;
      case 4:
        v3 = 864;
        break;
      default:
LABEL_13:
        -[__NSCFURLLocalStreamTask _onqueue_ioTick](a1);
        return;
    }
    *(_BYTE *)(a1 + v3) = 1;
    goto LABEL_13;
  }
}

- (void)_onqueue_readStreamEvent:(uint64_t)a1
{
  uint64_t v3;

  if (a1 && *(_QWORD *)(a1 + 792))
  {
    if (*(_DWORD *)(a1 + 776) == 1)
      *(_DWORD *)(a1 + 776) = 2;
    switch(a2)
    {
      case 16:
        v3 = 833;
        break;
      case 8:
        *(CFStreamError *)(a1 + 840) = CFReadStreamGetError((CFReadStreamRef)*(_QWORD *)(a1 + 792));
        goto LABEL_13;
      case 2:
        v3 = 832;
        break;
      default:
LABEL_13:
        -[__NSCFURLLocalStreamTask _onqueue_ioTick](a1);
        return;
    }
    *(_BYTE *)(a1 + v3) = 1;
    goto LABEL_13;
  }
}

- (_QWORD)_initWithTaskGroup:(const void *)a3 disavow:
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t Instance;
  const char *v7;
  SocketStream *v8;

  if (!a1)
    return 0;
  v3 = -[__NSCFURLLocalStreamTask _initCommonWithGroup:disavow:](a1, a2, a3);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3[98] = dispatch_queue_create("com.apple.NSURLSession.streamTask_work", v4);
    *((_DWORD *)v3 + 194) = 0;
    v5 = (_QWORD *)operator new();
    *v5 = &off_1E14EC6D0;
    v5[1] = &unk_1E14EC758;
    v5[2] = v3;
    if (TCFObject<SocketStream>::Class(void)::sOnce != -1)
      dispatch_once(&TCFObject<SocketStream>::Class(void)::sOnce, &__block_literal_global_366);
    Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      v8 = (SocketStream *)(Instance + 16);
      bzero((void *)(Instance + 16), 0x2B8uLL);
    }
    else
    {
      v8 = 0;
    }
    SocketStream::SocketStream(v8, v7);
    v5[3] = v8;
    v5[4] = 0;
    v3[95] = v5;
    -[__NSCFURLLocalStreamTask _init_setupTimeoutTimer]((dispatch_source_t *)v3);
  }
  return v3;
}

- (_QWORD)_initCommonWithGroup:(const void *)a3 disavow:
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)__NSCFURLLocalStreamTask;
  v4 = objc_msgSendSuper2(&v8, sel_initWithTaskGroup_, a2);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTaskIdentifier:", objc_msgSend((id)objc_msgSend(v4, "session"), "nextSeed"));
    objc_msgSend(v5, "setState:", 1);
    v5[144] = (id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5[101] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v5[96] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v5[112] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v5[113] = 0;
    v5[122] = _Block_copy(a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5[132] = v6;
  }
  return v5;
}

- (void)_init_setupTimeoutTimer
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  v2 = -[dispatch_source_t workQueue](a1, "workQueue");
  a1[121] = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v2);
  objc_initWeak(&location, a1);
  v3 = a1[121];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51____NSCFURLLocalStreamTask__init_setupTimeoutTimer__block_invoke;
  v4[3] = &unk_1E14FCD98;
  objc_copyWeak(&v5, &location);
  dispatch_source_set_event_handler(v3, v4);
  dispatch_source_set_timer(a1[121], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(a1[121]);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_onqueue_readStream:(const void *)a3 writeStreamAvailable:
{
  CFTypeRef v6;
  CFTypeRef v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  CFStreamStatus Status;
  __CFReadStream *v18;
  CFStreamError Error;
  uint64_t v20;
  CFStreamStatus v21;
  __CFWriteStream *v22;
  CFStreamError v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD propertyValue[5];
  uint8_t buf[8];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (*(_OWORD *)(a1 + 792) != 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "should only have gotten here once as a SocketStream client", buf, 2u);
    if (cf)
      goto LABEL_5;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (!cf)
    goto LABEL_7;
LABEL_5:
  v6 = CFRetain(cf);
LABEL_8:
  *(_QWORD *)(a1 + 792) = v6;
  if (a3)
    v7 = CFRetain(a3);
  else
    v7 = 0;
  *(_QWORD *)(a1 + 800) = v7;
  v8 = *(_QWORD *)(a1 + 704);
  if ((v8 || (v8 = *(_QWORD *)(a1 + 696)) != 0)
    && ((-[__NSCFURLSessionDelegateWrapper check_betterRouteDiscovered]((unsigned __int8 *)v8, (const char *)cf) & 1) != 0
     || -[__NSCFURLSessionDelegateWrapper check_betterRouteDiscovered](*(unsigned __int8 **)(v8 + 24), v9)))
  {
    propertyValue[0] = MEMORY[0x1E0C809B0];
    propertyValue[1] = 3221225472;
    propertyValue[2] = __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke;
    propertyValue[3] = &unk_1E14FE118;
    propertyValue[4] = a1;
    CFReadStreamSetProperty((CFReadStreamRef)cf, (CFStreamPropertyKey)&unk_1EDCFA1A8, propertyValue);
  }
  if (!*(_BYTE *)(a1 + 866))
  {
    *(_BYTE *)(a1 + 866) = 1;
    if (!*(_DWORD *)(a1 + 848)
      && !*(_DWORD *)(a1 + 880)
      && CFReadStreamGetStatus(*(CFReadStreamRef *)(a1 + 792)) != kCFStreamStatusError
      && CFWriteStreamGetStatus(*(CFWriteStreamRef *)(a1 + 800)) != kCFStreamStatusError)
    {
      v10 = *(_QWORD *)(a1 + 704);
      if (!v10)
        v10 = *(_QWORD *)(a1 + 696);
      -[__NSCFURLSessionDelegateWrapper _connectionEstablishedForStreamTask:](v10, (void *)a1);
    }
  }
  v11 = *(void **)(a1 + 904);
  if (v11)
  {
    *(_QWORD *)(a1 + 904) = 0;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (v15)
          {
            v16 = *(_QWORD *)(v15 + 48);
            if (v16)
              (*(void (**)(void))(v16 + 16))();
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v12);
    }

  }
  if (*(_QWORD *)(a1 + 792) && *(_QWORD *)(a1 + 800))
  {
    -[__NSCFURLLocalStreamTask _onqueue_scheduleStreams]((_QWORD *)a1);
    Status = CFReadStreamGetStatus(*(CFReadStreamRef *)(a1 + 792));
    v18 = *(__CFReadStream **)(a1 + 792);
    if (Status <= kCFStreamStatusNotOpen)
    {
      CFReadStreamOpen(v18);
    }
    else
    {
      Error = CFReadStreamGetError(v18);
      if (Error.domain && Error.error)
      {
        v20 = 8;
      }
      else if (CFReadStreamHasBytesAvailable(*(CFReadStreamRef *)(a1 + 792)))
      {
        v20 = 2;
      }
      else
      {
        v20 = 1;
      }
      -[__NSCFURLLocalStreamTask _onqueue_readStreamEvent:](a1, v20);
    }
    v21 = CFWriteStreamGetStatus(*(CFWriteStreamRef *)(a1 + 800));
    v22 = *(__CFWriteStream **)(a1 + 800);
    if (v21 <= kCFStreamStatusNotOpen)
    {
      CFWriteStreamOpen(v22);
    }
    else
    {
      v23 = CFWriteStreamGetError(v22);
      if (v23.domain && v23.error)
      {
        v24 = 8;
      }
      else if (CFWriteStreamCanAcceptBytes(*(CFWriteStreamRef *)(a1 + 800)))
      {
        v24 = 4;
      }
      else
      {
        v24 = 1;
      }
      -[__NSCFURLLocalStreamTask _onqueue_writeStreamEvent:](a1, v24);
    }
  }
}

- (uint64_t)_onqueue_sendSessionChallenge:(void *)a3 completionHandler:
{
  uint64_t v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  const char *v12;
  char v13;
  char v14;

  if (a1)
  {
    v6 = a1[88];
    if (!v6)
      v6 = a1[87];
    v8 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](v6, a2);
    v9 = a1[88];
    if (v9)
    {
      if (!v8)
      {
LABEL_9:
        if ((-[__NSCFURLSessionDelegateWrapper didReceiveChallenge](v9, v7) & 1) != 0)
        {
          v10 = a1[88];
          if (!v10)
            v10 = a1[87];
          goto LABEL_12;
        }
        return 0;
      }
    }
    else
    {
      v9 = a1[87];
      if ((v8 & 1) == 0)
        goto LABEL_9;
    }
LABEL_8:
    -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v9, a2, a3);
    return 1;
  }
  v13 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](0, a2);
  v9 = 0;
  if ((v13 & 1) != 0)
    goto LABEL_8;
  v14 = -[__NSCFURLSessionDelegateWrapper didReceiveChallenge](0, v12);
  v10 = 0;
  if ((v14 & 1) != 0)
  {
LABEL_12:
    -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v10, a1, a2, a3);
    return 1;
  }
  return 0;
}

@end
