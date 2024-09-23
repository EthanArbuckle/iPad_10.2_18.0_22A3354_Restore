@implementation HMDeviceSetupSession

- (HMDeviceSetupSession)init
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

- (HMDeviceSetupSession)initWithRole:(int64_t)a3 identifier:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  _HMContext *v10;
  HMDeviceSetupSession *v11;

  v8 = a5;
  v9 = a4;
  v10 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HomeKit.DeviceSetupSession"));
  v11 = -[HMDeviceSetupSession initWithRole:context:identifier:delegate:](self, "initWithRole:context:identifier:delegate:", a3, v10, v9, v8);

  return v11;
}

- (HMDeviceSetupSession)initWithRole:(int64_t)a3 context:(id)a4 identifier:(id)a5 delegate:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDeviceSetupSession *v16;
  HMDeviceSetupSession *v17;
  uint64_t v18;
  NSUUID *identifier;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HMFActivity *activity;
  uint64_t v26;
  NSDictionary *userInfo;
  HMDeviceSetupSession *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((unint64_t)a3 >= 2)
    _HMFPreconditionFailure();
  v15 = v14;
  if (v12 && v14)
  {
    v34.receiver = self;
    v34.super_class = (Class)HMDeviceSetupSession;
    v16 = -[HMDeviceSetupSession init](&v34, sel_init);
    v17 = v16;
    if (v16)
    {
      v16->_lock._os_unfair_lock_opaque = 0;
      v16->_state = 0;
      v16->_role = a3;
      objc_storeWeak((id *)&v16->_delegate, v15);
      v18 = objc_msgSend(v13, "copy");
      identifier = v17->_identifier;
      v17->_identifier = (NSUUID *)v18;

      objc_storeStrong((id *)&v17->_context, a4);
      v20 = objc_alloc(MEMORY[0x1E0D28540]);
      v21 = (void *)MEMORY[0x1E0CB3940];
      MEMORY[0x1A1AC1500](v17, a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@, %s:%ld"), v22, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/DeviceSetup/HMDeviceSetupSession.m", 178);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "initWithName:", v23);
      activity = v17->_activity;
      v17->_activity = (HMFActivity *)v24;

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v26 = objc_claimAutoreleasedReturnValue();
      userInfo = v17->_userInfo;
      v17->_userInfo = (NSDictionary *)v26;

    }
    self = v17;
    v28 = self;
  }
  else
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v31;
      v37 = 2112;
      v38 = v32;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v15;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[HMDeviceSetupSession] Invalid init parameters role: %@ context: %@ delegate: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v29);
    v28 = 0;
  }

  return v28;
}

- (void)configure
{
  -[HMDeviceSetupSession registerForMessages](self, "registerForMessages");
  -[HMDeviceSetupSession registerForNotifications](self, "registerForNotifications");
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDeviceSetupSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMDSS.rc"), self, sel_handleDeviceSetupSessionReceiveDataMessage_);

  -[HMDeviceSetupSession context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:selector:", CFSTR("HMDSS.cl"), self, sel_handleDeviceSetupSessionCloseMessage_);

}

- (void)handleDeviceSetupSessionCloseMessage:(id)a3
{
  id v4;
  void *v5;
  HMDeviceSetupSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Handling device setup session close message: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("ui"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[HMDeviceSetupSession setUserInfo:](v6, "setUserInfo:", v10);
  objc_msgSend(v4, "errorForKey:", CFSTR("er"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDeviceSetupSession cleanUpSessionWithError:](v6, "cleanUpSessionWithError:", v11);

}

- (void)handleDeviceSetupSessionReceiveDataMessage:(id)a3
{
  id v4;
  void *v5;
  HMDeviceSetupSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Handling device setup session receive data message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDeviceSetupSession context](v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__HMDeviceSetupSession_handleDeviceSetupSessionReceiveDataMessage___block_invoke;
  v14[3] = &unk_1E3AB5ED8;
  v14[4] = v6;
  v15 = v4;
  v12 = v4;
  v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v14);
  dispatch_async(v11, v13);

}

- (void)_handleDeviceSetupSessionReceiveDataMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDeviceSetupSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDeviceSetupSession *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDeviceSetupSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v4, "dataForKey:", CFSTR("da"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDeviceSetupSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive exchange data: %@ delegate: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_initWeak((id *)buf, v10);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke;
    v17[3] = &unk_1E3AB47B8;
    objc_copyWeak(&v19, (id *)buf);
    v18 = v4;
    objc_msgSend(v8, "setupSession:didReceiveExchangeData:completionHandler:", v10, v7, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get exchange data for message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
    -[HMDeviceSetupSession cleanUpSessionWithError:](v14, "cleanUpSessionWithError:", v8);
  }

}

- (void)registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleHomeKitDaemonInterruptedNotification_, CFSTR("kHomeKitDaemonInterruptedNotification"), 0);

}

- (void)handleHomeKitDaemonInterruptedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDeviceSetupSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling homed interrupted notification: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDeviceSetupSession cleanUpSessionWithError:](v6, "cleanUpSessionWithError:", v9);

}

- (void)open
{
  void *v3;
  NSObject *v4;
  dispatch_block_t v5;
  _QWORD block[5];

  -[HMDeviceSetupSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__HMDeviceSetupSession_open__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);

}

- (id)responseHandlerForOpenMessage
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke;
  v4[3] = &unk_1E3AB47E0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_handleOpenedSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  HMDeviceSetupSession *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDeviceSetupSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[HMDeviceSetupSession _moveToState:](self, "_moveToState:", 2))
  {
    -[HMDeviceSetupSession delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did open session with delegate: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setupSessionDidOpen:", v7);

  }
}

- (id)messageDestinationForOpenedSessions
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDeviceSetupSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (void)cleanUpSession
{
  -[HMDeviceSetupSession cleanUpSessionWithError:](self, "cleanUpSessionWithError:", 0);
}

- (void)cleanUpSessionWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMDeviceSetupSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMDeviceSetupSession_cleanUpSessionWithError___block_invoke;
  v9[3] = &unk_1E3AB5ED8;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v9);
  dispatch_async(v6, v8);

}

- (void)close
{
  void *v3;
  NSObject *v4;
  dispatch_block_t v5;
  _QWORD block[5];

  -[HMDeviceSetupSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HMDeviceSetupSession_close__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v4, v5);

}

