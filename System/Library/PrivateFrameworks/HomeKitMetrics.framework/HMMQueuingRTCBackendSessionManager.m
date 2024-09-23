@implementation HMMQueuingRTCBackendSessionManager

- (HMMQueuingRTCBackendSessionManager)initWithRTCFactory:(id)a3 timeSourceBlock:(id)a4
{
  id v7;
  double (**v8)(_QWORD);
  HMMQueuingRTCBackendSessionManager *v9;
  HMMQueuingRTCBackendSessionManager *v10;
  uint64_t v11;
  id timeSourceBlock;
  NSOperationQueue *v13;
  NSOperationQueue *queue;
  uint64_t v15;
  NSPointerArray *activeSessions;
  objc_super v18;

  v7 = a3;
  v8 = (double (**)(_QWORD))a4;
  v18.receiver = self;
  v18.super_class = (Class)HMMQueuingRTCBackendSessionManager;
  v9 = -[HMMQueuingRTCBackendSessionManager init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rtcFactory, a3);
    v11 = MEMORY[0x1D17B7A7C](v8);
    timeSourceBlock = v10->_timeSourceBlock;
    v10->_timeSourceBlock = (id)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v10->_queue;
    v10->_queue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v10->_queue, "setQualityOfService:", 9);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v15 = objc_claimAutoreleasedReturnValue();
    activeSessions = v10->_activeSessions;
    v10->_activeSessions = (NSPointerArray *)v15;

    v10->_nextStaleCheckTime = v8[2](v8) + 1800.0;
  }

  return v10;
}

- (BOOL)_isTimeValid
{
  BOOL result;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->__isTimeValid)
    return 1;
  if (_isTimeValid_onceToken != -1)
    dispatch_once(&_isTimeValid_onceToken, &__block_literal_global_103);
  result = (*((double (**)(void))self->_timeSourceBlock + 2))() >= *(double *)&_isTimeValid_minAllowedTime;
  self->__isTimeValid = result;
  return result;
}

- (id)logBackendSessionWithServiceName:(id)a3 sessionUUID:(id)a4 isRealtime:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  HMMQueuingRTCBackendSession *v10;
  void *v11;
  HMMQueuingRTCBackendSessionManager *v12;
  NSObject *v13;
  void *v14;
  NSUInteger v15;
  int v17;
  void *v18;
  __int16 v19;
  NSUInteger v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock_with_options();
  if (!-[HMMQueuingRTCBackendSessionManager _isTimeValid](self, "_isTimeValid"))
  {
    v10 = 0;
    goto LABEL_5;
  }
  -[NSPointerArray addPointer:](self->_activeSessions, "addPointer:", 0);
  -[NSPointerArray compact](self->_activeSessions, "compact");
  if (-[NSPointerArray count](self->_activeSessions, "count") <= 0x3E7)
  {
    v10 = -[HMMQueuingRTCBackendSession initWithServiceName:sessionUUID:isRealtime:submitter:timeSourceBlock:]([HMMQueuingRTCBackendSession alloc], "initWithServiceName:sessionUUID:isRealtime:submitter:timeSourceBlock:", v8, v9, v5, self, self->_timeSourceBlock);
    -[NSPointerArray hmf_addObject:](self->_activeSessions, "hmf_addObject:", v10);
LABEL_5:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x1D17B78FC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSPointerArray count](self->_activeSessions, "count");
    v17 = 138543874;
    v18 = v14;
    v19 = 2048;
    v20 = v15;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1CD029000, v13, OS_LOG_TYPE_ERROR, "%{public}@%lu sessions already queued; creating a nil session for service %@",
      (uint8_t *)&v17,
      0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMQueuingRTCBackendSessionManager sendMetaEventWithName:forServiceName:](v12, "sendMetaEventWithName:forServiceName:", CFSTR("ExceededSessionMax"), v8);
  v10 = 0;
LABEL_9:

  return v10;
}

- (void)sendMetaEventWithName:(id)a3 forServiceName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  -[HMMQueuingRTCBackendSessionManager timeSourceBlock](self, "timeSourceBlock", CFSTR("HMFMetaEventName"), CFSTR("HMFTimestamp"));
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v9[2]();
  objc_msgSend(v6, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = CFSTR("HMFCorrespondingServiceName");
  v15[1] = v10;
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMQueuingRTCBackendSessionManager submitMessages:serviceName:sessionUUID:isRealtime:](self, "submitMessages:serviceName:sessionUUID:isRealtime:", v12, CFSTR("HMFMeta"), v13, 0);
}

