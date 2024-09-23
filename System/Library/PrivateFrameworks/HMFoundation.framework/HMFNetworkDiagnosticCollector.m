@implementation HMFNetworkDiagnosticCollector

- (HMFNetworkDiagnosticCollector)initWithQueue:(id)a3 discoveryTimeout:(double)a4 resolveTimeout:(double)a5 diagnosticTimeout:(double)a6 serviceTypes:(id)a7
{
  id v13;
  id v14;
  HMFNetworkDiagnosticCollector *v15;
  HMFNetworkDiagnosticCollector *v16;
  HMFNetworkBrowser *v17;
  HMFNetworkBrowser *browser;
  objc_super v20;

  v13 = a3;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMFNetworkDiagnosticCollector;
  v15 = -[HMFNetworkDiagnosticCollector init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_serviceTypes, a7);
    v17 = -[HMFNetworkBrowser initWithQueue:domain:serviceTypes:]([HMFNetworkBrowser alloc], "initWithQueue:domain:serviceTypes:", v13, CFSTR("local"), v14);
    browser = v16->_browser;
    v16->_browser = v17;

    -[HMFNetworkBrowser setDelegate:](v16->_browser, "setDelegate:", v16);
    v16->_discoveryTimeout = a4;
    v16->_diagnosticTimeout = a6;
    v16->_resolveTimeout = a5;
  }

  return v16;
}

- (HMFNetworkDiagnosticCollector)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  HMFNetworkDiagnosticCollector *v6;

  v4 = a3;
  +[HMFNetworkServiceInfo defaultServiceTypes](HMFNetworkServiceInfo, "defaultServiceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFNetworkDiagnosticCollector initWithQueue:discoveryTimeout:resolveTimeout:diagnosticTimeout:serviceTypes:](self, "initWithQueue:discoveryTimeout:resolveTimeout:diagnosticTimeout:serviceTypes:", v4, v5, 5.0, 10.0, 30.0);

  return v6;
}

- (id)networkDiagnostics
{
  if (_MergedGlobals_3_8 != -1)
    dispatch_once(&_MergedGlobals_3_8, &__block_literal_global_26);
  return (id)qword_1ED012F18;
}

void __51__HMFNetworkDiagnosticCollector_networkDiagnostics__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012F18;
  qword_1ED012F18 = v0;

}

- (id)workContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMFNetworkDiagnosticCollector_workContext__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  if (qword_1ED012F20 != -1)
    dispatch_once(&qword_1ED012F20, block);
  return (id)qword_1ED012F28;
}

void __44__HMFNetworkDiagnosticCollector_workContext__block_invoke(uint64_t a1)
{
  HMFDispatchContext *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [HMFDispatchContext alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HMFDispatchContext initWithQueue:](v2, "initWithQueue:", v5);
  v4 = (void *)qword_1ED012F28;
  qword_1ED012F28 = v3;

}

