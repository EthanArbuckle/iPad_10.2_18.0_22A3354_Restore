@implementation C2RequestOptions

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return self->__sourceApplicationBundleIdentifier;
}

- (BOOL)outOfProcess
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;

  v3 = -[C2RequestOptions discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
  v4 = -[C2RequestOptions duetPreClearedMode](self, "duetPreClearedMode");
  v5 = -[C2RequestOptions _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks");
  if (v4)
    v6 = 1;
  else
    v6 = v5;
  return v3 || v6;
}

- (unint64_t)discretionaryNetworkBehavior
{
  return self->_discretionaryNetworkBehavior;
}

- (unint64_t)duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (BOOL)_allowsRetryForBackgroundDataTasks
{
  return self->__allowsRetryForBackgroundDataTasks;
}

+ (id)stringForQualityOfService:(int64_t)a3
{
  if (a3 <= 16)
  {
    if (a3 == -1)
      return CFSTR("default");
    if (a3 == 9)
      return CFSTR("background");
  }
  else
  {
    switch(a3)
    {
      case 17:
        return CFSTR("utility");
      case 33:
        return CFSTR("userInteractive");
      case 25:
        return CFSTR("userInitiated");
    }
  }
  return CFSTR("unknown");
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2;

  v2 = 8;
  if (!self->_hasAllowsCellularAccess)
    v2 = 9;
  return *((_BYTE *)&self->super.isa + v2);
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return self->__sourceApplicationSecondaryIdentifier;
}

- (BOOL)_allowsPowerNapScheduling
{
  return self->__allowsPowerNapScheduling;
}

- (BOOL)_allowsExpensiveAccess
{
  return self->__allowsExpensiveAccess;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (NSString)_appleIDContextSessionIdentifier
{
  return self->__appleIDContextSessionIdentifier;
}

- (void)handleCallbackForSessionTask:(id)a3 dataTask:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[C2RequestOptions containerType](self, "containerType");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__C2RequestOptions_handleCallbackForSessionTask_dataTask_callback___block_invoke;
  v15[3] = &unk_1E9898BC0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[C2CallstackAnnotations annotateCallstackForContainerType:block:](C2CallstackAnnotations, "annotateCallstackForContainerType:block:", v11, v15);

}

- (int64_t)containerType
{
  return self->_containerType;
}

- (BOOL)tlsPinning
{
  return self->_tlsPinning;
}

- (BOOL)metricRequest
{
  return self->_metricRequest;
}

+ (id)stringForDuetPreClearedMode:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("?");
  else
    return off_1E9898E88[a3];
}

+ (id)stringForDiscretionaryNetworkBehavior:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("?");
  else
    return off_1E9898E70[a3];
}

- (BOOL)redactUniformResourceIdentifierFromNetworkMetrics
{
  return self->_redactUniformResourceIdentifierFromNetworkMetrics;
}

- (BOOL)redactRemoteEndpointFromNetworkMetrics
{
  return self->_redactRemoteEndpointFromNetworkMetrics;
}

- (NSString)outOfProcessPoolName
{
  return self->_outOfProcessPoolName;
}

+ (BOOL)triesteMetricsEnabled
{
  return triesteMetricsEnabled;
}

- (double)emptySessionExpiryInSeconds
{
  return 300.0;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (void)set_timeoutIntervalForRequest:(double)a3
{
  self->__timeoutIntervalForRequest = a3;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3
{
  self->__allowsRetryForBackgroundDataTasks = a3;
}

- (void)set_allowsPowerNapScheduling:(BOOL)a3
{
  self->__allowsPowerNapScheduling = a3;
}

- (void)set_allowsExpensiveAccess:(BOOL)a3
{
  self->__allowsExpensiveAccess = a3;
}

- (void)setTlsPinning:(BOOL)a3
{
  self->_tlsPinning = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setOutOfProcessPoolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setMetricOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setDuetPreClearedMode:(unint64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_discretionaryNetworkBehavior = a3;
}

- (void)setAllowRouting:(BOOL)a3
{
  self->_allowRouting = a3;
}

- (void)setAllowExpiredDNSBehavior:(BOOL)a3
{
  self->_allowExpiredDNSBehavior = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkingDelegate);
  objc_storeStrong((id *)&self->_invokedURL, 0);
  objc_storeStrong(&self->_testBehavior_sessionGroupCreated, 0);
  objc_storeStrong((id *)&self->_originalHost, 0);
  objc_storeStrong((id *)&self->_c2MetricsEndpoint, 0);
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_useNWLoaderOverride, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->__appleIDContextSessionIdentifier, 0);
  objc_storeStrong((id *)&self->__sourceApplicationAuditTokenData, 0);
  objc_storeStrong((id *)&self->__sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->__sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_outOfProcessPoolName, 0);
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_hasAllowsCellularAccess = 1;
  self->_allowsCellularAccess = a3;
}

- (C2RequestOptions)init
{
  C2RequestOptions *v2;
  C2RequestOptions *v3;
  NSString *outOfProcessPoolName;
  NSString *sourceApplicationBundleIdentifier;
  NSString *sourceApplicationSecondaryIdentifier;
  NSData *sourceApplicationAuditTokenData;
  NSNumber *privacyProxyFailClosedOverride;
  NSNumber *useNWLoaderOverride;
  NSString *appleIDContextSessionIdentifier;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  C2MetricOptions *metricOptions;
  NSString *originalHost;
  NSURL *invokedURL;
  id testBehavior_sessionGroupCreated;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)C2RequestOptions;
  v2 = -[C2RequestOptions init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    outOfProcessPoolName = v2->_outOfProcessPoolName;
    v2->_qualityOfService = -1;
    v2->_outOfProcessPoolName = 0;

    v3->_hasAllowsCellularAccess = 0;
    *(_WORD *)&v3->_allowsCellularAccess = 257;
    v3->__allowsPowerNapScheduling = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->__timeoutIntervalForRequest = _Q0;
    sourceApplicationBundleIdentifier = v3->__sourceApplicationBundleIdentifier;
    v3->__sourceApplicationBundleIdentifier = 0;

    sourceApplicationSecondaryIdentifier = v3->__sourceApplicationSecondaryIdentifier;
    v3->__sourceApplicationSecondaryIdentifier = 0;

    sourceApplicationAuditTokenData = v3->__sourceApplicationAuditTokenData;
    v3->__sourceApplicationAuditTokenData = 0;

    privacyProxyFailClosedOverride = v3->_privacyProxyFailClosedOverride;
    v3->_privacyProxyFailClosedOverride = 0;

    useNWLoaderOverride = v3->_useNWLoaderOverride;
    v3->_useNWLoaderOverride = 0;

    appleIDContextSessionIdentifier = v3->__appleIDContextSessionIdentifier;
    v3->__appleIDContextSessionIdentifier = 0;

    *(_DWORD *)&v3->_tlsPinning = 0;
    v3->_discretionaryNetworkBehavior = 0;
    v3->_duetPreClearedMode = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v17;

    metricOptions = v3->_metricOptions;
    v3->_metricOptions = 0;

    objc_storeWeak((id *)&v3->_networkingDelegate, 0);
    *(_WORD *)&v3->_redactRemoteEndpointFromNetworkMetrics = 0;
    v3->_containerType = 0;
    v3->__optIntoDisableAPWakeOnIdleConnections = 0;
    originalHost = v3->_originalHost;
    v3->_originalHost = 0;

    v3->_metricRequest = 0;
    invokedURL = v3->_invokedURL;
    v3->_invokedURL = 0;

    testBehavior_sessionGroupCreated = v3->_testBehavior_sessionGroupCreated;
    v3->_testBehavior_sessionGroupCreated = 0;

  }
  return v3;
}

