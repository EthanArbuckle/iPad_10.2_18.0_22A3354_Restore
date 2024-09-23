@implementation HMMQueuingRTCBackendOperation

- (HMMQueuingRTCBackendOperation)initWithMessages:(id)a3 serviceName:(id)a4 sessionUUID:(id)a5 isRealtime:(BOOL)a6 rtcFactory:(id)a7 staleSessionBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMMQueuingRTCBackendOperation *v18;
  HMMQueuingRTCBackendOperation *v19;
  uint64_t v20;
  id staleSessionBlock;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMMQueuingRTCBackendOperation;
  v18 = -[HMMQueuingRTCBackendOperation init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messages, a3);
    objc_storeStrong((id *)&v19->_serviceName, a4);
    objc_storeStrong((id *)&v19->_sessionUUID, a5);
    v19->_isRealtime = a6;
    objc_storeStrong((id *)&v19->_rtcFactory, a7);
    v20 = MEMORY[0x1D17B7A7C](v17);
    staleSessionBlock = v19->_staleSessionBlock;
    v19->_staleSessionBlock = (id)v20;

    v19->_operationState = 0;
  }

  return v19;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(void);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  HMMQueuingRTCBackendOperation *v13;
  id v14;

  if (-[HMMQueuingRTCBackendOperation isCancelled](self, "isCancelled"))
  {
    -[HMMQueuingRTCBackendOperation changeOperationState:](self, "changeOperationState:", 2);
  }
  else
  {
    -[HMMQueuingRTCBackendOperation changeOperationState:](self, "changeOperationState:", 1);
    -[HMMQueuingRTCBackendOperation rtcFactory](self, "rtcFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMQueuingRTCBackendOperation serviceName](self, "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMQueuingRTCBackendOperation sessionUUID](self, "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionWithServiceName:samplingUUID:containsRealtime:", v4, v5, -[HMMQueuingRTCBackendOperation isRealtime](self, "isRealtime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __38__HMMQueuingRTCBackendOperation_start__block_invoke;
    v12 = &unk_1E898A458;
    v13 = self;
    v14 = v6;
    v7 = v6;
    objc_msgSend(v7, "startConfigurationWithCompletionHandler:", &v9);
    -[HMMQueuingRTCBackendOperation staleSessionBlock](self, "staleSessionBlock", v9, v10, v11, v12, v13);
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
}

- (void)changeOperationState:(int64_t)a3
{
  int64_t operationState;
  BOOL v6;
  int v7;
  BOOL v8;
  int v9;

  operationState = self->_operationState;
  v6 = a3 == 1 || operationState == 1;
  v7 = v6;
  if (v6)
    -[HMMQueuingRTCBackendOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("executing"));
  v8 = a3 == 2 || operationState == 2;
  v9 = v8;
  if (v8)
    -[HMMQueuingRTCBackendOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finished"));
  os_unfair_lock_lock_with_options();
  self->_operationState = a3;
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
    -[HMMQueuingRTCBackendOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("executing"));
  if (v9)
    -[HMMQueuingRTCBackendOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finished"));
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  HMMQueuingRTCBackendOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_operationState == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isFinished
{
  HMMQueuingRTCBackendOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_operationState == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)messages
{
  return self->_messages;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (BOOL)isRealtime
{
  return self->_isRealtime;
}

- (HMMRTCReportingFactory)rtcFactory
{
  return self->_rtcFactory;
}

- (id)staleSessionBlock
{
  return self->_staleSessionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_staleSessionBlock, 0);
  objc_storeStrong((id *)&self->_rtcFactory, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

void __38__HMMQueuingRTCBackendOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[4];
  _BYTE buf[24];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v23 = v3;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "messages");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
    {
      v6 = v5;
      v26 = *(_QWORD *)v28;
      v25 = *MEMORY[0x1E0D83850];
      v7 = *MEMORY[0x1E0D83868];
      v8 = *MEMORY[0x1E0D83860];
      v9 = *MEMORY[0x1E0D83858];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v26)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v12 = *(void **)(a1 + 40);
          v13 = objc_msgSend(*(id *)(a1 + 32), "isRealtime");
          v32[0] = v25;
          v32[1] = v7;
          *(_QWORD *)buf = &unk_1E8991ED0;
          *(_QWORD *)&buf[8] = &unk_1E8991ED0;
          v32[2] = v8;
          v32[3] = v9;
          v14 = &unk_1E8991EE8;
          if (v13)
            v14 = &unk_1E8991ED0;
          *(_QWORD *)&buf[16] = v11;
          v34 = v14;
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = v11;
          objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", buf, v32, 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "sendMessageWithDictionary:error:", v17, 0);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v6);
    }

    v4 = v23;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B78FC]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_1CD029000, v20, OS_LOG_TYPE_ERROR, "%{public}@No configured RTC backends for service %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  objc_msgSend(*(id *)(a1 + 32), "changeOperationState:", 2);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1)
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_67);
  return (id)logCategory__hmf_once_v10;
}

void __44__HMMQueuingRTCBackendOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10;
  logCategory__hmf_once_v10 = v0;

}

@end
