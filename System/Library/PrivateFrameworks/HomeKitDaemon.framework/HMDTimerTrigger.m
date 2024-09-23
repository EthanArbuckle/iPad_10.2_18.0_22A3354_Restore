@implementation HMDTimerTrigger

- (HMDTimerTrigger)initWithName:(id)a3 uuid:(id)a4
{
  HMDTimerTrigger *v4;
  HMDTimerTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *timerID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDTimerTrigger;
  v4 = -[HMDTrigger initWithName:uuid:](&v11, sel_initWithName_uuid_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HMDTrigger uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.homed.timertriggers."), "stringByAppendingString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    timerID = v5->_timerID;
    v5->_timerID = (NSString *)v8;

    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (HMDTimerTrigger)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDTimerTrigger *v7;
  uint64_t v8;
  NSDate *fireDate;
  void *v10;
  uint64_t v11;
  NSTimeZone *fireDateTimeZone;
  void *v13;
  uint64_t v14;
  NSDateComponents *fireRepeatInterval;
  void *v16;
  uint64_t v17;
  NSArray *recurrences;
  uint64_t v19;
  NSString *significantEvent;
  void *v21;
  uint64_t v22;
  NSDateComponents *significantEventOffset;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMDTimerTrigger;
  v7 = -[HMDTrigger initWithModel:home:](&v25, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "fireDate");
    v8 = objc_claimAutoreleasedReturnValue();
    fireDate = v7->_fireDate;
    v7->_fireDate = (NSDate *)v8;

    objc_msgSend(v6, "fireDateTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decodeTimeZone");
    v11 = objc_claimAutoreleasedReturnValue();
    fireDateTimeZone = v7->_fireDateTimeZone;
    v7->_fireDateTimeZone = (NSTimeZone *)v11;

    objc_msgSend(v6, "fireRepeatInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decodeDateComponents");
    v14 = objc_claimAutoreleasedReturnValue();
    fireRepeatInterval = v7->_fireRepeatInterval;
    v7->_fireRepeatInterval = (NSDateComponents *)v14;

    objc_msgSend(v6, "recurrences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "decodeArrayOfDateComponents");
    v17 = objc_claimAutoreleasedReturnValue();
    recurrences = v7->_recurrences;
    v7->_recurrences = (NSArray *)v17;

    objc_msgSend(v6, "significantEvent");
    v19 = objc_claimAutoreleasedReturnValue();
    significantEvent = v7->_significantEvent;
    v7->_significantEvent = (NSString *)v19;

    objc_msgSend(v6, "significantEventOffset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "decodeDateComponents");
    v22 = objc_claimAutoreleasedReturnValue();
    significantEventOffset = v7->_significantEventOffset;
    v7->_significantEventOffset = (NSDateComponents *)v22;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMDTimerTrigger;
  v15 = (void *)MEMORY[0x24BDD16A8];
  -[HMFObject description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger fireDate](self, "fireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_localTimeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger significantEvent](self, "significantEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "second");
  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger recurrences](self, "recurrences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<Timer-Trigger: %@, fireDate = %@, fireDateTimeZone = %@,                             significantEvent = %@, significantEventOffset = %tu, repeatInterval: %@, recurrences = %@"), v3, v5, v6, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)HMDTimerTrigger;
  -[HMFObject description](&v16, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v13);

  return v12;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HMDTimerTrigger;
  -[HMDTrigger dumpState](&v23, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger fireDate](self, "fireDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDTimerTrigger fireDate](self, "fireDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[HMDTimerTrigger fireDate](self, "fireDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmf_localTimeDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger significantEvent](self, "significantEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "second");
  -[HMDTimerTrigger recurrences](self, "recurrences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("initial fire date: %@, time zone: %@, sig-event: %@, sig-event-offset: %tu, repeat interval: %f seconds, recur-instances: %@"), v15, v16, v17, v19, v12, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE3EB78]);
  return v4;
}

- (unint64_t)triggerType
{
  return 2;
}

- (NSDate)currentFireDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentFireDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentFireDate:(id)a3
{
  NSDate *v4;
  NSDate *currentFireDate;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  currentFireDate = self->_currentFireDate;
  self->_currentFireDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDTimerTrigger *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDTimerTrigger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)HMDTimerTrigger;
  -[HMDTrigger configure:messageDispatcher:queue:](&v28, sel_configure_messageDispatcher_queue_, v8, v9, v10);
  -[HMDTimerTrigger timerID](self, "timerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[HMDTrigger uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.homed.timertriggers."), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setTimerID:](self, "setTimerID:", v14);

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTimerTrigger timerID](v16, "timerID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Null timerID -- initializing with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger fireDate](v21, "fireDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger fireDateTimeZone](v21, "fireDateTimeZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger timerID](v21, "timerID");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend(v26, "cStringUsingEncoding:", 4);
    *(_DWORD *)buf = 138544130;
    v30 = v23;
    v31 = 2112;
    v32 = v24;
    v33 = 2112;
    v34 = v25;
    v35 = 2080;
    v36 = v27;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Configuring with firedate %@ and timezone %@ for %s", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDTimerTrigger _activateWithCompletion:](v21, "_activateWithCompletion:", 0);

}

- (void)completeConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDTrigger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__HMDTimerTrigger_completeConfiguration__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDTrigger home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDTimerTrigger;
  -[HMDTrigger dealloc](&v6, sel_dealloc);
}