- (id)testBehavior_sessionGroupCreated
{
  return self->_testBehavior_sessionGroupCreated;
}

- (void)setOriginalHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setInvokedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)sessionConfigurationNameWithRouteHost:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB37A0];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v6, "appendFormat:", CFSTR("route=%@"), v5);

    if (-[C2RequestOptions outOfProcess](self, "outOfProcess"))
      v7 = CFSTR("T");
    else
      v7 = CFSTR("F");
    objc_msgSend(v6, "appendFormat:", CFSTR(":outOfProcess=%@"), v7);
    if (-[C2RequestOptions _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"))
      v8 = CFSTR("T");
    else
      v8 = CFSTR("F");
    objc_msgSend(v6, "appendFormat:", CFSTR(":powerNap=%@"), v8);
    -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(":app=%@"), v10);

    }
    -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(":2app=%@"), v12);

    }
    -[C2RequestOptions _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v6, "appendString:", CFSTR(":auditToken=Y"));
    if (-[C2RequestOptions outOfProcess](self, "outOfProcess"))
    {
      +[C2RequestOptions stringForDiscretionaryNetworkBehavior:](C2RequestOptions, "stringForDiscretionaryNetworkBehavior:", -[C2RequestOptions discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(":disc=%@"), v14);

      +[C2RequestOptions stringForDuetPreClearedMode:](C2RequestOptions, "stringForDuetPreClearedMode:", -[C2RequestOptions duetPreClearedMode](self, "duetPreClearedMode"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(":duet=%@"), v15);

      v16 = -[C2RequestOptions _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks")
          ? CFSTR("T")
          : CFSTR("F");
      objc_msgSend(v6, "appendFormat:", CFSTR(":retry=%@"), v16);
      -[C2RequestOptions outOfProcessPoolName](self, "outOfProcessPoolName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[C2RequestOptions outOfProcessPoolName](self, "outOfProcessPoolName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR(":pool=%@"), v18);

      }
    }
    -[C2RequestOptions useNWLoaderOverride](self, "useNWLoaderOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[C2RequestOptions useNWLoaderOverride](self, "useNWLoaderOverride");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "BOOLValue"))
        v21 = CFSTR("T");
      else
        v21 = CFSTR("F");
      objc_msgSend(v6, "appendFormat:", CFSTR(":useNWLoaderOverride=%@"), v21);

    }
    -[C2RequestOptions networkingDelegate](self, "networkingDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[C2RequestOptions networkingDelegate](self, "networkingDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(":networkingDelegate=%@"), v23);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (C2NetworkingDelegate)networkingDelegate
{
  return (C2NetworkingDelegate *)objc_loadWeakRetained((id *)&self->_networkingDelegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)decorateTask:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  -[C2RequestOptions _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
  if (v5 > 0.0)
  {
    -[C2RequestOptions _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
    objc_msgSend(v4, "set_timeoutIntervalForResource:");
  }
  -[C2RequestOptions _appleIDContextSessionIdentifier](self, "_appleIDContextSessionIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[C2RequestOptions _appleIDContextSessionIdentifier](self, "_appleIDContextSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v10 = (void *)getAKAppleIDSessionClass_softClass;
      v20 = getAKAppleIDSessionClass_softClass;
      if (!getAKAppleIDSessionClass_softClass)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __getAKAppleIDSessionClass_block_invoke;
        v16[3] = &unk_1E9898720;
        v16[4] = &v17;
        __getAKAppleIDSessionClass_block_invoke((uint64_t)v16);
        v10 = (void *)v18[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v17, 8);
      v12 = [v11 alloc];
      -[C2RequestOptions _appleIDContextSessionIdentifier](self, "_appleIDContextSessionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithIdentifier:", v13);
      objc_msgSend(v4, "_setAppleIDContext:", v14);

    }
  }
  return v4;
}

- (id)copyAndDecorateRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  if (v4)
  {
    if (-[C2RequestOptions hasAllowsCellularAccess](self, "hasAllowsCellularAccess"))
      objc_msgSend(v4, "setAllowsCellularAccess:", -[C2RequestOptions allowsCellularAccess](self, "allowsCellularAccess"));
    objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[C2RequestOptions _allowsExpensiveAccess](self, "_allowsExpensiveAccess"));
    -[C2RequestOptions privacyProxyFailClosedOverride](self, "privacyProxyFailClosedOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[C2RequestOptions privacyProxyFailClosedOverride](self, "privacyProxyFailClosedOverride");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setPrivacyProxyFailClosed:", objc_msgSend(v6, "BOOLValue"));

    }
    -[C2RequestOptions _timeoutIntervalForRequest](self, "_timeoutIntervalForRequest");
    if (v7 > 0.0)
    {
      -[C2RequestOptions _timeoutIntervalForRequest](self, "_timeoutIntervalForRequest");
      objc_msgSend(v4, "setTimeoutInterval:");
    }
    -[C2RequestOptions metricOptions](self, "metricOptions");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = -[C2RequestOptions allowRouting](self, "allowRouting");

      if (v10)
      {
        -[C2MetricOptions headerValueForTriggers](self->_metricOptions, "headerValueForTriggers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addValue:forHTTPHeaderField:", v11, CFSTR("x-apple-c2-metric-triggers"));

      }
    }
    v12 = v4;
  }

  return v4;
}

