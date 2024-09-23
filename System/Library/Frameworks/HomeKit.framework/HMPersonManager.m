@implementation HMPersonManager

- (HMPersonManager)initWithContext:(id)a3 UUID:(id)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMPersonManager *v12;
  HMPersonManager *v13;
  uint64_t v14;
  NSUUID *UUID;
  uint64_t v16;
  NSHashTable *observers;
  id fetchClientFactory;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMPersonManager;
  v12 = -[HMPersonManager init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    UUID = v13->_UUID;
    v13->_UUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_notificationCenter, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v16;

    fetchClientFactory = v13->_fetchClientFactory;
    v13->_fetchClientFactory = &__block_literal_global;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[NSHashTable anyObject](self->_observers, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HMPersonManager unsubscribe](self, "unsubscribe");
  -[HMPersonManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMPersonManager;
  -[HMPersonManager dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v5;
}

- (void)addObserver:(id)a3
{
  NSUInteger v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  v4 = -[NSHashTable count](self->_observers, "count");
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);
  if (!v4)
    -[HMPersonManager subscribe](self, "subscribe");

}

- (void)removeObserver:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = -[NSHashTable count](self->_observers, "count");
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
  v5 = -[NSHashTable count](self->_observers, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (!v5 && v4)
    -[HMPersonManager unsubscribe](self, "unsubscribe");

}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Perform cloud pull"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing cloud pull", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v7, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.pcp"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__HMPersonManager_performCloudPullWithCompletion___block_invoke;
  v20[3] = &unk_1E3AB60C8;
  v20[4] = v7;
  v21 = v5;
  v22 = v4;
  v16 = v4;
  v17 = v5;
  objc_msgSend(v15, "setResponseHandler:", v20);
  -[HMPersonManager context](v7, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:", v15);

}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMPersonManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch persons"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching persons with UUIDs: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v27 = CFSTR("HMPM.mk.pu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v10, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.fp"), v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMPersonManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:", v19);

}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch all persons"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all persons", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v7, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  -[HMPersonManager fetchClientFactory](v7, "fetchClientFactory");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager context](v7, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, const __CFString *, void *))v15)[2](v15, v16, v17, CFSTR("HMPM.m.fp"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setClassForUnarchiving:", objc_opt_class());
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__HMPersonManager_fetchAllPersonsWithCompletion___block_invoke;
  v21[3] = &unk_1E3AB3E50;
  v21[4] = v7;
  v22 = v5;
  v23 = v4;
  v19 = v4;
  v20 = v5;
  objc_msgSend(v18, "fetchWithCompletion:", v21);

}

- (void)fetchFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMPersonManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch face crops"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crops with UUIDs: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v27 = CFSTR("HMPM.mk.fcu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v10, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.ffc"), v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMPersonManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:", v19);

}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMPersonManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch face crops for persons"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crops for persons with UUIDs: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v27 = CFSTR("HMPM.mk.pu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v10, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.fpfc"), v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMPersonManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:", v19);

}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch all person face crops"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all person face crops", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v7, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  -[HMPersonManager fetchClientFactory](v7, "fetchClientFactory");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager context](v7, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, const __CFString *, void *))v15)[2](v15, v16, v17, CFSTR("HMPM.m.fpfc"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setClassForUnarchiving:", objc_opt_class());
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HMPersonManager_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v21[3] = &unk_1E3AB3E50;
  v21[4] = v7;
  v22 = v5;
  v23 = v4;
  v19 = v4;
  v20 = v5;
  objc_msgSend(v18, "fetchWithCompletion:", v21);

}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch all face crops"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all unassociated face crops", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v7, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  -[HMPersonManager fetchClientFactory](v7, "fetchClientFactory");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager context](v7, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, const __CFString *, void *))v15)[2](v15, v16, v17, CFSTR("HMPM.m.fufc"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setClassForUnarchiving:", objc_opt_class());
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__HMPersonManager_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v21[3] = &unk_1E3AB3E50;
  v21[4] = v7;
  v22 = v5;
  v23 = v4;
  v19 = v4;
  v20 = v5;
  objc_msgSend(v18, "fetchWithCompletion:", v21);

}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMPersonManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch faceprints"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching faceprints for face crops with UUIDs: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v27 = CFSTR("HMPM.mk.fcu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v10, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.ff"), v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMPersonManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:", v19);

}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch all faceprints"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all faceprints", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v7, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  -[HMPersonManager fetchClientFactory](v7, "fetchClientFactory");
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager context](v7, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, const __CFString *, void *))v15)[2](v15, v16, v17, CFSTR("HMPM.m.ff"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setClassForUnarchiving:", objc_opt_class());
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__HMPersonManager_fetchAllFaceprintsWithCompletion___block_invoke;
  v21[3] = &unk_1E3AB3E50;
  v21[4] = v7;
  v22 = v5;
  v23 = v4;
  v19 = v4;
  v20 = v5;
  objc_msgSend(v18, "fetchWithCompletion:", v21);

}

- (void)addOrUpdatePersons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMPersonManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Add persons"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v13;
    v42 = 2114;
    v43 = v15;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating persons to persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;
  if (v16)
  {
    v38 = CFSTR("HMPM.mk.p");
    v39 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMPersonManager UUID](v11, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.aoup"), v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __49__HMPersonManager_addOrUpdatePersons_completion___block_invoke;
    v33[3] = &unk_1E3AB4B08;
    v33[4] = v11;
    v34 = v9;
    v35 = v6;
    v36 = v8;
    objc_msgSend(v22, "setResponseHandler:", v33);
    -[HMPersonManager context](v11, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "messageDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendMessage:", v22);

  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = v11;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v32 = v8;
      v30 = v25;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2114;
      v43 = v31;
      v44 = 2112;
      v45 = v17;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize persons: %@", buf, 0x20u);

      v25 = v30;
      v8 = v32;

    }
    objc_autoreleasePoolPop(v25);
    -[HMPersonManager context](v26, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "delegateCaller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "callCompletion:error:", v8, v22);
  }

}