- (void)timerTriggered
{
  void *v3;
  HMDTimerTrigger *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Timer Triggered", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_initWeak((id *)buf, v4);
  -[HMDTrigger workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMDTimerTrigger_timerTriggered__block_invoke;
  block[3] = &unk_24E797318;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)invalidate
{
  void *v3;
  HMDTimerTrigger *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating the trigger", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger timerID](v4, "timerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelTaskWithIdentifier:onObserver:", v8, v4);

  v9.receiver = v4;
  v9.super_class = (Class)HMDTimerTrigger;
  -[HMDTrigger invalidate](&v9, sel_invalidate);
}

- (void)_startTimerWithFireDate:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDTimerTrigger *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDTimerTrigger *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "timeIntervalSinceNow");
  if (v6 <= 0.0)
  {
    -[HMDTimerTrigger getCalendar](self, "getCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger getFireInterval](self, "getFireInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v9, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hmf_localTimeDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Revised Next Fire Date %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v7 = v4;
  }
  v15 = (void *)MEMORY[0x227676638](v5);
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_localTimeDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Next fire date %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDTimerTrigger _startTimer:](v16, "_startTimer:", v7);

}

- (void)_startTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDTimerTrigger *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDTimerTrigger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDTimerTrigger *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[HMDTrigger active](self, "active")
      && -[HMDTimerTrigger shouldActivateOnLocalDevice](self, "shouldActivateOnLocalDevice"))
    {
      +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTimerTrigger timerID](self, "timerID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v6, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v7, v4, self, sel_handleTimerFiredNotification_, &v26);
      v8 = v26;

      if (v8)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDTimerTrigger timerID](v10, "timerID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v28 = v12;
          v29 = 2112;
          v30 = v13;
          v31 = 2112;
          v32 = v8;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v9);

        goto LABEL_15;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDTrigger name](v15, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Trigger %@ not activated on local device - skipping scheduling the trigger", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    -[HMDTimerTrigger setCurrentFireDate:](self, "setCurrentFireDate:", v4);
    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger name](v20, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger uuid](v20, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v22;
    v29 = 2112;
    v30 = v23;
    v31 = 2112;
    v32 = v25;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@/%@: Home reference is nil", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_15:

}

- (void)_stopTimer
{
  void *v3;
  void *v4;

  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger timerID](self, "timerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelTaskWithIdentifier:onObserver:", v4, self);

  -[HMDTimerTrigger setCurrentFireDate:](self, "setCurrentFireDate:", 0);
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)HMDTimerTrigger;
  -[HMDTrigger _registerForMessages](&v9, sel__registerForMessages);
  -[HMDTrigger home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:](HMDXPCBackgroundMessagePolicy, "policyWithEntitlementRequirement:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kScheduleTimerTriggerRequestKey"), self, v8, sel__handleUpdateTimerTriggerPropertiesRequest_);

}

- (void)_handleUpdateTimerTriggerPropertiesRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[HMDTimerTrigger emptyModelObject](self, "emptyModelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMDTimerTrigger fireDate](self, "fireDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDTimerTrigger validateTriggerModel:message:currentFireDate:](HMDTimerTrigger, "validateTriggerModel:message:currentFireDate:", v6, v14, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transaction:options:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "add:withMessage:", v8, v14);
    objc_msgSend(v13, "run");

  }
}

