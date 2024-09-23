@implementation HMFExponentialBackoffTimer

- (void)__fire
{
  _BOOL4 v3;
  double timeInterval;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v3 = -[HMFExponentialBackoffTimer isIncreasing](self, "isIncreasing");
  timeInterval = self->super._timeInterval;
  v5 = (double)-[HMFExponentialBackoffTimer exponentialFactor](self, "exponentialFactor");
  if (v3)
  {
    v6 = timeInterval * v5;
    -[HMFExponentialBackoffTimer maximumTimeInterval](self, "maximumTimeInterval");
    if (v6 > v7)
    {
      -[HMFExponentialBackoffTimer maximumTimeInterval](self, "maximumTimeInterval");
LABEL_6:
      v6 = v8;
    }
  }
  else
  {
    v6 = timeInterval / v5;
    -[HMFExponentialBackoffTimer minimumTimeInterval](self, "minimumTimeInterval");
    if (v6 < v9)
    {
      -[HMFExponentialBackoffTimer minimumTimeInterval](self, "minimumTimeInterval");
      goto LABEL_6;
    }
  }
  self->super._timeInterval = v6;
  v10.receiver = self;
  v10.super_class = (Class)HMFExponentialBackoffTimer;
  -[HMFTimer __fire](&v10, sel___fire);
}

- (double)maximumTimeInterval
{
  return self->_maximumTimeInterval;
}

- (BOOL)isIncreasing
{
  return self->_increasing;
}

- (int64_t)exponentialFactor
{
  return self->_exponentialFactor;
}

- (HMFExponentialBackoffTimer)initWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return -[HMFExponentialBackoffTimer initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:](self, "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 1, a4, a3, a3);
}

- (HMFExponentialBackoffTimer)initWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4 exponentialFactor:(int64_t)a5 options:(unint64_t)a6
{
  HMFExponentialBackoffTimer *v6;
  double v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  HMFExponentialBackoffTimer *v17;
  HMFExponentialBackoffTimer *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v6 = self;
  v27 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v11 = (void *)MEMORY[0x1A1AC355C](self, a2, 0, a6, a3, a4);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      v14 = "%{public}@[HMFExponentialBackoffTimer] The exponential factor cannot be 0";
      v15 = v12;
      v16 = 12;
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v11);
    v17 = 0;
    goto LABEL_12;
  }
  v8 = a3;
  v9 = a5 > 0;
  if (a3 <= 0.0)
  {
    v11 = (void *)MEMORY[0x1A1AC355C](self, a2);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2048;
      v24 = v8;
      v14 = "%{public}@[HMFExponentialBackoffTimer] The minimum time interval, %f, must be greater than 0";
      v15 = v12;
      v16 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (a4 < a3)
  {
    v11 = (void *)MEMORY[0x1A1AC355C](self, a2);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v13;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = v8;
      v14 = "%{public}@[HMFExponentialBackoffTimer] The maximum time interval, %f, must be greater than or equal to the m"
            "inimum time interval, %f";
      v15 = v12;
      v16 = 32;
LABEL_10:
      _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a5 <= 0)
    a3 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMFExponentialBackoffTimer;
  v19 = -[HMFTimer initWithTimeInterval:options:](&v20, sel_initWithTimeInterval_options_, a6 | 4, a3);
  if (v19)
  {
    v19->_minimumTimeInterval = v8;
    v19->_maximumTimeInterval = a4;
    v19->_exponentialFactor = a5;
    v19->_increasing = v9;
  }
  v6 = v19;
  v17 = v6;
LABEL_12:

  return v17;
}

- (double)timeInterval
{
  os_unfair_lock_s *p_lock;
  double timeInterval;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  timeInterval = self->super._timeInterval;
  os_unfair_lock_unlock(p_lock);
  return timeInterval;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  if (-[HMFExponentialBackoffTimer isIncreasing](self, "isIncreasing"))
    -[HMFExponentialBackoffTimer minimumTimeInterval](self, "minimumTimeInterval");
  else
    -[HMFExponentialBackoffTimer maximumTimeInterval](self, "maximumTimeInterval");
  self->super._timeInterval = v4;
  if (self->super._running)
    __kick(self);
  os_unfair_lock_unlock(p_lock);
}

- (double)minimumTimeInterval
{
  return self->_minimumTimeInterval;
}

@end