- (void)addOrUpdateFaceCrops:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMPersonManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Add face crops"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v13;
    v42 = 2114;
    v43 = v15;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating face crops to persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;
  if (v16)
  {
    v38 = CFSTR("HMPM.mk.fc");
    v39 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMPersonManager UUID](v11, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.aoufc"), v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __51__HMPersonManager_addOrUpdateFaceCrops_completion___block_invoke;
    v33[3] = &unk_1E3AB4B08;
    v33[4] = v11;
    v34 = v9;
    v35 = v6;
    v36 = v8;
    objc_msgSend(v22, "setResponseHandler:", v33);
    -[HMPersonManager context](v11, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "messageDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendMessage:", v22);

  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = v11;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v32 = v8;
      v30 = v25;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2114;
      v43 = v31;
      v44 = 2112;
      v45 = v17;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize face crops: %@", buf, 0x20u);

      v25 = v30;
      v8 = v32;

    }
    objc_autoreleasePoolPop(v25);
    -[HMPersonManager context](v26, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "delegateCaller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "callCompletion:error:", v8, v22);
  }

}

- (void)addOrUpdateFaceprints:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMPersonManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Add faceprints"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v13;
    v42 = 2114;
    v43 = v15;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating faceprints to persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;
  if (v16)
  {
    v38 = CFSTR("HMPM.mk.f");
    v39 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMPersonManager UUID](v11, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.aouf"), v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __52__HMPersonManager_addOrUpdateFaceprints_completion___block_invoke;
    v33[3] = &unk_1E3AB4B08;
    v33[4] = v11;
    v34 = v9;
    v35 = v6;
    v36 = v8;
    objc_msgSend(v22, "setResponseHandler:", v33);
    -[HMPersonManager context](v11, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "messageDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendMessage:", v22);

  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = v11;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v32 = v8;
      v30 = v25;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2114;
      v43 = v31;
      v44 = 2112;
      v45 = v17;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize faceprints: %@", buf, 0x20u);

      v25 = v30;
      v8 = v32;

    }
    objc_autoreleasePoolPop(v25);
    -[HMPersonManager context](v26, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "delegateCaller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "callCompletion:error:", v8, v22);
  }

}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMPersonManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[3];
  _QWORD v42[3];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v11)
    goto LABEL_7;
  v13 = v12;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Associate face crops"));
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shortDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMStringFromPersonFaceCropSource(a5);
    v35 = v14;
    v21 = a5;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v44 = v18;
    v45 = 2114;
    v46 = v20;
    v47 = 2112;
    v48 = v10;
    v49 = 2112;
    v50 = v11;
    v51 = 2112;
    v52 = v22;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Associating face crops with UUIDs %@ to person with UUID %@ for source: %@", buf, 0x34u);

    a5 = v21;
    v14 = v35;

    v13 = v36;
  }

  objc_autoreleasePoolPop(v15);
  v42[0] = v10;
  v41[0] = CFSTR("HMPM.mk.fcu");
  v41[1] = CFSTR("HMPM.mk.pu");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v23;
  v41[2] = CFSTR("HMPM.mk.s");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v16, "UUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithTarget:", v27);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.afc"), v28, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __85__HMPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke;
  v37[3] = &unk_1E3AB4B08;
  v37[4] = v16;
  v38 = v14;
  v39 = v10;
  v40 = v13;
  v30 = v13;
  v31 = v10;
  v32 = v14;
  objc_msgSend(v29, "setResponseHandler:", v37);
  -[HMPersonManager context](v16, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "messageDispatcher");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sendMessage:", v29);

}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMPersonManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMPersonManager *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  if (!v9)
    goto LABEL_14;
  v11 = v10;
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138544130;
    v29 = v15;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v17;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Associating face crops with UUIDs %@ to person with UUID %@ (processName: %@)", (uint8_t *)&v28, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Home"));

  v21 = (void *)MEMORY[0x1A1AC1AAC]();
  v22 = v13;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v25;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Associating face crops using User source because client is Home app", (uint8_t *)&v28, 0xCu);

    }
    v26 = 2;
  }
  else
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Associating face crops using Unknown source", (uint8_t *)&v28, 0xCu);

    }
    v26 = 0;
  }

  objc_autoreleasePoolPop(v21);
  -[HMPersonManager associateFaceCropsWithUUIDs:toPersonWithUUID:forSource:completion:](v22, "associateFaceCropsWithUUIDs:toPersonWithUUID:forSource:completion:", v8, v9, v26, v11);

}

