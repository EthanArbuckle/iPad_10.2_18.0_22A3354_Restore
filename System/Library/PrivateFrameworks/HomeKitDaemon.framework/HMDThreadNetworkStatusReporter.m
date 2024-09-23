@implementation HMDThreadNetworkStatusReporter

- (HMDThreadNetworkStatusReporter)initWithHome:(id)a3
{
  id v4;
  HMDThreadNetworkStatusReporter *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  HMDThreadRadioClient *threadRadioClient;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDThreadNetworkStatusReporter;
  v5 = -[HMDThreadNetworkStatusReporter init](&v14, sel_init);
  if (v5)
  {
    v6 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2(v6, v7, v8);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v5->_home, v4);
    v5->_threadNetworkPeriodicCheckFrequencyInMins = 0;
    v11 = objc_opt_new();
    threadRadioClient = v5->_threadRadioClient;
    v5->_threadRadioClient = (HMDThreadRadioClient *)v11;

  }
  return v5;
}

- (void)run
{
  NSObject *v3;
  _QWORD block[5];

  if (!-[HMDThreadNetworkStatusReporter threadNetworkPeriodicCheckFrequencyInMins](self, "threadNetworkPeriodicCheckFrequencyInMins"))
  {
    -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__HMDThreadNetworkStatusReporter_run__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)_scheduleThreadNetworkStatusPeriodicUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDThreadNetworkStatusReporter *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[HMDThreadNetworkStatusReporter threadNetworkPeriodicCheckFrequencyInMins](self, "threadNetworkPeriodicCheckFrequencyInMins"))
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceForKey:", CFSTR("ThreadNetworkHealthReportingPeriodInMinutes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)objc_msgSend(v6, "intValue") < 1)
      v7 = 240;
    else
      v7 = objc_msgSend(v6, "unsignedIntValue");
    v8 = (void *)MEMORY[0x227676638](-[HMDThreadNetworkStatusReporter setThreadNetworkPeriodicCheckFrequencyInMins:](self, "setThreadNetworkPeriodicCheckFrequencyInMins:", v7));
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2048;
      v15 = -[HMDThreadNetworkStatusReporter threadNetworkPeriodicCheckFrequencyInMins](v9, "threadNetworkPeriodicCheckFrequencyInMins");
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling start of periodic Thread network health reporting (for every %lu minutes)", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDThreadNetworkStatusReporter _runThreadNetworkStatusPeriodicUpdate](v9, "_runThreadNetworkStatusPeriodicUpdate");

  }
}

- (void)_runThreadNetworkStatusPeriodicUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDThreadNetworkStatusReporter *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HMDThreadNetworkMetadataStore defaultStore](HMDThreadNetworkMetadataStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDThreadNetworkStatusReporter home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "threadOperationalDataset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_initWeak((id *)buf, self);
    v12 = objc_msgSend(v6, "doesHomeContainResident");
    v13 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke;
    v23[3] = &unk_24E77B2F0;
    objc_copyWeak(&v25, (id *)buf);
    v14 = v6;
    v24 = v14;
    objc_msgSend(v4, "retrieveMetadata:homeHasResident:completion:", v7, v12, v23);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_2;
    v20[3] = &unk_24E77B318;
    objc_copyWeak(&v22, (id *)buf);
    v15 = v14;
    v21 = v15;
    -[HMDThreadNetworkStatusReporter _checkIfThreadNetworkIsRunningWithCompletion:](self, "_checkIfThreadNetworkIsRunningWithCompletion:", v20);
    -[HMDThreadNetworkStatusReporter _runThreadNetworkStateCapture](self, "_runThreadNetworkStateCapture");
    v16 = dispatch_time(0, 60000000000* -[HMDThreadNetworkStatusReporter threadNetworkPeriodicCheckFrequencyInMins](self, "threadNetworkPeriodicCheckFrequencyInMins"));
    -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_3;
    block[3] = &unk_24E797318;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_after(v16, v17, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No thread network metadata store", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)threadNetworkStateChange:(id)a3
{
  id v4;
  void *v5;
  HMDThreadNetworkStatusReporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDThreadNetworkStatusReporter *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    v24 = 2048;
    v25 = objc_msgSend(v4, "eventType");
    v26 = 2048;
    v27 = objc_msgSend(v4, "eventValue");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@threadNetworkStateChange - received event %@, type %ld, value %ld", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDThreadNetworkStatusReporter home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v4, "eventType");
      v16 = objc_msgSend(v4, "eventValue");
      v20 = 138544130;
      v21 = v14;
      v22 = 2112;
      v23 = v4;
      v24 = 2048;
      v25 = v15;
      v26 = 2048;
      v27 = v16;
      v17 = "%{public}@No linked home, dropping threadNetworkStateChange event %@, type %ld, value %ld";
      v18 = v13;
      v19 = 42;
LABEL_12:
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, v19);

    }
LABEL_13:

    objc_autoreleasePoolPop(v11);
    goto LABEL_14;
  }
  v10 = objc_msgSend(v4, "eventType");
  if (v10 == 1)
  {
    objc_msgSend(v9, "onThreadNetworkNodeTypeStateChange:", objc_msgSend(v4, "eventValue"));
    goto LABEL_14;
  }
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v4;
      v17 = "%{public}@Unexpected event %@";
      v18 = v13;
      v19 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v9, "onThreadNetworkConnectionStateChange:", objc_msgSend(v4, "eventValue"));
