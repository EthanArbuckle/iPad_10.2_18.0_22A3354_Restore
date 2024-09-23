@implementation HMDAccessoryMetric

- (HMDAccessoryMetric)initWithAccessory:(id)a3
{
  id v4;
  HMDAccessoryMetric *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  HMDAccessorySessionMetric *v8;
  HMDAccessorySessionMetric *sessionMetric;
  HMDAccessoryDiagnosticsMetric *v10;
  HMDAccessoryDiagnosticsMetric *diagnosticsMetric;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  uint64_t v17;
  HMFTimer *accessoryMetricTimer;
  void *v19;
  NSObject *v20;
  void *v21;
  double timerInterval;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessoryMetric;
  v5 = -[HMDAccessoryMetric init](&v24, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("Session Metrics", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_accessory, v4);
    v8 = -[HMDAccessorySessionMetric initWithAccessory:workQueue:]([HMDAccessorySessionMetric alloc], "initWithAccessory:workQueue:", v4, v5->_workQueue);
    sessionMetric = v5->_sessionMetric;
    v5->_sessionMetric = v8;

    v10 = -[HMDAccessoryDiagnosticsMetric initWithAccessory:]([HMDAccessoryDiagnosticsMetric alloc], "initWithAccessory:", v4);
    diagnosticsMetric = v5->_diagnosticsMetric;
    v5->_diagnosticsMetric = v10;

    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceForKey:", CFSTR("HMDAccessorySessionMetricSubmissionInterval"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "floatValue");
      v16 = v15;
    }
    else
    {
      v16 = 14400.0;
    }
    v5->_timerInterval = (float)(v16 + (float)(HMFRandomUInt32() % (int)(v16 * 0.1)));
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 4, v5->_timerInterval);
    accessoryMetricTimer = v5->_accessoryMetricTimer;
    v5->_accessoryMetricTimer = (HMFTimer *)v17;

    -[HMFTimer setDelegateQueue:](v5->_accessoryMetricTimer, "setDelegateQueue:", v5->_workQueue);
    -[HMFTimer setDelegate:](v5->_accessoryMetricTimer, "setDelegate:", v5);
    -[HMFTimer resume](v5->_accessoryMetricTimer, "resume");
    v19 = (void *)MEMORY[0x227676638](-[HMDAccessoryMetric _initDiagnosticCounters](v5, "_initDiagnosticCounters"));
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      timerInterval = v5->_timerInterval;
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2048;
      v28 = timerInterval;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[AccessoryMetric] Initialized session metric for accessory with submission interval: %f", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);

  }
  return v5;
}

- (void)_initDiagnosticCounters
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *deltaCounters;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[16] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE4EFD8];
  v19[0] = *MEMORY[0x24BE4EFD0];
  v19[1] = v3;
  v4 = *MEMORY[0x24BE4F038];
  v19[2] = *MEMORY[0x24BE4F030];
  v19[3] = v4;
  v5 = *MEMORY[0x24BE4F050];
  v19[4] = *MEMORY[0x24BE4F048];
  v19[5] = v5;
  v6 = *MEMORY[0x24BE4F060];
  v19[6] = *MEMORY[0x24BE4F058];
  v19[7] = v6;
  v7 = *MEMORY[0x24BE4F000];
  v19[8] = *MEMORY[0x24BE4F068];
  v19[9] = v7;
  v8 = *MEMORY[0x24BE4EFF8];
  v19[10] = *MEMORY[0x24BE4EFF0];
  v19[11] = v8;
  v9 = *MEMORY[0x24BE4F010];
  v19[12] = *MEMORY[0x24BE4F008];
  v19[13] = v9;
  v10 = *MEMORY[0x24BE4F020];
  v19[14] = *MEMORY[0x24BE4F018];
  v19[15] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 16);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  deltaCounters = self->_deltaCounters;
  self->_deltaCounters = v11;

  -[HMDAccessoryMetric previousDiagnosticMetrics](self, "previousDiagnosticMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    -[HMDAccessoryMetric diagnosticsMetric](self, "diagnosticsMetric");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "metric");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryMetric setPreviousDiagnosticMetrics:](self, "setPreviousDiagnosticMetrics:", v16);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryMetric diagnosticsMetric](self, "diagnosticsMetric");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMetricCollectionStartTime:", v17);

  }
}

