@implementation HMDUserPresenceFeedRetryTimer

- (HMDUserPresenceFeedRetryTimer)init
{
  HMDUserPresenceFeedRetryTimer *v2;
  uint64_t v3;
  NSUUID *timerID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDUserPresenceFeedRetryTimer;
  v2 = -[HMDUserPresenceFeedRetryTimer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    timerID = v2->_timerID;
    v2->_timerID = (NSUUID *)v3;

  }
  return v2;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserPresenceFeedRetryTimer timerID](self, "timerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("TID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserPresenceFeedRetryTimer retryCount](self, "retryCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("RC"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)startWithDelegate:(id)a3 delegateQueue:(id)a4 responseTime:(double)a5
{
  id v8;
  id v9;
  void *v10;
  HMDUserPresenceFeedRetryTimer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDUserPresenceFeedRetryTimer *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDUserPresenceFeedRetryTimer retryTimeInterval](v11, "retryTimeInterval");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting the timer after response time %@ and retry time interval %@", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  if (-[HMDUserPresenceFeedRetryTimer shouldRetryImmediately:](v11, "shouldRetryImmediately:", a5))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v11;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[HMDUserPresenceFeedRetryTimer retryTimeInterval](v18, "retryTimeInterval");
      objc_msgSend(v22, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Response time %@ is more than retry timer %@", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDUserPresenceFeedRetryTimer retryTimer](v18, "retryTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timerDidFire:", v24);
  }
  else
  {
    -[HMDUserPresenceFeedRetryTimer retryTimeInterval](v11, "retryTimeInterval");
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v25 - a5);
    -[HMDUserPresenceFeedRetryTimer setRetryTimer:](v11, "setRetryTimer:", v26);

    -[HMDUserPresenceFeedRetryTimer retryTimer](v11, "retryTimer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", v8);

    -[HMDUserPresenceFeedRetryTimer retryTimer](v11, "retryTimer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegateQueue:", v9);

    -[HMDUserPresenceFeedRetryTimer retryTimer](v11, "retryTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resume");
  }

}

- (void)cancel
{
  void *v3;

  -[HMDUserPresenceFeedRetryTimer retryTimer](self, "retryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDUserPresenceFeedRetryTimer setRetryTimer:](self, "setRetryTimer:", 0);
}

- (double)retryTimeInterval
{
  unint64_t v2;
  double result;

  v2 = -[HMDUserPresenceFeedRetryTimer retryCount](self, "retryCount");
  result = 300.0;
  if (v2 <= 0xA)
    return 30.0;
  return result;
}

- (BOOL)shouldRetryImmediately:(double)a3
{
  double v4;

  -[HMDUserPresenceFeedRetryTimer retryTimeInterval](self, "retryTimeInterval");
  return v4 <= a3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDUserPresenceFeedRetryTimer timerID](self, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFTimer)retryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSUUID)timerID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_7339 != -1)
    dispatch_once(&logCategory__hmf_once_t2_7339, &__block_literal_global_7340);
  return (id)logCategory__hmf_once_v3_7341;
}

void __44__HMDUserPresenceFeedRetryTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_7341;
  logCategory__hmf_once_v3_7341 = v0;

}

@end