- (double)_timeoutIntervalForRequest
{
  return self->__timeoutIntervalForRequest;
}

- (BOOL)allowRouting
{
  return self->_allowRouting;
}

- (BOOL)hasAllowsCellularAccess
{
  return self->_hasAllowsCellularAccess;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  return self->_privacyProxyFailClosedOverride;
}

- (void)set_appleIDContextSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPrivacyProxyFailClosedOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setMetricRequest:(BOOL)a3
{
  self->_metricRequest = a3;
}

- (id)sessionConfigurationWithName:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id BRContainersMonitorClass;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t v36[16];
  uint8_t buf[16];

  if (!a3)
    return 0;
  -[C2RequestOptions defaultSessionConfigurationWithName:](self, "defaultSessionConfigurationWithName:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "set_allowsPowerNapScheduling:", -[C2RequestOptions _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"));
    -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v9);

      }
    }
    -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", v14);

      }
    }
    -[C2RequestOptions _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[C2RequestOptions _sourceApplicationAuditTokenData](self, "_sourceApplicationAuditTokenData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "set_sourceApplicationAuditTokenData:", v16);

    }
    if (!-[C2RequestOptions outOfProcess](self, "outOfProcess"))
    {
      -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          BRContainersMonitorClass = getBRContainersMonitorClass();
          -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(BRContainersMonitorClass, "containerIDFromPrimaryIdentifier:secondaryIdentifier:", v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = getBRContainersMonitorClass();
            -[C2RequestOptions _sourceApplicationBundleIdentifier](self, "_sourceApplicationBundleIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self, "_sourceApplicationSecondaryIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "bundleIDFromPrimaryIdentifier:secondaryIdentifier:", v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
              v28 = v27;
            else
              v28 = v23;
            objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v28);

          }
        }
      }
    }
    if (-[C2RequestOptions outOfProcess](self, "outOfProcess"))
    {
      objc_msgSend(v4, "setDiscretionary:", -[C2RequestOptions discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior") == 2);
      objc_msgSend(v4, "set_infersDiscretionaryFromOriginatingClient:", -[C2RequestOptions discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior") == 1);
      -[C2RequestOptions outOfProcessPoolName](self, "outOfProcessPoolName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "set_connectionPoolName:", v29);

      objc_msgSend(v4, "set_allowsRetryForBackgroundDataTasks:", -[C2RequestOptions _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"));
      if (-[C2RequestOptions duetPreClearedMode](self, "duetPreClearedMode") == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, "set_duetPreClearedMode:", 1);
        }
        else
        {
          objc_msgSend(v4, "setDiscretionary:", 0);
          if (C2_DEFAULT_LOG_BLOCK_4 != -1)
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_4, &__block_literal_global_124);
          v31 = C2_DEFAULT_LOG_INTERNAL_4;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4DC3000, v31, OS_LOG_TYPE_INFO, "Unable to apply PreClearedModeWithBudgeting", buf, 2u);
          }
        }
      }
      if (-[C2RequestOptions duetPreClearedMode](self, "duetPreClearedMode") == 2)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, "set_duetPreClearedMode:", 2);
        }
        else
        {
          objc_msgSend(v4, "setDiscretionary:", 0);
          if (C2_DEFAULT_LOG_BLOCK_4 != -1)
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_4, &__block_literal_global_126);
          v32 = C2_DEFAULT_LOG_INTERNAL_4;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v36 = 0;
            _os_log_impl(&dword_1D4DC3000, v32, OS_LOG_TYPE_INFO, "Unable to apply PreClearedModeWithoutBudgeting", v36, 2u);
          }
        }
      }
    }
    if (-[C2RequestOptions tlsPinning](self, "tlsPinning"))
      objc_msgSend(v4, "set_tlsTrustPinningPolicyName:", *MEMORY[0x1E0CD6F98]);
    if (-[C2RequestOptions allowExpiredDNSBehavior](self, "allowExpiredDNSBehavior"))
      objc_msgSend(v4, "set_expiredDNSBehavior:", 1);
    -[C2RequestOptions useNWLoaderOverride](self, "useNWLoaderOverride");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[C2RequestOptions useNWLoaderOverride](self, "useNWLoaderOverride");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "set_usesNWLoader:", objc_msgSend(v34, "BOOLValue"));

    }
    v35 = v4;
  }

  return v4;
}

