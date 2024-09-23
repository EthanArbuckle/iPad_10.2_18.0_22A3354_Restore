@implementation HMDDiagnosticReporterLogObserver

- (BOOL)shouldSubmitEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  v13 = 1;
  if (v6)
  {
    v8 = objc_msgSend(v6, "currentMemoryUsage");
    if (v8 < -[HMDDiagnosticReporterLogObserver memoryExceptionThreshold](self, "memoryExceptionThreshold")
      || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "doubleForKey:", CFSTR("HMDDiagnosticReporterMemoryEventReportTime")),
          v11 = v10,
          v9,
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
          v12 - v11 < 86400.0))
    {
      v13 = 0;
    }
  }

  return v13;
}

- (HMDDiagnosticReporterLogObserver)initWithLogEventDispatcher:(id)a3
{
  id v4;
  HMDDiagnosticReporterLogObserver *v5;
  HMDDiagnosticReporterLogObserver *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *clientQueue;
  uint64_t v15;
  SDRDiagnosticReporter *reporter;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDDiagnosticReporterLogObserver;
  v5 = -[HMDDiagnosticReporterLogObserver init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_logEventDispatcher, v4);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceForKey:", CFSTR("memoryTriggerSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_memoryExceptionThreshold = objc_msgSend(v9, "unsignedIntegerValue");

    HMDispatchQueueNameString();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAFF28]), "initWithQueue:", v6->_clientQueue);
    reporter = v6->_reporter;
    v6->_reporter = (SDRDiagnosticReporter *)v15;

  }
  return v6;
}

- (void)start
{
  void *v3;
  HMDDiagnosticReporterLogObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDDiagnosticReporterLogObserver logEventDispatcher](v4, "logEventDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedEventClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forEventClasses:", v4, v8);

}

- (void)stop
{
  void *v3;
  HMDDiagnosticReporterLogObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDDiagnosticReporterLogObserver logEventDispatcher](v4, "logEventDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v4);

}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isSupportedEvent:", v4))
  {
    -[HMDDiagnosticReporterLogObserver clientQueue](self, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke;
    v6[3] = &unk_1E89C2328;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (HMMLogEventDispatching)logEventDispatcher
{
  return (HMMLogEventDispatching *)objc_loadWeakRetained((id *)&self->_logEventDispatcher);
}

- (unint64_t)memoryExceptionThreshold
{
  return self->_memoryExceptionThreshold;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (SDRDiagnosticReporter)reporter
{
  return (SDRDiagnosticReporter *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
}

void __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id location;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldSubmitEvent:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x1E0D28688], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "reporter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "domainForEvent:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "typeForEvent:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "subTypeForEvent:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", v4, v5, v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DB00E0]);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("projectver"));
    if (objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1EFA98808))
    {
      v12 = *(id *)(a1 + 40);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      objc_msgSend(v14, "updateDiagnosticReportSignature:", v8);
    }
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v39 = v18;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Submitting event: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v23;
      v40 = 2112;
      v41 = v8;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Submitting signature: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "reporter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke_61;
    v35[3] = &unk_1E89C1FC0;
    objc_copyWeak(&v36, &location);
    v25 = objc_msgSend(v24, "snapshotWithSignature:duration:event:payload:reply:", v8, 0, 0, v35, 15.0);

    if ((v25 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x1D17BA0A0](v26, v27, v28, v29);
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v39 = v33;
        v40 = 2112;
        v41 = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to submit event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
    }
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
}

void __66__HMDDiagnosticReporterLogObserver_didReceiveEventFromDispatcher___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitted event with response: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken_183017 != -1)
    dispatch_once(&supportedEventClasses_onceToken_183017, &__block_literal_global_183018);
  return (id)supportedEventClasses_supportedEventClasses_183019;
}

+ (BOOL)isSupportedEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "supportedEventClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (id)domainForEvent:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    return CFSTR("Performance");
  else
    return CFSTR("HomeKit");
}

+ (id)typeForEvent:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  id *v6;

  v3 = a3;
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EFA98808)
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "diagnosticReportEventType"), (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v6 = (id *)MEMORY[0x1E0DB0120];
    }
    else
    {
      if (v5 == objc_opt_class())
      {
        v4 = CFSTR("MemoryResourceException");
        goto LABEL_10;
      }
      v6 = (id *)MEMORY[0x1E0DB0110];
    }
    v4 = (__CFString *)*v6;
  }
LABEL_10:

  return v4;
}

+ (id)subTypeForEvent:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;

  v3 = a3;
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EFA98808)
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "diagnosticReportEventSubType"), (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v4 = CFSTR("Assertion");
    }
    else if (v5 == objc_opt_class())
    {
      v4 = CFSTR("Messaging");
    }
    else if (v5 == objc_opt_class())
    {
      MREExceptionTypeToString();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("Unknown");
    }
  }

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_182998 != -1)
    dispatch_once(&logCategory__hmf_once_t10_182998, &__block_literal_global_63_182999);
  return (id)logCategory__hmf_once_v11_183000;
}

void __47__HMDDiagnosticReporterLogObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_183000;
  logCategory__hmf_once_v11_183000 = v0;

}

void __57__HMDDiagnosticReporterLogObserver_supportedEventClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedEventClasses_supportedEventClasses_183019;
  supportedEventClasses_supportedEventClasses_183019 = v0;

}

@end
