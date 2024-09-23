@implementation HMFOperationBudget

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("value")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("full")) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("empty")) ^ 1;
  }

  return v4;
}

- (HMFOperationBudget)init
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

- (HMFOperationBudget)initWithLimit:(unint64_t)a3 rate:(_HMFRate)a4
{
  unint64_t value;
  double period;
  double v6;
  HMFOperationBudget *v8;
  HMFOperationBudget *v9;
  HMFTimer *v10;
  HMFTimer *timer;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  objc_super v17;

  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Limit must be nonzero");
    goto LABEL_9;
  }
  value = a4.value;
  if (!a4.value || (period = a4.period, v6 = a4.period, a4.period <= 0.0))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Rate is invalid");
LABEL_9:
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMFOperationBudget;
  v8 = -[HMFOperationBudget init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_limit = a3;
    v8->_value = a3;
    v8->_rate.value = value;
    v8->_rate.period = period;
    v10 = -[HMFTimer initWithTimeInterval:options:]([HMFTimer alloc], "initWithTimeInterval:options:", 5, v6);
    timer = v9->_timer;
    v9->_timer = v10;

    -[HMFTimer setDelegate:](v9->_timer, "setDelegate:", v9);
  }
  return v9;
}

- (unint64_t)value
{
  unint64_t value;

  os_unfair_recursive_lock_lock_with_options();
  value = self->_value;
  os_unfair_recursive_lock_unlock();
  return value;
}

- (BOOL)isFull
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_value == self->_limit;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isEmpty
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_value == 0;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)reset
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_value != self->_limit)
  {
    -[HMFTimer suspend](self->_timer, "suspend");
    __updateValue(self, self->_limit);
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)decrement
{
  return -[HMFOperationBudget decrementByCount:](self, "decrementByCount:", 1);
}

- (BOOL)decrementByCount:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  HMFOperationBudget *v7;
  NSObject *v8;
  void *v9;
  unint64_t value;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMFOperationBudget *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  HMFOperationBudget *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = os_unfair_recursive_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1A1AC355C](v5);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v9;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Decrementing by %tu", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  value = v7->_value;
  if (value < a3)
  {
    v22 = (void *)MEMORY[0x1A1AC355C]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v25;
      _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Cannot decrement, not enough budget", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }
  else
  {
    v11 = -[HMFOperationBudget isFull](v7, "isFull");
    __updateValue(v7, v7->_value - a3);
    if (v11)
    {
      v13 = (void *)MEMORY[0x1A1AC355C]();
      v14 = v7;
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v16;
        _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Starting timer", (uint8_t *)&v27, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v12 = objc_msgSend(v14[2], "resume");
    }
    v17 = (void *)MEMORY[0x1A1AC355C](v12);
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v7->_value;
      v27 = 138543618;
      v28 = v20;
      v29 = 2048;
      v30 = v21;
      _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Successfully decremented to: %tu", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  os_unfair_recursive_lock_unlock();
  return value >= a3;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_1 != -1)
    dispatch_once(&_MergedGlobals_3_1, &__block_literal_global_11);
  return (id)qword_1ED012E98;
}

void __33__HMFOperationBudget_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("OperationBudget"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012E98;
  qword_1ED012E98 = v0;

}

- (void)timerDidFire:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMFOperationBudget *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMFOperationBudget *v16;
  NSObject *v17;
  void *v18;
  unint64_t value;
  int v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_unfair_recursive_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1A1AC355C](v5);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v9;
    _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Incrementing", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = v7->_rate.value + v7->_value;
  if (v10 >= v7->_limit)
  {
    v11 = (void *)MEMORY[0x1A1AC355C]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Stopping timer", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v12[2], "suspend");
    __updateValue(v12, v7->_limit);
  }
  else
  {
    __updateValue(v7, v10);
    v7->_value += v7->_rate.value;
  }
  v15 = (void *)MEMORY[0x1A1AC355C]();
  v16 = v7;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    value = v7->_value;
    v20 = 138543618;
    v21 = v18;
    v22 = 2048;
    v23 = value;
    _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Incremented to: %tu", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  os_unfair_recursive_lock_unlock();

}

- (unint64_t)limit
{
  return self->_limit;
}

- (_HMFRate)rate
{
  _HMFRate *p_rate;
  unint64_t value;
  double period;
  _HMFRate result;

  p_rate = &self->_rate;
  value = self->_rate.value;
  period = p_rate->period;
  result.period = period;
  result.value = value;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
