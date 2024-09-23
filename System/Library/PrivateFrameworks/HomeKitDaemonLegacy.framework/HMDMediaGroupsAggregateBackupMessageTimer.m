@implementation HMDMediaGroupsAggregateBackupMessageTimer

- (HMDMediaGroupsAggregateBackupMessageTimer)initWithParticipantAccessoryUUID:(id)a3
{
  return -[HMDMediaGroupsAggregateBackupMessageTimer initWithParticipantAccessoryUUID:timerProvider:](self, "initWithParticipantAccessoryUUID:timerProvider:", a3, self);
}

- (HMDMediaGroupsAggregateBackupMessageTimer)initWithParticipantAccessoryUUID:(id)a3 timerProvider:(id)a4
{
  id v7;
  id v8;
  HMDMediaGroupsAggregateBackupMessageTimer *v9;
  HMDMediaGroupsAggregateBackupMessageTimer *v10;
  uint64_t v11;
  NSUUID *currentMessageIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDMediaGroupsAggregateBackupMessageTimer;
  v9 = -[HMDMediaGroupsAggregateBackupMessageTimer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_timerProvider, v8);
    objc_storeStrong((id *)&v10->_participantAccessoryUUID, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    currentMessageIdentifier = v10->_currentMessageIdentifier;
    v10->_currentMessageIdentifier = (NSUUID *)v11;

    v10->_attemptCount = 0;
  }

  return v10;
}

- (void)markAttemptWithMessageIdentifier:(id)a3
{
  -[HMDMediaGroupsAggregateBackupMessageTimer setCurrentMessageIdentifier:](self, "setCurrentMessageIdentifier:", a3);
  -[HMDMediaGroupsAggregateBackupMessageTimer setAttemptCount:](self, "setAttemptCount:", -[HMDMediaGroupsAggregateBackupMessageTimer attemptCount](self, "attemptCount") + 1);
}

- (void)startRetryTimer
{
  void *v3;
  HMDMediaGroupsAggregateBackupMessageTimer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregateBackupMessageTimer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDMediaGroupsAggregateBackupMessageTimer *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDMediaGroupsAggregateBackupMessageTimer attemptCount](v4, "attemptCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting timer with attempts: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if (-[HMDMediaGroupsAggregateBackupMessageTimer attemptCount](v4, "attemptCount") < 0x24)
  {
    -[HMDMediaGroupsAggregateBackupMessageTimer timerProvider](v4, "timerProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDMediaGroupsAggregateBackupMessageTimer nextTimeInterval](v4, "nextTimeInterval");
      objc_msgSend(v12, "timerWithTimeInterval:options:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaGroupsAggregateBackupMessageTimer setTimer:](v4, "setTimer:", v13);

      -[HMDMediaGroupsAggregateBackupMessageTimer timer](v4, "timer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDelegate:", v4);

      -[HMDMediaGroupsAggregateBackupMessageTimer timer](v4, "timer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resume");

    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = v4;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to start new timer due to no timer provider", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = v4;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = &unk_1E8B33B40;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create retry timer due to reaching the max attempt count: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
}

- (double)nextTimeInterval
{
  unint64_t v2;
  unint64_t v3;
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = -[HMDMediaGroupsAggregateBackupMessageTimer attemptCount](self, "attemptCount");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;
  v5[0] = vdupq_n_s64(0x404E000000000000uLL);
  v5[1] = xmmword_1CDB8FBA0;
  v6 = 0x409C200000000000;
  if (v3 > 5)
    return 86400.0;
  else
    return *((double *)v5 + v3 - 1);
}

- (HMDMediaGroupsAggregateBackupMessageTimer)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (HMDMediaGroupsAggregateBackupMessageTimer *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a4, a3);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregateBackupMessageTimer *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDMediaGroupsAggregateBackupMessageTimer timer](self, "timer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDMediaGroupsAggregateBackupMessageTimer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "didFireTimerForMediaGroupsAggregateBackupMessageTimer:", self);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of triggered timer due to no delegate", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregateBackupMessageTimer participantAccessoryUUID](self, "participantAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsAggregateBackupMessageTimerDelegate)delegate
{
  return (HMDMediaGroupsAggregateBackupMessageTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)participantAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)currentMessageIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentMessageIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (HMDTimerProvider)timerProvider
{
  return (HMDTimerProvider *)objc_loadWeakRetained((id *)&self->_timerProvider);
}

- (void)setTimerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_timerProvider, a3);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_currentMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_participantAccessoryUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_105664 != -1)
    dispatch_once(&logCategory__hmf_once_t4_105664, &__block_literal_global_105665);
  return (id)logCategory__hmf_once_v5_105666;
}

void __56__HMDMediaGroupsAggregateBackupMessageTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_105666;
  logCategory__hmf_once_v5_105666 = v0;

}

@end
