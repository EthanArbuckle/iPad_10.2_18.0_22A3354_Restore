@implementation HKKeyValueDomain

+ (id)heartRhythmDefaultsDomainWithHealthStore:(id)a3
{
  id v3;
  HKKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HKKeyValueDomain initWithCategory:domainName:healthStore:]([HKKeyValueDomain alloc], "initWithCategory:domainName:healthStore:", 0, CFSTR("com.apple.private.health.heart-rhythm"), v3);

  return v4;
}

- (id)hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  -[HKKeyValueDomain dateForKey:error:](self, "dateForKey:error:", CFSTR("HKElectrocardiogramFirstOnboardingCompleted"), &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = v5;
  }
  else
  {
    v10 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = (void *)HKLogHeartRhythm;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        v14 = v13;
        _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine first ECG onboarding completion date",
          buf,
          0xCu);

      }
    }
    else if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
    {
      -[HKKeyValueDomain(HKHeartRhythmAdditions) hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:].cold.1(v11, (uint64_t)self, (uint64_t)v7);
    }
    if (a3)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError(v7);
      v9 = 0;
    }
  }

  return v9;
}

- (id)_dataWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKKeyValueDomain dataForKey:error:](self, "dataForKey:error:", a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dateWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKKeyValueDomain dateForKey:error:](self, "dateForKey:error:", a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKKeyValueDomain stringForKey:error:](self, "stringForKey:error:", a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_numberWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKKeyValueDomain numberForKey:error:](self, "numberForKey:error:", a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_propertyListValueWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  -[HKKeyValueDomain propertyListValueForKey:error:](self, "propertyListValueForKey:error:", a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKKeyValueDomain)initWithCategory:(int64_t)a3 domainName:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  HKKeyValueDomainServerConfiguration *v10;
  HKKeyValueDomain *v11;
  HKKeyValueDomain *v12;
  uint64_t v13;
  NSString *domainName;
  uint64_t v15;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v17;
  HKTaskServerProxyProvider *proxyProvider;
  HKObserverSet *v19;
  void *v20;
  uint64_t v21;
  HKKeyValueDomainObserver *observers;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v8 = a4;
  v9 = a5;
  v10 = -[HKKeyValueDomainServerConfiguration initWithCategory:domainName:]([HKKeyValueDomainServerConfiguration alloc], "initWithCategory:domainName:", a3, v8);
  v30.receiver = self;
  v30.super_class = (Class)HKKeyValueDomain;
  v11 = -[HKKeyValueDomain init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    v13 = objc_msgSend(v8, "copy");
    domainName = v12->_domainName;
    v12->_domainName = (NSString *)v13;

    objc_storeStrong((id *)&v12->_healthStore, a5);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

    v17 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v12->_healthStore, CFSTR("HKKeyValueDomainServerIdentifier"), v12, v12->_identifier);
    proxyProvider = v12->_proxyProvider;
    v12->_proxyProvider = v17;

    -[HKTaskServerProxyProvider setTaskConfiguration:](v12->_proxyProvider, "setTaskConfiguration:", v10);
    objc_initWeak(&location, v12);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __60__HKKeyValueDomain_initWithCategory_domainName_healthStore___block_invoke;
    v27 = &unk_1E37E95B8;
    objc_copyWeak(&v28, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v12->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v24);
    -[HKProxyProvider setShouldRetryOnInterruption:](v12->_proxyProvider, "setShouldRetryOnInterruption:", 1, v24, v25, v26, v27);
    v19 = [HKObserverSet alloc];
    NSStringFromProtocol((Protocol *)&unk_1EE40FA08);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HKObserverSet initWithName:loggingCategory:](v19, "initWithName:loggingCategory:", v20, HKLogDefault);
    observers = v12->_observers;
    v12->_observers = (HKKeyValueDomainObserver *)v21;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __60__HKKeyValueDomain_initWithCategory_domainName_healthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)invalidate
{
  -[HKProxyProvider invalidate](self->_proxyProvider, "invalidate");
}

- (BOOL)setNumber:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("number == nil || ([number isKindOfClass:[NSNumber class]])"));

    }
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke;
  v21[3] = &unk_1E37F1A98;
  v13 = v9;
  v22 = v13;
  v14 = v10;
  v23 = v14;
  v24 = &v32;
  v25 = &v26;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_3;
  v20[3] = &unk_1E37E8B48;
  v20[4] = &v26;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v21, v20);
  if (*((_BYTE *)v33 + 24))
  {
    v15 = 1;
  }
  else
  {
    v16 = (id)v27[5];
    v17 = v16;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
    }

    v15 = *((_BYTE *)v33 + 24) != 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

