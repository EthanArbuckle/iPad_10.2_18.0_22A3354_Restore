@implementation HMSoftwareUpdateManager

- (HMSoftwareUpdateManager)initWithContext:(id)a3
{
  id v5;
  HMSoftwareUpdateManager *v6;
  HMSoftwareUpdateManager *v7;
  uint64_t v8;
  NSUUID *identifier;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMSoftwareUpdateManager;
  v6 = -[HMSoftwareUpdateManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("08DA0D15-4D5F-4E74-89B6-A4201BC50F72"));
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    objc_initWeak(&location, v7);
    -[_HMContext xpcClient](v7->_context, "xpcClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __43__HMSoftwareUpdateManager_initWithContext___block_invoke;
    v15 = &unk_1E3AB61D0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "registerReconnectionHandler:", &v12);

    -[HMSoftwareUpdateManager __registerForMessages](v7, "__registerForMessages", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (HMSoftwareUpdateManager)init
{
  _HMContext *v3;
  HMSoftwareUpdateManager *v4;

  v3 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HomeKit.SUManager"));
  v4 = -[HMSoftwareUpdateManager initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (void)__registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMSoftwareUpdateManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMSUM.ua"), self, sel__handleUpdatedAvailableUpdate_);

  -[HMSoftwareUpdateManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:selector:", CFSTR("HMSUM.fu"), self, sel__handleFetch_);

  -[HMSoftwareUpdateManager context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:selector:", CFSTR("HMSUM.su"), self, sel__handleStartUpdate_);

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMSoftwareUpdateManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMSoftwareUpdateManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdateManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdateManager startWithCompletionHandler:]", CFSTR("completionHandler"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMSoftwareUpdateManager_startWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB60A0;
    block[4] = self;
    v20 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2080;
      v24 = "-[HMSoftwareUpdateManager startWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)reconnect
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HMSoftwareUpdateManager *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMSoftwareUpdateManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HMSoftwareUpdateManager_reconnect__block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v5, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2080;
      v14 = "-[HMSoftwareUpdateManager reconnect]";
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_reallyStartWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMSoftwareUpdateManager *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;
  _BYTE location[12];
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdateManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D285F8];
    -[HMSoftwareUpdateManager messageDestination](self, "messageDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMSUM.op"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __61__HMSoftwareUpdateManager__reallyStartWithCompletionHandler___block_invoke;
    v17 = &unk_1E3AB4AE0;
    objc_copyWeak(&v19, (id *)location);
    v18 = v4;
    objc_msgSend(v8, "setResponseHandler:", &v14);
    objc_msgSend(v5, "messageDispatcher", v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMessage:completionHandler:", v8, 0);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v13;
      v21 = 2080;
      v22 = "-[HMSoftwareUpdateManager _reallyStartWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)stop
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HMSoftwareUpdateManager *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMSoftwareUpdateManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__HMSoftwareUpdateManager_stop__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2080;
      v15 = "-[HMSoftwareUpdateManager stop]";
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (HMSoftwareUpdate)availableUpdate
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_availableUpdate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAvailableUpdate:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_availableUpdate, a3);
  -[HMSoftwareUpdateManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithContext:", v5);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleUpdatedAvailableUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMSoftwareUpdateManager *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HMSoftwareUpdateManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMSoftwareUpdateManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdateManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_9:
    objc_msgSend(v4, "respondWithPayload:", 0);
    goto LABEL_10;
  }
  objc_msgSend(v4, "nullForKey:", CFSTR("update"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
LABEL_4:
    -[HMSoftwareUpdateManager availableUpdate](self, "availableUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating available software update to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMSoftwareUpdateManager setAvailableUpdate:](v14, "setAvailableUpdate:", v10);
    }

    goto LABEL_9;
  }
  objc_msgSend(v4, "dataForKey:", CFSTR("update"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17, &v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v32;
    v20 = v19;
    if (v10)
    {

      goto LABEL_4;
    }
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v30;
      v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from update data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v31);

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Missing update from message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v26);

  }
LABEL_10:

}

- (void)updateAvailableUpdate:(id)a3 completionHandler:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMSoftwareUpdateManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMSoftwareUpdateManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMSoftwareUpdateManager *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD block[5];
  char *v29;
  id v30;
  void (**v31)(id, void *);
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  -[HMSoftwareUpdateManager context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdateManager updateAvailableUpdate:completionHandler:]", CFSTR("completionHandler"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      v34 = 2112;
      v35 = (const char *)v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v9 = (void *)v8;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v14;
      v34 = 2080;
      v35 = "-[HMSoftwareUpdateManager updateAvailableUpdate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 12;
    goto LABEL_12;
  }
  if (v6 && !objc_msgSend(v6, "downloadSize"))
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot accept available update of download size 0 : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 3;
LABEL_12:
    objc_msgSend(v15, "hmErrorWithCode:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v21);

    goto LABEL_13;
  }
  objc_msgSend(v9, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E3AB4D20;
  block[4] = self;
  v29 = v6;
  v31 = v7;
  v30 = v9;
  dispatch_async(v10, block);

LABEL_13:
}

- (void)_handleFetch:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMSoftwareUpdateManager *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  HMSoftwareUpdateManager *v17;
  id v18;
  void *v19;
  HMSoftwareUpdateManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  __int128 buf;
  void (*v29)(id *);
  void *v30;
  id v31;
  HMSoftwareUpdateManager *v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received fetch request", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMSoftwareUpdateManager delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_initWeak(&location, v6);
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __40__HMSoftwareUpdateManager__handleFetch___block_invoke;
    v24[3] = &unk_1E3AAFE20;
    objc_copyWeak(&v26, &location);
    v25 = v4;
    v11 = v6;
    v12 = v9;
    v13 = v24;
    -[HMSoftwareUpdateManager context](v11, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v10;
    *((_QWORD *)&buf + 1) = 3221225472;
    v29 = ____requestFetch_block_invoke;
    v30 = &unk_1E3AB5C58;
    v31 = v12;
    v32 = v11;
    v33 = v13;
    v16 = v13;
    v17 = v11;
    v18 = v12;
    objc_msgSend(v15, "invokeBlock:", &buf);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v23);

  }
}

- (void)_handleStartUpdate:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMSoftwareUpdateManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMSoftwareUpdateManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMSoftwareUpdateManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  HMSoftwareUpdateManager *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received start update request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMSoftwareUpdateManager delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("update"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v35);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v35;
      if (v11)
      {
        objc_initWeak((id *)buf, v6);
        -[HMSoftwareUpdateManager context](v6, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "delegateCaller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke;
        v29[3] = &unk_1E3AAFE70;
        v30 = v9;
        v31 = v6;
        v32 = v11;
        objc_copyWeak(&v34, (id *)buf);
        v33 = v4;
        objc_msgSend(v14, "invokeBlock:", v29);

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v24 = (void *)MEMORY[0x1A1AC1AAC]();
        v25 = v6;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          v38 = 2112;
          v39 = v12;
          _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from update data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v28);

      }
    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        v38 = 2112;
        v39 = v23;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing update from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSoftwareUpdateManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdateManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMSoftwareUpdateManagerDelegate)delegate
{
  return (HMSoftwareUpdateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_HMContext)context
{
  return self->_context;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableUpdate, 0);
}