- (void)_handleUpdateTimerTriggerPropertiesModel:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  objc_msgSend(v33, "setProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("fireDate"));

  if (v8)
  {
    objc_msgSend(v33, "fireDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setFireDate:](self, "setFireDate:", v9);

  }
  objc_msgSend(v33, "setProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("fireDateTimeZone"));

  if (v11)
  {
    objc_msgSend(v33, "fireDateTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "decodeTimeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setFireDateTimeZone:](self, "setFireDateTimeZone:", v13);

    v8 = 1;
  }
  objc_msgSend(v33, "setProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", CFSTR("fireRepeatInterval"));

  if (v15)
  {
    objc_msgSend(v33, "fireRepeatInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "decodeDateComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setFireRepeatInterval:](self, "setFireRepeatInterval:", v17);

    v8 = 1;
  }
  objc_msgSend(v33, "setProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", CFSTR("recurrences"));

  if (v19)
  {
    objc_msgSend(v33, "recurrences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "decodeArrayOfDateComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setRecurrences:](self, "setRecurrences:", v21);

    v8 = 1;
  }
  objc_msgSend(v33, "setProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", CFSTR("significantEvent"));

  if (v23)
  {
    objc_msgSend(v33, "significantEvent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setSignificantEvent:](self, "setSignificantEvent:", v24);

    v8 = 1;
  }
  objc_msgSend(v33, "setProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", CFSTR("significantEventOffset"));

  if (v26)
  {
    objc_msgSend(v33, "significantEventOffset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "decodeDateComponents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTimerTrigger setSignificantEventOffset:](self, "setSignificantEventOffset:", v28);

LABEL_14:
    objc_msgSend(v6, "messagePayload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    HMDRemoteMessagePayloadKeysForTransportMetadata();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObjectsForKeys:", v31);

    -[HMDTimerTrigger _serializeForAdd](self, "_serializeForAdd");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addEntriesFromDictionary:", v32);

    objc_msgSend(v6, "respondWithPayload:", v30);
    goto LABEL_15;
  }
  if (v8)
    goto LABEL_14;
LABEL_15:

}

- (void)_handleTimerTriggerUpdate:(id)a3 message:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[HMDTimerTrigger _handleUpdateTimerTriggerPropertiesModel:message:](self, "_handleUpdateTimerTriggerPropertiesModel:message:", v7, v6);
  -[HMDTrigger _handleTriggerUpdate:message:](self, "_handleTriggerUpdate:message:", v7, v6);

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDTimerTriggerModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDTimerTriggerModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = [HMDTimerTriggerModel alloc];
  -[HMDTrigger uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  -[HMDTrigger _fillBaseObjectChangeModel:](self, "_fillBaseObjectChangeModel:", v9);
  -[HMDTimerTrigger fireDate](self, "fireDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTriggerModel setFireDate:](v9, "setFireDate:", v10);

  v11 = (void *)MEMORY[0x24BDD1618];
  -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTriggerModel setFireDateTimeZone:](v9, "setFireDateTimeZone:", v13);

  -[HMDTimerTrigger significantEvent](self, "significantEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTriggerModel setSignificantEvent:](v9, "setSignificantEvent:", v14);

  v15 = (void *)MEMORY[0x24BDD1618];
  -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTriggerModel setSignificantEventOffset:](v9, "setSignificantEventOffset:", v17);

  v18 = (void *)MEMORY[0x24BDD1618];
  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTriggerModel setFireRepeatInterval:](v9, "setFireRepeatInterval:", v20);

  v21 = (void *)MEMORY[0x24BDD1618];
  -[HMDTimerTrigger recurrences](self, "recurrences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTriggerModel setRecurrences:](v9, "setRecurrences:", v23);

  return v9;
}

- (id)emptyModelObject
{
  HMDTimerTriggerModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDTimerTriggerModel *v7;

  v3 = [HMDTimerTriggerModel alloc];
  -[HMDTrigger uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[HMDTimerTrigger modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger fireDate](self, "fireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDTimerTrigger fireDate](self, "fireDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kTimerTriggerInitialFireDateKey"));

  }
  -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1618];
    -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kTimerTriggerTimeZoneDataKey"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kTimerTriggerResetTimeZoneDataKey"));
  }
  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1618];
    -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kTimerTriggerRecurrenceDataKey"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kTimerTriggerResetRecurrenceDataKey"));
  }
  -[HMDTimerTrigger recurrences](self, "recurrences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD1618];
    -[HMDTimerTrigger recurrences](self, "recurrences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("kTimerTriggerRecurrencesKey"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kTimerTriggerResetRecurrencesKey"));
  }
  -[HMDTimerTrigger significantEvent](self, "significantEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDTimerTrigger significantEvent](self, "significantEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("kTimerTriggerSignificantEventKey"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kTimerTriggerResetSignificantEventKey"));
  }
  -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD1618];
    -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("kTimerTriggerSignificantEventOffsetKey"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kTimerTriggerResetSignificantEventOffsetKey"));
  }
  return v3;
}

- (BOOL)_reactivateTrigger
{
  void *v3;

  -[HMDTimerTrigger fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[HMDTimerTrigger _reactivateFireDateTrigger](self, "_reactivateFireDateTrigger");
  else
    return -[HMDTimerTrigger _reactivateSignificantEventTrigger](self, "_reactivateSignificantEventTrigger");
}

- (BOOL)_reactivateFireDateTrigger
{
  void *v3;
  void *v4;
  HMDTimerTrigger *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDTimerTrigger _nextFireDate](self, "_nextFireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDTimerTrigger _startTimerWithFireDate:](self, "_startTimerWithFireDate:", v3);
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@No valid next fire date, disabling the timer", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDTimerTrigger _disableTimerOffReactivationFailure](v5, "_disableTimerOffReactivationFailure");
  }

  return 1;
}

- (BOOL)_reactivateSignificantEventTrigger
{
  void *v3;
  void *v4;
  HMDTimerTrigger *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDTimerTrigger _nextSignificantEventFireDate](self, "_nextSignificantEventFireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hmf_localTimeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting timer based on significant event with %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDTimerTrigger _startTimerWithSignificantEventDate:](v5, "_startTimerWithSignificantEventDate:", v3);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@No valid next significant fire date, disabling the timer", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDTimerTrigger _disableTimerOffReactivationFailure](v5, "_disableTimerOffReactivationFailure");
  }

  return 1;
}