uint64_t __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_2;
  v5[3] = &unk_1E37E9020;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setNumber:forKey:completion:", v2, v3, v5);
}

void __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("number == nil || ([number isKindOfClass:[NSNumber class]])"));

    }
  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke;
  v21[3] = &unk_1E37F1AC0;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke_2;
  v19[3] = &unk_1E37E6B38;
  v20 = v24;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setNumber:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data == nil || ([data isKindOfClass:[NSData class]])"));

    }
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__HKKeyValueDomain_setData_forKey_error___block_invoke;
  v21[3] = &unk_1E37F1A98;
  v13 = v9;
  v22 = v13;
  v14 = v10;
  v23 = v14;
  v24 = &v32;
  v25 = &v26;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __41__HKKeyValueDomain_setData_forKey_error___block_invoke_3;
  v20[3] = &unk_1E37E8B48;
  v20[4] = &v26;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v21, v20);
  if (*((_BYTE *)v33 + 24))
  {
    v15 = 1;
  }
  else
  {
    v16 = (id)v27[5];
    v17 = v16;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
    }

    v15 = *((_BYTE *)v33 + 24) != 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

uint64_t __41__HKKeyValueDomain_setData_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HKKeyValueDomain_setData_forKey_error___block_invoke_2;
  v5[3] = &unk_1E37E9020;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setData:forKey:completion:", v2, v3, v5);
}

void __41__HKKeyValueDomain_setData_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __41__HKKeyValueDomain_setData_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data == nil || ([data isKindOfClass:[NSData class]])"));

    }
  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__HKKeyValueDomain_setData_forKey_completion___block_invoke;
  v21[3] = &unk_1E37F1AC0;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __46__HKKeyValueDomain_setData_forKey_completion___block_invoke_2;
  v19[3] = &unk_1E37E6B38;
  v20 = v24;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __46__HKKeyValueDomain_setData_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setData:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __46__HKKeyValueDomain_setData_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setDate:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date == nil || ([date isKindOfClass:[NSDate class]])"));

    }
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__HKKeyValueDomain_setDate_forKey_error___block_invoke;
  v21[3] = &unk_1E37F1A98;
  v13 = v9;
  v22 = v13;
  v14 = v10;
  v23 = v14;
  v24 = &v32;
  v25 = &v26;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_3;
  v20[3] = &unk_1E37E8B48;
  v20[4] = &v26;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v21, v20);
  if (*((_BYTE *)v33 + 24))
  {
    v15 = 1;
  }
  else
  {
    v16 = (id)v27[5];
    v17 = v16;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
    }

    v15 = *((_BYTE *)v33 + 24) != 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

uint64_t __41__HKKeyValueDomain_setDate_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_2;
  v5[3] = &unk_1E37E9020;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setDate:forKey:completion:", v2, v3, v5);
}

void __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date == nil || ([date isKindOfClass:[NSDate class]])"));

    }
  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke;
  v21[3] = &unk_1E37F1AC0;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke_2;
  v19[3] = &unk_1E37E6B38;
  v20 = v24;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDate:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string == nil || ([string isKindOfClass:[NSString class]])"));

    }
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__HKKeyValueDomain_setString_forKey_error___block_invoke;
  v21[3] = &unk_1E37F1A98;
  v13 = v9;
  v22 = v13;
  v14 = v10;
  v23 = v14;
  v24 = &v32;
  v25 = &v26;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __43__HKKeyValueDomain_setString_forKey_error___block_invoke_3;
  v20[3] = &unk_1E37E8B48;
  v20[4] = &v26;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v21, v20);
  if (*((_BYTE *)v33 + 24))
  {
    v15 = 1;
  }
  else
  {
    v16 = (id)v27[5];
    v17 = v16;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
    }

    v15 = *((_BYTE *)v33 + 24) != 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

uint64_t __43__HKKeyValueDomain_setString_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__HKKeyValueDomain_setString_forKey_error___block_invoke_2;
  v5[3] = &unk_1E37E9020;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setString:forKey:completion:", v2, v3, v5);
}