void __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke_2;
  v5[3] = &unk_1E3AAFE48;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "softwareUpdateManager:didReceiveRequestToInstallUpdate:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
}

void __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response to install update request with error: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v10)[2](v10, v3, 0);

  }
}

void __40__HMSoftwareUpdateManager__handleFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v6;
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v13;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed fetch request with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = 0;
    v15 = v8;
    goto LABEL_15;
  }
  if (v12)
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v16;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received response to fetch request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (!v5)
  {
    v14 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "downloadSize"))
  {
    v24 = CFSTR("update");
    encodeRootObject(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v15 = 0;
    goto LABEL_15;
  }
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = v10;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v21;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot accept fetched update of download size 0 : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "responseHandler", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v23)[2](v23, v15, v14);

  }
}

void __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating available update to: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = a1[5];
  if (v7)
  {
    v35 = CFSTR("update");
    encodeRootObject(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = CFSTR("update");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  v11 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(a1[4], "messageDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("HMSUM.ua"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, a1[4]);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_39;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v32, (id *)buf);
  v30 = a1[5];
  v31 = a1[7];
  v15 = _Block_copy(aBlock);
  objc_msgSend(a1[4], "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pendingRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v15);
  objc_msgSend(v17, "addCompletionBlock:forIdentifier:", v19, v18);

  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_2;
  v24[3] = &unk_1E3AB4B08;
  v20 = v17;
  v25 = v20;
  v21 = v18;
  v26 = v21;
  v27 = a1[5];
  v22 = v15;
  v28 = v22;
  objc_msgSend(v13, "setResponseHandler:", v24);
  objc_msgSend(a1[6], "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:completionHandler:", v13, 0);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

void __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "setAvailableUpdate:", *(_QWORD *)(a1 + 32));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!v8)
    {
      objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(*(id *)(a1 + 48), "setIdentifier:", v7);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __31__HMSoftwareUpdateManager_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setStarted:", 0);
  v6 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMSUM.cl"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__HMSoftwareUpdateManager_stop__block_invoke_36;
  v10[3] = &unk_1E3AB47E0;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v8, "setResponseHandler:", v10);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:completionHandler:", v8, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __31__HMSoftwareUpdateManager_stop__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v5;
      v13 = "%{public}@Failed to stop with error: %@";
      v14 = v10;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);

    }
  }
  else if (v11)
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v12;
    v13 = "%{public}@Stopped";
    v14 = v10;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v8);
}

void __61__HMSoftwareUpdateManager__reallyStartWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to start with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "setStarted:", 1);
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("update"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v26;
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v15)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = v16;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v21;
          v29 = 2112;
          v30 = v15;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Initial available software update: %@", buf, 0x16u);

          v16 = v24;
        }

        objc_autoreleasePoolPop(v17);
        objc_msgSend(v18, "setAvailableUpdate:", v15);
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v25;
          v29 = 2112;
          v30 = v16;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from software update data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
      }

    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v9, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "delegateCaller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

  }
}

uint64_t __36__HMSoftwareUpdateManager_reconnect__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isStarted");
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
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Restarting on reconnect", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_reallyStartWithCompletionHandler:", 0);
  }
  return result;
}

uint64_t __54__HMSoftwareUpdateManager_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_reallyStartWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __43__HMSoftwareUpdateManager_initWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_17959 != -1)
    dispatch_once(&logCategory__hmf_once_t34_17959, &__block_literal_global_17960);
  return (id)logCategory__hmf_once_v35_17961;
}

void __38__HMSoftwareUpdateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35_17961;
  logCategory__hmf_once_v35_17961 = v0;

}

@end
