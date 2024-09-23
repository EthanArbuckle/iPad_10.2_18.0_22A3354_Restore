@implementation BKIOHIDServiceMatcher

- (void)_lock_servicesAdded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *WeakRetained;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[BKIOHIDServiceMatcher _servicesForIOHIDServiceRefs:](self, "_servicesForIOHIDServiceRefs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BKLogHID();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl(&dword_1C8914000, v6, OS_LOG_TYPE_INFO, "Services added: %{public}@", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11++), "setServiceStatus:", 1);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_copyWeak((id *)buf, (id *)&self->_observer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observerQueue);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BKIOHIDServiceMatcher__lock_servicesAdded___block_invoke;
  block[3] = &unk_1E81F7090;
  objc_copyWeak(&v16, (id *)buf);
  block[4] = self;
  v15 = v7;
  v13 = v7;
  dispatch_async(WeakRetained, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (id)_servicesForIOHIDServiceRefs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  Class serviceClass;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  Class v14;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  serviceClass = self->_serviceClass;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__BKIOHIDServiceMatcher__servicesForIOHIDServiceRefs___block_invoke;
  v12[3] = &unk_1E81F70B8;
  v14 = serviceClass;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)_servicesAdded:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKIOHIDServiceMatcher _lock_servicesAdded:](self, "_lock_servicesAdded:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __45__BKIOHIDServiceMatcher__lock_servicesAdded___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "matcher:servicesDidMatch:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__BKIOHIDServiceMatcher__servicesForIOHIDServiceRefs___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(objc_class **)(a1 + 48);
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithHIDServiceRef:", v4);

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "senderDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v11 = 0;
  v8 = objc_msgSend(v6, "matchesDescriptor:failureReason:", v7, &v11);
  v9 = v11;

  if ((v8 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
LABEL_9:

    goto LABEL_10;
  }
  if (v9)
  {
    BKLogHID();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1C8914000, v10, OS_LOG_TYPE_DEFAULT, "service %{public}@ did not match: %{public}@", buf, 0x16u);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (BKIOHIDServiceMatcher)initWithSenderDescriptor:(id)a3 dataProvider:(id)a4
{
  id v7;
  id v8;
  BKIOHIDServiceMatcher *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[BKIOHIDServiceMatcher initWithUsagePage:usage:builtIn:dataProvider:](self, "initWithUsagePage:usage:builtIn:dataProvider:", objc_msgSend(v7, "primaryPage"), objc_msgSend(v7, "primaryUsage"), 0, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_senderDescriptor, a3);

  return v9;
}

- (BKIOHIDServiceMatcher)initWithUsagePage:(int)a3 usage:(int)a4 builtIn:(BOOL)a5 dataProvider:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  BKIOHIDServiceMatcher *v21;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[4];

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v26[3] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v25[0] = CFSTR("DeviceUsagePage");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = a6;
    objc_msgSend(v10, "numberWithInt:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v25[1] = CFSTR("DeviceUsage");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = CFSTR("Built-In");
    v26[1] = v13;
    v26[2] = MEMORY[0x1E0C9AAB0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v26;
    v16 = v25;
    v17 = 3;
  }
  else
  {
    v23[0] = CFSTR("DeviceUsagePage");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = a6;
    objc_msgSend(v18, "numberWithInt:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("DeviceUsage");
    v24[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v24;
    v16 = v23;
    v17 = 2;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[BKIOHIDServiceMatcher initWithMatchingDictionary:dataProvider:](self, "initWithMatchingDictionary:dataProvider:", v20, a6);
  return v21;
}

- (BKIOHIDServiceMatcher)initWithMatchingDictionary:(id)a3 dataProvider:(id)a4
{
  id v6;
  id v7;
  BKIOHIDServiceMatcher *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BKIOHIDServiceMatcher initWithMatchingDictionary:serviceClass:dataProvider:](self, "initWithMatchingDictionary:serviceClass:dataProvider:", v7, objc_opt_class(), v6);

  return v8;
}

- (BKIOHIDServiceMatcher)initWithMatchingDictionary:(id)a3 serviceClass:(Class)a4 dataProvider:(id)a5
{
  id v8;
  id v9;
  BKIOHIDServiceMatcher *v10;
  BKIOHIDServiceMatcher *v11;
  uint64_t v12;
  NSDictionary *matchingDictionary;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKIOHIDServiceMatcher;
  v10 = -[BKIOHIDServiceMatcher init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceClass, a4);
    v12 = objc_msgSend(v8, "copy");
    matchingDictionary = v11->_matchingDictionary;
    v11->_matchingDictionary = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_dataProvider, a5);
  }

  return v11;
}

- (void)_expectDeallocation
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  BKIOHIDServiceMatcher *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_startedMatching && !self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dealloc without invalidation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138544642;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      v12 = 2048;
      v13 = self;
      v14 = 2114;
      v15 = CFSTR("BKIOHIDServiceMatcher.m");
      v16 = 1024;
      v17 = 86;
      v18 = 2114;
      v19 = v4;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C892768CLL);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BKIOHIDServiceMatcher _expectDeallocation](self, "_expectDeallocation");
  v3.receiver = self;
  v3.super_class = (Class)BKIOHIDServiceMatcher;
  -[BKIOHIDServiceMatcher dealloc](&v3, sel_dealloc);
}

