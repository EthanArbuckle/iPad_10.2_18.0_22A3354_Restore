@implementation HMMigrationBoost

- (HMMigrationBoost)initWithMessageTarget:(id)a3 notificationCenter:(id)a4 messageDispatcher:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMMigrationBoost *v15;
  HMMigrationBoost *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMMigrationBoost;
  v15 = -[HMMigrationBoost init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageTarget, a3);
    objc_storeStrong((id *)&v16->_notificationCenter, a4);
    objc_storeStrong((id *)&v16->_messageDispatcher, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (void)startBoost
{
  void *v3;
  HMMigrationBoost *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Waiting for daemon disconnect to trigger a boost", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMigrationBoost notificationCenter](v4, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__handleDaemonDisconnect_, CFSTR("kHomeKitDaemonInterruptedNotification"), 0);

}

- (void)stopBoost
{
  void *v3;
  HMMigrationBoost *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@No longer waiting for daemon disconnect to trigger a boost", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMigrationBoost notificationCenter](v4, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v4);

}

- (void)_handleDaemonDisconnect:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMMigrationBoost queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v4, block);

}

- (NSUUID)messageTarget
{
  return self->_messageTarget;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageTarget, 0);
}

void __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending boost message after daemon disconnect", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x1E0D285F8];
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(*(id *)(a1 + 32), "messageTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMHM.upgradeToHH2Boost"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke_4;
  v12[3] = &unk_1E3AB4808;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "setResponseHandler:", v12);
  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:completionHandler:", v10, 0);

}

void __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response to boost message: %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "stopBoost");

}

@end
