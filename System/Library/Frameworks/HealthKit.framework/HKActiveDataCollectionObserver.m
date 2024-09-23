@implementation HKActiveDataCollectionObserver

- (HKActiveDataCollectionObserver)initWithHealthStore:(id)a3
{
  id v4;
  HKActiveDataCollectionObserver *v5;
  HKActiveDataCollectionObserver *v6;
  uint64_t v7;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v9;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKActiveDataCollectionObserver;
  v5 = -[HKActiveDataCollectionObserver init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("HKActiveDataCollectionObserverTaskServerIdentifier"), v6, v6->_identifier);
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = v9;

    objc_initWeak(&location, v6);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__HKActiveDataCollectionObserver_initWithHealthStore___block_invoke;
    v12[3] = &unk_1E37EADA0;
    objc_copyWeak(&v13, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v6->_proxyProvider, "setAutomaticProxyReconnectionHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __54__HKActiveDataCollectionObserver_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HKActiveDataCollectionObserver _restartTaskServerIfNeeded]((uint64_t)WeakRetained);

}

- (void)_restartTaskServerIfNeeded
{
  os_unfair_lock_s *v2;
  id v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
    if (objc_msgSend(v3, "count"))
      objc_msgSend((id)a1, "subscribeForQuantityTypes:", v3);

  }
}

- (NSArray)activelyCollectedTypes
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_activelyCollectedTypes, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)subscribeForQuantityTypes:(id)a3
{
  id v4;
  NSObject *v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  HKActiveDataCollectionObserver *v11;
  uint8_t buf[4];
  HKActiveDataCollectionObserver *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscribing to active collection of types %@", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke;
  v9[3] = &unk_1E37EADC8;
  v10 = v4;
  v11 = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2;
  v8[3] = &unk_1E37E6A70;
  v7 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v9, v8);

}

void __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "remote_subscribeForQuantityTypes:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  if (v3)
  {
    objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
}

void __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2_cold_1();

}

- (void)unsubscribeForQuantityTypes:(id)a3
{
  id v4;
  NSObject *v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  HKActiveDataCollectionObserver *v11;
  uint8_t buf[4];
  HKActiveDataCollectionObserver *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Unsubscribing to active collection of types %@", buf, 0x16u);
  }
  proxyProvider = self->_proxyProvider;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke;
  v9[3] = &unk_1E37EADC8;
  v10 = v4;
  v11 = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke_2;
  v8[3] = &unk_1E37E6A70;
  v7 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v9, v8);

}

void __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_unsubscribeForQuantityTypes:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
}

void __62__HKActiveDataCollectionObserver_unsubscribeForQuantityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2_cold_1();

}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E928);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_client_updatedCollectedTypes_, 0, 0);
  return v2;
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E988);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_subscribeForQuantityTypes_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_unsubscribeForQuantityTypes_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void)client_updatedCollectedTypes:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *activelyCollectedTypes;
  id WeakRetained;
  BOOL v9;
  id v10;
  int v11;
  HKActiveDataCollectionObserver *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated actively collected types: %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)objc_msgSend(v4, "copy");
  activelyCollectedTypes = self->_activelyCollectedTypes;
  self->_activelyCollectedTypes = v6;

  objc_copyWeak((id *)&v11, (id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&v11);
  v9 = WeakRetained == 0;

  if (!v9)
  {
    v10 = objc_loadWeakRetained((id *)&v11);
    objc_msgSend(v10, "activeDataCollectionObserver:updatedCollectedTypes:", self, v4);

  }
  objc_destroyWeak((id *)&v11);

}

- (void)client_didChangeAllowCollectionPause:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  id WeakRetained;
  id v8;
  char v9;
  id v10;
  int v11;
  HKActiveDataCollectionObserver *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v11 = 138543618;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change allow collection pause %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_allowCollectionPause = v3;
  objc_copyWeak((id *)&v11, (id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&v11);
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&v11);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&v11);
      objc_msgSend(v10, "activeDataCollectionObserver:didChangeAllowCollectionPause:", self, v3);

    }
  }
  objc_destroyWeak((id *)&v11);
}

- (HKActiveDataCollectionObserverDelegate)delegate
{
  return (HKActiveDataCollectionObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowCollectionPause
{
  return self->_allowCollectionPause;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activelyCollectedTypes, 0);
  objc_storeStrong((id *)&self->_subscribedTypes, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __60__HKActiveDataCollectionObserver_subscribeForQuantityTypes___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "%{public}@: Unable to fetch active data collection observer proxy %{public}@ with error: %{public}@");
}

@end
