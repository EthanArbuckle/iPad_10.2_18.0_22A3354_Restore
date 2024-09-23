@implementation HMDSoftwareUpdateEventProvider

- (HMDSoftwareUpdateEventProvider)initWithContext:(id)a3 scanOptionsFactory:(id)a4 timerFactory:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, double);
  HMDSoftwareUpdateEventProvider *v12;
  HMDSoftwareUpdateEventProvider *v13;
  void *v14;
  id scanOptionsFactory;
  uint64_t v16;
  NSMutableArray *scanFutures;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, double))a5;
  v24.receiver = self;
  v24.super_class = (Class)HMDSoftwareUpdateEventProvider;
  v12 = -[HMDSoftwareUpdateEventProvider init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_context, a3);
    v14 = _Block_copy(v10);
    scanOptionsFactory = v13->_scanOptionsFactory;
    v13->_scanOptionsFactory = v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    scanFutures = v13->_scanFutures;
    v13->_scanFutures = (NSMutableArray *)v16;

    -[HMDSoftwareUpdateEventProviderContext configureWithDelegate:](v13->_context, "configureWithDelegate:", v13);
    -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v13, "forwardDescriptorEventWithErrorCode:", 0);
    v11[2](v11, 8, 5.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdateEventProvider setProgressDebounceTimer:](v13, "setProgressDebounceTimer:", v18);

    -[HMDSoftwareUpdateEventProvider progressDebounceTimer](v13, "progressDebounceTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v13);

    -[HMDSoftwareUpdateEventProvider context](v13, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdateEventProvider progressDebounceTimer](v13, "progressDebounceTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegateQueue:", v21);

  }
  return v13;
}

- (void)scanWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMDSoftwareUpdateEventProvider *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2048;
    v29 = a3;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Scanning with options: %lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDSoftwareUpdateEventProvider scanOptionsFactory](v8, "scanOptionsFactory");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11[2](v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke;
  v24[3] = &unk_24E773268;
  v25 = v6;
  v15 = v6;
  v16 = (id)objc_msgSend(v13, "addCompletionBlock:", v24);
  -[HMDSoftwareUpdateEventProvider context](v8, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke_2;
  v21[3] = &unk_24E79BBD0;
  v21[4] = v8;
  v22 = v13;
  v23 = v12;
  v19 = v12;
  v20 = v13;
  dispatch_async(v18, v21);

}

- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdateDescriptor *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastSentSoftwareUpdateDescriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastSentSoftwareUpdateDescriptor:(id)a3
{
  HMSoftwareUpdateDescriptor *v4;
  HMSoftwareUpdateDescriptor *lastSentSoftwareUpdateDescriptor;

  v4 = (HMSoftwareUpdateDescriptor *)a3;
  os_unfair_lock_lock_with_options();
  lastSentSoftwareUpdateDescriptor = self->_lastSentSoftwareUpdateDescriptor;
  self->_lastSentSoftwareUpdateDescriptor = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdateProgress *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastSentSoftwareUpdateProgress;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)forwardDescriptorEventWithErrorCode:(id)a3
{
  id v4;
  void *v5;
  HMDSoftwareUpdateEventProvider *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Forwarding descriptor event", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSoftwareUpdateEventProvider context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__HMDSoftwareUpdateEventProvider_forwardDescriptorEventWithErrorCode___block_invoke;
  v11[3] = &unk_24E773290;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "managerStatus:", v11);

}

- (id)descriptorFromControllerStatus:(id)a3 controllerDescriptor:(id)a4 errorCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDSoftwareUpdateEventProvider *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDSoftwareUpdateEventProvider *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDSoftwareUpdateEventProvider *v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HMDSULocalUtilities descriptorFromControllerStatus:controllerDescriptor:errorCode:](HMDSULocalUtilities, "descriptorFromControllerStatus:controllerDescriptor:errorCode:", v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9)
  {
    -[HMDSoftwareUpdateEventProvider context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEventForTopicSuffixID:", *MEMORY[0x24BDD4BD0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD79E0], "descriptorFromEvent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v12 = v15;

        v16 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "setStatus:", objc_msgSend(v11, "status")));
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v19;
          v31 = 2112;
          v32 = v12;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Forwarding previous descriptor: %@", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v16);