- (id)defaultSessionConfigurationWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    if (!-[C2RequestOptions outOfProcess](self, "outOfProcess"))
    {
      objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "set_preventsIdleSleepOnceConnected:", 1);
      if (+[C2DeviceInfo whitelistedForDisableAPWakeOnIdleConnections](C2DeviceInfo, "whitelistedForDisableAPWakeOnIdleConnections")|| -[C2RequestOptions _optIntoDisableAPWakeOnIdleConnections](self, "_optIntoDisableAPWakeOnIdleConnections"))
      {
        if (C2_DEFAULT_LOG_BLOCK_4 != -1)
          dispatch_once(&C2_DEFAULT_LOG_BLOCK_4, &__block_literal_global_9);
        v9 = C2_DEFAULT_LOG_INTERNAL_4;
        if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D4DC3000, v9, OS_LOG_TYPE_DEBUG, "set_disableAPWakeOnIdleConnections.", buf, 2u);
        }
        objc_msgSend(v8, "set_disableAPWakeOnIdleConnections:", 1);
      }
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:uuid:%@"), v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39F8], "backgroundSessionConfigurationWithIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
      objc_msgSend(v8, "setURLCredentialStorage:", 0);
      objc_msgSend(v8, "setHTTPCookieStorage:", 0);
      objc_msgSend(v8, "setURLCache:", 0);
      objc_msgSend(v8, "setRequestCachePolicy:", 1);
      objc_msgSend(v8, "set_timingDataOptions:", 85);
      goto LABEL_14;
    }
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)allowExpiredDNSBehavior
{
  return self->_tlsPinning && self->_allowExpiredDNSBehavior;
}

