@implementation HMFOperation

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMFOperation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __21__HMFOperation_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "main");
}

- (BOOL)isFinished
{
  HMFOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  HMFOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("executing")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("finished")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("isFinished")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___HMFOperation;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setQualityOfService:(int64_t)a3
{
  NSObject *queue;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMFOperation;
  -[HMFOperation setQualityOfService:](&v7, sel_setQualityOfService_);
  queue = self->_queue;
  dispatch_get_global_queue(a3, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(queue, v6);

  self->_qosWasSet = 1;
}

- (OS_dispatch_queue)underlyingQueue
{
  return self->_queue;
}

- (void)start
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMFOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMFOperation *v10;
  NSObject *v11;
  void *v12;
  HMFActivity *activity;
  OS_voucher *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMFActivity *v19;
  HMFActivity *v20;
  void *v21;
  HMFOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMFActivity *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMFOperation *v32;
  NSObject *v33;
  void *v34;
  HMFOperation *v35;
  void *v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isExecuting"), CFSTR("isFinished"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation _willChangeValuesForKeys:](self, "_willChangeValuesForKeys:", v3);

  v4 = os_unfair_lock_lock_with_options();
  if (self->_executing)
  {
    v31 = (void *)MEMORY[0x1A1AC355C](v4);
    v32 = self;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v34;
      _os_log_impl(&dword_19B546000, v33, OS_LOG_TYPE_ERROR, "%{public}@Operation is already executing", buf, 0xCu);

    }
LABEL_24:

    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Operation is already executing."), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  if ((-[HMFOperation isReady](self, "isReady") & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1A1AC355C]();
    v35 = self;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v36;
      _os_log_impl(&dword_19B546000, v33, OS_LOG_TYPE_ERROR, "%{public}@Operation is not ready", buf, 0xCu);

    }
    goto LABEL_24;
  }
  if (self->_finished || -[HMFOperation isCancelled](self, "isCancelled"))
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Operation is already complete, aborting.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    if (!self->_finished)
    {
      self->_finished = 1;
      v9 = (void *)MEMORY[0x1A1AC355C]();
      v10 = v6;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v12;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Cancelled operation was not marked finished, marking finished", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
  }
  else
  {
    activity = self->_activity;
    if (!activity)
    {
      v14 = self->_voucher;
      voucher_adopt();
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[HMFOperation identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Operation:%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[HMFActivity initWithName:]([HMFActivity alloc], "initWithName:", v18);
      v20 = self->_activity;
      self->_activity = v19;

      -[HMFActivity end](self->_activity, "end");
      activity = self->_activity;
    }
    -[HMFActivity begin](activity, "begin");
    v21 = (void *)MEMORY[0x1A1AC355C](-[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("Starting operation")));
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Starting operation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    self->_executing = 1;
    -[HMFOperation timer](v22, "timer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resume");

    v26 = self->_activity;
    if (v22->_qosWasSet)
    {
      v27 = -[HMFOperation qualityOfService](v22, "qualityOfService");
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __21__HMFOperation_start__block_invoke;
      v39[3] = &unk_1E3B37AF8;
      v39[4] = v22;
      -[HMFActivity blockWithQualityOfService:block:](v26, "blockWithQualityOfService:block:", v27, v39);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __21__HMFOperation_start__block_invoke_2;
      v38[3] = &unk_1E3B37AF8;
      v38[4] = v22;
      -[HMFActivity blockWithBlock:](v26, "blockWithBlock:", v38);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v28;
    dispatch_async((dispatch_queue_t)v22->_queue, v28);
    -[HMFActivity end](self->_activity, "end");

  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isExecuting"), CFSTR("isFinished"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation _didChangeValuesForKeys:](self, "_didChangeValuesForKeys:", v30);

}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)finish
{
  void *v3;
  void *v4;
  HMFOperation *v5;
  NSObject *v6;
  void *v7;
  NSError *error;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isExecuting"), CFSTR("isFinished"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation _willChangeValuesForKeys:](self, "_willChangeValuesForKeys:", v3);

  os_unfair_lock_lock_with_options();
  if ((-[HMFOperation isCancelled](self, "isCancelled") & 1) == 0 && !self->_finished)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finishing operation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    error = v5->_error;
    v5->_error = 0;

    if (v5->_executing)
    {
      v5->_executing = 0;
      self->_finished = 1;
    }
    -[HMFActivity invalidate](v5->_activity, "invalidate");
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isExecuting"), CFSTR("isFinished"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation _didChangeValuesForKeys:](self, "_didChangeValuesForKeys:", v9);

}

- (HMFOperation)initWithTimeout:(double)a3
{
  HMFOperation *v4;
  uint64_t v5;
  NSUUID *identifier;
  const char *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  OS_voucher *voucher;
  void *v12;
  void *v13;
  HMFTimer *v14;
  HMFTimer *timer;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMFOperation;
  v4 = -[HMFOperation init](&v17, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v4->_identifier;
    v4->_identifier = (NSUUID *)v5;

    v7 = (const char *)HMFDispatchQueueName(v4, 0);
    v8 = dispatch_queue_create(v7, 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    v10 = voucher_copy();
    voucher = v4->_voucher;
    v4->_voucher = (OS_voucher *)v10;

    -[HMFOperation identifier](v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation setName:](v4, "setName:", v13);

    if (a3 > 0.0)
    {
      v14 = -[HMFTimer initWithTimeInterval:options:]([HMFTimer alloc], "initWithTimeInterval:options:", 0, a3);
      timer = v4->_timer;
      v4->_timer = v14;

      -[HMFTimer setDelegate:](v4->_timer, "setDelegate:", v4);
    }
  }
  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setActivity:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  HMFOperation *v8;
  NSObject *v9;
  void *v10;
  HMFOperation *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_unfair_lock_lock_with_options();
    if (self->_executing || self->_finished)
    {
      v7 = (void *)MEMORY[0x1A1AC355C](v6);
      v8 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot set an activity once an operation has started executing", (uint8_t *)&v13, 0xCu);

      }
    }
    else
    {
      if (!self->_activity)
      {
        objc_storeStrong((id *)&self->_activity, a3);
        goto LABEL_7;
      }
      v7 = (void *)MEMORY[0x1A1AC355C]();
      v11 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot set an activity once an activity has been set", (uint8_t *)&v13, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v7);
LABEL_7:
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (HMFOperation)init
{
  return -[HMFOperation initWithTimeout:](self, "initWithTimeout:", 0.0);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (NSError)error
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_error;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)timeoutDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMFOperation timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

uint64_t __21__HMFOperation_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "main");
}

- (void)main
{
  void *v3;
  HMFOperation *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Subclasses should override main", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMFOperation cancelWithError:](self, "cancelWithError:", v3);

}

- (void)cancelWithError:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMFOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  if (!self->_finished)
    objc_storeStrong((id *)&self->_error, a3);
  os_unfair_lock_unlock(&self->_lock);
  v13.receiver = self;
  v13.super_class = (Class)HMFOperation;
  -[HMFOperation cancel](&v13, sel_cancel);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isExecuting"), CFSTR("isFinished"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation _willChangeValuesForKeys:](self, "_willChangeValuesForKeys:", v6);

  v7 = os_unfair_lock_lock_with_options();
  if (!self->_finished)
  {
    v8 = (void *)MEMORY[0x1A1AC355C](v7);
    v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (v9->_executing)
    {
      v9->_executing = 0;
      self->_finished = 1;
    }
    -[HMFActivity invalidate](v9->_activity, "invalidate");
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isExecuting"), CFSTR("isFinished"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation _didChangeValuesForKeys:](self, "_didChangeValuesForKeys:", v12);

}

- (HMFActivity)activity
{
  os_unfair_lock_s *p_lock;
  HMFActivity *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_activity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_16 != -1)
    dispatch_once(&_MergedGlobals_3_16, &__block_literal_global_43);
  return (id)qword_1ED013008;
}

void __27__HMFOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Operation"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013008;
  qword_1ED013008 = v0;

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFOperation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMFOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Operation timed out, cancelling", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFOperation cancelWithError:](v6, "cancelWithError:", v9);

}

@end