- (void)disassociateFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMPersonManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Disassociate face crops"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v13;
    v38 = 2114;
    v39 = v15;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Disassociating unassociated face crops with UUIDs %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v34 = CFSTR("HMPM.mk.fcu");
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v11, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.dfc"), v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __61__HMPersonManager_disassociateFaceCropsWithUUIDs_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v11;
  v31 = v9;
  v32 = v6;
  v33 = v8;
  v21 = v8;
  v22 = v6;
  v23 = v9;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMPersonManager context](v11, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v20);

}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMPersonManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Remove persons"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v13;
    v38 = 2114;
    v39 = v15;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing persons with UUIDs from persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v34 = CFSTR("HMPM.mk.pu");
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v11, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.rp"), v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __53__HMPersonManager_removePersonsWithUUIDs_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v11;
  v31 = v9;
  v32 = v6;
  v33 = v8;
  v21 = v8;
  v22 = v6;
  v23 = v9;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMPersonManager context](v11, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v20);

}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMPersonManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Remove face crops"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v13;
    v38 = 2114;
    v39 = v15;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing faceCrops with UUIDs from persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v34 = CFSTR("HMPM.mk.fcu");
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v11, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.rfc"), v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __55__HMPersonManager_removeFaceCropsWithUUIDs_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v11;
  v31 = v9;
  v32 = v6;
  v33 = v8;
  v21 = v8;
  v22 = v6;
  v23 = v9;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMPersonManager context](v11, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v20);

}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMPersonManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMPersonManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Remove faceprints"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v13;
    v38 = 2114;
    v39 = v15;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing faceprints with UUIDs from persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v34 = CFSTR("HMPM.mk.fu");
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v11, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.rf"), v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __56__HMPersonManager_removeFaceprintsWithUUIDs_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v11;
  v31 = v9;
  v32 = v6;
  v33 = v8;
  v21 = v8;
  v22 = v6;
  v23 = v9;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMPersonManager context](v11, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v20);

}

