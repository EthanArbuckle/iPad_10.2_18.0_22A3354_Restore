@implementation HMMTRAccessoryReachabilityObserver

- (HMMTRAccessoryReachabilityObserver)initWithQueue:(id)a3
{
  id v5;
  HMMTRAccessoryReachabilityObserver *v6;
  HMMTRAccessoryReachabilityObserver *v7;
  id completionBlock;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRAccessoryReachabilityObserver;
  v6 = -[HMMTRAccessoryReachabilityObserver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    objc_storeWeak((id *)&v7->_targetServer, 0);
    completionBlock = v7->_completionBlock;
    v7->_completionBlock = 0;

  }
  return v7;
}

- (void)startObservingReachabilityForAccessoryServer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  HMMTRAccessoryReachabilityObserver *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMMTRAccessoryReachabilityObserver *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[HMMTRAccessoryReachabilityObserver completionBlock](self, "completionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMMTRAccessoryReachabilityObserver completionBlock](self, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryReachabilityObserver setCompletionBlock:](self, "setCompletionBlock:", 0);
    -[HMMTRAccessoryReachabilityObserver workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__HMMTRAccessoryReachabilityObserver_startObservingReachabilityForAccessoryServer_completion___block_invoke;
    block[3] = &unk_250F22988;
    v25 = v9;
    v11 = v9;
    dispatch_async(v10, block);

  }
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting reachability observation for accessory server with nodeID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v6, "matterDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "state");

  if (v18 == 1)
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v13;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nodeID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ was already reachable, replying immediately", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v7[2](v7, 0);
  }
  else
  {
    -[HMMTRAccessoryReachabilityObserver setTargetServer:](v13, "setTargetServer:", v6);
    -[HMMTRAccessoryReachabilityObserver setCompletionBlock:](v13, "setCompletionBlock:", v7);
    objc_msgSend(v6, "registerForNotifications:", v13);
  }

}

- (void)stopObservingReachabilityWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  -[HMMTRAccessoryReachabilityObserver completionBlock](self, "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMMTRAccessoryReachabilityObserver completionBlock](self, "completionBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryReachabilityObserver setCompletionBlock:](self, "setCompletionBlock:", 0);
    -[HMMTRAccessoryReachabilityObserver workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __73__HMMTRAccessoryReachabilityObserver_stopObservingReachabilityWithError___block_invoke;
    v14 = &unk_250F22768;
    v16 = v6;
    v15 = v4;
    v8 = v6;
    dispatch_async(v7, &v11);

  }
  -[HMMTRAccessoryReachabilityObserver targetServer](self, "targetServer", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "unregisterForNotifications:", self);
  -[HMMTRAccessoryReachabilityObserver setTargetServer:](self, "setTargetServer:", 0);

}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMMTRAccessoryReachabilityObserver *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  HMMTRAccessoryReachabilityObserver *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMMTRAccessoryReachabilityObserver *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMMTRAccessoryReachabilityObserver *v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  _QWORD block[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    if (a4 == 1)
    {
      -[HMMTRAccessoryReachabilityObserver targetServer](self, "targetServer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if ((HMFEqualObjects() & 1) != 0)
        {
          if (v9 && objc_msgSend(v9, "hmf_BOOLForKey:", *MEMORY[0x24BE1B448]))
          {
            v14 = (void *)MEMORY[0x242656984]();
            v15 = self;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "nodeID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v41 = v17;
              v42 = 2112;
              v43 = (unint64_t)v18;
              _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ became reachable", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v14);
            -[HMMTRAccessoryReachabilityObserver completionBlock](v15, "completionBlock");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRAccessoryReachabilityObserver setCompletionBlock:](v15, "setCompletionBlock:", 0);
            if (v19)
            {
              -[HMMTRAccessoryReachabilityObserver workQueue](v15, "workQueue");
              v20 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __95__HMMTRAccessoryReachabilityObserver_indicateNotificationFromServer_notifyType_withDictionary___block_invoke;
              block[3] = &unk_250F22988;
              v39 = v19;
              dispatch_async(v20, block);

            }
            goto LABEL_31;
          }
          v30 = (void *)MEMORY[0x242656984]();
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "nodeID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v33;
            v42 = 2112;
            v43 = (unint64_t)v37;
            _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ is currently unreachable, still waiting for reachable notification", buf, 0x16u);

            goto LABEL_29;
          }
LABEL_30:

          objc_autoreleasePoolPop(v30);
LABEL_31:

          goto LABEL_32;
        }
        v30 = (void *)MEMORY[0x242656984]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v33;
        v42 = 2112;
        v43 = (unint64_t)v13;
        v44 = 2112;
        v45 = v12;
        v34 = "%{public}@Expecting notification for accessory server %@, received notification for accessory server %@, ignoring";
        v35 = v32;
        v36 = 32;
      }
      else
      {
        v30 = (void *)MEMORY[0x242656984]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        v42 = 2112;
        v43 = (unint64_t)v12;
        v34 = "%{public}@Not expected any notification for any server, but received notification for accessory server %@, ignoring";
        v35 = v32;
        v36 = 22;
      }
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
LABEL_29:

      goto LABEL_30;
    }
    v26 = MEMORY[0x242656984]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v29;
      v42 = 2048;
      v43 = a4;
      v44 = 2112;
      v45 = v12;
      _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected notification %lu accessory server, ignoring %@", buf, 0x20u);

    }
    v25 = (void *)v26;
  }
  else
  {
    v21 = MEMORY[0x242656984]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v24;
      v42 = 2112;
      v43 = (unint64_t)v10;
      _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@Received notification for a non-matter accessory server, ignoring %@", buf, 0x16u);

    }
    v25 = (void *)v21;
  }
  objc_autoreleasePoolPop(v25);
LABEL_32:

}

- (id)logIdentifier
{
  void *v2;
  HMMTRAccessoryServer **p_targetServer;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  p_targetServer = &self->_targetServer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetServer);
  objc_msgSend(WeakRetained, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_targetServer);
  objc_msgSend(v6, "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMMTRAccessoryServer)targetServer
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_targetServer);
}

- (void)setTargetServer:(id)a3
{
  objc_storeWeak((id *)&self->_targetServer, a3);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_targetServer);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __95__HMMTRAccessoryReachabilityObserver_indicateNotificationFromServer_notifyType_withDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HMMTRAccessoryReachabilityObserver_stopObservingReachabilityWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __94__HMMTRAccessoryReachabilityObserver_startObservingReachabilityForAccessoryServer_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_5023 != -1)
    dispatch_once(&logCategory__hmf_once_t9_5023, &__block_literal_global_5024);
  return (id)logCategory__hmf_once_v10_5025;
}

void __49__HMMTRAccessoryReachabilityObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_5025;
  logCategory__hmf_once_v10_5025 = v0;

}

@end