- (void)submitMessages:(id)a3 serviceName:(id)a4 sessionUUID:(id)a5 isRealtime:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMMQueuingRTCBackendSessionManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMMQueuingRTCBackendOperation *v18;
  void *v19;
  HMMQueuingRTCBackendOperation *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17B78FC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v16;
    v24 = 2112;
    v25 = v12;
    v26 = 2048;
    v27 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1CD029000, v15, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Queuing session containing %lu messages for submission", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMMQueuingRTCBackendSessionManager queue](v14, "queue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [HMMQueuingRTCBackendOperation alloc];
  -[HMMQueuingRTCBackendSessionManager rtcFactory](v14, "rtcFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__HMMQueuingRTCBackendSessionManager_submitMessages_serviceName_sessionUUID_isRealtime___block_invoke;
  v21[3] = &unk_1E898A590;
  v21[4] = v14;
  v20 = -[HMMQueuingRTCBackendOperation initWithMessages:serviceName:sessionUUID:isRealtime:rtcFactory:staleSessionBlock:](v18, "initWithMessages:serviceName:sessionUUID:isRealtime:rtcFactory:staleSessionBlock:", v10, v11, v12, v6, v19, v21);
  objc_msgSend(v17, "addOperation:", v20);

}

- (void)checkForStaleSessions
{
  double v3;
  void *v4;
  HMMQueuingRTCBackendSessionManager *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  HMMQueuingRTCBackendSessionManager *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_unfair_lock_t lock;
  _QWORD v22[3];
  _QWORD v23[3];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v3 = (*((double (**)(void))self->_timeSourceBlock + 2))();
  if (v3 >= self->_nextStaleCheckTime)
  {
    v4 = (void *)MEMORY[0x1D17B78FC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_impl(&dword_1CD029000, v6, OS_LOG_TYPE_INFO, "%{public}@Checking for stale backend sessions", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = 0;
    while (v8 < -[NSPointerArray count](v5->_activeSessions, "count"))
    {
      -[NSPointerArray pointerAtIndex:](v5->_activeSessions, "pointerAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && (v11 = objc_msgSend(v9, "lastEventTime"), v3 - v12 > 3600.0))
      {
        v13 = (void *)MEMORY[0x1D17B78FC](v11);
        v14 = v5;
        HMFGetOSLogHandle();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "serviceName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v16;
          v26 = 2112;
          v27 = v17;
          _os_log_impl(&dword_1CD029000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Found stale session for service %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        v22[0] = CFSTR("HMFSessionIdentifier");
        objc_msgSend(v10, "sessionUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v18;
        v23[1] = CFSTR("HMFLogging.StaleSession");
        v22[1] = CFSTR("HMFEventName");
        v22[2] = CFSTR("HMFTimestamp");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendMessage:", v20);

        objc_msgSend(v10, "close");
        -[NSPointerArray removePointerAtIndex:](v5->_activeSessions, "removePointerAtIndex:", v8);
      }
      else
      {
        ++v8;
      }

    }
    self->_nextStaleCheckTime = v3 + 3600.0;
  }
  os_unfair_lock_unlock(lock);
}

- (void)addBarrierBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMQueuingRTCBackendSessionManager queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBarrierBlock:", v4);

}

- (HMMRTCReportingFactory)rtcFactory
{
  return self->_rtcFactory;
}

- (id)timeSourceBlock
{
  return self->_timeSourceBlock;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_timeSourceBlock, 0);
  objc_storeStrong((id *)&self->_rtcFactory, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

uint64_t __88__HMMQueuingRTCBackendSessionManager_submitMessages_serviceName_sessionUUID_isRealtime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForStaleSessions");
}

void __50__HMMQueuingRTCBackendSessionManager__isTimeValid__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", 1);
  objc_msgSend(v5, "setMonth:", 1);
  objc_msgSend(v5, "setYear:", 2022);
  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = (void *)objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTimeZone:", v2);

  objc_msgSend(v1, "dateFromComponents:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  _isTimeValid_minAllowedTime = v4;

}

+ (id)sharedSessionManager
{
  if (sharedSessionManager__hmf_once_t11 != -1)
    dispatch_once(&sharedSessionManager__hmf_once_t11, &__block_literal_global_97);
  return (id)sharedSessionManager__hmf_once_v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1)
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_115);
  return (id)logCategory__hmf_once_v20;
}

void __49__HMMQueuingRTCBackendSessionManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20;
  logCategory__hmf_once_v20 = v0;

}

void __58__HMMQueuingRTCBackendSessionManager_sharedSessionManager__block_invoke()
{
  HMMQueuingRTCBackendSessionManager *v0;
  uint64_t v1;
  void *v2;
  HMMRTCReportingFactory *v3;

  v0 = [HMMQueuingRTCBackendSessionManager alloc];
  v3 = objc_alloc_init(HMMRTCReportingFactory);
  v1 = -[HMMQueuingRTCBackendSessionManager initWithRTCFactory:timeSourceBlock:](v0, "initWithRTCFactory:timeSourceBlock:", v3, &__block_literal_global_101);
  v2 = (void *)sharedSessionManager__hmf_once_v12;
  sharedSessionManager__hmf_once_v12 = v1;

}

double __58__HMMQueuingRTCBackendSessionManager_sharedSessionManager__block_invoke_2()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  return v2;
}

@end