LABEL_13:
        goto LABEL_14;
      }
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v23;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from previous event: %@", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Current and previous descriptor are both nil", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v12 = v11;
    goto LABEL_13;
  }
LABEL_14:

  return v12;
}

- (void)forwardProgressEventWithProgress:(id)a3
{
  id v4;
  void *v5;
  HMDSoftwareUpdateEventProvider *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDSoftwareUpdateEventProvider *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  os_unfair_lock_s *p_lock;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  HMDSoftwareUpdateEventProvider *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDSoftwareUpdateEventProvider *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543362;
    v32 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Debouncing progress event", (uint8_t *)&v31, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (!v4)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Progress is nil. Refreshing software update descriptor.", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v10, "forwardDescriptorEventWithErrorCode:", 0);
  }
  +[HMDSULocalUtilities progressFromControllerProgress:](HMDSULocalUtilities, "progressFromControllerProgress:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[HMDSoftwareUpdateEventProvider context](v6, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BDD7A08]);
      -[HMDSoftwareUpdateEventProvider context](v6, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventTimeStamp");
      v18 = (void *)objc_msgSend(v16, "initWithProgress:eventSource:eventTimestamp:", v13, v15);

      p_lock = &v6->_lock;
      os_unfair_lock_lock_with_options();
      -[HMDSoftwareUpdateEventProvider setDebouncedProgressEvent:](v6, "setDebouncedProgressEvent:", v18);
      objc_storeStrong((id *)&v6->_lastSentSoftwareUpdateProgress, v13);
      -[HMDSoftwareUpdateEventProvider progressDebounceTimer](v6, "progressDebounceTimer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isRunning");

      if ((v21 & 1) == 0)
      {
        -[HMDSoftwareUpdateEventProvider progressDebounceTimer](v6, "progressDebounceTimer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "resume");

      }
      os_unfair_lock_unlock(p_lock);

    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v6;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Event source was nil", (uint8_t *)&v31, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v6;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSoftwareUpdateProgress", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (void)forwardDebouncedProgressEvent
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  HMDSoftwareUpdateEventProvider *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSoftwareUpdateEventProvider debouncedProgressEvent](self, "debouncedProgressEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateEventProvider setDebouncedProgressEvent:](self, "setDebouncedProgressEvent:", 0);
  -[HMDSoftwareUpdateEventProvider progressDebounceTimer](self, "progressDebounceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if (v6)
  {
    -[HMDSoftwareUpdateEventProvider progressDebounceTimer](self, "progressDebounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspend");

  }
  os_unfair_lock_unlock(p_lock);
  if (v4)
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Forwarding progress event", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDSoftwareUpdateEventProvider context](v9, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forwardEvent:withTopicSuffixID:", v4, *MEMORY[0x24BDD4BD8]);

  }
}

- (void)respondToScanFuturesWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDSoftwareUpdateEventProvider *v10;

  v4 = a3;
  -[HMDSoftwareUpdateEventProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateEventProvider *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager scanRequestDidLocateUpdate with error: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v12, "forwardDescriptorEventWithErrorCode:", v15);
  -[HMDSoftwareUpdateEventProvider respondToScanFuturesWithError:](v12, "respondToScanFuturesWithError:", v10);

}

- (void)manager:(id)a3 scanRequestPostponed:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateEventProvider *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager scanRequestPostponed with error: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v12, "forwardDescriptorEventWithErrorCode:", v15);
  -[HMDSoftwareUpdateEventProvider respondToScanFuturesWithError:](v12, "respondToScanFuturesWithError:", v10);

}

- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSoftwareUpdateEventProvider *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didChangeProgressOnDownload", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateEventProvider forwardProgressEventWithProgress:](v9, "forwardProgressEventWithProgress:", v12);

}

- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateEventProvider *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFailDownload", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v12, "forwardDescriptorEventWithErrorCode:", v15);

}