- (id)closeSetupSessionHMDHomeManagerMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend((id)objc_opt_class(), "messageDestinationToHomeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("id");
  -[HMDeviceSetupSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithName:qualityOfService:destination:payload:", CFSTR("HMDSS.cl.homeManager"), 9, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HMDeviceSetupSession_closeSetupSessionHMDHomeManagerMessage__block_invoke;
  v9[3] = &unk_1E3AB4808;
  v9[4] = self;
  objc_msgSend(v7, "setResponseHandler:", v9);
  return v7;
}

- (void)_closeWithError:(id)a3
{
  __CFString *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDeviceSetupSession *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMFActivity *activity;
  void *v19;
  HMFActivity *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  HMDeviceSetupSession *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  -[HMDeviceSetupSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[HMDeviceSetupSession _moveToState:](self, "_moveToState:", 3))
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR(" due to error: ");
      *(_DWORD *)buf = 138543874;
      v35 = v10;
      if (!v4)
        v11 = &stru_1E3AB7688;
      v36 = 2112;
      if (v4)
        v12 = v4;
      else
        v12 = &stru_1E3AB7688;
      v37 = v11;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Closing session%@%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = (void *)MEMORY[0x1E0D285F8];
    -[HMDeviceSetupSession messageDestinationForOpenedSessions](v8, "messageDestinationForOpenedSessions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageWithName:qualityOfService:destination:payload:", CFSTR("HMDSS.cl"), 9, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __40__HMDeviceSetupSession__closeWithError___block_invoke;
    v31[3] = &unk_1E3AB4808;
    v31[4] = v8;
    objc_msgSend(v15, "setResponseHandler:", v31);
    -[HMDeviceSetupSession context](v8, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessage:", v15);

    -[HMFActivity markWithReason:](v8->_activity, "markWithReason:", CFSTR("HMDeviceSetupSession.closeWithError"));
    activity = v8->_activity;
    v32[0] = CFSTR("code");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = activity;
    objc_msgSend(v19, "numberWithInteger:", -[__CFString code](v4, "code"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("domain");
    v33[0] = v21;
    -[__CFString domain](v4, "domain");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (const __CFString *)v22;
    else
      v24 = &stru_1E3AB7688;
    v33[1] = v24;
    v25 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);

    if (-[HMDeviceSetupSession _moveToState:](v8, "_moveToState:", 0))
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = v8;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v29;
        v36 = 2112;
        v37 = v4;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did close with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      -[HMDeviceSetupSession delegate](v27, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setupSession:didCloseWithError:", v27, v4);

    }
  }

}

- (void)sendExchangeData:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDeviceSetupSession *v11;
  NSObject *v12;
  void *v13;
  const void *v14;
  void (**v15)(void *, _QWORD, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDeviceSetupSession *v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v13;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sending exchange data: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  if (v9)
    v14 = v9;
  else
    v14 = &__block_literal_global_46387;
  v15 = (void (**)(void *, _QWORD, void *))_Block_copy(v14);

  if (v8)
  {
    v27 = CFSTR("da");
    v28 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D285F8];
    -[HMDeviceSetupSession messageDestinationForOpenedSessions](v11, "messageDestinationForOpenedSessions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageWithName:qualityOfService:destination:payload:", CFSTR("HMDSS.rc"), a4, v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDeviceSetupSession responseHandlerForReceiveDataMessageWithCompletionHandler:](v11, "responseHandlerForReceiveDataMessageWithCompletionHandler:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setResponseHandler:", v20);

    -[HMDeviceSetupSession context](v11, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:", v19);

  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = v11;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to send missing exchange data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v16);
  }

}

- (id)responseHandlerForReceiveDataMessageWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HMDeviceSetupSession_responseHandlerForReceiveDataMessageWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E3AB59B8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

- (BOOL)_needsClosing
{
  void *v3;
  NSObject *v4;
  int64_t state;
  BOOL v6;

  -[HMDeviceSetupSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  state = self->_state;
  if (state)
    v6 = state == 3;
  else
    v6 = 1;
  return !v6;
}

- (BOOL)_moveToState:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  unint64_t state;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDeviceSetupSession *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL result;
  void *v21;
  HMDeviceSetupSession *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMDeviceSetupSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  state = self->_state;
  switch(state)
  {
    case 0uLL:
      if ((unint64_t)(a3 - 2) < 2 || !a3)
        goto LABEL_16;
      v8 = a3 == 1;
      goto LABEL_9;
    case 1uLL:
      if ((unint64_t)a3 < 2)
        goto LABEL_16;
      if ((unint64_t)(a3 - 2) >= 2)
        goto LABEL_13;
      goto LABEL_19;
    case 2uLL:
      v8 = a3 == 3;
      if ((unint64_t)a3 < 3)
        goto LABEL_16;
LABEL_9:
      if (!v8)
        goto LABEL_13;
LABEL_19:
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        HMDeviceSetupSessionStateAsString(a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        HMDeviceSetupSessionStateAsString(state);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v24;
        v29 = 2112;
        v30 = v25;
        v31 = 2112;
        v32 = v26;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Moving to state: %@ from state: %@", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      self->_state = a3;
      result = 1;
      break;
    case 3uLL:
      if ((unint64_t)a3 < 2)
        goto LABEL_19;
      if ((unint64_t)(a3 - 2) >= 2)
      {
LABEL_13:
        v9 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          HMDeviceSetupSessionStateAsString(a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          HMDeviceSetupSessionStateAsString(state);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543874;
          v28 = v11;
          v29 = 2112;
          v30 = v12;
          v31 = 2112;
          v32 = v13;
          _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMDeviceSetupSession] Failed to understand move to state: %@ from state: %@", (uint8_t *)&v27, 0x20u);

        }
        objc_autoreleasePoolPop(v9);
      }
LABEL_16:
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HMDeviceSetupSessionStateAsString(a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HMDeviceSetupSessionStateAsString(state);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to move to state: %@ from state: %@", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      result = 0;
      break;
    default:
      goto LABEL_13;
  }
  return result;
}

- (NSDictionary)userInfo
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *userInfo;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDictionary *)objc_msgSend(v6, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDeviceSetupSession identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  HMDeviceSetupSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDeviceSetupSession", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", v4);

  -[HMDeviceSetupSession context](v4, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deregisterReceiver:", v4);

  v10.receiver = v4;
  v10.super_class = (Class)HMDeviceSetupSession;
  -[HMDeviceSetupSession dealloc](&v10, sel_dealloc);
}

- (HMDeviceSetupSessionDelegate)delegate
{
  return (HMDeviceSetupSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)role
{
  return self->_role;
}

- (_HMContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __82__HMDeviceSetupSession_responseHandlerForReceiveDataMessageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Receive data response with payload: %@ error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v5, "code", CFSTR("code")));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("domain");
  v22[0] = v13;
  objc_msgSend(v5, "domain");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E3AB7688;
  if (v14)
    v16 = (const __CFString *)v14;
  v22[1] = v16;
  v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "markWithReason:", CFSTR("reallySendExchangeData"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("da"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __40__HMDeviceSetupSession__closeWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v10;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received response for close session message with error %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v5, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0D27FC8]))
    goto LABEL_10;
  if (objc_msgSend(v5, "code") == 14)
  {

LABEL_7:
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@close session thru HMDHomeManager. session %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "closeSetupSessionHMDHomeManagerMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendMessage:", v19);

LABEL_10:
    goto LABEL_11;
  }
  v12 = objc_msgSend(v5, "code");

  if (v12 == 2)
    goto LABEL_7;