- (void)_disableTimerOffReactivationFailure
{
  -[HMDTimerTrigger _stopTimer](self, "_stopTimer");
  -[HMDTrigger setEnabled:message:](self, "setEnabled:message:", 0, 0);
}

- (BOOL)shouldActivateOnLocalDevice
{
  void *v3;
  char v4;
  objc_super v6;

  -[HMDTrigger home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)HMDTimerTrigger;
  if (-[HMDTrigger shouldActivateOnLocalDevice](&v6, sel_shouldActivateOnLocalDevice))
    v4 = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident");
  else
    v4 = 0;

  return v4;
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HMDTimerTrigger__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_24E797698;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = _Block_copy(aBlock);
  if (-[HMDTrigger active](self, "active"))
    v7 = -[HMDTimerTrigger shouldActivateOnLocalDevice](self, "shouldActivateOnLocalDevice");
  else
    v7 = 0;
  -[HMDTrigger _activate:completionHandler:](self, "_activate:completionHandler:", v7, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (id)_nextFireDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDTimerTrigger *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDTimerTrigger fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger getFireInterval](self, "getFireInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HMDTimerTrigger _closestDatesForStartDate:earliestDate:timeZone:deliveryRepeatInterval:returnDateBefore:returnDateAfter:](self, "_closestDatesForStartDate:earliestDate:timeZone:deliveryRepeatInterval:returnDateBefore:returnDateAfter:", v3, v4, v5, v6, 0, &v13);
  v7 = v13;

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Next Fire Date : [%@]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  return v7;
}

- (id)_nextSignificantEventFireDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDTrigger home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeLocationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger significantEvent](self, "significantEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSignificantTimeEvent nextTimerDateFromHomeLocation:signifiantEvent:offset:loggingObject:](HMDSignificantTimeEvent, "nextTimerDateFromHomeLocation:signifiantEvent:offset:loggingObject:", v5, v6, v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldExecuteActionSet
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  HMDTimerTrigger *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  HMDTimerTrigger *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[HMDTimerTrigger recurrences](self, "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimerTrigger recurrences](self, "recurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "components:fromDate:", 512, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HMDTimerTrigger recurrences](self, "recurrences");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v10)
  {
    v11 = v10;
    v26 = v8;
    v27 = v5;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v18;
          v35 = 2112;
          v36 = v14;
          v37 = 2112;
          v38 = v9;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Comparing date components iter: %@, now: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
        v19 = objc_msgSend(v9, "weekday");
        if (v19 == objc_msgSend(v14, "weekday"))
        {
          v21 = (void *)MEMORY[0x227676638]();
          v22 = v16;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v34 = v24;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Current week day matches with a recurring instance, allowing execution of action set", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v21);
          v20 = 1;
          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v11)
        continue;
      break;
    }
    v20 = 0;
LABEL_18:
    v8 = v26;
    v5 = v27;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_timerTriggered
{
  _BOOL4 v3;
  void *v4;
  HMDTimerTrigger *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDTimerTrigger _shouldExecuteActionSet](self, "_shouldExecuteActionSet");
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to execute the Action set.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __34__HMDTimerTrigger__timerTriggered__block_invoke;
    v10[3] = &unk_24E79B7E0;
    v10[4] = v5;
    -[HMDTrigger _executeActionSetsWithCompletionHandler:](v5, "_executeActionSetsWithCompletionHandler:", v10);
    -[HMDTrigger triggerFired](v5, "triggerFired");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Should execute action set returned NO, going ahead to reactivate trigger", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  -[HMDTimerTrigger _reactiveTriggerAfterDelay](v5, "_reactiveTriggerAfterDelay");
}

