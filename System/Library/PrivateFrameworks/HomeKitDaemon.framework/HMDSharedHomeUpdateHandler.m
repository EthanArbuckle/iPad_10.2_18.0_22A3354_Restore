@implementation HMDSharedHomeUpdateHandler

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_102204 != -1)
    dispatch_once(&logCategory__hmf_once_t0_102204, &__block_literal_global_102205);
  return (id)logCategory__hmf_once_v1_102206;
}

void __41__HMDSharedHomeUpdateHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_102206;
  logCategory__hmf_once_v1_102206 = v0;

}

- (void)configureWithHome:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *workQueue;
  id obj;

  obj = a3;
  objc_msgSend(obj, "workQueue");
  v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  self->_workQueue = v4;

  objc_storeWeak((id *)&self->_home, obj);
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  id v5;

  -[HMDSharedHomeUpdateHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_residentsChanged_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v5);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDSharedHomeUpdateHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pause
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSharedHomeUpdateHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDSharedHomeUpdateHandler_pause__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSharedHomeUpdateHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HMDSharedHomeUpdateHandler_resume__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)residentsChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDSharedHomeUpdateHandler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDSharedHomeUpdateHandler_residentsChanged___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)requestHomeDataSync
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSharedHomeUpdateHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDSharedHomeUpdateHandler_requestHomeDataSync__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_evaluateNeedForSync
{
  void *v3;
  void *v4;
  HMDSharedHomeUpdateHandler *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSharedHomeUpdateHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDSharedHomeUpdateHandler *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  HMDSharedHomeUpdateSession *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDSharedHomeUpdateSession *v27;
  void *v28;
  void *v29;
  HMDSharedHomeUpdateHandler *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[HMDSharedHomeUpdateHandler pendingRequestDataFromResidentSession](self, "pendingRequestDataFromResidentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sync session already running", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDSharedHomeUpdateHandler home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedHomeSourceVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v14;
      v38 = 2112;
      v39 = v10;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Current source version %@, device version is %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    if (objc_msgSend(v9, "isGreaterThanVersion:", v10))
    {
      if (-[HMDSharedHomeUpdateHandler firstFetchComplete](v12, "firstFetchComplete"))
      {
        objc_msgSend(v8, "currentUser");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x227676638]();
        v17 = v12;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v19)
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37 = v20;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Pending request is set to YES, starting request for data sync", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v16);
          objc_msgSend(v15, "pairingUsername", CFSTR("pairingUsername"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = [HMDSharedHomeUpdateSession alloc];
          -[HMDSharedHomeUpdateHandler workQueue](v17, "workQueue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "homeManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "messageDispatcher");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[HMDSharedHomeUpdateSession initWithHome:delegate:workQueue:messagePayload:messageDispatcher:](v23, "initWithHome:delegate:workQueue:messagePayload:messageDispatcher:", v8, v17, v24, v22, v26);
          -[HMDSharedHomeUpdateHandler setPendingRequestDataFromResidentSession:](v17, "setPendingRequestDataFromResidentSession:", v27);

          -[HMDSharedHomeUpdateHandler pendingRequestDataFromResidentSession](v17, "pendingRequestDataFromResidentSession");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "requestDataSync");

        }
        else
        {
          if (v19)
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37 = v33;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Current user is nil, cannot continue", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v16);
        }

      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v12;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v32;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Waiting for first fetch to complete", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
      }
    }

  }
}

