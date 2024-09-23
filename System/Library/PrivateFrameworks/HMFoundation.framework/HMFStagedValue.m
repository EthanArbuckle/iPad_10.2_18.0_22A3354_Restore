@implementation HMFStagedValue

- (id)value
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = 16;
  if (!self->_isStaged)
    v4 = 32;
  v5 = *(id *)((char *)&self->super.isa + v4);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (HMFStagedValue)initWithValue:(id)a3
{
  id v5;
  HMFStagedValue *v6;
  HMFStagedValue *v7;
  id timerFactory;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMFStagedValue;
  v6 = -[HMFStagedValue init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_committedValue, a3);
    v7->_isStaged = 0;
    timerFactory = v7->_timerFactory;
    v7->_timerFactory = &__block_literal_global_0;

  }
  return v7;
}

HMFTimer *__32__HMFStagedValue_initWithValue___block_invoke(double a1)
{
  return -[HMFTimer initWithTimeInterval:options:]([HMFTimer alloc], "initWithTimeInterval:options:", 2, a1);
}

- (void)stageValue:(id)a3 withTimeout:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  (*((void (**)(double))self->_timerFactory + 2))(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFStagedValue _stageValue:withTimer:](self, "_stageValue:withTimer:", v7, v6);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stageValue:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMFStagedValue _stageValue:withTimer:](self, "_stageValue:withTimer:", v4, 0);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)commitValue:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMFStagedValue _commitValue:](self, "_commitValue:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_stageValue:(id)a3 withTimer:(id)a4
{
  id v7;
  HMFTimer *timer;
  id v9;

  v9 = a3;
  v7 = a4;
  if (HMFEqualObjects(v9, self->_committedValue))
  {
    -[HMFStagedValue _unstageValue](self, "_unstageValue");
  }
  else
  {
    self->_isStaged = 1;
    objc_storeStrong(&self->_stagedValue, a3);
    objc_storeStrong((id *)&self->_timer, a4);
    timer = self->_timer;
    if (timer)
    {
      -[HMFTimer setDelegate:](timer, "setDelegate:", self);
      -[HMFTimer resume](self->_timer, "resume");
    }
  }

}

- (void)_unstageValue
{
  id stagedValue;
  HMFTimer *timer;

  self->_isStaged = 0;
  stagedValue = self->_stagedValue;
  self->_stagedValue = 0;

  timer = self->_timer;
  self->_timer = 0;

}

- (void)_commitValue:(id)a3
{
  objc_storeStrong(&self->_committedValue, a3);
  -[HMFStagedValue _unstageValue](self, "_unstageValue");
}

- (id)committedValue
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_committedValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isStaged
{
  HMFStagedValue *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isStaged;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCommittedValue:(id)a3
{
  id v4;
  id committedValue;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  committedValue = self->_committedValue;
  self->_committedValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMFStagedValue *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_isStaged && -[HMFTimer isEqual:](self->_timer, "isEqual:", v4))
  {
    v5 = self->_committedValue;
    v6 = self->_stagedValue;
    -[HMFStagedValue _unstageValue](self, "_unstageValue");
    os_unfair_lock_unlock(&self->_lock);
    -[HMFStagedValue delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1A1AC355C]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Notify of expired value: %@ committed value: %@ delegate: %@", (uint8_t *)&v12, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "stagedValue:didExpireValue:", v9, v6);

    }
    else
    {

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

+ (id)logCategory
{
  if (_MergedGlobals_53 != -1)
    dispatch_once(&_MergedGlobals_53, &__block_literal_global_4);
  return (id)qword_1ED0130C8;
}

void __29__HMFStagedValue_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("StagedValue"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0130C8;
  qword_1ED0130C8 = v0;

}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMFStagedValueDelegate)delegate
{
  return (HMFStagedValueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_committedValue, 0);
  objc_storeStrong(&self->_stagedValue, 0);
}

@end