- (void)_reactiveTriggerAfterDelay
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, (uint64_t)(*(double *)&minimumTimerRecurrence / 30.0 * 1000000000.0));
  -[HMDTrigger workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__HMDTimerTrigger__reactiveTriggerAfterDelay__block_invoke;
  v5[3] = &unk_24E797318;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_closestDatesForStartDate:(id)a3 earliestDate:(id)a4 timeZone:(id)a5 deliveryRepeatInterval:(id)a6 returnDateBefore:(id *)a7 returnDateAfter:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  HMDTimerTrigger *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  HMDTimerTrigger *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id *v41;
  HMDTimerTrigger *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  HMDTimerTrigger *v50;
  void *v51;
  id v52;
  void *v53;
  HMDTimerTrigger *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  HMDTimerTrigger *v58;
  void *v59;
  id v60;
  void *v61;
  HMDTimerTrigger *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *context;
  void *contexta;
  id v70;
  void *v71;
  HMDTimerTrigger *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  HMDTimerTrigger *v77;
  HMDTimerTrigger *v78;
  void *v80;
  id *v81;
  NSObject *v82;
  void *v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  -[HMDTimerTrigger getCalendar](self, "getCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v13, "compare:", v18);

  if (v19 != 1)
  {
    if (v15)
    {
      v31 = objc_msgSend(v83, "secondsFromGMT");
      v32 = objc_msgSend(v15, "secondsFromGMT");
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v13, (double)(v31 - v32));
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = v13;
    }
    v29 = v33;
    if (v16)
    {
      v77 = self;
      v70 = v13;
      v34 = 0;
      v35 = 1;
      do
      {
        v36 = v34;
        v37 = v35;
        _NCSchedulerDateWithMultiple(v29, v17, v16, v35);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 *= 2;
      }
      while (objc_msgSend(v34, "compare:", v14) == -1);
      v76 = v15;
      if (v37 < 2)
      {
        v40 = v37;
        v28 = v34;
      }
      else
      {
        v38 = v37 >> 1;
        v39 = (unint64_t)(float)((float)(v37 - (v37 >> 1)) * 0.5) + (v37 >> 1);
        do
        {
          v40 = v39;
          _NCSchedulerDateWithMultiple(v29, v17, v16, v39);
          v28 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v28, "compare:", v14) == -1)
            v38 = v40;
          else
            v37 = v40;
          v39 = v38 + (unint64_t)((float)(v37 - v38) * 0.5);
          v34 = v28;
        }
        while (v37 - v38 > 1);
      }
      v46 = objc_msgSend(v28, "compare:", v14);
      if (v46 == 1)
      {
        self = v77;
        if (a8)
        {
          *a8 = objc_retainAutorelease(v28);
          v73 = (void *)MEMORY[0x227676638]();
          v54 = v77;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = objc_claimAutoreleasedReturnValue();
            v67 = *a8;
            contexta = (void *)v56;
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v85 = v56;
            v86 = 2112;
            v87 = v67;
            self = v77;
            v88 = 2112;
            v89 = v57;
            _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@(d) Timer fires next at %@; current time (GMT): %@",
              buf,
              0x20u);

          }
          objc_autoreleasePoolPop(v73);
        }
        if (a7)
        {
          _NCSchedulerDateWithMultiple(v29, v17, v16, v40 - 1);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          v74 = (void *)MEMORY[0x227676638]();
          v58 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = *a7;
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v85 = (uint64_t)v59;
            v86 = 2112;
            v87 = v60;
            self = v77;
            v88 = 2112;
            v89 = v61;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@(e) Timer fires next at %@; current time (GMT): %@",
              buf,
              0x20u);

          }
          v13 = v70;
          v30 = v74;
          goto LABEL_47;
        }
        v13 = v70;
      }
      else
      {
        self = v77;
        if (!v46)
        {
          v28 = objc_retainAutorelease(v28);
          *a8 = v28;
          v30 = (void *)MEMORY[0x227676638]();
          v62 = v77;
          HMFGetOSLogHandle();
          v82 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            v13 = v70;
            v15 = v76;
            v22 = v82;
            goto LABEL_51;
          }
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = *a8;
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v85 = (uint64_t)v63;
          v86 = 2112;
          v87 = v64;
          self = v77;
          v22 = v82;
          v88 = 2112;
          v89 = v65;
          _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_INFO, "%{public}@(f) Timer fires next at %@; current time (GMT): %@",
            buf,
            0x20u);

          v13 = v70;
LABEL_47:
          v15 = v76;
LABEL_51:

          objc_autoreleasePoolPop(v30);
          goto LABEL_52;
        }
        v13 = v70;
        if (v46 == -1)
        {
          if (a7)
          {
            *a7 = objc_retainAutorelease(v28);
            context = (void *)MEMORY[0x227676638]();
            v72 = v77;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v48 = objc_claimAutoreleasedReturnValue();
              v66 = *a7;
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v49 = (void *)v48;
              v85 = v48;
              v86 = 2112;
              v87 = v66;
              self = v77;
              v88 = 2112;
              v89 = v80;
              _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@(b) Timer fires next at %@; current time (GMT): %@",
                buf,
                0x20u);

            }
            objc_autoreleasePoolPop(context);
            v13 = v70;
          }
          if (a8)
          {
            _NCSchedulerDateWithMultiple(v29, v17, v16, v40 + 1);
            v81 = a8;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            v30 = (void *)MEMORY[0x227676638]();
            v50 = self;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = *v81;
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v85 = (uint64_t)v51;
              v86 = 2112;
              v87 = v52;
              self = v77;
              v88 = 2112;
              v89 = v53;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@(c) Timer fires next at %@; current time (GMT): %@",
                buf,
                0x20u);

              v13 = v70;
            }
            goto LABEL_47;
          }
        }
      }
      v15 = v76;
      goto LABEL_52;
    }
    if (objc_msgSend(v33, "compare:", v14) == -1)
    {
      v41 = a7;
      if (!a7)
        goto LABEL_23;
    }
    else
    {
      v41 = a8;
      if (!a8)
      {
LABEL_23:
        v30 = (void *)MEMORY[0x227676638]();
        v42 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v78 = self;
          v44 = v15;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v85 = (uint64_t)v43;
          v86 = 2112;
          v87 = v29;
          v88 = 2112;
          v89 = v45;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@(g) Timer fires next at %@; current time (GMT): %@",
            buf,
            0x20u);

          v15 = v44;
          self = v78;

        }
        v28 = 0;
        goto LABEL_51;
      }
    }
    *v41 = objc_retainAutorelease(v29);
    goto LABEL_23;
  }
  if (a8)
  {
    v20 = a8;
    *a8 = objc_retainAutorelease(v13);
    v71 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22;
      v25 = self;
      v26 = *v20;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v75 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = (uint64_t)v23;
      v86 = 2112;
      v87 = v26;
      self = v25;
      v22 = v24;
      v88 = 2112;
      v89 = v27;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@(a) Timer fires next at %@; current time (GMT): %@",
        buf,
        0x20u);

      v15 = v75;
    }
    v28 = 0;
    v29 = 0;
    v30 = v71;
    goto LABEL_51;
  }
  v28 = 0;
  v29 = 0;
