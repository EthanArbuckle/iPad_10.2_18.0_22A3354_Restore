@implementation HMFTimer

- (void)resume
{
  os_unfair_lock_s *p_lock;
  HMFTimer *v4;
  NSObject *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self;
  __activateIfNecessary(v4);
  __kick(v4);
  if (!v4->_running)
  {
    -[HMFTimer timer](v4, "timer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v5);

    v4->_running = 1;
  }

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setDelegateQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *delegateQueue;

  v4 = (OS_dispatch_queue *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_timer)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("HMFTimer delegateQueue can only be set before activation (resume/fire)"));
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFTimer)initWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  HMFTimer *v5;
  HMFTimer *v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HMFTimer *v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v5 = self;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    v10 = (void *)MEMORY[0x1A1AC355C](self, a2, a4);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMFTimer] Expiration, %f, must be greater than 0", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v13 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMFTimer;
    v7 = -[HMFTimer init](&v16, sel_init);
    if (v7)
    {
      v7->_timeInterval = a3;
      v7->_options = a4;
      if ((a4 & 2) != 0)
      {
        v14 = 1000000;
      }
      else
      {
        v8 = a3 * 1000000000.0;
        if ((a4 & 8) != 0)
          v9 = v8 * 0.5;
        else
          v9 = v8 / 10.0;
        v14 = (uint64_t)v9;
      }
      v7->_leeway = v14;
    }
    v5 = v7;
    v13 = v5;
  }

  return v13;
}

- (void)suspend
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __suspend(self);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)dealloc
{
  NSObject *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer && !self->_running)
    dispatch_resume(timer);
  v4.receiver = self;
  v4.super_class = (Class)HMFTimer;
  -[HMFTimer dealloc](&v4, sel_dealloc);
}

- (HMFTimerDelegate)delegate
{
  return (HMFTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)__handleExpiration
{
  void *v3;
  HMFOSTransaction *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v4 = -[HMFOSTransaction initWithName:]([HMFOSTransaction alloc], "initWithName:", CFSTR("com.apple.hmftimer.handle-expiration"));
  os_unfair_lock_lock_with_options();
  if (self->_running)
  {
    -[HMFTimer __fire](self, "__fire");
    os_unfair_lock_unlock(&self->_lock);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
    -[HMFTimer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timerDidFire:", self);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)__fire
{
  NSDate *v3;
  NSDate *fireDate;

  if ((-[HMFTimer options](self, "options") & 4) != 0)
  {
    __kick(self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    fireDate = self->_fireDate;
    self->_fireDate = v3;

    __suspend(self);
  }
}

- (HMFTimer)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  return CFSTR("Timer");
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  void *v8;
  HMFAttributeDescription *v9;
  HMFAttributeDescription *v10;
  void *v11;
  HMFAttributeDescription *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  HMFBooleanToString(-[HMFTimer isRunning](self, "isRunning"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Running"), v4);
  v6 = [HMFAttributeDescription alloc];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMFTimer timeInterval](self, "timeInterval", v5);
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Interval"), v8);
  v15[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  HMFBooleanToString((-[HMFTimer options](self, "options") >> 2) & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMFAttributeDescription initWithName:value:](v10, "initWithName:value:", CFSTR("Repeating"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)leeway
{
  return self->_leeway;
}

- (BOOL)isRunning
{
  HMFTimer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_running;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)fireDate
{
  os_unfair_lock_s *p_lock;
  NSDate *fireDate;
  NSDate *v5;
  NSDate *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  fireDate = self->_fireDate;
  if (fireDate)
  {
    v5 = fireDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setFireDate:(id)a3
{
  NSDate *v4;
  NSDate *fireDate;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  fireDate = self->_fireDate;
  self->_fireDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (OS_dispatch_queue)delegateQueue
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)kick
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __kick(self);
  os_unfair_lock_unlock(p_lock);
}

- (void)fire
{
  os_unfair_lock_s *p_lock;
  NSObject *timerQueue;
  qos_class_t v5;
  dispatch_qos_class_t v6;
  dispatch_block_t v7;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __activateIfNecessary(self);
  -[HMFTimer __fire](self, "__fire");
  os_unfair_lock_unlock(p_lock);
  timerQueue = self->_timerQueue;
  if ((self->_options & 0x10) != 0)
  {
    v6 = QOS_CLASS_USER_INITIATED;
  }
  else
  {
    v5 = qos_class_self();
    if (v5 <= QOS_CLASS_UTILITY)
      v6 = QOS_CLASS_UTILITY;
    else
      v6 = v5;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __16__HMFTimer_fire__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6, 0, block);
  dispatch_async(timerQueue, v7);

}

void __16__HMFTimer_fire__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerDidFire:", *(_QWORD *)(a1 + 32));

}

- (double)timeInterval
{
  return self->_timeInterval;
}

@end