LABEL_14:

}

- (void)threadWakeOnDeviceConnectionStateChange:(id)a3
{
  id v4;
  void *v5;
  HMDThreadNetworkStatusReporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDThreadNetworkStatusReporter *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eMACAddressAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v9;
    v22 = 2048;
    v23 = objc_msgSend(v4, "connectionState");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@threadWakeOnDeviceConnectionStateChange - received event %@, eMACAddress %@, connectionState %ld", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDThreadNetworkStatusReporter home](v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "onThreadNetworkWakeOnDeviceConnectionStateChange:", v4);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadWakeOnDeviceConnectionStateChange event", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)threadPeripheralDeviceNodeTypeChange:(id)a3
{
  id v4;
  void *v5;
  HMDThreadNetworkStatusReporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDThreadNetworkStatusReporter *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    v19 = 2048;
    v20 = objc_msgSend(v4, "peripheralDeviceNodeType");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@threadPeripheralDeviceNodeTypeChange - received event %@, peripheral nodeType %ld", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDThreadNetworkStatusReporter home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "onThreadNetworkPeripheralDeviceNodeTypeChange:", v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadPeripheralDeviceNodeTypeChange event", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)threadPreferredNetworkUpdated:(id)a3
{
  id v4;
  void *v5;
  HMDThreadNetworkStatusReporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDThreadNetworkStatusReporter *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@threadPreferredNetworkUpdated - received event %@, value %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDThreadNetworkStatusReporter home](v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
    {
      objc_msgSend(v4, "eventValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "eventValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v10, "saveAndSyncWithThreadOperationalDataset:", v13);

      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eventValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadPreferredNetworkUpdated event %@, value %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)threadBTCallStateChange:(id)a3
{
  id v4;
  void *v5;
  HMDThreadNetworkStatusReporter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HMDThreadNetworkStatusReporter *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDThreadNetworkStatusReporter *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    v25 = 2048;
    v26 = objc_msgSend(v4, "callState");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@threadBTCallStateChange - received event %@, value %ld", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDThreadNetworkStatusReporter home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(v4, "callState");
    if (v10)
    {
      if (v10 == 1)
      {
        v11 = 1;
LABEL_14:
        objc_msgSend(v9, "onThreadNetworkCallStateChange:", v11);
        goto LABEL_15;
      }
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected event %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }
    v11 = 0;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = v6;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "callState");
    v21 = 138543874;
    v22 = v15;
    v23 = 2112;
    v24 = v4;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadBTCallStateChange event %@, value %ld", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
LABEL_15:

}

- (void)registerForThreadNetworkEvents
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMDThreadNetworkStatusReporter_registerForThreadNetworkEvents__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_registerForThreadNetworkEvents
{
  NSObject *v3;
  void *v4;
  HMDThreadNetworkStatusReporter *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@_registerForThreadNetworkEvents", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDThreadNetworkStatusReporter threadRadioClient](v5, "threadRadioClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForThreadNetworkEvents:", v5);

}

- (void)unregisterForThreadNetworkEvents
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDThreadNetworkStatusReporter_unregisterForThreadNetworkEvents__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_unregisterForThreadNetworkEvents
{
  NSObject *v3;
  void *v4;
  HMDThreadNetworkStatusReporter *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@_unregisterForThreadNetworkEvents", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDThreadNetworkStatusReporter threadRadioClient](v5, "threadRadioClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterForThreadNetworkEvents:", v5);

  -[HMDThreadNetworkStatusReporter home](v5, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "onThreadNetworkConnectionStateChange:", 1);
    objc_msgSend(v10, "onThreadNetworkNodeTypeStateChange:", 0);
  }

}