- (void)configure
{
  void *v3;
  HMPersonManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Configuring person manager", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMPersonManager context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:selector:", CFSTR("HMPM.m.dcpd"), v4, sel_handleDidChangePersonDataMessage_);

  -[HMPersonManager notificationCenter](v4, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_handleDaemonReconnectedNotification_, CFSTR("HMDaemonReconnectedNotification"), 0);

}

- (void)subscribe
{
  void *v3;
  HMPersonManager *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing to person changes", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v4, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.s"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v10);

}

- (void)unsubscribe
{
  void *v3;
  HMPersonManager *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from person changes", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonManager UUID](v4, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMPM.m.u"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v10);

}

- (void)handleDidChangePersonDataMessage:(id)a3
{
  id v4;
  void *v5;
  HMPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  HMPersonManager *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
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
    v49 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling did change person data message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.up"), v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.uufc"), v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.upfc"), v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.uf"), v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setForKey:", CFSTR("HMPM.mk.rpu"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForKey:", CFSTR("HMPM.mk.rfcu"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForKey:", CFSTR("HMPM.mk.rfu"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[NSHashTable allObjects](v6->_observers, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&v6->_lock);
  -[HMPersonManager context](v6, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __52__HMPersonManager_handleDidChangePersonDataMessage___block_invoke;
  v34[3] = &unk_1E3AAD9B8;
  v35 = v33;
  v36 = v6;
  v37 = v14;
  v38 = v32;
  v39 = v31;
  v40 = v29;
  v17 = (void *)v16;
  v41 = v27;
  v42 = v25;
  v43 = v13;
  v18 = v13;
  v26 = v25;
  v19 = v15;
  v20 = v17;
  v28 = v27;
  v30 = v29;
  v21 = v31;
  v22 = v32;
  v23 = v14;
  v24 = v33;
  objc_msgSend(v20, "invokeBlock:", v34);

  objc_msgSend(v4, "respondWithPayload:", 0);
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  HMPersonManager *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v9 = -[NSHashTable count](v6->_observers, "count");
  os_unfair_lock_unlock(&v6->_lock);
  if (v9)
    -[HMPersonManager subscribe](v6, "subscribe");

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMPersonManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (id)fetchClientFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchClientFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 40, 1);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchClientFactory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __52__HMPersonManager_handleDidChangePersonDataMessage___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint8_t v113[128];
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "count"))
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = a1[5];
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(a1[4], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v5;
      v116 = 2048;
      v117 = v6;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated persons", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v7 = a1[6];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v104;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v104 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "personManager:didUpdatePersons:", a1[5], a1[4]);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      }
      while (v9);
    }

  }
  if (objc_msgSend(a1[7], "count"))
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = a1[5];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(a1[7], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v16;
      v116 = 2048;
      v117 = v17;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated unassociated face crops", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v18 = a1[6];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v100;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v100 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v22);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "personManager:didUpdateUnassociatedFaceCrops:", a1[5], a1[7]);
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
      }
      while (v20);
    }

  }
  if (objc_msgSend(a1[8], "count"))
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = a1[5];
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(a1[8], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v27;
      v116 = 2048;
      v117 = v28;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated person face crops", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v29 = a1[6];
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v96;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v96 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v33);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v34, "personManager:didUpdatePersonFaceCrops:", a1[5], a1[8]);
          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
      }
      while (v31);
    }

  }
  if (objc_msgSend(a1[9], "count"))
  {
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = a1[5];
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(a1[9], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v38;
      v116 = 2048;
      v117 = v39;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated faceprints", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v40 = a1[6];
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v92;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v92 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v44);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v45, "personManager:didUpdateFaceprints:", a1[5], a1[9]);
          ++v44;
        }
        while (v42 != v44);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
      }
      while (v42);
    }

  }
  if (objc_msgSend(a1[10], "count"))
  {
    v46 = (void *)MEMORY[0x1A1AC1AAC]();
    v47 = a1[5];
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(a1[10], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v49;
      v116 = 2048;
      v117 = v50;
      _os_log_impl(&dword_19B1B0000, v48, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed person UUIDs", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v46);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v51 = a1[6];
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v109, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v88;
      do
      {
        v55 = 0;
        do
        {
          if (*(_QWORD *)v88 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v55);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v56, "personManager:didRemovePersonsWithUUIDs:", a1[5], a1[10]);
          ++v55;
        }
        while (v53 != v55);
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v109, 16);
      }
      while (v53);
    }

  }
  if (objc_msgSend(a1[11], "count"))
  {
    v57 = (void *)MEMORY[0x1A1AC1AAC]();
    v58 = a1[5];
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(a1[11], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v60;
      v116 = 2048;
      v117 = v61;
      _os_log_impl(&dword_19B1B0000, v59, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed face crop UUIDs", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v57);
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v62 = a1[6];
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v83, v108, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v84;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v84 != v65)
            objc_enumerationMutation(v62);
          v67 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v66);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v67, "personManager:didRemoveFaceCropsWithUUIDs:", a1[5], a1[11]);
          ++v66;
        }
        while (v64 != v66);
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v83, v108, 16);
      }
      while (v64);
    }

  }
  if (objc_msgSend(a1[12], "count"))
  {
    v68 = (void *)MEMORY[0x1A1AC1AAC]();
    v69 = a1[5];
    HMFGetOSLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(a1[12], "count");
      *(_DWORD *)buf = 138543618;
      v115 = v71;
      v116 = 2048;
      v117 = v72;
      _os_log_impl(&dword_19B1B0000, v70, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed faceprint UUIDs", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v68);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v73 = a1[6];
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v80;
      do
      {
        v77 = 0;
        do
        {
          if (*(_QWORD *)v80 != v76)
            objc_enumerationMutation(v73);
          v78 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v77);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v78, "personManager:didRemoveFaceprintsWithUUIDs:", a1[5], a1[12], (_QWORD)v79);
          ++v77;
        }
        while (v75 != v77);
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
      }
      while (v75);
    }

  }
}

