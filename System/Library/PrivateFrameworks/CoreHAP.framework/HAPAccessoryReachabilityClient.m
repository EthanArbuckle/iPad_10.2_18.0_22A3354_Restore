@implementation HAPAccessoryReachabilityClient

- (HAPAccessoryReachabilityClient)init
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

- (HAPAccessoryReachabilityClient)initWithIdentifier:(id)a3 profile:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPAccessoryReachabilityClient *v11;
  HAPAccessoryReachabilityClient *v12;
  uint64_t v13;
  HAPDeviceID *identifier;
  uint64_t v15;
  HAPAccessoryReachabilityProfile *profile;
  uint64_t v17;
  HAP2PropertyLock *propertyLock;
  HAPAccessoryReachabilityClient *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HAPAccessoryReachabilityClient;
  v11 = -[HAPAccessoryReachabilityClient init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_state = 3;
    v13 = objc_msgSend(v8, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (HAPDeviceID *)v13;

    v15 = objc_msgSend(v9, "copyWithZone:", 0);
    profile = v12->_profile;
    v12->_profile = (HAPAccessoryReachabilityProfile *)v15;

    objc_storeStrong((id *)&v12->_operationQueue, a5);
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAPAccessoryReachabilityClient.propertyLock"));
    v17 = objc_claimAutoreleasedReturnValue();
    propertyLock = v12->_propertyLock;
    v12->_propertyLock = (HAP2PropertyLock *)v17;

    -[HAPAccessoryReachabilityClient _processProfile](v12, "_processProfile");
    v19 = v12;
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  HAPDeviceID *identifier;
  HAPDeviceID *v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryReachabilityClient;
  -[HMFObject description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (self)
    identifier = self->_identifier;
  else
    identifier = 0;
  v6 = identifier;
  v7 = -[HAPAccessoryReachabilityClient state](self, "state");
  if (v7 > 3)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E894B178[v7];
  -[HAPAccessoryReachabilityClient confirmInterval](self, "confirmInterval");
  v10 = v9;
  -[HAPAccessoryReachabilityClient profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ identifier=%@ state=%@, confirmInterval=%f, profile=%@"), v3, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)setDelegate:(id)a3
{
  id v4;
  HAP2PropertyLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HAPAccessoryReachabilityClient_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v7);

}

- (void)setProfile:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HAP2SerializedOperationQueue *operationQueue;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  HAPAccessoryReachabilityClient *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__HAPAccessoryReachabilityClient_setProfile___block_invoke;
  v11 = &unk_1E894E0F8;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  if (self)
    operationQueue = self->_operationQueue;
  else
    operationQueue = 0;
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v6, v8, v9, v10, v11, v12);

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HAP2SerializedOperationQueue *operationQueue;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  HAPAccessoryReachabilityClient *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__HAPAccessoryReachabilityClient_startWithCompletionHandler___block_invoke;
  v11 = &unk_1E894D5E0;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  if (self)
    operationQueue = self->_operationQueue;
  else
    operationQueue = 0;
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v6, v8, v9, v10, v11, v12);

}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HAP2SerializedOperationQueue *operationQueue;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  HAPAccessoryReachabilityClient *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __60__HAPAccessoryReachabilityClient_stopWithCompletionHandler___block_invoke;
  v11 = &unk_1E894D5E0;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  if (self)
    operationQueue = self->_operationQueue;
  else
    operationQueue = 0;
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v6, v8, v9, v10, v11, v12);

}

- (BOOL)isRunning
{
  return (-[HAPAccessoryReachabilityClient state](self, "state") & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)kick
{
  void *v4;
  HAPAccessoryReachabilityClient *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t state;
  const __CFString *v11;
  HAPDeviceID *identifier;
  void *v13;
  HAP2SerializedOperationQueue *operationQueue;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  HAPDeviceID *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    state = v5->_state;
    if (state > 3)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E894B178[state];
    identifier = v5->_identifier;
    *(_DWORD *)buf = 138544130;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = identifier;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@ state=%@ id=%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__HAPAccessoryReachabilityClient_kick__block_invoke;
  v15[3] = &unk_1E894DD08;
  v15[4] = v5;
  v13 = (void *)MEMORY[0x1D17B7400](v15);
  if (v5)
    operationQueue = v5->_operationQueue;
  else
    operationQueue = 0;
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v13);

}