void __43__HKKeyValueDomain_setString_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __43__HKKeyValueDomain_setString_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKKeyValueDomain.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string == nil || ([string isKindOfClass:[NSString class]])"));

    }
  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__HKKeyValueDomain_setString_forKey_completion___block_invoke;
  v21[3] = &unk_1E37F1AC0;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __48__HKKeyValueDomain_setString_forKey_completion___block_invoke_2;
  v19[3] = &unk_1E37E6B38;
  v20 = v24;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __48__HKKeyValueDomain_setString_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setString:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __48__HKKeyValueDomain_setString_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__37;
  v28 = __Block_byref_object_dispose__37;
  v29 = 0;
  if (v8)
  {
    -[HKKeyValueDomain _dataFromPropertyListValue:error:](self, "_dataFromPropertyListValue:error:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v10 = 0;
  }
  proxyProvider = self->_proxyProvider;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke;
  v19[3] = &unk_1E37F1A98;
  v14 = v10;
  v20 = v14;
  v21 = v9;
  v22 = &v30;
  v23 = &v24;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_3;
  v18[3] = &unk_1E37E8B48;
  v18[4] = &v24;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);
  if (*((_BYTE *)v31 + 24))
  {
    v11 = 1;
  }
  else
  {
    v15 = (id)v25[5];
    v16 = v15;
    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError(v15);
    }

    v11 = *((_BYTE *)v31 + 24) != 0;
  }

LABEL_13:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

uint64_t __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_2;
  v5[3] = &unk_1E37E9020;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setData:forKey:completion:", v2, v3, v5);
}

void __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setPropertyListValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v22 = 0;
    -[HKKeyValueDomain _dataFromPropertyListValue:error:](self, "_dataFromPropertyListValue:error:", v8, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    v13 = v12;
    if (!v11)
    {
      ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v12);
      goto LABEL_7;
    }

  }
  else
  {
    v11 = 0;
  }
  v14 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke;
  v18[3] = &unk_1E37F1AC0;
  v19 = v11;
  v20 = v9;
  v21 = v10;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

LABEL_7:
}

uint64_t __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setData:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setValuesWithDictionary:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setValuesWithDictionary:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeValuesForKeys:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeValuesForKeys:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setValueForAllKeys:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setValueForAllKeys:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)numberForKey:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  v25 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__HKKeyValueDomain_numberForKey_error___block_invoke;
  v16[3] = &unk_1E37F1B10;
  v9 = v6;
  v17 = v9;
  v18 = &v26;
  v19 = &v20;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __39__HKKeyValueDomain_numberForKey_error___block_invoke_3;
  v15[3] = &unk_1E37E8B48;
  v15[4] = &v20;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v16, v15);
  v10 = (void *)v27[5];
  if (!v10)
  {
    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError(v11);
    }

    v10 = (void *)v27[5];
  }
  v13 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

uint64_t __39__HKKeyValueDomain_numberForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__HKKeyValueDomain_numberForKey_error___block_invoke_2;
  v4[3] = &unk_1E37F1870;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberForKey:completion:", v2, v4);
}

void __39__HKKeyValueDomain_numberForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __39__HKKeyValueDomain_numberForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)numberForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__HKKeyValueDomain_numberForKey_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __44__HKKeyValueDomain_numberForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __44__HKKeyValueDomain_numberForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__HKKeyValueDomain_numberForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  v25 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__HKKeyValueDomain_dataForKey_error___block_invoke;
  v16[3] = &unk_1E37F1B10;
  v9 = v6;
  v17 = v9;
  v18 = &v26;
  v19 = &v20;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __37__HKKeyValueDomain_dataForKey_error___block_invoke_3;
  v15[3] = &unk_1E37E8B48;
  v15[4] = &v20;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v16, v15);
  v10 = (void *)v27[5];
  if (!v10)
  {
    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError(v11);
    }

    v10 = (void *)v27[5];
  }
  v13 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

uint64_t __37__HKKeyValueDomain_dataForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__HKKeyValueDomain_dataForKey_error___block_invoke_2;
  v4[3] = &unk_1E37F1B38;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_dataForKey:completion:", v2, v4);
}

void __37__HKKeyValueDomain_dataForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __37__HKKeyValueDomain_dataForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)dataForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__HKKeyValueDomain_dataForKey_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __42__HKKeyValueDomain_dataForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __42__HKKeyValueDomain_dataForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_dataForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __42__HKKeyValueDomain_dataForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)dateForKey:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  v25 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__HKKeyValueDomain_dateForKey_error___block_invoke;
  v16[3] = &unk_1E37F1B10;
  v9 = v6;
  v17 = v9;
  v18 = &v26;
  v19 = &v20;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __37__HKKeyValueDomain_dateForKey_error___block_invoke_3;
  v15[3] = &unk_1E37E8B48;
  v15[4] = &v20;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v16, v15);
  v10 = (void *)v27[5];
  if (!v10)
  {
    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError(v11);
    }

    v10 = (void *)v27[5];
  }
  v13 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