void __56__HMPersonManager_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to remove faceprints: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully removed %lu faceprints";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __55__HMPersonManager_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to remove face crops: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully removed %lu face crops";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __53__HMPersonManager_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to remove persons: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully removed %lu persons";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __61__HMPersonManager_disassociateFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to disassociate face crops: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully disassociated %lu face crops";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __85__HMPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to associate face crops: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully associated %lu face crops";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __52__HMPersonManager_addOrUpdateFaceprints_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to add/update faceprints: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully added/updated %lu faceprints";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __51__HMPersonManager_addOrUpdateFaceCrops_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to add/update face crops: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully added/updated %lu face crops";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __49__HMPersonManager_addOrUpdatePersons_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to add/update persons: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully added/updated %lu persons";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __52__HMPersonManager_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu faceprints", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v16;
      v21 = 2114;
      v22 = v18;
      v23 = 2112;
      v24 = (uint64_t)v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all faceprints: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2114;
      v43 = v12;
      v44 = 2112;
      v45 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch faceprints: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_113;
    v36[3] = &unk_1E3AB60A0;
    v38 = a1[6];
    v37 = v5;
    objc_msgSend(v14, "invokeBlock:", v36);

    v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.f"), v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138543874;
        v41 = v21;
        v42 = 2114;
        v43 = v23;
        v44 = 2048;
        v45 = v24;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu faceprints", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_116;
      v31[3] = &unk_1E3AB60A0;
      v27 = &v33;
      v33 = a1[6];
      v32 = v15;
      objc_msgSend(v26, "invokeBlock:", v31);

      v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized faceprints in response payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "delegateCaller");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_115;
      v34[3] = &unk_1E3AB6078;
      v27 = &v35;
      v35 = a1[6];
      objc_msgSend(v30, "invokeBlock:", v34);

    }
  }

}

