@implementation HMAccessCodeManager

- (HMAccessCodeManager)initWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessCodeManager *v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessCodeManagerUUIDFromHomeUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMAccessCodeManager initWithHome:context:UUID:notificationCenter:](self, "initWithHome:context:UUID:notificationCenter:", v4, v8, v7, v9);

  return v10;
}

- (HMAccessCodeManager)initWithHome:(id)a3 context:(id)a4 UUID:(id)a5 notificationCenter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMAccessCodeManager *v14;
  HMAccessCodeManager *v15;
  uint64_t v16;
  NSHashTable *observers;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessCodeManager;
  v14 = -[HMAccessCodeManager init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_home, v10);
    objc_storeStrong((id *)&v15->_context, a4);
    objc_storeStrong((id *)&v15->_UUID, a5);
    objc_storeStrong((id *)&v15->_notificationCenter, a6);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v15->_observers;
    v15->_observers = (NSHashTable *)v16;

  }
  return v15;
}

- (void)configure
{
  void *v3;
  HMAccessCodeManager *v4;
  NSObject *v5;
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
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Configuring access code manager", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMAccessCodeManager context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:selector:", CFSTR("HMAccessCodeManagerDidAddAccessoryAccessCodesMessage"), v4, sel_handleDidAddAccessoryAccessCodesMessage_);

  -[HMAccessCodeManager context](v4, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:selector:", CFSTR("HMAccessCodeManagerDidUpdateAccessoryAccessCodesMessage"), v4, sel_handleDidUpdateAccessoryAccessCodesMessage_);

  -[HMAccessCodeManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForMessage:receiver:selector:", CFSTR("HMAccessCodeManagerDidRemoveAccessoryAccessCodesMessage"), v4, sel_handleDidRemoveAccessoryAccessCodesMessage_);

  -[HMAccessCodeManager context](v4, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerForMessage:receiver:selector:", CFSTR("HMAccessCodeManagerDidAddHomeAccessCodesMessage"), v4, sel_handleDidAddHomeAccessCodesMessage_);

  -[HMAccessCodeManager context](v4, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerForMessage:receiver:selector:", CFSTR("HMAccessCodeManagerDidUpdateHomeAccessCodesMessage"), v4, sel_handleDidUpdateHomeAccessCodesMessage_);

  -[HMAccessCodeManager context](v4, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerForMessage:receiver:selector:", CFSTR("HMAccessCodeManagerDidRemoveHomeAccessCodesMessage"), v4, sel_handleDidRemoveHomeAccessCodesMessage_);

  -[HMAccessCodeManager notificationCenter](v4, "notificationCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", v4, sel_handleDaemonReconnectedNotification_, CFSTR("HMDaemonReconnectedNotification"), 0);

}

- (void)unconfigure
{
  _HMContext *context;
  void *v4;
  HMAccessCodeManager *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HMContext *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring access code manager", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMAccessCodeManager setHome:](v5, "setHome:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", v5);

    -[HMAccessCodeManager context](v5, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deregisterReceiver:", v5);

    v12 = self->_context;
    self->_context = 0;

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  HMAccessCodeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding observer: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v6, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[HMAccessCodeManager observers](v6, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v4);

  os_unfair_lock_unlock(&v6->_lock.lock);
  if (!v10)
    -[HMAccessCodeManager _subscribe](v6, "_subscribe");

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  HMAccessCodeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  char v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing observer: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v6, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[HMAccessCodeManager observers](v6, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v4);

  -[HMAccessCodeManager observers](v6, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    v13 = 0;
  else
    v13 = v10 == 1;
  v14 = v13;

  os_unfair_lock_unlock(&v6->_lock.lock);
  if ((v14 & 1) != 0)
    -[HMAccessCodeManager _unsubscribe](v6, "_unsubscribe");

}

- (NSArray)accessoriesSupportingAccessCodes
{
  void *v2;
  void *v3;
  void *v4;

  -[HMAccessCodeManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_87);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)fetchAccessCodesFromAccessories:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMAccessCodeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  char *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager fetchAccessCodesFromAccessories:completion:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v14;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching access codes from accessories: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "na_map:", &__block_literal_global_96);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("HMAccessCodeManagerMessageKeyAccessoryUUIDs");
    encodeRootObject(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_2;
    v25[3] = &unk_1E3AB60C8;
    v25[4] = v11;
    v26 = v6;
    v27 = v8;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerFetchAccessCodesMessage"), v17, v25);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2080;
      v33 = "-[HMAccessCodeManager fetchAccessCodesFromAccessories:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v15);
  }

}

- (void)fetchAccessCodeConstraintsFromAccessories:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMAccessCodeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  char *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager fetchAccessCodeConstraintsFromAccessories:completion:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v14;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching access code constraints from accessories: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "na_map:", &__block_literal_global_108);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("HMAccessCodeManagerMessageKeyAccessoryUUIDs");
    encodeRootObject(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2;
    v25[3] = &unk_1E3AB60C8;
    v25[4] = v11;
    v26 = v6;
    v27 = v8;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerFetchAccessCodeConstraintsMessage"), v17, v25);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2080;
      v33 = "-[HMAccessCodeManager fetchAccessCodeConstraintsFromAccessories:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v15);
  }

}

- (void)fetchHomeAccessCodesWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMAccessCodeManager *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  void (**v21)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager fetchHomeAccessCodesWithCompletion:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = (const char *)v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  -[HMAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching home access codes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke;
    v20[3] = &unk_1E3AB59B8;
    v20[4] = v8;
    v21 = v5;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v8, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerFetchHomeAccessCodesMessage"), 0, v20);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2080;
      v25 = "-[HMAccessCodeManager fetchHomeAccessCodesWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v13);

  }
}

- (void)setUserInformation:(id)a3 forHomeAccessCodeWithValue:(id)a4 completion:(id)a5
{
  char *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  HMAccessCodeManager *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMAccessCodeManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMAccessCodeManager *v32;
  NSObject *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  char *v37;
  void (**v38)(_QWORD, _QWORD);
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager setUserInformation:forHomeAccessCodeWithValue:completion:]", CFSTR("completion"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v34;
      v43 = 2112;
      v44 = (const char *)v30;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v30, 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  v11 = (void (**)(_QWORD, _QWORD))v10;
  -[HMAccessCodeManager context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v17;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting user information: %@, for home access code", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v8, "removedUserInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v8, "createAccessCodeUserInformationValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = CFSTR("HMAccessCodeManagerMessageKeyUserInformationValue");
      encodeRootObject(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = CFSTR("HMAccessCodeManagerMessageKeyAccessCodeValue");
      v40[0] = v27;
      encodeRootObject(v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke;
      v36[3] = &unk_1E3AB60C8;
      v36[4] = v14;
      v37 = v8;
      v38 = v11;
      -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v14, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerSetUserInformationMessage"), v29, v36);

      goto LABEL_14;
    }
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = v14;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Caller passed userInformation with a removedUserInfo, which is not allowed. Returning an error.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 3;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v25;
      v43 = 2080;
      v44 = "-[HMAccessCodeManager setUserInformation:forHomeAccessCodeWithValue:completion:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 12;
  }
  objc_msgSend(v23, "hmErrorWithCode:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v26);
LABEL_14:

}

- (void)removeHomeAccessCodeWithValue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMAccessCodeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  void (**v25)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager removeHomeAccessCodeWithValue:completion:]", CFSTR("completion"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = (const char *)v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing home access code - This method has been deprecated.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__HMAccessCodeManager_removeHomeAccessCodeWithValue_completion___block_invoke;
    v24[3] = &unk_1E3AB5990;
    v25 = v8;
    -[HMAccessCodeManager removeSimpleLabelAccessCode:completion:](v11, "removeSimpleLabelAccessCode:completion:", v15, v24);

    v16 = v25;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2080;
      v29 = "-[HMAccessCodeManager removeHomeAccessCodeWithValue:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v16);
  }

}

- (void)removeSimpleLabelAccessCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMAccessCodeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const __CFString *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager removeSimpleLabelAccessCode:completion:]", CFSTR("completion"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = (const char *)v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing simple label access code", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v26 = CFSTR("HMAccessCodeManagerMessageKeyAccessCodeString");
    v27 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke;
    v24[3] = &unk_1E3AB59B8;
    v24[4] = v11;
    v25 = v8;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerRemoveSimpleLabelAccessCodeMessage"), v15, v24);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2080;
      v31 = "-[HMAccessCodeManager removeSimpleLabelAccessCode:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v17);

  }
}

- (void)submitAccessCodeModificationRequests:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMAccessCodeManager *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  char *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager submitAccessCodeModificationRequests:completion:]", CFSTR("completion"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting access code modification requests: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMAccessCodeManager home](v11, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMAccessCodeManager valueObjectsForAccessCodeModificationRequests:home:](HMAccessCodeManager, "valueObjectsForAccessCodeModificationRequests:home:", v6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = CFSTR("HMAccessCodeManagerMessageKeyAccessCodeModificationRequests");
    encodeRootObject(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke;
    v26[3] = &unk_1E3AB60C8;
    v26[4] = v11;
    v27 = v6;
    v28 = v8;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerSubmitAccessCodeModificationRequestsMessage"), v18, v26);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v19;
      v33 = 2080;
      v34 = "-[HMAccessCodeManager submitAccessCodeModificationRequests:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v16);
  }

}