- (id)run
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMFNetworkDiagnosticCollector workContext](self, "workContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke;
  v6[3] = &unk_1E3B38910;
  v6[4] = self;
  +[HMFFuture inContext:perform:](HMFFuture, "inContext:perform:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "discoveryTimeout");
  objc_msgSend(v2, "discoverDevicesWithTimeout:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke_2;
  v13[3] = &unk_1E3B38408;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "then:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke_3;
  v12[3] = &unk_1E3B38910;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "finally:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __36__HMFNetworkDiagnosticCollector_run__block_invoke_4;
  v11[3] = &unk_1E3B38910;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "finally:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v8)
    _HMFPreconditionFailure(CFSTR("future"));
  v9 = v8;

  return 3;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "resolveTimeout");
  objc_msgSend(v4, "resolveDevicesWithAddressType:timeout:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    _HMFPreconditionFailure(CFSTR("future"));
  v6 = v5;

  return 3;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "diagnosticTimeout");
  objc_msgSend(v1, "startDiagnosticsWithTimeout:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    _HMFPreconditionFailure(CFSTR("future"));
  v3 = v2;

  return 3;
}

uint64_t __36__HMFNetworkDiagnosticCollector_run__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stop");
  return 1;
}

- (void)stop
{
  void *v3;
  id v4;

  -[HMFNetworkDiagnosticCollector currentDiagnostics](self, "currentDiagnostics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_each:", &__block_literal_global_10);

  -[HMFNetworkDiagnosticCollector devices](self, "devices");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_each:", &__block_literal_global_12);

}

uint64_t __37__HMFNetworkDiagnosticCollector_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

uint64_t __37__HMFNetworkDiagnosticCollector_stop__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (id)devices
{
  void *v2;
  void *v3;

  -[HMFNetworkDiagnosticCollector browser](self, "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "foundNetworkServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeDevices
{
  void *v2;
  void *v3;

  -[HMFNetworkDiagnosticCollector devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __46__HMFNetworkDiagnosticCollector_activeDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowPowerMode") ^ 1;
}

- (id)discoverDevicesWithTimeout:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  HMFNetworkDiagnosticCollector *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMFNetworkDiagnosticCollector serviceTypes](self, "serviceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)MEMORY[0x1A1AC355C]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@=> Run browse with %@ services and timeout: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMFNetworkDiagnosticCollector browser](v8, "browser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startBrowsingWithTimeout:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier(v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Nothing to do, no service types provided", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)resolveDevicesWithAddressType:(unint64_t)a3 timeout:(double)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  HMFNetworkDiagnosticCollector *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  unint64_t v24;
  double v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HMFNetworkDiagnosticCollector activeDevices](self, "activeDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)MEMORY[0x1A1AC355C]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_INFO, "%{public}@=> Run resolve with %@ devices and timeout: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__HMFNetworkDiagnosticCollector_resolveDevicesWithAddressType_timeout___block_invoke;
    v22[3] = &unk_1E3B389F8;
    v23 = v16;
    v24 = a3;
    v25 = a4;
    v17 = v16;
    objc_msgSend(v7, "na_each:", v22);
    +[HMFFuture allSettled:](HMFFuture, "allSettled:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ignoreResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_ERROR, "%{public}@No devices to resolve", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

void __71__HMFNetworkDiagnosticCollector_resolveDevicesWithAddressType_timeout___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "resolveAddressWithAddressType:timeout:receivedDataHandler:", *(_QWORD *)(a1 + 40), 0, *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)startDiagnosticsWithTimeout:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  HMFNetworkDiagnosticCollector *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *currentDiagnostics;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  HMFNetworkDiagnosticCollector *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMFNetworkDiagnosticCollector activeDevices](self, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)MEMORY[0x1A1AC355C]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v11;
      v30 = 2114;
      v31 = v12;
      v32 = 2114;
      v33 = v13;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@=> Run diagnostics with %{public}@ devices and timeout: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMFNetworkDiagnosticCollector networkDiagnostics](v8, "networkDiagnostics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke;
    v25 = &unk_1E3B38A48;
    v26 = v5;
    v27 = v8;
    objc_msgSend(v14, "na_flatMap:", &v22);
    v15 = objc_claimAutoreleasedReturnValue();
    currentDiagnostics = v8->_currentDiagnostics;
    v8->_currentDiagnostics = (NSArray *)v15;

    -[HMFNetworkDiagnosticCollector currentDiagnostics](v8, "currentDiagnostics", v22, v23, v24, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFNetworkDiagnostic runDiagnostics:timeout:](HMFNetworkDiagnostic, "runDiagnostics:timeout:", v17, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v26;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_ERROR, "%{public}@No devices to run diagnostics", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFFuture futureWithError:](HMFFuture, "futureWithError:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke_2;
  v4[3] = &unk_1E3B38A20;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = a2;
  objc_msgSend(v2, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __61__HMFNetworkDiagnosticCollector_startDiagnosticsWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(objc_class **)(a1 + 40);
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDevice:delegate:queue:", v4, v6, v7);

  return v8;
}

- (id)diagnosticReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(CFSTR("Service Type\t\tDevice ID\t\tCategory\tS#\tC#\tSF\tPing\t\t\t\t Model / Name / Address / Port\t\n"), "mutableCopy");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("device.serviceInfo.serviceType.length"), 1);
  -[HMFNetworkDiagnosticCollector currentDiagnostics](self, "currentDiagnostics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceType");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __49__HMFNetworkDiagnosticCollector_diagnosticReport__block_invoke;
  v17 = &unk_1E3B38A70;
  v19 = v20;
  v11 = v3;
  v18 = v11;
  objc_msgSend(v7, "na_each:", &v14);
  v12 = (void *)objc_msgSend(v11, "copy", v14, v15, v16, v17);

  _Block_object_dispose(v20, 8);
  return v12;
}

void __49__HMFNetworkDiagnosticCollector_diagnosticReport__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v14, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceType");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n"));
  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v14, "dumpReport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v13);

}

