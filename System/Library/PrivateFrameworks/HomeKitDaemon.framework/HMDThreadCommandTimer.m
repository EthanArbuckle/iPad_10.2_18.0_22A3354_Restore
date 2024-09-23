@implementation HMDThreadCommandTimer

- (HMDThreadCommandTimer)initWithQueue:(id)a3 delayInSecs:(id)a4
{
  id v7;
  id v8;
  HMDThreadCommandTimer *v9;
  uint64_t v10;
  HMFTimer *commandTimer;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDThreadCommandTimer;
  v9 = -[HMDThreadCommandTimer init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, (double)objc_msgSend(v8, "integerValue"));
    commandTimer = v9->_commandTimer;
    v9->_commandTimer = (HMFTimer *)v10;

    objc_storeStrong((id *)&v9->_delayInSecs, a4);
    -[HMFTimer setDelegateQueue:](v9->_commandTimer, "setDelegateQueue:", v7);
    -[HMFTimer setDelegate:](v9->_commandTimer, "setDelegate:", v9);
    v9->_commandType = 0;
    v9->_commandCount = 0;
    objc_storeStrong((id *)&v9->_commandQueue, a3);
  }

  return v9;
}

- (HMDThreadCommandTimer)initWithTimer:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  dispatch_queue_t v8;
  HMDThreadCommandTimer *v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a3;
  v8 = dispatch_queue_create("thread-command-timer-test", v6);
  v9 = -[HMDThreadCommandTimer initWithQueue:delayInSecs:](self, "initWithQueue:delayInSecs:", v8, &unk_24E96BC18);

  -[HMDThreadCommandTimer setCommandTimer:](v9, "setCommandTimer:", v7);
  return v9;
}

- (void)startWithBlock:(id)a3 completion:(id)a4 commandType:(int64_t)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  HMDThreadCommandTimer *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  HMDThreadCommandTimer *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HMDThreadCommandTimer commandTimer](self, "commandTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRunning");

  if (v12)
  {
    -[HMDThreadCommandTimer commandTimer](self, "commandTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suspend");

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadCommandTimer _commandTypeValueToString:](v15, "_commandTypeValueToString:", -[HMDThreadCommandTimer commandType](v15, "commandType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      v32 = 2048;
      v33 = -[HMDThreadCommandTimer commandCount](v15, "commandCount");
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Not executing deferred thread command %@ with id(%lu). Sending nil completion", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDThreadCommandTimer completionForBlock](v15, "completionForBlock");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0);

  }
  -[HMDThreadCommandTimer setCommandBlock:](self, "setCommandBlock:", v8);
  -[HMDThreadCommandTimer setCompletionForBlock:](self, "setCompletionForBlock:", v9);
  -[HMDThreadCommandTimer setCommandCount:](self, "setCommandCount:", -[HMDThreadCommandTimer commandCount](self, "commandCount") + 1);
  v20 = (void *)MEMORY[0x227676638](-[HMDThreadCommandTimer setCommandType:](self, "setCommandType:", a5));
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDThreadCommandTimer _commandTypeValueToString:](v21, "_commandTypeValueToString:", -[HMDThreadCommandTimer commandType](v21, "commandType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDThreadCommandTimer delayInSecs](v21, "delayInSecs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMDThreadCommandTimer commandCount](v21, "commandCount");
    v28 = 138544130;
    v29 = v23;
    v30 = 2112;
    v31 = v24;
    v32 = 2112;
    v33 = (uint64_t)v25;
    v34 = 2048;
    v35 = v26;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Scheduling deferred thread command %@ to execute after %@ secs with id(%lu)", (uint8_t *)&v28, 0x2Au);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDThreadCommandTimer commandTimer](v21, "commandTimer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "resume");

  os_unfair_lock_unlock(p_lock);
}

- (void)abort
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  HMDThreadCommandTimer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HMDThreadCommandTimer commandTimer](self, "commandTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunning");

  if (v5)
  {
    -[HMDThreadCommandTimer commandTimer](self, "commandTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suspend");

    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadCommandTimer _commandTypeValueToString:](v8, "_commandTypeValueToString:", -[HMDThreadCommandTimer commandType](v8, "commandType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2048;
      v18 = -[HMDThreadCommandTimer commandCount](v8, "commandCount");
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Not executing deferred thread command %@ with id(%lu). Sending nil completion", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDThreadCommandTimer completionForBlock](v8, "completionForBlock");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0);

    -[HMDThreadCommandTimer setCommandType:](v8, "setCommandType:", 0);
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)currentlyScheduledCommand
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int v5;
  int64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HMDThreadCommandTimer commandTimer](self, "commandTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunning");

  if (v5)
    v6 = -[HMDThreadCommandTimer commandType](self, "commandType");
  else
    v6 = 0;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  HMDThreadCommandTimer *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HMDThreadCommandTimer commandBlock](self, "commandBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadCommandTimer _commandTypeValueToString:](v8, "_commandTypeValueToString:", -[HMDThreadCommandTimer commandType](v8, "commandType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2048;
      v22 = -[HMDThreadCommandTimer commandCount](v8, "commandCount");
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Executing deferred thread command %@ now with id(%lu)", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDThreadCommandTimer commandQueue](v8, "commandQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    -[HMDThreadCommandTimer commandBlock](v8, "commandBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v13, v14);

    -[HMDThreadCommandTimer setCommandType:](v8, "setCommandType:", 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDThreadCommandTimer _commandTypeValueToString:](v8, "_commandTypeValueToString:", -[HMDThreadCommandTimer commandType](v8, "commandType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2048;
      v22 = -[HMDThreadCommandTimer commandCount](v8, "commandCount");
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Execution block not found for thread command %@ with id(%lu)", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  os_unfair_lock_unlock(p_lock);

}

- (id)_commandTypeValueToString:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("provideExtendedMACAddress");
  else
    return CFSTR("unknown");
}

- (HMFTimer)commandTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCommandTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)delayInSecs
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelayInSecs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)commandBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCommandBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)completionForBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletionForBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)commandQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommandQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int64_t)a3
{
  self->_commandType = a3;
}

- (unint64_t)commandCount
{
  return self->_commandCount;
}

- (void)setCommandCount:(unint64_t)a3
{
  self->_commandCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong(&self->_completionForBlock, 0);
  objc_storeStrong(&self->_commandBlock, 0);
  objc_storeStrong((id *)&self->_delayInSecs, 0);
  objc_storeStrong((id *)&self->_commandTimer, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_136919 != -1)
    dispatch_once(&logCategory__hmf_once_t5_136919, &__block_literal_global_136920);
  return (id)logCategory__hmf_once_v6_136921;
}

void __36__HMDThreadCommandTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_136921;
  logCategory__hmf_once_v6_136921 = v0;

}

@end