LABEL_52:

}

- (id)getCalendar
{
  void *v2;
  void *v3;

  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDTimerTrigger getCalendar:](HMDTimerTrigger, "getCalendar:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getFireInterval
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[HMDTimerTrigger fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_6;
  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMDTimerTrigger recurrences](self, "recurrences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v5, "setDay:", 1);
      return v5;
    }
LABEL_6:
    v5 = 0;
    return v5;
  }
  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (HMDTimerTrigger)initWithCoder:(id)a3
{
  id v4;
  HMDTimerTrigger *v5;
  uint64_t v6;
  NSDate *fireDate;
  uint64_t v8;
  NSTimeZone *fireDateTimeZone;
  uint64_t v10;
  NSDateComponents *fireRepeatInterval;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *recurrences;
  uint64_t v17;
  NSString *timerID;
  uint64_t v19;
  NSString *significantEvent;
  uint64_t v21;
  NSDateComponents *significantEventOffset;
  NSDateComponents *v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMDTimerTrigger;
  v5 = -[HMDTrigger initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerInitialFireDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerTimeZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    fireDateTimeZone = v5->_fireDateTimeZone;
    v5->_fireDateTimeZone = (NSTimeZone *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerRepeatInterval"));
    v10 = objc_claimAutoreleasedReturnValue();
    fireRepeatInterval = v5->_fireRepeatInterval;
    v5->_fireRepeatInterval = (NSDateComponents *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("HM.timerTriggerRecurrences"));
    v15 = objc_claimAutoreleasedReturnValue();
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerTimerIDCodingKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    timerID = v5->_timerID;
    v5->_timerID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.timerTriggerSignificantEvent"));
    v19 = objc_claimAutoreleasedReturnValue();
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.timerTriggerSignificantEventOffset"));
    v21 = objc_claimAutoreleasedReturnValue();
    significantEventOffset = v5->_significantEventOffset;
    v5->_significantEventOffset = (NSDateComponents *)v21;

    v23 = v5->_fireRepeatInterval;
    if (v23)
    {
      if (-[NSDateComponents nanosecond](v23, "nanosecond"))
        -[NSDateComponents setNanosecond:](v5->_fireRepeatInterval, "setNanosecond:", 0);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDTimerTrigger;
  v4 = a3;
  -[HMDTrigger encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  -[HMDTimerTrigger fireDate](self, "fireDate", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timerTriggerInitialFireDate"));

  -[HMDTimerTrigger fireDateTimeZone](self, "fireDateTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timerTriggerTimeZone"));

  -[HMDTimerTrigger fireRepeatInterval](self, "fireRepeatInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("timerTriggerRepeatInterval"));

  -[HMDTimerTrigger recurrences](self, "recurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.timerTriggerRecurrences"));

  -[HMDTimerTrigger timerID](self, "timerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("timerTriggerTimerIDCodingKey"));

  -[HMDTimerTrigger significantEvent](self, "significantEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HM.timerTriggerSignificantEvent"));

  -[HMDTimerTrigger significantEventOffset](self, "significantEventOffset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HM.timerTriggerSignificantEventOffset"));

}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDTimerTrigger *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDTimerTrigger _handleTimerTriggerUpdate:message:](self, "_handleTimerTriggerUpdate:message:", v13, v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Received unknown model object", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDTimerTrigger *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMD.BGTM.NK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDTimerTrigger timerID](self, "timerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

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
      -[HMDTimerTrigger timerID](v10, "timerID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Timer Trigger fired : %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDTimerTrigger timerTriggered](v10, "timerTriggered");
  }

}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSTimeZone)fireDateTimeZone
{
  return self->_fireDateTimeZone;
}

- (void)setFireDateTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (void)setSignificantEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDateComponents)significantEventOffset
{
  return self->_significantEventOffset;
}

- (void)setSignificantEventOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDateComponents)fireRepeatInterval
{
  return self->_fireRepeatInterval;
}