uint64_t __37__HKKeyValueDomain_dateForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__HKKeyValueDomain_dateForKey_error___block_invoke_2;
  v4[3] = &unk_1E37E9048;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_dateForKey:completion:", v2, v4);
}

void __37__HKKeyValueDomain_dateForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __37__HKKeyValueDomain_dateForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)dateForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__HKKeyValueDomain_dateForKey_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __42__HKKeyValueDomain_dateForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __42__HKKeyValueDomain_dateForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_dateForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __42__HKKeyValueDomain_dateForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  v25 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__HKKeyValueDomain_stringForKey_error___block_invoke;
  v16[3] = &unk_1E37F1B10;
  v9 = v6;
  v17 = v9;
  v18 = &v26;
  v19 = &v20;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __39__HKKeyValueDomain_stringForKey_error___block_invoke_3;
  v15[3] = &unk_1E37E8B48;
  v15[4] = &v20;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v16, v15);
  v10 = (void *)v27[5];
  if (!v10)
  {
    v11 = (id)v21[5];
    v12 = v11;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError(v11);
    }

    v10 = (void *)v27[5];
  }
  v13 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

uint64_t __39__HKKeyValueDomain_stringForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__HKKeyValueDomain_stringForKey_error___block_invoke_2;
  v4[3] = &unk_1E37F1B60;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_stringForKey:completion:", v2, v4);
}

void __39__HKKeyValueDomain_stringForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __39__HKKeyValueDomain_stringForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)stringForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__HKKeyValueDomain_stringForKey_completion___block_invoke;
  v14[3] = &unk_1E37F1AE8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __44__HKKeyValueDomain_stringForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __44__HKKeyValueDomain_stringForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stringForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__HKKeyValueDomain_stringForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)propertyListValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  v25 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke;
  v16[3] = &unk_1E37F1B10;
  v9 = v6;
  v17 = v9;
  v18 = &v26;
  v19 = &v20;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_3;
  v15[3] = &unk_1E37E8B48;
  v15[4] = &v20;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v16, v15);
  v10 = v27[5];
  if (v10)
  {
    -[HKKeyValueDomain _propertyListValueFromData:error:](self, "_propertyListValueFromData:error:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (id)v21[5];
    v13 = v12;
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError(v12);
    }

    v11 = 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

uint64_t __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_2;
  v4[3] = &unk_1E37F1B38;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_dataForKey:completion:", v2, v4);
}

void __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)propertyListValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  HKKeyValueDomain *v16;
  id v17;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke;
  v14[3] = &unk_1E37F1AC0;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_3;
  v12[3] = &unk_1E37E6B38;
  v13 = v17;
  v10 = v17;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

void __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_2;
  v4[3] = &unk_1E37F1B88;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_dataForKey:completion:", v3, v4);

}

void __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v8 = v5;
    objc_msgSend(v6, "_propertyListValueFromData:error:", a2, &v8);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;

    v5 = v7;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_dataFromPropertyListValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, a4);
}

- (id)_propertyListValueFromData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, a4);
}

- (id)allValuesWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__37;
  v22 = __Block_byref_object_dispose__37;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__37;
  v16 = __Block_byref_object_dispose__37;
  v17 = 0;
  proxyProvider = self->_proxyProvider;
  v10[4] = &v12;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__HKKeyValueDomain_allValuesWithError___block_invoke;
  v11[3] = &unk_1E37F1BB0;
  v11[4] = &v18;
  v11[5] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__HKKeyValueDomain_allValuesWithError___block_invoke_3;
  v10[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v11, v10);
  v5 = (void *)v19[5];
  if (!v5)
  {
    v6 = (id)v13[5];
    v7 = v6;
    if (v6)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError(v6);
    }

    v5 = (void *)v19[5];
  }
  v8 = v5;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __39__HKKeyValueDomain_allValuesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__HKKeyValueDomain_allValuesWithError___block_invoke_2;
  v3[3] = &unk_1E37EFFC8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_allValuesWithCompletion:", v3);
}