- (void)confirm
{
  void *v4;
  HAPAccessoryReachabilityClient *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t state;
  const __CFString *v11;
  HAPDeviceID *identifier;
  void *v13;
  HAP2SerializedOperationQueue *operationQueue;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  HAPDeviceID *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    state = v5->_state;
    if (state > 3)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E894B178[state];
    identifier = v5->_identifier;
    *(_DWORD *)buf = 138544130;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = identifier;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@ state=%@ id=%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__HAPAccessoryReachabilityClient_confirm__block_invoke;
  v15[3] = &unk_1E894DD08;
  v15[4] = v5;
  v13 = (void *)MEMORY[0x1D17B7400](v15);
  if (v5)
    operationQueue = v5->_operationQueue;
  else
    operationQueue = 0;
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v13);

}

- (void)_runStateMachine
{
  HAPAccessoryReachabilityClient *v2;
  void *v3;
  HAPAccessoryReachabilityClient *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unint64_t state;
  const __CFString *v9;
  HAPDeviceID *identifier;
  int64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  HAPDeviceID *v17;
  uint64_t v18;

  v2 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (HAPAccessoryReachabilityClient *)self->_operationQueue;
  v3 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryReachabilityClient assertCurrentQueue](self, "assertCurrentQueue"));
  v4 = v2;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    state = v4->_state;
    if (state > 3)
      v9 = CFSTR("unknown");
    else
      v9 = off_1E894B178[state];
    identifier = v4->_identifier;
    v12 = 138543874;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = identifier;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@state=%@ id=%@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  v11 = v4->_state;
  if ((unint64_t)(v11 - 1) < 2)
  {
    -[HAPAccessoryReachabilityClient _poll](v4, "_poll");
  }
  else if (v11 == 3)
  {
    -[HAPAccessoryReachabilityClient _stop](v4, "_stop");
  }
  else if (!v11)
  {
    -[HAPAccessoryReachabilityClient _wait](v4, "_wait");
  }
}

- (void)_enterState:(int64_t)a3
{
  HAPAccessoryReachabilityClient *v4;

  v4 = self;
  if (self)
    self = (HAPAccessoryReachabilityClient *)self->_operationQueue;
  -[HAPAccessoryReachabilityClient assertCurrentQueue](self, "assertCurrentQueue");
  v4->_state = a3;
  -[HAPAccessoryReachabilityClient _runStateMachine](v4, "_runStateMachine");
}