+ (void)initialize
{
  void *v2;

  if ((hasTriesteMetricsEnabled & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "c2DefaultsDomain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    triesteMetricsEnabled = objc_msgSend(v2, "BOOLForKey:", CFSTR("C2_triesteMetricsEnabled"));

    hasTriesteMetricsEnabled = 1;
  }
}

+ (C2NetworkingDelegate)testNetworkingDelegate
{
  return (C2NetworkingDelegate *)(id)_testNetworkingDelegate;
}

+ (void)setTestNetworkingDelegate:(id)a3
{
  objc_storeStrong((id *)&_testNetworkingDelegate, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  C2RequestOptions *v4;
  C2RequestOptions *v5;
  id WeakRetained;

  v4 = +[C2RequestOptions allocWithZone:](C2RequestOptions, "allocWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    -[C2RequestOptions setQualityOfService:](v4, "setQualityOfService:", self->_qualityOfService);
    -[C2RequestOptions setOutOfProcessPoolName:](v5, "setOutOfProcessPoolName:", self->_outOfProcessPoolName);
    if (self->_hasAllowsCellularAccess)
      -[C2RequestOptions setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", self->_allowsCellularAccess);
    -[C2RequestOptions set_allowsExpensiveAccess:](v5, "set_allowsExpensiveAccess:", self->__allowsExpensiveAccess);
    -[C2RequestOptions set_allowsPowerNapScheduling:](v5, "set_allowsPowerNapScheduling:", self->__allowsPowerNapScheduling);
    -[C2RequestOptions set_timeoutIntervalForRequest:](v5, "set_timeoutIntervalForRequest:", self->__timeoutIntervalForRequest);
    -[C2RequestOptions set_timeoutIntervalForResource:](v5, "set_timeoutIntervalForResource:", self->__timeoutIntervalForResource);
    -[C2RequestOptions set_sourceApplicationBundleIdentifier:](v5, "set_sourceApplicationBundleIdentifier:", self->__sourceApplicationBundleIdentifier);
    -[C2RequestOptions set_sourceApplicationSecondaryIdentifier:](v5, "set_sourceApplicationSecondaryIdentifier:", self->__sourceApplicationSecondaryIdentifier);
    -[C2RequestOptions set_sourceApplicationAuditTokenData:](v5, "set_sourceApplicationAuditTokenData:", self->__sourceApplicationAuditTokenData);
    -[C2RequestOptions set_appleIDContextSessionIdentifier:](v5, "set_appleIDContextSessionIdentifier:", self->__appleIDContextSessionIdentifier);
    -[C2RequestOptions setTlsPinning:](v5, "setTlsPinning:", self->_tlsPinning);
    -[C2RequestOptions setAllowRouting:](v5, "setAllowRouting:", self->_allowRouting);
    -[C2RequestOptions setAllowExpiredDNSBehavior:](v5, "setAllowExpiredDNSBehavior:", self->_allowExpiredDNSBehavior);
    -[C2RequestOptions setDiscretionaryNetworkBehavior:](v5, "setDiscretionaryNetworkBehavior:", self->_discretionaryNetworkBehavior);
    -[C2RequestOptions setDuetPreClearedMode:](v5, "setDuetPreClearedMode:", self->_duetPreClearedMode);
    -[C2RequestOptions set_allowsRetryForBackgroundDataTasks:](v5, "set_allowsRetryForBackgroundDataTasks:", self->__allowsRetryForBackgroundDataTasks);
    -[C2RequestOptions setPrivacyProxyFailClosedOverride:](v5, "setPrivacyProxyFailClosedOverride:", self->_privacyProxyFailClosedOverride);
    -[C2RequestOptions setIdentifier:](v5, "setIdentifier:", self->_identifier);
    -[C2RequestOptions setMetricOptions:](v5, "setMetricOptions:", self->_metricOptions);
    WeakRetained = objc_loadWeakRetained((id *)&self->_networkingDelegate);
    -[C2RequestOptions setNetworkingDelegate:](v5, "setNetworkingDelegate:", WeakRetained);

    -[C2RequestOptions setRedactRemoteEndpointFromNetworkMetrics:](v5, "setRedactRemoteEndpointFromNetworkMetrics:", self->_redactRemoteEndpointFromNetworkMetrics);
    -[C2RequestOptions setRedactUniformResourceIdentifierFromNetworkMetrics:](v5, "setRedactUniformResourceIdentifierFromNetworkMetrics:", self->_redactUniformResourceIdentifierFromNetworkMetrics);
    -[C2RequestOptions setContainerType:](v5, "setContainerType:", self->_containerType);
    -[C2RequestOptions set_optIntoDisableAPWakeOnIdleConnections:](v5, "set_optIntoDisableAPWakeOnIdleConnections:", self->__optIntoDisableAPWakeOnIdleConnections);
    -[C2RequestOptions setOriginalHost:](v5, "setOriginalHost:", self->_originalHost);
    -[C2RequestOptions setMetricRequest:](v5, "setMetricRequest:", self->_metricRequest);
    -[C2RequestOptions setInvokedURL:](v5, "setInvokedURL:", self->_invokedURL);
    -[C2RequestOptions setTestBehavior_sessionGroupCreated:](v5, "setTestBehavior_sessionGroupCreated:", self->_testBehavior_sessionGroupCreated);
  }
  return v5;
}

void __56__C2RequestOptions_defaultSessionConfigurationWithName___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_4;
  C2_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __49__C2RequestOptions_sessionConfigurationWithName___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_4;
  C2_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __49__C2RequestOptions_sessionConfigurationWithName___block_invoke_125()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_4;
  C2_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

uint64_t __67__C2RequestOptions_handleCallbackForSessionTask_dataTask_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallbackForTask:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (double)taskCallbackConsideredHangInSeconds
{
  return 60.0;
}

- (BOOL)isEqual:(id)a3
{
  C2RequestOptions *v4;
  C2RequestOptions *v5;
  int64_t qualityOfService;
  NSString *outOfProcessPoolName;
  uint64_t v8;
  void *v9;
  NSString *v10;
  void *v11;
  int v12;
  BOOL v13;
  _BOOL4 hasAllowsCellularAccess;
  _BOOL4 allowsCellularAccess;
  _BOOL4 allowsExpensiveAccess;
  _BOOL4 allowsPowerNapScheduling;
  double timeoutIntervalForRequest;
  double v19;
  double timeoutIntervalForResource;
  double v21;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v23;
  NSString *v24;
  void *v25;
  int v26;
  NSString *sourceApplicationSecondaryIdentifier;
  uint64_t v28;
  NSString *v29;
  void *v30;
  int v31;
  NSData *sourceApplicationAuditTokenData;
  uint64_t v33;
  NSData *v34;
  void *v35;
  int v36;
  NSString *appleIDContextSessionIdentifier;
  uint64_t v38;
  NSString *v39;
  void *v40;
  int v41;
  _BOOL4 tlsPinning;
  _BOOL4 allowRouting;
  _BOOL4 allowExpiredDNSBehavior;
  unint64_t discretionaryNetworkBehavior;
  unint64_t duetPreClearedMode;
  _BOOL4 allowsRetryForBackgroundDataTasks;
  NSNumber *privacyProxyFailClosedOverride;
  uint64_t v49;
  NSNumber *v50;
  void *v51;
  int v52;
  NSString *identifier;
  uint64_t v54;
  NSString *v55;
  void *v56;
  int v57;
  C2MetricOptions *metricOptions;
  uint64_t v59;
  C2MetricOptions *v60;
  void *v61;
  _BOOL4 v62;
  _BOOL4 redactRemoteEndpointFromNetworkMetrics;
  _BOOL4 redactUniformResourceIdentifierFromNetworkMetrics;
  int64_t containerType;
  _BOOL4 optIntoDisableAPWakeOnIdleConnections;
  NSString *originalHost;
  uint64_t v68;
  NSString *v69;
  void *v70;
  int v71;
  _BOOL4 metricRequest;
  NSURL *invokedURL;
  uint64_t v74;
  NSURL *v75;
  void *v76;
  char v77;

  v4 = (C2RequestOptions *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      qualityOfService = self->_qualityOfService;
      if (qualityOfService != -[C2RequestOptions qualityOfService](v5, "qualityOfService"))
        goto LABEL_73;
      outOfProcessPoolName = self->_outOfProcessPoolName;
      -[C2RequestOptions outOfProcessPoolName](v5, "outOfProcessPoolName");
      v8 = objc_claimAutoreleasedReturnValue();
      if (outOfProcessPoolName == (NSString *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        v10 = self->_outOfProcessPoolName;
        if (!v10)
          goto LABEL_72;
        -[C2RequestOptions outOfProcessPoolName](v5, "outOfProcessPoolName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqual:](v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_73;
      }
      hasAllowsCellularAccess = self->_hasAllowsCellularAccess;
      if (hasAllowsCellularAccess != -[C2RequestOptions hasAllowsCellularAccess](v5, "hasAllowsCellularAccess"))
        goto LABEL_73;
      allowsCellularAccess = self->_allowsCellularAccess;
      if (allowsCellularAccess != -[C2RequestOptions allowsCellularAccess](v5, "allowsCellularAccess"))
        goto LABEL_73;
      allowsExpensiveAccess = self->__allowsExpensiveAccess;
      if (allowsExpensiveAccess != -[C2RequestOptions _allowsExpensiveAccess](v5, "_allowsExpensiveAccess"))
        goto LABEL_73;
      allowsPowerNapScheduling = self->__allowsPowerNapScheduling;
      if (allowsPowerNapScheduling != -[C2RequestOptions _allowsPowerNapScheduling](v5, "_allowsPowerNapScheduling"))
        goto LABEL_73;
      timeoutIntervalForRequest = self->__timeoutIntervalForRequest;
      -[C2RequestOptions _timeoutIntervalForRequest](v5, "_timeoutIntervalForRequest");
      if (timeoutIntervalForRequest != v19)
        goto LABEL_73;
      timeoutIntervalForResource = self->__timeoutIntervalForResource;
      -[C2RequestOptions _timeoutIntervalForResource](v5, "_timeoutIntervalForResource");
      if (timeoutIntervalForResource != v21)
        goto LABEL_73;
      sourceApplicationBundleIdentifier = self->__sourceApplicationBundleIdentifier;
      -[C2RequestOptions _sourceApplicationBundleIdentifier](v5, "_sourceApplicationBundleIdentifier");
      v23 = objc_claimAutoreleasedReturnValue();
      if (sourceApplicationBundleIdentifier == (NSString *)v23)
      {

      }
      else
      {
        v9 = (void *)v23;
        v24 = self->__sourceApplicationBundleIdentifier;
        if (!v24)
          goto LABEL_72;
        -[C2RequestOptions _sourceApplicationBundleIdentifier](v5, "_sourceApplicationBundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[NSString isEqual:](v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_73;
      }
      sourceApplicationSecondaryIdentifier = self->__sourceApplicationSecondaryIdentifier;
      -[C2RequestOptions _sourceApplicationSecondaryIdentifier](v5, "_sourceApplicationSecondaryIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      if (sourceApplicationSecondaryIdentifier == (NSString *)v28)
      {

      }
      else
      {
        v9 = (void *)v28;
        v29 = self->__sourceApplicationSecondaryIdentifier;
        if (!v29)
          goto LABEL_72;
        -[C2RequestOptions _sourceApplicationSecondaryIdentifier](v5, "_sourceApplicationSecondaryIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[NSString isEqual:](v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_73;
      }
      sourceApplicationAuditTokenData = self->__sourceApplicationAuditTokenData;
      -[C2RequestOptions _sourceApplicationAuditTokenData](v5, "_sourceApplicationAuditTokenData");
      v33 = objc_claimAutoreleasedReturnValue();
      if (sourceApplicationAuditTokenData == (NSData *)v33)
      {

      }
      else
      {
        v9 = (void *)v33;
        v34 = self->__sourceApplicationAuditTokenData;
        if (!v34)
          goto LABEL_72;
        -[C2RequestOptions _sourceApplicationAuditTokenData](v5, "_sourceApplicationAuditTokenData");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[NSData isEqual:](v34, "isEqual:", v35);

        if (!v36)
          goto LABEL_73;
      }
      appleIDContextSessionIdentifier = self->__appleIDContextSessionIdentifier;
      -[C2RequestOptions _appleIDContextSessionIdentifier](v5, "_appleIDContextSessionIdentifier");
      v38 = objc_claimAutoreleasedReturnValue();
      if (appleIDContextSessionIdentifier == (NSString *)v38)
      {

      }
      else
      {
        v9 = (void *)v38;
        v39 = self->__appleIDContextSessionIdentifier;
        if (!v39)
          goto LABEL_72;
        -[C2RequestOptions _appleIDContextSessionIdentifier](v5, "_appleIDContextSessionIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[NSString isEqual:](v39, "isEqual:", v40);

        if (!v41)
          goto LABEL_73;
      }
      tlsPinning = self->_tlsPinning;
      if (tlsPinning != -[C2RequestOptions tlsPinning](v5, "tlsPinning"))
        goto LABEL_73;
      allowRouting = self->_allowRouting;
      if (allowRouting != -[C2RequestOptions allowRouting](v5, "allowRouting"))
        goto LABEL_73;
      allowExpiredDNSBehavior = self->_allowExpiredDNSBehavior;
      if (allowExpiredDNSBehavior != -[C2RequestOptions allowExpiredDNSBehavior](v5, "allowExpiredDNSBehavior"))
        goto LABEL_73;
      discretionaryNetworkBehavior = self->_discretionaryNetworkBehavior;
      if (discretionaryNetworkBehavior != -[C2RequestOptions discretionaryNetworkBehavior](v5, "discretionaryNetworkBehavior"))goto LABEL_73;
      duetPreClearedMode = self->_duetPreClearedMode;
      if (duetPreClearedMode != -[C2RequestOptions duetPreClearedMode](v5, "duetPreClearedMode"))
        goto LABEL_73;
      allowsRetryForBackgroundDataTasks = self->__allowsRetryForBackgroundDataTasks;
      if (allowsRetryForBackgroundDataTasks != -[C2RequestOptions _allowsRetryForBackgroundDataTasks](v5, "_allowsRetryForBackgroundDataTasks"))goto LABEL_73;
      privacyProxyFailClosedOverride = self->_privacyProxyFailClosedOverride;
      -[C2RequestOptions privacyProxyFailClosedOverride](v5, "privacyProxyFailClosedOverride");
      v49 = objc_claimAutoreleasedReturnValue();
      if (privacyProxyFailClosedOverride == (NSNumber *)v49)
      {

      }
      else
      {
        v9 = (void *)v49;
        v50 = self->_privacyProxyFailClosedOverride;
        if (!v50)
          goto LABEL_72;
        -[C2RequestOptions privacyProxyFailClosedOverride](v5, "privacyProxyFailClosedOverride");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[NSNumber isEqual:](v50, "isEqual:", v51);

        if (!v52)
          goto LABEL_73;
      }
      identifier = self->_identifier;
      -[C2RequestOptions identifier](v5, "identifier");
      v54 = objc_claimAutoreleasedReturnValue();
      if (identifier == (NSString *)v54)
      {

      }
      else
      {
        v9 = (void *)v54;
        v55 = self->_identifier;
        if (!v55)
          goto LABEL_72;
        -[C2RequestOptions identifier](v5, "identifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[NSString isEqual:](v55, "isEqual:", v56);

        if (!v57)
          goto LABEL_73;
      }
      metricOptions = self->_metricOptions;
      -[C2RequestOptions metricOptions](v5, "metricOptions");
      v59 = objc_claimAutoreleasedReturnValue();
      if (metricOptions == (C2MetricOptions *)v59)
      {

      }
      else
      {
        v9 = (void *)v59;
        v60 = self->_metricOptions;
        if (!v60)
          goto LABEL_72;
        -[C2RequestOptions metricOptions](v5, "metricOptions");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[C2MetricOptions isEqual:](v60, "isEqual:", v61);

        if (!v62)
          goto LABEL_73;
      }
      redactRemoteEndpointFromNetworkMetrics = self->_redactRemoteEndpointFromNetworkMetrics;
      if (redactRemoteEndpointFromNetworkMetrics != -[C2RequestOptions redactRemoteEndpointFromNetworkMetrics](v5, "redactRemoteEndpointFromNetworkMetrics"))goto LABEL_73;
      redactUniformResourceIdentifierFromNetworkMetrics = self->_redactUniformResourceIdentifierFromNetworkMetrics;
      if (redactUniformResourceIdentifierFromNetworkMetrics != -[C2RequestOptions redactUniformResourceIdentifierFromNetworkMetrics](v5, "redactUniformResourceIdentifierFromNetworkMetrics"))goto LABEL_73;
      containerType = self->_containerType;
      if (containerType != -[C2RequestOptions containerType](v5, "containerType"))
        goto LABEL_73;
      optIntoDisableAPWakeOnIdleConnections = self->__optIntoDisableAPWakeOnIdleConnections;
      if (optIntoDisableAPWakeOnIdleConnections != -[C2RequestOptions _optIntoDisableAPWakeOnIdleConnections](v5, "_optIntoDisableAPWakeOnIdleConnections"))goto LABEL_73;
      originalHost = self->_originalHost;
      -[C2RequestOptions originalHost](v5, "originalHost");
      v68 = objc_claimAutoreleasedReturnValue();
      if (originalHost == (NSString *)v68)
      {

      }
      else
      {
        v9 = (void *)v68;
        v69 = self->_originalHost;
        if (!v69)
          goto LABEL_72;
        -[C2RequestOptions originalHost](v5, "originalHost");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = -[NSString isEqual:](v69, "isEqual:", v70);

        if (!v71)
          goto LABEL_73;
      }
      metricRequest = self->_metricRequest;
      if (metricRequest != -[C2RequestOptions metricRequest](v5, "metricRequest"))
        goto LABEL_73;
      invokedURL = self->_invokedURL;
      -[C2RequestOptions invokedURL](v5, "invokedURL");
      v74 = objc_claimAutoreleasedReturnValue();
      if (invokedURL == (NSURL *)v74)
      {

LABEL_77:
        v13 = 1;
        goto LABEL_74;
      }
      v9 = (void *)v74;
      v75 = self->_invokedURL;
      if (v75)
      {
        -[C2RequestOptions invokedURL](v5, "invokedURL");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = -[NSURL isEqual:](v75, "isEqual:", v76);

        if ((v77 & 1) != 0)
          goto LABEL_77;
LABEL_73:
        v13 = 0;
LABEL_74:

        goto LABEL_75;
      }
LABEL_72:

      goto LABEL_73;
    }
    v13 = 0;
  }
LABEL_75:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_qualityOfService, CFSTR("qualityOfService"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outOfProcessPoolName, CFSTR("outOfProcessPoolName"));
  if (-[C2RequestOptions hasAllowsCellularAccess](self, "hasAllowsCellularAccess"))
    objc_msgSend(v4, "encodeBool:forKey:", self->_allowsCellularAccess, CFSTR("allowsCellularAccess"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__allowsExpensiveAccess, CFSTR("allowsExpensiveAccess"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__allowsPowerNapScheduling, CFSTR("allowsPowerNapScheduling"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeoutIntervalForRequestDouble"), self->__timeoutIntervalForRequest);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeoutIntervalForResourceDouble"), self->__timeoutIntervalForResource);
  objc_msgSend(v4, "encodeObject:forKey:", self->__sourceApplicationBundleIdentifier, CFSTR("sourceApplicationBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__sourceApplicationSecondaryIdentifier, CFSTR("sourceApplicationSecondaryIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__sourceApplicationAuditTokenData, CFSTR("sourceApplicationAuditTokenData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__appleIDContextSessionIdentifier, CFSTR("appleIDContextSessionIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_tlsPinning, CFSTR("tlsPinning"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowRouting, CFSTR("allowRouting"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowExpiredDNSBehavior, CFSTR("allowExpiredDNSBehavior"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_discretionaryNetworkBehavior, CFSTR("discretionaryNetworkBehavior"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_duetPreClearedMode, CFSTR("duetPreClearedMode"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__allowsRetryForBackgroundDataTasks, CFSTR("allowsRetryForBackgroundDataTasks"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_privacyProxyFailClosedOverride, CFSTR("privacyProxyFailClosedOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_useNWLoaderOverride, CFSTR("useNWLoaderOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metricOptions, CFSTR("metricOptions"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_redactRemoteEndpointFromNetworkMetrics, CFSTR("redactRemoteEndpointFromNetworkMetrics"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_redactUniformResourceIdentifierFromNetworkMetrics, CFSTR("redactUniformResourceIdentifierFromNetworkMetrics"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_containerType, CFSTR("containerType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__optIntoDisableAPWakeOnIdleConnections, CFSTR("optIntoDisableAPWakeOnIdleConnections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalHost, CFSTR("originalHost"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_metricRequest, CFSTR("metricRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_invokedURL, CFSTR("invokedURL"));

}

- (C2RequestOptions)initWithCoder:(id)a3
{
  id v4;
  C2RequestOptions *v5;
  uint64_t v6;
  NSString *outOfProcessPoolName;
  double v8;
  double v9;
  uint64_t v10;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v12;
  NSString *sourceApplicationSecondaryIdentifier;
  uint64_t v14;
  NSData *sourceApplicationAuditTokenData;
  uint64_t v16;
  NSString *appleIDContextSessionIdentifier;
  uint64_t v18;
  NSNumber *privacyProxyFailClosedOverride;
  uint64_t v20;
  NSNumber *useNWLoaderOverride;
  void *v22;
  void *v23;
  NSString *v24;
  void *identifier;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  C2MetricOptions *metricOptions;
  uint64_t v30;
  int v31;
  uint64_t v32;
  NSString *originalHost;
  uint64_t v34;
  NSURL *invokedURL;
  id testBehavior_sessionGroupCreated;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)C2RequestOptions;
  v5 = -[C2RequestOptions init](&v38, sel_init);
  if (v5)
  {
    v5->_qualityOfService = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("qualityOfService"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outOfProcessPoolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    outOfProcessPoolName = v5->_outOfProcessPoolName;
    v5->_outOfProcessPoolName = (NSString *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsCellularAccess")))
      -[C2RequestOptions setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsCellularAccess")));
    v5->__allowsExpensiveAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsExpensiveAccess"));
    v5->__allowsPowerNapScheduling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsPowerNapScheduling"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeoutIntervalForRequestDouble"));
    v5->__timeoutIntervalForRequest = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeoutIntervalForResourceDouble"));
    v5->__timeoutIntervalForResource = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    sourceApplicationBundleIdentifier = v5->__sourceApplicationBundleIdentifier;
    v5->__sourceApplicationBundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationSecondaryIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    sourceApplicationSecondaryIdentifier = v5->__sourceApplicationSecondaryIdentifier;
    v5->__sourceApplicationSecondaryIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationAuditTokenData"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceApplicationAuditTokenData = v5->__sourceApplicationAuditTokenData;
    v5->__sourceApplicationAuditTokenData = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleIDContextSessionIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    appleIDContextSessionIdentifier = v5->__appleIDContextSessionIdentifier;
    v5->__appleIDContextSessionIdentifier = (NSString *)v16;

    v5->_tlsPinning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tlsPinning"));
    v5->_allowRouting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowRouting"));
    v5->_allowExpiredDNSBehavior = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowExpiredDNSBehavior"));
    v5->_discretionaryNetworkBehavior = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("discretionaryNetworkBehavior"));
    v5->_duetPreClearedMode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("duetPreClearedMode"));
    v5->__allowsRetryForBackgroundDataTasks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsRetryForBackgroundDataTasks"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyProxyFailClosedOverride"));
    v18 = objc_claimAutoreleasedReturnValue();
    privacyProxyFailClosedOverride = v5->_privacyProxyFailClosedOverride;
    v5->_privacyProxyFailClosedOverride = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useNWLoaderOverride"));
    v20 = objc_claimAutoreleasedReturnValue();
    useNWLoaderOverride = v5->_useNWLoaderOverride;
    v5->_useNWLoaderOverride = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
      identifier = v5->_identifier;
      v5->_identifier = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v5->_identifier;
      v5->_identifier = (NSString *)v26;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metricOptions"));
    v28 = objc_claimAutoreleasedReturnValue();
    metricOptions = v5->_metricOptions;
    v5->_metricOptions = (C2MetricOptions *)v28;

    v5->_redactRemoteEndpointFromNetworkMetrics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("redactRemoteEndpointFromNetworkMetrics"));
    v5->_redactUniformResourceIdentifierFromNetworkMetrics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("redactUniformResourceIdentifierFromNetworkMetrics"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("containerType")))
      v30 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("containerType"));
    else
      v30 = 0;
    v5->_containerType = v30;
    v31 = objc_msgSend(v4, "containsValueForKey:", CFSTR("optIntoDisableAPWakeOnIdleConnections"));
    if (v31)
      LOBYTE(v31) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("optIntoDisableAPWakeOnIdleConnections"));
    v5->__optIntoDisableAPWakeOnIdleConnections = v31;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalHost"));
    v32 = objc_claimAutoreleasedReturnValue();
    originalHost = v5->_originalHost;
    v5->_originalHost = (NSString *)v32;

    v5->_metricRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("metricRequest"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invokedURL"));
    v34 = objc_claimAutoreleasedReturnValue();
    invokedURL = v5->_invokedURL;
    v5->_invokedURL = (NSURL *)v34;

    testBehavior_sessionGroupCreated = v5->_testBehavior_sessionGroupCreated;
    v5->_testBehavior_sessionGroupCreated = 0;

  }
  return v5;
}

- (NSData)_sourceApplicationAuditTokenData
{
  return self->__sourceApplicationAuditTokenData;
}

- (void)set_sourceApplicationAuditTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)useNWLoaderOverride
{
  return self->_useNWLoaderOverride;
}

- (void)setUseNWLoaderOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setRedactRemoteEndpointFromNetworkMetrics:(BOOL)a3
{
  self->_redactRemoteEndpointFromNetworkMetrics = a3;
}

- (void)setRedactUniformResourceIdentifierFromNetworkMetrics:(BOOL)a3
{
  self->_redactUniformResourceIdentifierFromNetworkMetrics = a3;
}

- (void)setContainerType:(int64_t)a3
{
  self->_containerType = a3;
}

- (BOOL)_optIntoDisableAPWakeOnIdleConnections
{
  return self->__optIntoDisableAPWakeOnIdleConnections;
}

- (void)set_optIntoDisableAPWakeOnIdleConnections:(BOOL)a3
{
  self->__optIntoDisableAPWakeOnIdleConnections = a3;
}

- (BOOL)useAdaptiveTimeouts
{
  return self->_useAdaptiveTimeouts;
}

- (void)setUseAdaptiveTimeouts:(BOOL)a3
{
  self->_useAdaptiveTimeouts = a3;
}

- (BOOL)outOfProcessDiscretionary
{
  return self->_outOfProcessDiscretionary;
}

- (void)setOutOfProcessDiscretionary:(BOOL)a3
{
  self->_outOfProcessDiscretionary = a3;
}

- (NSURL)c2MetricsEndpoint
{
  return self->_c2MetricsEndpoint;
}

- (void)setC2MetricsEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)c2MetricsReportFrequency
{
  return self->_c2MetricsReportFrequency;
}

- (void)setC2MetricsReportFrequency:(unint64_t)a3
{
  self->_c2MetricsReportFrequency = a3;
}

- (unint64_t)c2MetricsReportFrequencyBase
{
  return self->_c2MetricsReportFrequencyBase;
}

- (void)setC2MetricsReportFrequencyBase:(unint64_t)a3
{
  self->_c2MetricsReportFrequencyBase = a3;
}

- (void)setHasAllowsCellularAccess:(BOOL)a3
{
  self->_hasAllowsCellularAccess = a3;
}

- (NSString)originalHost
{
  return self->_originalHost;
}

- (void)setTestBehavior_sessionGroupCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSURL)invokedURL
{
  return self->_invokedURL;
}

- (void)setNetworkingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkingDelegate, a3);
}

@end