LABEL_11:

}

void __62__HMDeviceSetupSession_closeSetupSessionHMDHomeManagerMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v5;
      v13 = "%{public}@Failed to close session thru HMDHomeManager. session %@, error %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v14, v15, v13, (uint8_t *)&v17, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v11;
    v19 = 2112;
    v20 = CFSTR("HMDSS.cl.homeManager");
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = 0;
    v13 = "%{public}@Received response for %@ for session %@ with error %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 42;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __29__HMDeviceSetupSession_close__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "markWithReason:", CFSTR("HMDeviceSetupSession.close"));
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

uint64_t __48__HMDeviceSetupSession_cleanUpSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "markWithReason:", CFSTR("HMDeviceSetupSession.cleanUpSession"));
  result = objc_msgSend(*(id *)(a1 + 32), "_needsClosing");
  if ((_DWORD)result)
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(const __CFString **)(a1 + 40);
      v8 = CFSTR(" with error: ");
      v9 = 138543874;
      v10 = v6;
      if (!v7)
      {
        v8 = &stru_1E3AB7688;
        v7 = &stru_1E3AB7688;
      }
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Closing session due to clean up%@%@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  dispatch_block_t v23;
  _QWORD v24[4];
  id v25;
  id *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = (id *)WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v11;
      v31 = 2112;
      v32 = v6;
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Received response for open message with payload: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = v9[3];
    v27[0] = CFSTR("errorCode");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = v12;
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v5, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v27[1] = CFSTR("domain");
    objc_msgSend(v5, "domain");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &stru_1E3AB7688;
    if (v16)
      v18 = (const __CFString *)v16;
    v28[1] = v18;
    v27[2] = CFSTR("role");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "role"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v19;
    v20 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);

    objc_msgSend(v9[3], "markWithReason:", CFSTR("HMDeviceSetupSession.open.responseHandler"));
    objc_msgSend(v9, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke_68;
    v24[3] = &unk_1E3AB5ED8;
    v25 = v5;
    v26 = v9;
    v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v24);
    dispatch_async(v22, v23);

  }
}

uint64_t __53__HMDeviceSetupSession_responseHandlerForOpenMessage__block_invoke_68(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "_closeWithError:");
  else
    return objc_msgSend(v1, "_handleOpenedSession");
}

void __28__HMDeviceSetupSession_open__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_moveToState:", 1))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[3];
    v32[0] = CFSTR("identifier");
    v4 = v3;
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMDailyRotatedUUID(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = CFSTR("no identifier");
    v32[1] = CFSTR("role");
    v33[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "role"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v10;
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);

    v30[0] = CFSTR("id");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("ro");
    v31[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "role"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Sending device setup session open message", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = (void *)MEMORY[0x1E0D285F8];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "qualityOfService");
    objc_msgSend((id)objc_opt_class(), "messageDestinationToHomeManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "messageWithName:qualityOfService:destination:payload:", CFSTR("HMDSS.op"), v22, v23, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "responseHandlerForOpenMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setResponseHandler:", v25);

    objc_msgSend(v24, "setActivity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(a1 + 32), "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "messageDispatcher");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sendMessage:", v24);

  }
}

void __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Notifying client of did receive exchange data resulted in error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "qualityOfService");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke_43;
  v13[3] = &unk_1E3AB4790;
  v13[4] = WeakRetained;
  objc_msgSend(WeakRetained, "sendExchangeData:qualityOfService:completionHandler:", v5, v12, v13);

}

void __68__HMDeviceSetupSession__handleDeviceSetupSessionReceiveDataMessage___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Sending exchange data resulted in error: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "cleanUpSessionWithError:", v6);

}

uint64_t __67__HMDeviceSetupSession_handleDeviceSetupSessionReceiveDataMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceSetupSessionReceiveDataMessage:", *(_QWORD *)(a1 + 40));
}

+ (id)messageDestinationToHomeManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v2);

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_46451 != -1)
    dispatch_once(&logCategory__hmf_once_t27_46451, &__block_literal_global_89);
  return (id)logCategory__hmf_once_v28_46452;
}

void __35__HMDeviceSetupSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28_46452;
  logCategory__hmf_once_v28_46452 = v0;

}

@end