- (void)_processProfile
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  HAPAccessoryReachabilityClient *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  HAPAccessoryReachabilityClient *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryReachabilityClient profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepInterval");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 <= 0.0)
  {
    objc_msgSend(v7, "preferenceForKey:", CFSTR("kReachabilityDefaultTestInterval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_confirmInterval = (double)objc_msgSend(v13, "unsignedIntValue");

    self->_confirmInterval = fmax(self->_confirmInterval, 1.0);
  }
  else
  {
    objc_msgSend(v7, "preferenceForKey:", CFSTR("kReachabilityDefaultSleepyTestInterval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)objc_msgSend(v10, "unsignedIntValue");

    self->_confirmInterval = fmax((v6 + v6) * 1.15, fmax(v11, 1.0));
  }
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEBUG, "%{public}@%@: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
}

- (void)_wait
{
  HMFTimer *activityTimer;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  HMFTimer *v11;

  if (self)
  {
    -[HAP2SerializedOperationQueue assertCurrentQueue](self->_operationQueue, "assertCurrentQueue");
    activityTimer = self->_activityTimer;
    if (activityTimer)
    {
      -[HMFTimer suspend](activityTimer, "suspend");
      -[HMFTimer setDelegate:](self->_activityTimer, "setDelegate:", 0);
    }
  }
  else
  {
    objc_msgSend(0, "assertCurrentQueue");
  }
  v4 = (double)arc4random() * 2.32830644e-10;
  -[HAPAccessoryReachabilityClient confirmInterval](self, "confirmInterval");
  v6 = v4 * (v5 * 0.05);
  v7 = objc_alloc(MEMORY[0x1E0D286C8]);
  -[HAPAccessoryReachabilityClient confirmInterval](self, "confirmInterval");
  v9 = (void *)objc_msgSend(v7, "initWithTimeInterval:options:", 1, v6 + v8);
  v10 = v9;
  if (self)
  {
    objc_storeStrong((id *)&self->_activityTimer, v9);

    -[HMFTimer setDelegate:](self->_activityTimer, "setDelegate:", self);
    v11 = self->_activityTimer;
  }
  else
  {

    objc_msgSend(0, "setDelegate:", 0);
    v11 = 0;
  }
  -[HMFTimer resume](v11, "resume");
}

- (void)_poll
{
  HAPAccessoryReachabilityClient *v2;
  id WeakRetained;

  v2 = self;
  if (self)
    self = (HAPAccessoryReachabilityClient *)self->_operationQueue;
  -[HAPAccessoryReachabilityClient assertCurrentQueue](self, "assertCurrentQueue");
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_msgSend(WeakRetained, "pollAccessory");

}

- (void)_stop
{
  if (self)
  {
    -[HAP2SerializedOperationQueue assertCurrentQueue](self->_operationQueue, "assertCurrentQueue");
    -[HMFTimer suspend](self->_activityTimer, "suspend");
    objc_storeStrong((id *)&self->_activityTimer, 0);
  }
  else
  {
    objc_msgSend(0, "assertCurrentQueue");
    objc_msgSend(0, "suspend");
  }
}

- (void)timerDidFire:(id)a3
{
  id v5;
  void *v6;
  HAPAccessoryReachabilityClient *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HAPDeviceID *identifier;
  HAP2SerializedOperationQueue *operationQueue;
  HAP2SerializedOperationQueue *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  HAPDeviceID *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    *(_DWORD *)buf = 138543874;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = identifier;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@ id=%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_initWeak((id *)buf, v7);
  if (v7)
    operationQueue = v7->_operationQueue;
  else
    operationQueue = 0;
  v13 = operationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__HAPAccessoryReachabilityClient_timerDidFire___block_invoke;
  v15[3] = &unk_1E894DF38;
  objc_copyWeak(&v17, (id *)buf);
  v14 = v5;
  v16 = v14;
  -[HAP2SerializedOperationQueue addBlock:](v13, "addBlock:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)_timerDidFire:(id)a3
{
  id v5;
  void *v6;
  HMFTimer *activityTimer;
  int64_t v8;
  void *v9;
  HAPAccessoryReachabilityClient *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (self)
    activityTimer = self->_activityTimer;
  else
    activityTimer = 0;
  if (objc_msgSend(v5, "isEqual:", activityTimer))
  {
    v8 = -[HAPAccessoryReachabilityClient state](self, "state");
    if ((unint64_t)(v8 - 1) >= 3)
    {
      if (!v8)
        -[HAPAccessoryReachabilityClient _enterState:](self, "_enterState:", 1);
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@ timer should not be running in this state", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
  }

}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (HAPAccessoryReachabilityProfile)profile
{
  return self->_profile;
}

- (HAPAccessoryReachabilityDelegate)delegate
{
  return (HAPAccessoryReachabilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)confirmInterval
{
  return self->_confirmInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

void __47__HAPAccessoryReachabilityClient_timerDidFire___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_timerDidFire:", *(_QWORD *)(a1 + 32));

}

uint64_t __41__HAPAccessoryReachabilityClient_confirm__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result)
  {
    if (result != 3)
      return result;
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", v3);
}

unint64_t __38__HAPAccessoryReachabilityClient_kick__block_invoke(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result <= 2)
    return objc_msgSend(*(id *)(a1 + 32), "_enterState:", qword_1CCFA32A0[result]);
  return result;
}

uint64_t __60__HAPAccessoryReachabilityClient_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "state") <= 1)
    objc_msgSend(*(id *)(a1 + 32), "_enterState:", 3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __61__HAPAccessoryReachabilityClient_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));

  if (!WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to start reachability monitoring"), CFSTR("No delegate"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v8);
LABEL_7:

    return;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((unint64_t)(v3 - 1) < 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  if (!v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot start from current state: %@"), CFSTR("waiting"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("reachability is already running"), v8, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);

    goto LABEL_7;
  }
}

uint64_t __45__HAPAccessoryReachabilityClient_setProfile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_processProfile");
}

id __46__HAPAccessoryReachabilityClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

+ (HAPAccessoryReachabilityClient)new
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

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E89898C0, CFSTR("kReachabilityDefaultTestInterval"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E89898D0, CFSTR("kReachabilityDefaultSleepyTestInterval"));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1)
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_8308);
  return (id)logCategory__hmf_once_v7;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __45__HAPAccessoryReachabilityClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7;
  logCategory__hmf_once_v7 = v0;

}

@end
