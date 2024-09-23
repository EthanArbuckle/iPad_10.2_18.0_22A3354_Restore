@implementation HMDTimeEvent

- (HMDTimeEvent)initWithModel:(id)a3 home:(id)a4
{
  HMDTimeEvent *v4;
  HMDTimeEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDTimeEvent;
  v4 = -[HMDEvent initWithModel:home:](&v7, sel_initWithModel_home_, a3, a4);
  v5 = v4;
  if (v4)
    -[HMDTimeEvent _initialize](v4, "_initialize");
  return v5;
}

- (void)_initialize
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *timerID;

  -[HMDEvent uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.homed.triggers."), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringWithSmallestEncoding");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  timerID = self->_timerID;
  self->_timerID = v6;

  -[HMDTimeEvent _updateRepetitive](self, "_updateRepetitive");
}

- (void)_updateRepetitive
{
  BOOL v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = 1;
LABEL_4:
    self->_repetitive = v3;
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
    goto LABEL_4;
  }
}

- (BOOL)isActive
{
  return (-[HMDEvent activationType](self, "activationType") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDTimeEvent;
  return -[HMDEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  HMDTimeEvent *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  HMDTimeEvent *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDTimeEvent *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDTimeEvent *v32;
  NSObject *v33;
  void *v34;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HMDTimeEvent;
  v7 = -[HMDEvent _activate:completionHandler:](&v37, sel__activate_completionHandler_, a3, 0);
  if (-[HMDTimeEvent isActive](self, "isActive"))
  {
    -[HMDTimeEvent _nextTimerDate](self, "_nextTimerDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HMDTimeEvent timerID](self, "timerID");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmf_localTimeDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v13;
        v40 = 2112;
        v41 = v9;
        v42 = 2112;
        v43 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting the next timer (%@) set to [%@]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDTimeEvent backgroundTaskManager](v11, "backgroundTaskManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v16 = objc_msgSend(v15, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v9, v8, v11, sel_handleTimerFiredNotification_, &v36);
      v17 = v36;

      if ((v16 & 1) == 0)
      {
        v18 = (void *)MEMORY[0x227676638]();
        v19 = v11;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v39 = v21;
          v40 = 2112;
          v41 = v9;
          v42 = 2112;
          v43 = v17;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to activate time trigger %@ with error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
      }
      v22 = _Block_copy(v6);
      v23 = v22;
      if (v22)
        (*((void (**)(void *, id))v22 + 2))(v22, v17);

    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get next time date", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      v9 = (void (**)(_QWORD, _QWORD))_Block_copy(v6);
      if (!v9)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v17);
    }

LABEL_22:
    goto LABEL_23;
  }
  -[HMDTimeEvent timerID](self, "timerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeEvent backgroundTaskManager](self, "backgroundTaskManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "cancelTaskWithIdentifier:onObserver:", v8, self);

  v25 = _Block_copy(v6);
  v26 = v25;
  if (v25)
    (*((void (**)(void *, _QWORD))v25 + 2))(v25, 0);

  v27 = (void *)MEMORY[0x227676638]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v30;
    v40 = 2112;
    v41 = v8;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Stopping the already scheduled timer with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
LABEL_23:

  return v7;
}

- (id)_nextTimerDate
{
  return 0;
}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDTimeEvent *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  HMDTimeEvent *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMD.BGTM.NK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDTimeEvent timerID](self, "timerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMDEventTriggerActivationTypeAsString(-[HMDEvent activationType](v10, "activationType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v12;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Timer has fired %@, current activation state: %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    if (-[HMDTimeEvent isActive](v10, "isActive"))
    {
      -[HMDEvent delegate](v10, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "didOccurEvent:causingDevice:", v10, 0);

      if (-[HMDTimeEvent repetitive](v10, "repetitive"))
      {
        -[HMDEvent eventTrigger](v10, "eventTrigger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "executeOnce");

        v18 = (void *)MEMORY[0x227676638]();
        v19 = v10;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
        if ((v17 & 1) != 0)
        {
          if (v21)
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138543362;
            v25 = v22;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Not-Reactivating the event as it does not have recurrences", (uint8_t *)&v24, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
        }
        else
        {
          if (v21)
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138543362;
            v25 = v23;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Reactivating the event as it does have some recurrences", (uint8_t *)&v24, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
          -[HMDTimeEvent _reactivateTriggerAfterDelay](v19, "_reactivateTriggerAfterDelay");
        }
      }
    }
  }

}

- (void)_reactivateTriggerAfterDelay
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 60000000000);
  -[HMDEvent workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke;
  block[3] = &unk_24E7972B0;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  void *v2;
  void *v3;

  -[HMDEvent home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundTaskManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDBackgroundTaskManager *)v3;
}

- (HMDTimeEvent)initWithCoder:(id)a3
{
  HMDTimeEvent *v3;
  HMDTimeEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDTimeEvent;
  v3 = -[HMDEvent initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HMDTimeEvent _initialize](v3, "_initialize");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDTimeEvent;
  -[HMDEvent encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void)invalidate
{
  void *v3;
  id v4;

  -[HMDTimeEvent backgroundTaskManager](self, "backgroundTaskManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDTimeEvent timerID](self, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelTaskWithIdentifier:onObserver:", v3, self);

}

- (NSString)timerID
{
  return self->_timerID;
}

- (BOOL)repetitive
{
  return self->_repetitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
}

void __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "eventTrigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke_2;
  v3[3] = &unk_24E799B48;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v2, "_activateWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Reactivated trigger after timer fired", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isValidAbsoluteDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  BOOL v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "minute") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = +[HMDTimeEvent isValidOffsetDateComponents:](HMDTimeEvent, "isValidOffsetDateComponents:", v5);
      goto LABEL_10;
    }
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      v10 = "%{public}@Minute and hour fields are not set in %@";
      v11 = v8;
      v12 = 22;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v15, v12);

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      v10 = "%{public}@Given date components is nil";
      v11 = v8;
      v12 = 12;
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v6);
  v13 = 0;
LABEL_10:

  return v13;
}

+ (BOOL)isValidOffsetDateComponents:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    if (objc_msgSend(v4, "minute") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "setMinute:", objc_msgSend(v4, "minute"));
    if (objc_msgSend(v4, "hour") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "setHour:", objc_msgSend(v4, "hour"));
    if (objc_msgSend(v4, "day") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "setDay:", objc_msgSend(v4, "day"));
    if (objc_msgSend(v4, "month") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "setMonth:", objc_msgSend(v4, "month"));
    v6 = objc_msgSend(v4, "isEqual:", v5);
    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Given date component contains non supported fields set: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_171313 != -1)
    dispatch_once(&logCategory__hmf_once_t14_171313, &__block_literal_global_171314);
  return (id)logCategory__hmf_once_v15_171315;
}

void __27__HMDTimeEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_171315;
  logCategory__hmf_once_v15_171315 = v0;

}

@end