- (void)setFireRepeatInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)recurrences
{
  return self->_recurrences;
}

- (void)setRecurrences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)timerID
{
  return self->_timerID;
}

- (void)setTimerID:(id)a3
{
  objc_storeStrong((id *)&self->_timerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_fireRepeatInterval, 0);
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
  objc_storeStrong((id *)&self->_fireDateTimeZone, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_currentFireDate, 0);
  objc_storeStrong((id *)&self->currentFireDate, 0);
}

void __45__HMDTimerTrigger__reactiveTriggerAfterDelay__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "active")
    && objc_msgSend(WeakRetained, "shouldActivateOnLocalDevice"))
  {
    objc_msgSend(WeakRetained, "_reactivateTrigger");
  }

}

uint64_t __34__HMDTimerTrigger__timerTriggered__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeCompleteWithError:", a2);
}

void __43__HMDTimerTrigger__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = v5;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Activate on super class failed, bailing out", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
      {
        v11 = *(void (**)(void))(v10 + 16);
LABEL_19:
        v11();
      }
    }
    else
    {
      if (objc_msgSend(WeakRetained, "active")
        && objc_msgSend(v5, "shouldActivateOnLocalDevice"))
      {
        objc_msgSend(v5, "_reactiveTriggerAfterDelay");
      }
      else if (objc_msgSend(v5, "active"))
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = v5;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v20;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Looks like the timer is already running. Stopping it.", (uint8_t *)&v22, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(v18, "_stopTimer");
      }
      v21 = *(_QWORD *)(a1 + 32);
      if (v21)
      {
        v11 = *(void (**)(void))(v21 + 16);
        goto LABEL_19;
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@TimerTrigger instance is gone. Doing Nothing.", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
}

void __33__HMDTimerTrigger_timerTriggered__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerTriggered");

}

uint64_t __40__HMDTimerTrigger_completeConfiguration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_38710 != -1)
    dispatch_once(&logCategory__hmf_once_t0_38710, &__block_literal_global_38711);
  return (id)logCategory__hmf_once_v1_38712;
}

+ (id)validateRecurrence:(id)a3 calendar:(id)a4 fireDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if ((objc_msgSend(v7, "second") == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v7, "second"))
      && (objc_msgSend(v7, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v7, "nanosecond")))
    {
      objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v9);
      v10 = 0;
      if (v12 < *(double *)&minimumTimerRecurrence)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 42, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 69, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }
  v13 = v10;

  return v13;
}

+ (id)validateSignificantOffset:(id)a3
{
  return 0;
}

+ (id)validateRecurrences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "calendar");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = HMFEqualObjects();

          if ((v13 & 1) == 0)
          {
            v22 = MEMORY[0x227676638]();
            v23 = a1;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v45 = v25;
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Calendars are not matching in the recurrence instances", buf, 0xCu);

            }
            v26 = (void *)v22;
LABEL_23:
            objc_autoreleasePoolPop(v26);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v9)
          continue;
        break;
      }
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if (!objc_msgSend(v19, "weekday"))
          {
            v28 = MEMORY[0x227676638]();
            v29 = a1;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v45 = v31;
              v46 = 2112;
              v47 = v19;
              _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid values for week day: %@", buf, 0x16u);

            }
            v26 = (void *)v28;
            goto LABEL_23;
          }
          v20 = objc_alloc_init(MEMORY[0x24BDBCE68]);
          objc_msgSend(v20, "setWeekday:", objc_msgSend(v19, "weekday"));
          objc_msgSend(v20, "setCalendar:", v6);
          if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
          {
            v32 = (void *)MEMORY[0x227676638]();
            v33 = a1;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v45 = v35;
              v46 = 2112;
              v47 = v19;
              _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Miscellaneous fields have been set recurrence instances: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v32);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        v21 = 0;
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v21 = 0;
    }
LABEL_24:

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)validateTriggerModel:(id)a3 message:(id)a4 currentFireDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  void *v51;
  void *v53;
  void *context;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "dateForKey:", CFSTR("kTimerTriggerInitialFireDateKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = v10;
    goto LABEL_9;
  }
  v12 = (id)v11;
  +[HMDTimerTrigger validateWholeMinuteDate:onCalendar:](HMDTimerTrigger, "validateWholeMinuteDate:onCalendar:", v11, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v8, "setFireDate:", v12);
    objc_msgSend(v8, "setSignificantEvent:", 0);
    objc_msgSend(v8, "setSignificantEventOffset:", 0);