- (void)diagnostic:(id)a3 didStartWithDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMFNetworkDiagnosticCollector *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "addresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC355C]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = v10;
    HMFGetLogIdentifier(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "count");
    if (v16)
    {
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    *(_DWORD *)buf = 138544130;
    v21 = v19;
    v22 = 2114;
    v23 = v13;
    v24 = 2112;
    v25 = v15;
    v26 = 2114;
    v27 = v17;
    _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_INFO, "%{public}@Started %{public}@ with device: %@ and addresses: %{public}@", buf, 0x2Au);
    if (v16)

    v10 = v18;
  }

  objc_autoreleasePoolPop(v10);
}

uint64_t __63__HMFNetworkDiagnosticCollector_diagnostic_didStartWithDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addressString");
}

- (void)diagnostic:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetworkDiagnosticCollector *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v12 = CFSTR("❌");
    else
      v12 = CFSTR("✅");
    objc_msgSend(v6, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544386;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 2112;
    v23 = v15;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@%@ Completed %{public}@ for device: %@ with error: %{public}@", (uint8_t *)&v16, 0x34u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)browser:(id)a3 didStartBrowsingForServiceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetworkDiagnosticCollector *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Browser started browsing for service type: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)browser:(id)a3 didStopBrowsingForServiceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetworkDiagnosticCollector *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Browser stopped browsing for service type: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)browser:(id)a3 didFindNetworkService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetworkDiagnosticCollector *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Browser did find network service: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)browser:(id)a3 didLoseNetworkService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetworkDiagnosticCollector *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Browser did lose network service: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)browser:(id)a3 didUpdateNetworkService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFNetworkDiagnosticCollector *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Browser did update network service: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

+ (id)logCategory
{
  if (qword_1ED012F30 != -1)
    dispatch_once(&qword_1ED012F30, &__block_literal_global_36);
  return (id)qword_1ED012F38;
}

void __44__HMFNetworkDiagnosticCollector_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFNetworkDiagnostic"), CFSTR("com.apple.HomeKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012F38;
  qword_1ED012F38 = v0;

}

- (HMFNetworkBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (NSArray)currentDiagnostics
{
  return self->_currentDiagnostics;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTypes, a3);
}

- (NSMutableDictionary)devicesMap
{
  return self->_devicesMap;
}

- (void)setDevicesMap:(id)a3
{
  objc_storeStrong((id *)&self->_devicesMap, a3);
}

- (double)discoveryTimeout
{
  return self->_discoveryTimeout;
}

- (void)setDiscoveryTimeout:(double)a3
{
  self->_discoveryTimeout = a3;
}

- (double)resolveTimeout
{
  return self->_resolveTimeout;
}

- (void)setResolveTimeout:(double)a3
{
  self->_resolveTimeout = a3;
}

- (double)diagnosticTimeout
{
  return self->_diagnosticTimeout;
}

- (void)setDiagnosticTimeout:(double)a3
{
  self->_diagnosticTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesMap, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentDiagnostics, 0);
  objc_storeStrong((id *)&self->_browser, 0);
}

@end