- (void)manager:(id)a3 didFinishDownload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSoftwareUpdateEventProvider *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishDownload", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v9, "forwardDescriptorEventWithErrorCode:", 0);

}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  HMDSoftwareUpdateEventProvider *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishDownload", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v11, "forwardDescriptorEventWithErrorCode:", 0);

}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6 denialReasons:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDSoftwareUpdateEventProvider *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a7;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishDownload", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v14, "forwardDescriptorEventWithErrorCode:", 0);

}

- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateEventProvider *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFailInstallation", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v12, "forwardDescriptorEventWithErrorCode:", v15);

}

- (void)manager:(id)a3 didFinishInstallation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSoftwareUpdateEventProvider *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@SUControllerManager didFinishInstallation", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDSoftwareUpdateEventProvider forwardDescriptorEventWithErrorCode:](v9, "forwardDescriptorEventWithErrorCode:", 0);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSoftwareUpdateEventProvider progressDebounceTimer](self, "progressDebounceTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDSoftwareUpdateEventProvider forwardDebouncedProgressEvent](self, "forwardDebouncedProgressEvent");
}

- (HMDSoftwareUpdateEventProviderContext)context
{
  return (HMDSoftwareUpdateEventProviderContext *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)scanFutures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScanFutures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)scanOptionsFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setScanOptionsFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (HMFTimer)progressDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMSoftwareUpdateProgressEvent)debouncedProgressEvent
{
  return (HMSoftwareUpdateProgressEvent *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDebouncedProgressEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncedProgressEvent, 0);
  objc_storeStrong((id *)&self->_progressDebounceTimer, 0);
  objc_storeStrong(&self->_scanOptionsFactory, 0);
  objc_storeStrong((id *)&self->_scanFutures, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastSentSoftwareUpdateProgress, 0);
  objc_storeStrong((id *)&self->_lastSentSoftwareUpdateDescriptor, 0);
}

void __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (*(_QWORD *)(a1 + 32))
    v2 = (void *)MEMORY[0x24BDBD1C0];
  else
    v2 = (void *)MEMORY[0x24BDBD1C8];
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "scanFutures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke_2;
  v7[3] = &unk_24E7732B8;
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "na_each:", v7);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setScanFutures:", v5);

}

void __64__HMDSoftwareUpdateEventProvider_respondToScanFuturesWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Responding to scan futures with didFindUpdate: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "finishWithResult:", *(_QWORD *)(a1 + 40));

}

void __70__HMDSoftwareUpdateEventProvider_forwardDescriptorEventWithErrorCode___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138544130;
    v33 = v13;
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Controller status:\n%@\n\nController descriptor:\n%@\nerror: %@", (uint8_t *)&v32, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  if (v9)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      objc_autoreleasePoolPop(v14);
      goto LABEL_17;
    }
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v17;
    v34 = 2112;
    v35 = v9;
    v18 = "%{public}@Failed to fetch manager status with error: %@";
    v19 = v16;
    v20 = 22;
LABEL_6:
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v32, v20);

    goto LABEL_7;
  }
  if (!v7)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v17;
    v18 = "%{public}@Controller status was nil";
    v19 = v16;
    v20 = 12;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "descriptorFromControllerStatus:controllerDescriptor:errorCode:", v7, v8, *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "eventSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x24BDD79E8]);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "eventTimeStamp");
    v26 = (void *)objc_msgSend(v24, "initWithDescriptor:eventSource:eventTimestamp:", v21, v23);

    objc_msgSend(*(id *)(a1 + 32), "forwardDebouncedProgressEvent");
    objc_msgSend(*(id *)(a1 + 32), "setLastSentSoftwareUpdateDescriptor:", v21);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "forwardEvent:withTopicSuffixID:", v26, *MEMORY[0x24BDD4BD0]);

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Event source was nil", (uint8_t *)&v32, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
  }

LABEL_17:
}

uint64_t __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
}

void __61__HMDSoftwareUpdateEventProvider_scanWithOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "scanFutures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanWithOptions:", *(_QWORD *)(a1 + 48));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1)
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global);
  return (id)logCategory__hmf_once_v30;
}

void __45__HMDSoftwareUpdateEventProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30;
  logCategory__hmf_once_v30 = v0;

}

@end