- (void)generateAccessCodeForUser:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMAccessCodeManager *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  char *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager generateAccessCodeForUser:completion:]", CFSTR("completion"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Generating new access code for user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v29 = CFSTR("HMAccessCodeManagerMessageKeyUserUUIDString");
    objc_msgSend(v6, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke;
    v26[3] = &unk_1E3AB60C8;
    v26[4] = v11;
    v27 = v6;
    v28 = v8;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerGenerateNewUserAccessCodeMessage"), v17, v26);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      v33 = 2080;
      v34 = "-[HMAccessCodeManager generateAccessCodeForUser:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v19);

  }
}

- (void)setAccessCode:(id)a3 forUser:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "uuid");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMAccessCodeManager setAccessCode:forUserWithUUID:completion:](self, "setAccessCode:forUserWithUUID:completion:", v9, v10, v8);

}

- (void)setAccessCode:(id)a3 forUserWithUUID:(id)a4 completion:(id)a5
{
  char *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessCodeManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HMAccessCodeManager *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMAccessCodeManager *v30;
  NSObject *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager setAccessCode:forUserWithUUID:completion:]", CFSTR("completion"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v32;
      v41 = 2112;
      v42 = (const char *)v28;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  -[HMAccessCodeManager context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMAccessCodeManager home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMAccessCodeManager convertPotentialUniqueIdentifier:toUUIDForUserInHome:](HMAccessCodeManager, "convertPotentialUniqueIdentifier:toUUIDForUserInHome:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v18;
      v41 = 2112;
      v42 = v8;
      v43 = 2112;
      v44 = v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Setting access code: %@ for user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v19 = (void *)MEMORY[0x1E0C99E08];
    v37 = CFSTR("HMAccessCodeManagerMessageKeyUserUUIDString");
    objc_msgSend(v14, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithDictionary:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("HMAccessCodeManagerMessageKeyAccessCodeString"));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke;
    v34[3] = &unk_1E3AB60C8;
    v34[4] = v16;
    v35 = v14;
    v36 = v11;
    v23 = v14;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v16, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerSetAccessCodeForUserMessage"), v22, v34);

  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v27;
      v41 = 2080;
      v42 = "-[HMAccessCodeManager setAccessCode:forUserWithUUID:completion:]";
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v22);
  }

}

- (void)resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessCodeManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMAccessCodeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  char *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:completion:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v14;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Resetting accessory access codes with value matching home access code: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "createHomeAccessCodeValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("HMAccessCodeManagerMessageKeyHomeAccessCodeValue");
    encodeRootObject(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke;
    v25[3] = &unk_1E3AB60C8;
    v25[4] = v11;
    v26 = v6;
    v27 = v8;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerResetAccessoryAccessCodesMessage"), v17, v25);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2080;
      v33 = "-[HMAccessCodeManager resetAccessoryAccessCodesWithValueMatchingHomeAccessCode:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v15);
  }

}

- (void)fetchCachedAccessoryAccessCodesWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMAccessCodeManager *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  void (**v21)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessCodeManager fetchCachedAccessoryAccessCodesWithCompletion:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = (const char *)v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  -[HMAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching cached accessory access codes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke;
    v20[3] = &unk_1E3AB59B8;
    v20[4] = v8;
    v21 = v5;
    -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v8, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerFetchCachedAccessCodesMessage"), 0, v20);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2080;
      v25 = "-[HMAccessCodeManager fetchCachedAccessoryAccessCodesWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v13);

  }
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  HMAccessCodeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v6, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  os_unfair_lock_unlock(&v6->_lock.lock);
  if (!v10)
    -[HMAccessCodeManager _subscribe](v6, "_subscribe");

}

- (void)handleDidAddAccessoryAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  HMAccessCodeManager *v24;
  id v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessoryAccessCodeValues"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didAddAccessoryAccessCodesMessage with accessoryAccessCodeValues: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke;
  v26[3] = &unk_1E3AAF3D8;
  v26[4] = v8;
  objc_msgSend(v6, "na_map:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v8, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v8->_lock.lock);
  -[HMAccessCodeManager context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke_148;
  v22 = &unk_1E3AB5CD0;
  v23 = v14;
  v24 = v8;
  v25 = v12;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v16, "invokeBlock:", &v19);

  objc_msgSend(v4, "respondWithSuccess", v19, v20, v21, v22);
}

- (void)handleDidUpdateAccessoryAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  HMAccessCodeManager *v24;
  id v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessoryAccessCodeValues"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didUpdateAccessoryAccessCodesMessage with accessoryAccessCodeValues: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke;
  v26[3] = &unk_1E3AAF3D8;
  v26[4] = v8;
  objc_msgSend(v6, "na_map:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v8, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v8->_lock.lock);
  -[HMAccessCodeManager context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke_151;
  v22 = &unk_1E3AB5CD0;
  v23 = v14;
  v24 = v8;
  v25 = v12;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v16, "invokeBlock:", &v19);

  objc_msgSend(v4, "respondWithSuccess", v19, v20, v21, v22);
}

- (void)handleDidRemoveAccessoryAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  HMAccessCodeManager *v24;
  id v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessoryAccessCodeValues"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didRemoveAccessoryAccessCodesMessage with accessoryAccessCodeValues: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke;
  v26[3] = &unk_1E3AAF3D8;
  v26[4] = v8;
  objc_msgSend(v6, "na_map:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v8, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v8->_lock.lock);
  -[HMAccessCodeManager context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke_154;
  v22 = &unk_1E3AB5CD0;
  v23 = v14;
  v24 = v8;
  v25 = v12;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v16, "invokeBlock:", &v19);

  objc_msgSend(v4, "respondWithSuccess", v19, v20, v21, v22);
}

- (void)handleDidAddHomeAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  HMAccessCodeManager *v24;
  id v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyHomeAccessCodeValues"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didAddHomeAccessCodesMessage with homeAccessCodeValues: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke;
  v26[3] = &unk_1E3AAF388;
  v26[4] = v8;
  objc_msgSend(v6, "na_map:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v8, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v8->_lock.lock);
  -[HMAccessCodeManager context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke_2;
  v22 = &unk_1E3AB5CD0;
  v23 = v14;
  v24 = v8;
  v25 = v12;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v16, "invokeBlock:", &v19);

  objc_msgSend(v4, "respondWithSuccess", v19, v20, v21, v22);
}

- (void)handleDidUpdateHomeAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  HMAccessCodeManager *v24;
  id v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyHomeAccessCodeValues"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didUpdateHomeAccessCodesMessage with homeAccessCodeValues: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke;
  v26[3] = &unk_1E3AAF388;
  v26[4] = v8;
  objc_msgSend(v6, "na_map:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v8, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v8->_lock.lock);
  -[HMAccessCodeManager context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke_2;
  v22 = &unk_1E3AB5CD0;
  v23 = v14;
  v24 = v8;
  v25 = v12;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v16, "invokeBlock:", &v19);

  objc_msgSend(v4, "respondWithSuccess", v19, v20, v21, v22);
}

- (void)handleDidRemoveHomeAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  HMAccessCodeManager *v24;
  id v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyHomeAccessCodeValues"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling didRemoveHomeAccessCodesMessage with homeAccessCodeValues: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke;
  v26[3] = &unk_1E3AAF388;
  v26[4] = v8;
  objc_msgSend(v6, "na_map:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessCodeManager observers](v8, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v8->_lock.lock);
  -[HMAccessCodeManager context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke_2;
  v22 = &unk_1E3AB5CD0;
  v23 = v14;
  v24 = v8;
  v25 = v12;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v16, "invokeBlock:", &v19);

  objc_msgSend(v4, "respondWithSuccess", v19, v20, v21, v22);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMAccessCodeManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (objc_class *)MEMORY[0x1E0D285D8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  -[HMAccessCodeManager messageTargetUUID](self, "messageTargetUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v12, "initWithTarget:", v13);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", v11, v17, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setResponseHandler:", v9);
  -[HMAccessCodeManager context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:", v14);

}

- (void)_subscribe
{
  void *v3;
  HMAccessCodeManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v4, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerSubscribeMessage"), 0, 0);
}

- (void)_unsubscribe
{
  void *v3;
  HMAccessCodeManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMAccessCodeManager _sendMessageWithName:payload:responseHandler:](v4, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMAccessCodeManagerUnsubscribeMessage"), 0, 0);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessCodeManager UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_home);
}

id __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMHomeAccessCode homeAccessCodeWithValue:home:](HMHomeAccessCode, "homeAccessCodeWithValue:home:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __61__HMAccessCodeManager_handleDidRemoveHomeAccessCodesMessage___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1A1AC1AAC]();
          v9 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = v4;
            v12 = v5;
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            v22 = 2112;
            v23 = v7;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didRemoveHomeAccessCodes:%@", buf, 0x20u);

            v2 = v13;
            v5 = v12;
            v4 = v11;
          }

          objc_autoreleasePoolPop(v8);
          objc_msgSend(v7, "accessCodeManager:didRemoveHomeAccessCodes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

}

id __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMHomeAccessCode homeAccessCodeWithValue:home:](HMHomeAccessCode, "homeAccessCodeWithValue:home:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __61__HMAccessCodeManager_handleDidUpdateHomeAccessCodesMessage___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1A1AC1AAC]();
          v9 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = v4;
            v12 = v5;
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            v22 = 2112;
            v23 = v7;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didUpdateHomeAccessCodes:%@", buf, 0x20u);

            v2 = v13;
            v5 = v12;
            v4 = v11;
          }

          objc_autoreleasePoolPop(v8);
          objc_msgSend(v7, "accessCodeManager:didUpdateHomeAccessCodes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

}

id __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMHomeAccessCode homeAccessCodeWithValue:home:](HMHomeAccessCode, "homeAccessCodeWithValue:home:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __58__HMAccessCodeManager_handleDidAddHomeAccessCodesMessage___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1A1AC1AAC]();
          v9 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = v4;
            v12 = v5;
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            v22 = 2112;
            v23 = v7;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didAddHomeAccessCodes:%@", buf, 0x20u);

            v2 = v13;
            v5 = v12;
            v4 = v11;
          }

          objc_autoreleasePoolPop(v8);
          objc_msgSend(v7, "accessCodeManager:didAddHomeAccessCodes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

}