void __39__HKKeyValueDomain_allValuesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __39__HKKeyValueDomain_allValuesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)allValuesWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke;
  v10[3] = &unk_1E37F1BD8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allValuesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startObservation:(id)a3
{
  -[HKKeyValueDomain _startObservation:withCompletion:](self, "_startObservation:withCompletion:", a3, &__block_literal_global_84);
}

- (void)_startObservation:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  HKKeyValueDomainObserver *observers;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  observers = self->_observers;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HKKeyValueDomain__startObservation_withCompletion___block_invoke;
  v11[3] = &unk_1E37F1C20;
  v13 = &v14;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  -[HKKeyValueDomainObserver registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v6, v9, v11);

  if (!*((_BYTE *)v15 + 24))
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);

  _Block_object_dispose(&v14, 8);
}

uint64_t __53__HKKeyValueDomain__startObservation_withCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_registerFirstObserverWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)stopObservation:(id)a3
{
  HKKeyValueDomainObserver *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__HKKeyValueDomain_stopObservation___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKKeyValueDomainObserver unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __36__HKKeyValueDomain_stopObservation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterLastObserver");
}

- (void)_registerFirstObserverWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke;
  v6[3] = &unk_1E37E67C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKKeyValueDomain _observeKeyValueDomainChanges:completion:](self, "_observeKeyValueDomainChanges:completion:", 1, v6);

}

void __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_unregisterLastObserver
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__HKKeyValueDomain__unregisterLastObserver__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKKeyValueDomain _observeKeyValueDomainChanges:completion:](self, "_observeKeyValueDomainChanges:completion:", 0, v2);
}

void __43__HKKeyValueDomain__unregisterLastObserver__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "%{public}@: unable to unregister observing changes: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)_observeKeyValueDomainChanges:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke;
  v12[3] = &unk_1E37F1C48;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleAutomaticProxyReconnection
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

uint64_t __53__HKKeyValueDomain__handleAutomaticProxyReconnection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateKeyValueDomain:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_synchronouslyRegisterToObserveKeyValueDomainChanges:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__37;
  v15 = __Block_byref_object_dispose__37;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke;
  v10[3] = &unk_1E37F1BB0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_2;
  v3[3] = &unk_1E37E9020;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeChanges:completion:", 1, v3);
}

void __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)clientRemote_didUpdate
{
  HKKeyValueDomainObserver *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__HKKeyValueDomain_clientRemote_didUpdate__block_invoke;
  v3[3] = &unk_1E37F1C70;
  v3[4] = self;
  -[HKKeyValueDomainObserver notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __42__HKKeyValueDomain_clientRemote_didUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateKeyValueDomain:", *(_QWORD *)(a1 + 32));
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FA68);
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FAC8);
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)healthAppDefaultsDomainWithHealthStore:(id)a3
{
  id v3;
  HKKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HKKeyValueDomain initWithCategory:domainName:healthStore:]([HKKeyValueDomain alloc], "initWithCategory:domainName:healthStore:", 2, CFSTR("com.apple.Health"), v3);

  return v4;
}

+ (id)healthArticlesDefaultsDomainWithHealthStore:(id)a3
{
  id v3;
  HKKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HKKeyValueDomain initWithCategory:domainName:healthStore:]([HKKeyValueDomain alloc], "initWithCategory:domainName:healthStore:", 2, CFSTR("com.apple.Health.Articles"), v3);

  return v4;
}

+ (id)safetyDefaultsDomainWithHealthStore:(id)a3
{
  id v3;
  HKKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HKKeyValueDomain initWithCategory:domainName:healthStore:]([HKKeyValueDomain alloc], "initWithCategory:domainName:healthStore:", 2, CFSTR("com.apple.Safety"), v3);

  return v4;
}

+ (id)safetyDefaultsLocalDomainWithHealthStore:(id)a3
{
  id v3;
  HKKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HKKeyValueDomain initWithCategory:domainName:healthStore:]([HKKeyValueDomain alloc], "initWithCategory:domainName:healthStore:", 1, CFSTR("com.apple.Safety"), v3);

  return v4;
}

+ (id)emergencyDefaultsDomainWithHealthStore:(id)a3
{
  id v3;
  HKKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HKKeyValueDomain initWithCategory:domainName:healthStore:]([HKKeyValueDomain alloc], "initWithCategory:domainName:healthStore:", 2, CFSTR("com.apple.Health.Emergency"), v3);

  return v4;
}

void __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "%{public}@: unable to register to observe changes: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