- (void)submitMetricAndStop
{
  void *v3;
  id v4;

  -[HMDAccessoryMetric sessionMetric](self, "sessionMetric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitMetric");

  -[HMDAccessoryMetric accessoryMetricTimer](self, "accessoryMetricTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryMetric *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDAccessoryMetric *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryMetric accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryMetric accessoryMetricTimer](self, "accessoryMetricTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDAccessoryMetric sessionMetric](self, "sessionMetric");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitMetric");

    -[HMDAccessoryMetric sessionMetric](self, "sessionMetric");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetSessionMetric");

    if (!v5)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory disappeared, stopping accessory metric timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDAccessoryMetric accessoryMetricTimer](v10, "accessoryMetricTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suspend");

      -[HMDAccessoryMetric setAccessoryMetricTimer:](v10, "setAccessoryMetricTimer:", 0);
    }
    -[HMDAccessoryMetric diagnosticsMetric](self, "diagnosticsMetric");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectMetric");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryMetric previousDiagnosticMetrics](self, "previousDiagnosticMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    if (v16 && v15)
    {
      v41 = v5;
      v42 = v4;
      v17 = (void *)objc_msgSend(v15, "mutableCopy");
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[HMDAccessoryMetric deltaCounters](self, "deltaCounters");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v18)
      {
        v19 = v18;
        v44 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            v21 = v17;
            if (*(_QWORD *)v46 != v44)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v15, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAccessoryMetric previousDiagnosticMetrics](self, "previousDiagnosticMetrics");
            v24 = self;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = (void *)MEMORY[0x24BDD16E0];
            v28 = objc_msgSend(v23, "intValue");
            v29 = v28 - objc_msgSend(v26, "intValue");
            v30 = v27;
            self = v24;
            objc_msgSend(v30, "numberWithInt:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v21;
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, v22);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v19);
      }

      v5 = v41;
      v4 = v42;
    }
    -[HMDAccessoryMetric setPreviousDiagnosticMetrics:](self, "setPreviousDiagnosticMetrics:", v15);
    if (objc_msgSend(v17, "count"))
    {
      v32 = (void *)MEMORY[0x24BDD16E0];
      -[HMDAccessoryMetric diagnosticsMetric](self, "diagnosticsMetric");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "metricCollectionStartTime");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceNow");
      LODWORD(v36) = llround(fabs(v35));
      objc_msgSend(v32, "numberWithInt:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v37, CFSTR("HMMTRAccessoryDiagnosticLogEventDurationInSeconds"));

      -[HMDAccessoryMetric diagnosticsMetric](self, "diagnosticsMetric");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "submitMetric:", v17);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryMetric diagnosticsMetric](self, "diagnosticsMetric");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setMetricCollectionStartTime:", v39);

    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDAccessorySessionMetric)sessionMetric
{
  return self->_sessionMetric;
}

- (HMDAccessoryDiagnosticsMetric)diagnosticsMetric
{
  return self->_diagnosticsMetric;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMFTimer)accessoryMetricTimer
{
  return self->_accessoryMetricTimer;
}

- (void)setAccessoryMetricTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryMetricTimer, a3);
}

- (double)timerInterval
{
  return self->_timerInterval;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSArray)deltaCounters
{
  return self->_deltaCounters;
}

- (NSDictionary)previousDiagnosticMetrics
{
  return self->_previousDiagnosticMetrics;
}

- (void)setPreviousDiagnosticMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_previousDiagnosticMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDiagnosticMetrics, 0);
  objc_storeStrong((id *)&self->_deltaCounters, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessoryMetricTimer, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_diagnosticsMetric, 0);
  objc_storeStrong((id *)&self->_sessionMetric, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_92084 != -1)
    dispatch_once(&logCategory__hmf_once_t4_92084, &__block_literal_global_123);
  return (id)logCategory__hmf_once_v5_92085;
}

void __33__HMDAccessoryMetric_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_92085;
  logCategory__hmf_once_v5_92085 = v0;

}

@end