- (void)_checkIfThreadNetworkIsRunningWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDThreadNetworkStatusReporter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[HMDThreadNetworkMetadataStore defaultStore](HMDThreadNetworkMetadataStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "checkIfThreadNetworkIsRunningWithCompletion:", v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No thread network metadata store", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v12);

  }
}

- (void)_runThreadNetworkStateCapture
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];

  -[HMDThreadNetworkStatusReporter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDThreadNetworkStatusReporter threadRadioClient](self, "threadRadioClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__HMDThreadNetworkStatusReporter__runThreadNetworkStateCapture__block_invoke;
  v5[3] = &unk_24E77B340;
  v5[4] = self;
  objc_msgSend(v4, "triggerThreadNetworkStateCaptureWithCompletion:", v5);

}

- (unint64_t)threadNetworkPeriodicCheckFrequencyInMins
{
  return self->_threadNetworkPeriodicCheckFrequencyInMins;
}

- (void)setThreadNetworkPeriodicCheckFrequencyInMins:(unint64_t)a3
{
  self->_threadNetworkPeriodicCheckFrequencyInMins = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDThreadRadioClient)threadRadioClient
{
  return self->_threadRadioClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadRadioClient, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __63__HMDThreadNetworkStatusReporter__runThreadNetworkStateCapture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6 && v5 && (v11 = *(void **)(a1 + 32)) != 0)
  {
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "metricsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "threadNetworkObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x227676638](objc_msgSend(v15, "generateLogForPeriodicReport:", v5));
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138546178;
      v21 = v19;
      v22 = 2048;
      v23 = objc_msgSend(v5, "reportDuration");
      v24 = 2048;
      v25 = objc_msgSend(v5, "numAdvertisedBRs");
      v26 = 2048;
      v27 = objc_msgSend(v5, "numAppleBRs");
      v28 = 2048;
      v29 = objc_msgSend(v5, "numThirdPartyBRs");
      v30 = 2048;
      v31 = objc_msgSend(v5, "numThreadNetworks");
      v32 = 2048;
      v33 = objc_msgSend(v5, "maxSimuIPPrefixesDetected");
      v34 = 2048;
      v35 = objc_msgSend(v5, "txTotal");
      v36 = 2048;
      v37 = objc_msgSend(v5, "txSuccess");
      v38 = 2048;
      v39 = objc_msgSend(v5, "txDelayAvg");
      v40 = 2048;
      v41 = objc_msgSend(v5, "rxTotal");
      v42 = 2048;
      v43 = objc_msgSend(v5, "rxSuccess");
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Periodic Thread network health reporting - duration=%ld BRs:(T=%ld A=%ld 3=%ld) Ntwk:(#=%ld IPpfx=%ld) Tx:(T=%ld S=%ld AvgDelay=%ld) Rx:(T=%ld S=%ld)", buf, 0x7Au);

    }
    objc_autoreleasePoolPop(v16);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2112;
      v23 = (uint64_t)v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Periodic Thread network health reporting failed with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __66__HMDThreadNetworkStatusReporter_unregisterForThreadNetworkEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterForThreadNetworkEvents");
}

uint64_t __64__HMDThreadNetworkStatusReporter_registerForThreadNetworkEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForThreadNetworkEvents");
}

void __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (v9)
      {
        objc_msgSend(v4, "setThreadPreferredNetworkExists:", 1);
        if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
        {
          objc_msgSend(v9, "operationalDataset");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          if (v5)
          {
            v6 = *(void **)(a1 + 32);
            objc_msgSend(v9, "operationalDataset");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = (void *)objc_msgSend(v7, "copy");
            objc_msgSend(v6, "saveAndSyncWithThreadOperationalDataset:", v8);

          }
        }
      }
      else
      {
        objc_msgSend(v4, "setThreadPreferredNetworkExists:", 0);
      }
    }
  }

}

void __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!a3)
  {
    if (WeakRetained)
    {
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        v9 = v7;
        objc_msgSend(v8, "setThreadNetworkIsUp:", a2);
        v7 = v9;
      }
    }
  }

}

void __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_runThreadNetworkStatusPeriodicUpdate");

}

uint64_t __37__HMDThreadNetworkStatusReporter_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleThreadNetworkStatusPeriodicUpdate");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_42875 != -1)
    dispatch_once(&logCategory__hmf_once_t0_42875, &__block_literal_global_42876);
  return (id)logCategory__hmf_once_v1_42877;
}

void __45__HMDThreadNetworkStatusReporter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_42877;
  logCategory__hmf_once_v1_42877 = v0;

}

@end
