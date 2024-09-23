@implementation HMDSharedHomeUpdateSession

- (HMDSharedHomeUpdateSession)initWithHome:(id)a3 delegate:(id)a4 workQueue:(id)a5 messagePayload:(id)a6 messageDispatcher:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDSharedHomeUpdateSession *v18;
  HMDSharedHomeUpdateSession *v19;
  uint64_t v20;
  NSUUID *sessionID;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDSharedHomeUpdateSession;
  v18 = -[HMDSharedHomeUpdateSession init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_home, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    sessionID = v19->_sessionID;
    v19->_sessionID = (NSUUID *)v20;

    v19->_retryCount = 0;
    v19->_currentTimerValue = (double)(unint64_t)(60 * requestHomeDataSyncRetryPeriodInMinutes);
    objc_storeWeak((id *)&v19->_delegate, v14);
    objc_storeStrong((id *)&v19->_workQueue, a5);
    objc_storeStrong((id *)&v19->_messagePayload, a6);
    objc_storeStrong((id *)&v19->_messageDispatcher, a7);
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  HMDSharedHomeUpdateSession *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating the session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDSharedHomeUpdateSession;
  -[HMDSharedHomeUpdateSession dealloc](&v7, sel_dealloc);
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSharedHomeUpdateSession homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedHomeUpdateSession sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t retryCount;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSharedHomeUpdateSession sessionID](self, "sessionID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self)
    retryCount = self->_retryCount;
  else
    retryCount = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMDSharedHomeUpdateSession: %@, %tu]"), v4, retryCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)homeIdentifier
{
  void *v3;
  HMDHome *home;
  HMDHome *v5;
  void *v6;
  HMDHome *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self)
    home = self->_home;
  else
    home = 0;
  v5 = home;
  -[HMDHome name](v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v7 = self->_home;
  else
    v7 = 0;
  -[HMDHome uuid](v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)requestDataSync
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDSharedHomeUpdateSession_requestDataSync__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *timer;
  HMFTimer *v5;
  HMFTimer *v6;

  v6 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    timer = self->_timer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    timer = 0;
  }
  v5 = v6;
  if (timer == v6)
  {
    -[HMDSharedHomeUpdateSession _requestDataSync]((uint64_t)self);
    v5 = v6;
  }

}

- (id)dumpState
{
  void *v3;
  unint64_t retryCount;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    retryCount = self->_retryCount;
  else
    retryCount = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", retryCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Retry Count"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (HMDSharedHomeUpdateSessionDelegate)delegate
{
  return (HMDSharedHomeUpdateSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messagePayload, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)_requestDataSync
{
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  id v24;
  void *v25;
  void *v26;
  HMDRemoteDeviceMessageDestination *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _BYTE buf[24];
  void *v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 64) < 3uLL)
    {
      v6 = *(void **)(a1 + 32);
      v7 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        v8 = v6;
        objc_msgSend(v8, "sharedHomeSourceVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "primaryResident");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "residentDeviceManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "availableResidentDevices");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v7;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __45__HMDSharedHomeUpdateSession__selectResident__block_invoke;
        v39 = &unk_1E89BF570;
        v40 = v9;
        v13 = v9;
        objc_msgSend(v12, "hmf_objectsPassingTest:", buf);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v36[0] = v7;
        v36[1] = 3221225472;
        v36[2] = __45__HMDSharedHomeUpdateSession__selectResident__block_invoke_2;
        v36[3] = &unk_1E89BF598;
        v37 = v10;
        v15 = v10;
        objc_msgSend(v14, "sortedArrayUsingComparator:", v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (v21)
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2112;
          v39 = v17;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Sending sync request session %@ with resident %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        v23 = [HMDRemoteDeviceMessageDestination alloc];
        v24 = *(id *)(a1 + 32);
        objc_msgSend(v24, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "device");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v23, "initWithTarget:device:", v25, v26);
        +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", CFSTR("kRequestHomeDataSyncRequestKey"), v27, v19[5]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, v19);
        v31 = v7;
        v32 = 3221225472;
        v33 = __46__HMDSharedHomeUpdateSession__requestDataSync__block_invoke;
        v34 = &unk_1E89BF5C0;
        objc_copyWeak(&v35, (id *)buf);
        objc_msgSend(v28, "setResponseHandler:", &v31);
        v29 = v19[6];
        objc_msgSend(v29, "sendMessage:completionHandler:", v28, 0, v31, v32, v33, v34);

        ++*(_QWORD *)(a1 + 64);
        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        if (v21)
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@No valid residents, cannot continue", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        -[HMDSharedHomeUpdateSession _callDelegate](v19);
      }

    }
    else
    {
      v2 = (void *)MEMORY[0x1D17BA0A0]();
      v3 = (id)a1;
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Retry count has maxed out, cannot continue", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
      -[HMDSharedHomeUpdateSession _callDelegate](v3);
    }
  }
}

- (void)_callDelegate
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  _QWORD *v6;

  objc_msgSend(a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = a1[3];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__HMDSharedHomeUpdateSession__callDelegate__block_invoke;
    v4[3] = &unk_1E89C2328;
    v5 = v2;
    v6 = a1;
    dispatch_async(v3, v4);

  }
}

void __46__HMDSharedHomeUpdateSession__requestDataSync__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)MEMORY[0x1D17BA0A0]();
    v2 = WeakRetained;
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v2 + 9));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v4;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@Starting the retry timer with %@ seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v1);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, *((double *)v2 + 9));
    v7 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v6;

    objc_msgSend(*((id *)v2 + 7), "setDelegate:", v2);
    v8 = (void *)*((_QWORD *)v2 + 7);
    v9 = *((id *)v2 + 3);
    objc_msgSend(v8, "setDelegateQueue:", v9);

    v10 = objc_msgSend(*((id *)v2 + 7), "resume");
    *((double *)v2 + 9) = *((double *)v2 + 9) + (double)(unint64_t)(60 * requestHomeDataSyncRetryPeriodInMinutes);
    v11 = (void *)MEMORY[0x1D17BA0A0](v10);
    v12 = v2;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v2 + 9));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Bumped the next timer's value to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

uint64_t __45__HMDSharedHomeUpdateSession__selectResident__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isGreaterThanVersion:", *(_QWORD *)(a1 + 32)))
    v6 = objc_msgSend(v3, "isReachable");
  else
    v6 = 0;

  return v6;
}

uint64_t __45__HMDSharedHomeUpdateSession__selectResident__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "compare:", v10);

  if (!v11)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v5) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v6) & 1) != 0)
    {
      v11 = -1;
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "compare:", v15);

    }
  }

  return v11;
}

void __43__HMDSharedHomeUpdateSession__callDelegate__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didCompleteHomeUpdateSession:withError:", v2, v3);

}

void __45__HMDSharedHomeUpdateSession_requestDataSync__block_invoke(uint64_t a1)
{
  -[HMDSharedHomeUpdateSession _requestDataSync](*(_QWORD *)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_174410 != -1)
    dispatch_once(&logCategory__hmf_once_t1_174410, &__block_literal_global_174411);
  return (id)logCategory__hmf_once_v2_174412;
}

void __41__HMDSharedHomeUpdateSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_174412;
  logCategory__hmf_once_v2_174412 = v0;

}

@end