uint64_t __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_115(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __67__HMPersonManager_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __63__HMPersonManager_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu unassociated face crops", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v16;
      v21 = 2114;
      v22 = v18;
      v23 = 2112;
      v24 = (uint64_t)v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all unassociated face crops: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __57__HMPersonManager_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu person face crops", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v16;
      v21 = 2114;
      v22 = v18;
      v23 = 2112;
      v24 = (uint64_t)v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all person face crops: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2114;
      v43 = v12;
      v44 = 2112;
      v45 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crops: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_103;
    v36[3] = &unk_1E3AB60A0;
    v38 = a1[6];
    v37 = v5;
    objc_msgSend(v14, "invokeBlock:", v36);

    v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.fc"), v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138543874;
        v41 = v21;
        v42 = 2114;
        v43 = v23;
        v44 = 2048;
        v45 = v24;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu face crops", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_106;
      v31[3] = &unk_1E3AB60A0;
      v27 = &v33;
      v33 = a1[6];
      v32 = v15;
      objc_msgSend(v26, "invokeBlock:", v31);

      v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized person face crops in response payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "delegateCaller");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_105;
      v34[3] = &unk_1E3AB6078;
      v27 = &v35;
      v35 = a1[6];
      objc_msgSend(v30, "invokeBlock:", v34);

    }
  }

}

uint64_t __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_105(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __64__HMPersonManager_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2114;
      v43 = v12;
      v44 = 2112;
      v45 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crops: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_97;
    v36[3] = &unk_1E3AB60A0;
    v38 = a1[6];
    v37 = v5;
    objc_msgSend(v14, "invokeBlock:", v36);

    v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.fc"), v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138543874;
        v41 = v21;
        v42 = 2114;
        v43 = v23;
        v44 = 2048;
        v45 = v24;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu face crops", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_100;
      v31[3] = &unk_1E3AB60A0;
      v27 = &v33;
      v33 = a1[6];
      v32 = v15;
      objc_msgSend(v26, "invokeBlock:", v31);

      v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized face crops in response payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "delegateCaller");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_99;
      v34[3] = &unk_1E3AB6078;
      v27 = &v35;
      v35 = a1[6];
      objc_msgSend(v30, "invokeBlock:", v34);

    }
  }

}

uint64_t __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_99(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __54__HMPersonManager_fetchFaceCropsWithUUIDs_completion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __49__HMPersonManager_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v61 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v62 = v5;
    v9 = v5;
    v10 = (void *)v8;
    obj = v9;
    v63 = (void *)v8;
    v64 = a1;
    v67 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (!v67)
      goto LABEL_21;
    v66 = *(_QWORD *)v69;
    while (1)
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v69 != v66)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v12, "externalPersonUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        objc_msgSend(v10, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
          goto LABEL_18;
        objc_msgSend(v17, "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "compare:", v20);

        v22 = (void *)MEMORY[0x1A1AC1AAC]();
        v23 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
        if (v21 != 1)
        {
          if (v25)
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "shortDescription");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v73 = v29;
            v74 = 2114;
            v75 = v31;
            v76 = 2112;
            v77 = (uint64_t)v18;
            _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Ignoring person with duplicate external person UUID: %@", buf, 0x20u);

            a1 = v64;
            v10 = v63;
          }

          objc_autoreleasePoolPop(v22);