- (void)receivedHomeDataFromSourceVersion:(id)a3 forceUpdateVersion:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HMDSharedHomeUpdateHandler workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94__HMDSharedHomeUpdateHandler_receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke;
  v13[3] = &unk_24E7962D8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_receivedHomeDataFromSourceVersion:(id)a3 forceUpdateVersion:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDSharedHomeUpdateHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDSharedHomeUpdateHandler *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  HMDSharedHomeUpdateHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDSharedHomeUpdateHandler *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToVersion:", v10) & 1) != 0
    || objc_msgSend(v8, "isGreaterThanVersion:", v10))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Remote version is greater than or equal to local version", buf, 0xCu);

    }
    v15 = v10;
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Remote version is less than local version", buf, 0xCu);

    }
    v15 = v8;
  }

  objc_autoreleasePoolPop(v11);
  v18 = v15;
  -[HMDSharedHomeUpdateHandler home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sharedHomeSourceVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20
    && (objc_msgSend(v18, "isGreaterThanVersion:", v20) & 1) == 0
    && (objc_msgSend(v18, "isEqualToVersion:", v20) || !v6))
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v32;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Leaving shared home source version to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating shared home source version to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v19, "emptyModelObjectWithChangeType:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSharedHomeSourceVersion:", v18);
    objc_msgSend(v19, "backingStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "transaction:options:", CFSTR("Update Shared Home Source Version"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "add:withMessage:", v25, 0);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __95__HMDSharedHomeUpdateHandler__receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke;
    v33[3] = &unk_24E79A050;
    v34 = v9;
    objc_msgSend(v28, "run:", v33);

  }
}

- (BOOL)pendingRequestDataFromResident
{
  void *v2;

  -[HMDSharedHomeUpdateHandler pendingRequestDataFromResidentSession](self, "pendingRequestDataFromResidentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (void)setPendingRequestDataFromResidentSession:(id)a3
{
  HMDSharedHomeUpdateSession *v4;
  HMDSharedHomeUpdateSession *pendingRequestDataFromResidentSession;

  v4 = (HMDSharedHomeUpdateSession *)a3;
  os_unfair_lock_lock_with_options();
  pendingRequestDataFromResidentSession = self->_pendingRequestDataFromResidentSession;
  self->_pendingRequestDataFromResidentSession = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDSharedHomeUpdateSession)pendingRequestDataFromResidentSession
{
  os_unfair_lock_s *p_lock;
  HMDSharedHomeUpdateSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pendingRequestDataFromResidentSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)didCompleteHomeUpdateSession:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDSharedHomeUpdateHandler *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDSharedHomeUpdateHandler pendingRequestDataFromResidentSession](self, "pendingRequestDataFromResidentSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ is complete with error %@, stopping", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDSharedHomeUpdateHandler setPendingRequestDataFromResidentSession:](v10, "setPendingRequestDataFromResidentSession:", 0);
  }

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedHomeUpdateHandler pendingRequestDataFromResidentSession](self, "pendingRequestDataFromResidentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dumpState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE3EB60]);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (void)setPendingRequestDataFromResident:(BOOL)a3
{
  self->_pendingRequestDataFromResident = a3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (BOOL)firstFetchComplete
{
  return self->_firstFetchComplete;
}

- (void)setFirstFetchComplete:(BOOL)a3
{
  self->_firstFetchComplete = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pendingRequestDataFromResidentSession, 0);
}

uint64_t __95__HMDSharedHomeUpdateHandler__receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  return result;
}

uint64_t __94__HMDSharedHomeUpdateHandler_receivedHomeDataFromSourceVersion_forceUpdateVersion_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedHomeDataFromSourceVersion:forceUpdateVersion:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __49__HMDSharedHomeUpdateHandler_requestHomeDataSync__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received sync request", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateNeedForSync");
}

void __47__HMDSharedHomeUpdateHandler_residentsChanged___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isSuspended");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Ignoring resident changed/updated notifications during home merge", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Received residents changed/updated notification", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_evaluateNeedForSync");
  }
}

uint64_t __36__HMDSharedHomeUpdateHandler_resume__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resuming update handler for home %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setSuspended:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateNeedForSync");
}

uint64_t __35__HMDSharedHomeUpdateHandler_pause__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Pausing update handler for home %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setSuspended:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setPendingRequestDataFromResidentSession:", 0);
}

@end