LABEL_9:
    objc_msgSend(v9, "timeZoneForKey:", CFSTR("kTimerTriggerTimeZoneDataKey"));
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFireDateTimeZone:", v22);

    }
    else if (objc_msgSend(v9, "BOOLForKey:", CFSTR("kTimerTriggerResetTimeZoneDataKey")))
    {
      objc_msgSend(v8, "setFireDateTimeZone:", 0);
    }
    objc_msgSend(v9, "dateComponentsForKey:", CFSTR("kTimerTriggerRecurrenceDataKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v10;
    if (v23)
    {
      +[HMDTimerTrigger getCalendar:](HMDTimerTrigger, "getCalendar:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDTimerTrigger validateRecurrence:calendar:fireDate:](HMDTimerTrigger, "validateRecurrence:calendar:fireDate:", v23, v24, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = a1;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v61 = v28;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Not a valid recurrence", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(v9, "responseHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          v21 = 0;
LABEL_60:

          v10 = v59;
          goto LABEL_61;
        }
        objc_msgSend(v9, "responseHandler");
        v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v14, 0);
        v21 = 0;
LABEL_59:

        goto LABEL_60;
      }
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFireRepeatInterval:", v31);

    }
    else if (objc_msgSend(v9, "BOOLForKey:", CFSTR("kTimerTriggerResetRecurrenceDataKey")))
    {
      objc_msgSend(v8, "setFireRepeatInterval:", 0);
    }
    objc_msgSend(v9, "numberForKey:", CFSTR("kTimerTriggerRecurrencesKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v32;
    if (v32)
    {
      if (objc_msgSend(v32, "unsignedIntegerValue") == 127)
        goto LABEL_33;
      HMDaysOfTheWeekToDateComponents();
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "arrayOfDateComponentsForKey:", CFSTR("kTimerTriggerRecurrencesKey"));
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))v33;
    if (v33)
    {
      +[HMDTimerTrigger validateRecurrences:](HMDTimerTrigger, "validateRecurrences:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v14 = (void *)v34;
        v35 = (void *)MEMORY[0x227676638]();
        v36 = a1;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = v35;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v61 = v38;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid recurrence instances", buf, 0xCu);

          v35 = v55;
        }

        objc_autoreleasePoolPop(v35);
        objc_msgSend(v9, "responseHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v21 = 0;
          goto LABEL_58;
        }
        objc_msgSend(v9, "responseHandler");
        v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v40)[2](v40, v14, 0);
        v21 = 0;
LABEL_57:

LABEL_58:
        goto LABEL_59;
      }
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRecurrences:", v41);

LABEL_38:
      objc_msgSend(v9, "stringForKey:", CFSTR("kTimerTriggerSignificantEventKey"));
      v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        if ((HMIsValidSignificantEvent() & 1) == 0)
        {
          v46 = (void *)MEMORY[0x227676638]();
          v47 = a1;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = v46;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = v49;
            _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Significant event is not valid", buf, 0xCu);

            v46 = v57;
          }

          objc_autoreleasePoolPop(v46);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "responseHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v9, "responseHandler");
            v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v50)[2](v50, v42, 0);

            v14 = 0;
          }
LABEL_51:
          v21 = 0;
LABEL_56:

          goto LABEL_57;
        }
        objc_msgSend(v8, "setSignificantEvent:", v40);
        objc_msgSend(v8, "setFireDate:", 0);
        objc_msgSend(v8, "setFireDateTimeZone:", 0);
        objc_msgSend(v8, "setFireRepeatInterval:", 0);
      }
      objc_msgSend(v9, "dateComponentsForKey:", CFSTR("kTimerTriggerSignificantEventOffsetKey"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        +[HMDTimerTrigger validateSignificantOffset:](HMDTimerTrigger, "validateSignificantOffset:", v42);
        v43 = objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v14 = (void *)v43;
          context = (void *)MEMORY[0x227676638]();
          v56 = a1;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = v53;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Invalid significant event offset", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
          objc_msgSend(v9, "responseHandler");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_56;
          objc_msgSend(v9, "responseHandler");
          v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v45)[2](v45, v14, 0);

          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v42, 1, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSignificantEventOffset:", v51);

      }
      else if (objc_msgSend(v9, "BOOLForKey:", CFSTR("kTimerTriggerResetSignificantEventOffsetKey")))
      {
        objc_msgSend(v8, "setSignificantEventOffset:", 0);
      }
      v21 = v8;
      v14 = 0;
      goto LABEL_56;
    }
LABEL_33:
    if (objc_msgSend(v9, "BOOLForKey:", CFSTR("kTimerTriggerResetRecurrencesKey")))
      objc_msgSend(v8, "setRecurrences:", 0);
    v30 = 0;
    goto LABEL_38;
  }
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x227676638]();
  v16 = a1;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v61 = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Fire date is not valid", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v9, "responseHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v9, "responseHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v20)[2](v20, v14, 0);
    v21 = 0;
LABEL_61:

    goto LABEL_62;
  }
  v21 = 0;
LABEL_62:

  return v21;
}

+ (id)validateWholeMinuteDate:(id)a3 onCalendar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "components:fromDate:", 3178750, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "second"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 70, 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "timeIntervalSinceNow");
      if (v11 >= 0.0)
      {
        v10 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 28);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

+ (id)getCalendar:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "calendar");
  else
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__HMDTimerTrigger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_38712;
  logCategory__hmf_once_v1_38712 = v0;

}

@end