id __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessoryAccessCode accessoryAccessCodeWithValue:accessory:](HMAccessoryAccessCode, "accessoryAccessCodeWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCode because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

void __66__HMAccessCodeManager_handleDidRemoveAccessoryAccessCodesMessage___block_invoke_154(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1A1AC1AAC]();
          v9 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = v4;
            v12 = v5;
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            v22 = 2112;
            v23 = v7;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didRemoveAccessoryAccessCodes:%@", buf, 0x20u);

            v2 = v13;
            v5 = v12;
            v4 = v11;
          }

          objc_autoreleasePoolPop(v8);
          objc_msgSend(v7, "accessCodeManager:didRemoveAccessoryAccessCodes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

}

id __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessoryAccessCode accessoryAccessCodeWithValue:accessory:](HMAccessoryAccessCode, "accessoryAccessCodeWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCode because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

void __66__HMAccessCodeManager_handleDidUpdateAccessoryAccessCodesMessage___block_invoke_151(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1A1AC1AAC]();
          v9 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = v4;
            v12 = v5;
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            v22 = 2112;
            v23 = v7;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didUpdateAccessoryAccessCodes:%@", buf, 0x20u);

            v2 = v13;
            v5 = v12;
            v4 = v11;
          }

          objc_autoreleasePoolPop(v8);
          objc_msgSend(v7, "accessCodeManager:didUpdateAccessoryAccessCodes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

}

id __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessoryAccessCode accessoryAccessCodeWithValue:accessory:](HMAccessoryAccessCode, "accessoryAccessCodeWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCode because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

void __63__HMAccessCodeManager_handleDidAddAccessoryAccessCodesMessage___block_invoke_148(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1A1AC1AAC]();
          v9 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v11 = v4;
            v12 = v5;
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            v21 = v14;
            v22 = 2112;
            v23 = v7;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Telling observer: %@: didAddAccessoryAccessCodes:%@", buf, 0x20u);

            v2 = v13;
            v5 = v12;
            v4 = v11;
          }

          objc_autoreleasePoolPop(v8);
          objc_msgSend(v7, "accessCodeManager:didAddAccessoryAccessCodes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

}