LABEL_18:
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v16);
          goto LABEL_19;
        }
        if (v25)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "shortDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v73 = v26;
          v74 = 2114;
          v75 = v28;
          v76 = 2112;
          v77 = (uint64_t)v12;
          _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Ignoring person with duplicate external person UUID: %@", buf, 0x20u);

          a1 = v64;
          v10 = v63;

        }
        objc_autoreleasePoolPop(v22);
LABEL_19:

      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      if (!v67)
      {
LABEL_21:

        objc_msgSend(v10, "allValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");
        v34 = a1;
        v35 = objc_msgSend(obj, "count");
        v36 = (void *)MEMORY[0x1A1AC1AAC]();
        v37 = *(id *)(v34 + 32);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
        if (v33 == v35)
        {
          if (v39)
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v64 + 40), "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "shortDescription");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v32, "count");
            *(_DWORD *)buf = 138543874;
            v73 = v40;
            v74 = 2114;
            v75 = v42;
            v76 = 2048;
            v77 = v43;
            _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu persons", buf, 0x20u);

          }
        }
        else if (v39)
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v64 + 40), "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "shortDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v32, "count");
          v56 = objc_msgSend(obj, "count");
          *(_DWORD *)buf = 138544130;
          v73 = v52;
          v74 = 2114;
          v75 = v54;
          v76 = 2048;
          v77 = v55;
          v78 = 2048;
          v79 = v56;
          _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched all %lu (filtered from %lu) persons", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v36);
        v57 = *(_QWORD *)(v64 + 48);
        v58 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v63, "allValues");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setWithArray:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v57 + 16))(v57, v60, 0);

        v7 = v61;
        v5 = v62;
        goto LABEL_30;
      }
    }
  }
  v44 = (void *)MEMORY[0x1A1AC1AAC]();
  v45 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v46 = a1;
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v46 + 40), "identifier");
    v49 = v7;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "shortDescription");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v73 = v48;
    v74 = 2114;
    v75 = v51;
    v76 = 2112;
    v77 = (uint64_t)v49;
    _os_log_impl(&dword_19B1B0000, v47, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch all persons: %@", buf, 0x20u);

    v7 = v49;
  }

  objc_autoreleasePoolPop(v44);
  (*(void (**)(void))(*(_QWORD *)(v46 + 48) + 16))();
LABEL_30:

}

void __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2114;
      v43 = v12;
      v44 = 2112;
      v45 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch persons: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_82;
    v36[3] = &unk_1E3AB60A0;
    v38 = a1[6];
    v37 = v5;
    objc_msgSend(v14, "invokeBlock:", v36);

    v15 = v38;
  }
  else
  {
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMPM.mk.p"), v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 138543874;
        v41 = v21;
        v42 = 2114;
        v43 = v23;
        v44 = 2048;
        v45 = v24;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu persons", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "delegateCaller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_89;
      v31[3] = &unk_1E3AB60A0;
      v27 = &v33;
      v33 = a1[6];
      v32 = v15;
      objc_msgSend(v26, "invokeBlock:", v31);

      v28 = v32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized persons in response payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(a1[4], "context");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "delegateCaller");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_87;
      v34[3] = &unk_1E3AB6078;
      v27 = &v35;
      v35 = a1[6];
      objc_msgSend(v30, "invokeBlock:", v34);

    }
  }

}

uint64_t __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_87(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __52__HMPersonManager_fetchPersonsWithUUIDs_completion___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __50__HMPersonManager_performCloudPullWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      v14 = "%{public}@[%{public}@] Failed to perform cloud pull: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v14 = "%{public}@[%{public}@] Successfully performed cloud pull";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

HMCameraObjectFetchClient *__59__HMPersonManager_initWithContext_UUID_notificationCenter___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  HMCameraObjectFetchClient *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = -[HMCameraObjectFetchClient initWithUUID:context:messageName:destination:]([HMCameraObjectFetchClient alloc], "initWithUUID:context:messageName:destination:", v11, v10, v9, v8);

  return v12;
}

@end