- (id)existingServices
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSDictionary *matchingDictionary;
  int v8;
  void *v9;
  __int16 v10;
  NSDictionary *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[BKIOHIDServiceMatcherDataProviding IOHIDServicesMatching:](self->_dataProvider, "IOHIDServicesMatching:", self->_matchingDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKIOHIDServiceMatcher _servicesForIOHIDServiceRefs:](self, "_servicesForIOHIDServiceRefs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BKLogHID();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    matchingDictionary = self->_matchingDictionary;
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = matchingDictionary;
    _os_log_impl(&dword_1C8914000, v5, OS_LOG_TYPE_INFO, "Services discovered: %{public}@ for:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (void)startObserving:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  Class serviceClass;
  NSDictionary *matchingDictionary;
  id v13;
  BKIOHIDServiceMatcherDataProviding *dataProvider;
  void *v15;
  void *v16;
  BKIOHIDServiceMatcher *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  BKIOHIDServiceMatcher *v21;
  objc_class *v22;
  void *v23;
  int v24;
  BKIOHIDServiceMatcher *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BKIOHIDServiceMatcher *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_startedMatching)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already started matching -- only one observer per matcher, plz"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (BKIOHIDServiceMatcher *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544642;
      v25 = v17;
      v26 = 2114;
      v27 = v19;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKIOHIDServiceMatcher.m");
      v32 = 1024;
      v33 = 123;
      v34 = 2114;
      v35 = v16;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v24, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8927A40);
  }
  self->_startedMatching = 1;
  -[BKIOHIDServiceMatcher setObserver:](self, "setObserver:", v7);
  -[BKIOHIDServiceMatcher setObserverQueue:](self, "setObserverQueue:", v8);
  BKLogHID();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    matchingDictionary = self->_matchingDictionary;
    serviceClass = self->_serviceClass;
    v24 = 134218754;
    v25 = self;
    v26 = 2114;
    v27 = v10;
    v28 = 2114;
    v29 = (BKIOHIDServiceMatcher *)serviceClass;
    v30 = 2114;
    v31 = (const __CFString *)matchingDictionary;
    v13 = v10;
    _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_INFO, "%p %{public}@ started matching %{public}@ with dictionary %{public}@", (uint8_t *)&v24, 0x2Au);

  }
  dataProvider = self->_dataProvider;
  if (!dataProvider)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must have a data provider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (BKIOHIDServiceMatcher *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544642;
      v25 = v21;
      v26 = 2114;
      v27 = v23;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKIOHIDServiceMatcher.m");
      v32 = 1024;
      v33 = 133;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v24, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8927B2CLL);
  }
  -[BKIOHIDServiceMatcherDataProviding registerIOHIDServicesCallback:matchingDictionary:target:refCon:](dataProvider, "registerIOHIDServicesCallback:matchingDictionary:target:refCon:", _BKHIDServiceAdded, self->_matchingDictionary, self, self->_matchingDictionary);
  -[BKIOHIDServiceMatcherDataProviding IOHIDServicesMatching:](self->_dataProvider, "IOHIDServicesMatching:", self->_matchingDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    -[BKIOHIDServiceMatcher _lock_servicesAdded:](self, "_lock_servicesAdded:", v15);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  Class serviceClass;
  NSObject *v6;
  void *v7;
  NSDictionary *matchingDictionary;
  id v9;
  int v10;
  BKIOHIDServiceMatcher *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  Class v15;
  __int16 v16;
  NSDictionary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_startedMatching)
  {
    -[BKIOHIDServiceMatcher observer](self, "observer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    serviceClass = self->_serviceClass;
    BKLogHID();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_opt_class();
      matchingDictionary = self->_matchingDictionary;
      v10 = 134218754;
      v11 = self;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = serviceClass;
      v16 = 2114;
      v17 = matchingDictionary;
      v9 = v7;
      _os_log_impl(&dword_1C8914000, v6, OS_LOG_TYPE_INFO, "%p %{public}@ stopped matching %{public}@ with dictionary %{public}@", (uint8_t *)&v10, 0x2Au);

    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_observer, 0);
    objc_storeWeak((id *)&self->_observerQueue, 0);
    -[BKIOHIDServiceMatcherDataProviding unregisterIOHIDServicesCallback:matchingDictionary:target:refCon:](self->_dataProvider, "unregisterIOHIDServicesCallback:matchingDictionary:target:refCon:", _BKHIDServiceAdded, self->_matchingDictionary, self, self->_matchingDictionary);

  }
  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

- (void)setMatchingDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (Class)serviceClass
{
  return self->_serviceClass;
}

- (void)setServiceClass:(Class)a3
{
  objc_storeStrong((id *)&self->_serviceClass, a3);
}

- (BKIOHIDServiceMatchObserver)observer
{
  return (BKIOHIDServiceMatchObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_observerQueue);
}

- (void)setObserverQueue:(id)a3
{
  objc_storeWeak((id *)&self->_observerQueue, a3);
}

- (BKIOHIDServiceMatcherDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_observerQueue);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_serviceClass, 0);
  objc_storeStrong((id *)&self->_matchingDictionary, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
}

@end