void __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessoryAccessCodeFetchResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_2;
      v30[3] = &unk_1E3AAF318;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_144;
      v27[3] = &unk_1E3AB5C58;
      v13 = *(void **)(a1 + 40);
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v10;
      v29 = v13;
      v14 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory access codes. Could not find fetch response object in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_143;
      v31[3] = &unk_1E3AB6078;
      v32 = *(id *)(a1 + 40);
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v18;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached accessory access codes with error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_142;
    v33[3] = &unk_1E3AB60A0;
    v35 = *(id *)(a1 + 40);
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_143(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessoryAccessCodeFetchResponse responseWithValue:accessory:](HMAccessoryAccessCodeFetchResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCodeFetchResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __69__HMAccessCodeManager_fetchCachedAccessoryAccessCodesWithCompletion___block_invoke_144(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with fetch responses for cached accessory access codes: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_2;
      v30[3] = &unk_1E3AAF3B0;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_141;
      v27[3] = &unk_1E3AB5C58;
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v10;
      v29 = *(id *)(a1 + 48);
      v13 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to reset accessory access code. Could not find modification response objects in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_140;
      v31[3] = &unk_1E3AB6078;
      v32 = *(id *)(a1 + 48);
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v38 = v17;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to reset accessory access codes with value matching home access code: %@, with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_139;
    v33[3] = &unk_1E3AB60A0;
    v35 = *(id *)(a1 + 48);
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_139(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_140(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessCodeModificationResponse responseWithValue:accessory:](HMAccessCodeModificationResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __91__HMAccessCodeManager_resetAccessoryAccessCodesWithValueMatchingHomeAccessCode_completion___block_invoke_141(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_2;
      v31[3] = &unk_1E3AAF3B0;
      v31[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v9;
      v28[1] = 3221225472;
      v28[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_138;
      v28[3] = &unk_1E3AB5C58;
      v28[4] = *(_QWORD *)(a1 + 32);
      v29 = v10;
      v30 = *(id *)(a1 + 48);
      v13 = v10;
      objc_msgSend(v12, "invokeBlock:", v28);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v39 = v24;
        v40 = 2112;
        v41 = v25;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to set access code for user: %@. Could not find modification response objects in message response.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "delegateCaller");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_137;
      v32[3] = &unk_1E3AB6078;
      v33 = *(id *)(a1 + 48);
      objc_msgSend(v27, "invokeBlock:", v32);

      v8 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v39 = v17;
      v40 = 2112;
      v41 = v18;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to set access code for user with UUID: %@, with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_136;
    v34[3] = &unk_1E3AB60A0;
    v36 = *(id *)(a1 + 48);
    v35 = v5;
    objc_msgSend(v20, "invokeBlock:", v34);

    v8 = v36;
  }

}

uint64_t __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_137(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessCodeModificationResponse responseWithValue:accessory:](HMAccessCodeModificationResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __64__HMAccessCodeManager_setAccessCode_forUserWithUUID_completion___block_invoke_138(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_2;
      v30[3] = &unk_1E3AAF3B0;
      v30[4] = a1[4];
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_134;
      v27[3] = &unk_1E3AB5C58;
      v27[4] = a1[4];
      v28 = v10;
      v29 = a1[6];
      v13 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = a1[4];
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate new access code. Could not find modification response objects in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(a1[4], "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_133;
      v31[3] = &unk_1E3AB6078;
      v32 = a1[6];
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = a1[4];
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v17;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate new access code for user with UUID: %@, with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(a1[4], "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_132;
    v33[3] = &unk_1E3AB60A0;
    v35 = a1[6];
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_133(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessCodeModificationResponse responseWithValue:accessory:](HMAccessCodeModificationResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __60__HMAccessCodeManager_generateAccessCodeForUser_completion___block_invoke_134(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_2;
      v30[3] = &unk_1E3AAF3B0;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_131;
      v27[3] = &unk_1E3AB5C58;
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v10;
      v29 = *(id *)(a1 + 48);
      v13 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit modification requests. Could not find modification response objects in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_130;
      v31[3] = &unk_1E3AB6078;
      v32 = *(id *)(a1 + 48);
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v38 = v17;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit access code modification requests: %@, with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_129;
    v33[3] = &unk_1E3AB60A0;
    v35 = *(id *)(a1 + 48);
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_130(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessCodeModificationResponse responseWithValue:accessory:](HMAccessCodeModificationResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __71__HMAccessCodeManager_submitAccessCodeModificationRequests_completion___block_invoke_131(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessCodeModificationResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_2;
      v30[3] = &unk_1E3AAF3B0;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_127;
      v27[3] = &unk_1E3AB5C58;
      v13 = *(void **)(a1 + 40);
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v10;
      v29 = v13;
      v14 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove simple label access code. Could not find modification response objects in message response.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_124;
      v31[3] = &unk_1E3AB6078;
      v32 = *(id *)(a1 + 40);
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v18;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove simple label access code with error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_122;
    v33[3] = &unk_1E3AB60A0;
    v35 = *(id *)(a1 + 40);
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_124(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessCodeModificationResponse responseWithValue:accessory:](HMAccessCodeModificationResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessCodeModificationResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __62__HMAccessCodeManager_removeSimpleLabelAccessCode_completion___block_invoke_127(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with modification responses for removed simple label access code: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __64__HMAccessCodeManager_removeHomeAccessCodeWithValue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set user information: %@, for home access code with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke_120;
  v16[3] = &unk_1E3AB60A0;
  v14 = *(id *)(a1 + 48);
  v17 = v5;
  v18 = v14;
  v15 = v5;
  objc_msgSend(v13, "invokeBlock:", v16);

}

uint64_t __80__HMAccessCodeManager_setUserInformation_forHomeAccessCodeWithValue_completion___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyHomeAccessCodeValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_2;
      v30[3] = &unk_1E3AAF388;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_3;
      v27[3] = &unk_1E3AB5C58;
      v13 = *(void **)(a1 + 40);
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v10;
      v29 = v13;
      v14 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home access codes. Could not find access codes in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_117;
      v31[3] = &unk_1E3AB6078;
      v32 = *(id *)(a1 + 40);
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v18;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home access codes with error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_115;
    v33[3] = &unk_1E3AB60A0;
    v35 = *(id *)(a1 + 40);
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_117(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMHomeAccessCode homeAccessCodeWithValue:home:](HMHomeAccessCode, "homeAccessCodeWithValue:home:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__HMAccessCodeManager_fetchHomeAccessCodesWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with home access codes: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessoryAccessCodeConstraintsFetchResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2_112;
      v30[3] = &unk_1E3AAF360;
      v30[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_3;
      v27[3] = &unk_1E3AB5C58;
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v10;
      v29 = *(id *)(a1 + 48);
      v13 = v10;
      objc_msgSend(v12, "invokeBlock:", v27);

    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access code constraints. Could not find fetch response object in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_111;
      v31[3] = &unk_1E3AB6078;
      v32 = *(id *)(a1 + 48);
      objc_msgSend(v26, "invokeBlock:", v31);

      v8 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v38 = v17;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access code constraints from accessories: %@, with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_109;
    v33[3] = &unk_1E3AB60A0;
    v35 = *(id *)(a1 + 48);
    v34 = v5;
    objc_msgSend(v20, "invokeBlock:", v33);

    v8 = v35;
  }

}

uint64_t __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_111(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_2_112(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessoryAccessCodeConstraintsFetchResponse responseWithValue:home:](HMAccessoryAccessCodeConstraintsFetchResponse, "responseWithValue:home:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with fetch responses: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __76__HMAccessCodeManager_fetchAccessCodeConstraintsFromAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[2];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMAccessCodeManagerMessageKeyAccessoryAccessCodeFetchResponseValues"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v13;
        v41 = 2112;
        v42 = v8;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received accessory access code fetch response values: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v14 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_103;
      v32[3] = &unk_1E3AAF318;
      v32[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "na_map:", v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v14;
      v29[1] = 3221225472;
      v29[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_106;
      v29[3] = &unk_1E3AB5C58;
      v29[4] = *(_QWORD *)(a1 + 32);
      v30 = v15;
      v31 = *(id *)(a1 + 48);
      v18 = v15;
      objc_msgSend(v17, "invokeBlock:", v29);

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access codes. Could not find fetch response object in message.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "delegateCaller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_102;
      v33[3] = &unk_1E3AB6078;
      v34 = *(id *)(a1 + 48);
      objc_msgSend(v28, "invokeBlock:", v33);

      v8 = 0;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v40 = v22;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v5;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access codes from accessories: %@, with error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "delegateCaller");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_98;
    v35[3] = &unk_1E3AB60A0;
    v37 = *(id *)(a1 + 48);
    v36 = v5;
    objc_msgSend(v25, "invokeBlock:", v35);

    v8 = v37;
  }

}

uint64_t __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_102(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

id __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMAccessoryAccessCodeFetchResponse responseWithValue:accessory:](HMAccessoryAccessCodeFetchResponse, "responseWithValue:accessory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating HMAccessoryAccessCodeFetchResponse because we could not find the accessory with UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke_106(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with fetch responses for accessory access codes: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __66__HMAccessCodeManager_fetchAccessCodesFromAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __55__HMAccessCodeManager_accessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

+ (BOOL)doesAccessCode:(id)a3 conflictWithExistingAccessCodes:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HMAccessCodeManager_doesAccessCode_conflictWithExistingAccessCodes___block_invoke;
  v8[3] = &unk_1E3AAFB58;
  v9 = v5;
  v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "na_any:", v8);

  return (char)a4;
}

+ (BOOL)isWeakAccessCode:(id)a3
{
  return SecPasswordIsPasswordWeak2();
}

+ (id)generateAccessCodeValueFromConstraints:(id)a3 existingAccessCodes:(id)a4
{
  return (id)objc_msgSend(a1, "generateAccessCodeValueFromConstraints:accessoryAccessCodes:homeAccessCodes:", a3, a4, 0);
}

+ (id)generateAccessCodeValueFromConstraints:(id)a3 accessoryAccessCodes:(id)a4 homeAccessCodes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMAccessCodeValue *v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "addObjectsFromArray:", v9);
  v12 = objc_msgSend(a1, "_accessCodeLengthFromLowerBound:upperBound:", objc_msgSend(a1, "greatestLowerBoundForAccessCodeLengthFromConstraints:", v8), objc_msgSend(a1, "leastUpperBoundForAccessCodeLengthFromConstraints:", v8));
  if (v12 == -1)
  {
    v17 = 0;
  }
  else
  {
    v13 = v12;
    v14 = 0;
    v15 = 10;
    while (1)
    {
      v16 = v14;
      objc_msgSend(a1, "_createAccessCodeWithLength:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!objc_msgSend(v11, "containsObject:", v14))
          break;
      }
      if (!--v15)
      {
        v17 = 0;
        goto LABEL_11;
      }
    }
    v17 = -[HMAccessCodeValue initWithStringValue:]([HMAccessCodeValue alloc], "initWithStringValue:", v14);
LABEL_11:

  }
  return v17;
}

+ (int64_t)leastUpperBoundForAccessCodeLengthFromConstraints:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "na_map:", &__block_literal_global_13747);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@min.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

+ (int64_t)greatestLowerBoundForAccessCodeLengthFromConstraints:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "na_map:", &__block_literal_global_69);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@max.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

+ (int64_t)_accessCodeLengthFromLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  if (a3 > a4)
    return -1;
  if (a3 <= 6 && a4 > 5)
    return 6;
  if (a3 <= 4 && a4 > 3)
    return 4;
  if (a3 <= 3)
    return -1;
  return a3;
}

+ (id)_createAccessCodeWithLength:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  HMGenerateDecimalDigitPasswordWithLength(a3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2048;
      v16 = a3;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate access code with length: %ld, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

+ (HMAccessCodeConstraints)accessCodeConstraints
{
  return -[HMAccessCodeConstraints initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:]([HMAccessCodeConstraints alloc], "initWithAllowedCharacterSets:minimumLength:maximumLength:maximumAllowedAccessCodes:", 1, 4, 8, 1000);
}

+ (id)accessCodeManagerUUIDFromHomeUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("5B1683C8-EAFC-436F-9DBD-1A08AD6E62D3"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)valueObjectsForAccessCodeModificationRequests:(id)a3 home:(id)a4
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_168, a4);
}

+ (id)convertPotentialUniqueIdentifier:(id)a3 toUUIDForUserInHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "users");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v14;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v16;
    v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@convertPotentialUniqueIdentifier: %@ where current user has uuid %@ and uniqueIdentifier %@", buf, 0x2Au);

    v10 = v25;
  }

  objc_autoreleasePoolPop(v11);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__HMAccessCodeManager_convertPotentialUniqueIdentifier_toUUIDForUserInHome___block_invoke;
  v26[3] = &unk_1E3AB1AF0;
  v27 = v6;
  v19 = v6;
  objc_msgSend(v10, "na_firstObjectPassingTest:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    v22 = v21;
  else
    v22 = v19;
  v23 = v22;

  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107 != -1)
    dispatch_once(&logCategory__hmf_once_t107, &__block_literal_global_175);
  return (id)logCategory__hmf_once_v108;
}

void __34__HMAccessCodeManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v108;
  logCategory__hmf_once_v108 = v0;

}

uint64_t __76__HMAccessCodeManager_convertPotentialUniqueIdentifier_toUUIDForUserInHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

id __74__HMAccessCodeManager_valueObjectsForAccessCodeModificationRequests_home___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v4)
  {
    objc_msgSend(v4, "createAccessCodeAddRequestValue");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (v7)
  {
    objc_msgSend(v7, "createAccessCodeUpdateRequestValue");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10)
    {
      v12 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v10, "createAccessCodeRemoveRequestValue");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_17:

  return v12;
}

uint64_t __76__HMAccessCodeManager_greatestLowerBoundForAccessCodeLengthFromConstraints___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "minimumLength"));
}

uint64_t __73__HMAccessCodeManager_leastUpperBoundForAccessCodeLengthFromConstraints___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "maximumLength"));
}

uint64_t __70__HMAccessCodeManager_doesAccessCode_conflictWithExistingAccessCodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;

  v3 = a2;
  v4 = HMFEqualObjects();
  v5 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));
  LODWORD(a1) = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", v3);

  return v4 | v5 | a1;
}

@end
