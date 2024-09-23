@implementation COAlarmManager

- (COAlarmManager)initWithConnectionProvider:(id)a3 distributedTimersClient:(id)a4
{
  id v7;
  id v8;
  COAlarmManager *v9;
  COAlarmManager *v10;
  COObserverSet *v11;
  COObserverSet *observers;
  void *v13;
  uint64_t v14;
  NSUUID *instanceID;
  NSObject *v16;
  NSUUID *v17;
  objc_class *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  COAlarmManager *v23;
  __int16 v24;
  NSUUID *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)COAlarmManager;
  v9 = -[COAlarmManager init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_alloc_init(COObserverSet);
    observers = v10->_observers;
    v10->_observers = v11;

    objc_storeStrong((id *)&v10->_provider, a3);
    objc_storeStrong((id *)&v10->_dtClient, a4);
    objc_msgSend(v8, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_canDispatch = v13 == 0;

    v30[0] = 0;
    v30[1] = 0;
    if (xpc_get_instance())
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v30);
      instanceID = v10->_instanceID;
      v10->_instanceID = (NSUUID *)v14;

    }
    COLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v10->_instanceID;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v23 = v10;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v19;
      v28 = 2048;
      v29 = v8;
      _os_log_impl(&dword_21214B000, v16, OS_LOG_TYPE_DEFAULT, "%p manager created for %@ with %@ provider [DT: %p]", buf, 0x2Au);

    }
  }

  return v10;
}

- (COAlarmManager)initWithConnectionProvider:(id)a3
{
  id v4;
  void *v5;
  COAlarmManager *v6;

  v4 = a3;
  MakeDTTimerClient(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COAlarmManager initWithConnectionProvider:distributedTimersClient:](self, "initWithConnectionProvider:distributedTimersClient:", v4, v5);

  return v6;
}

- (COAlarmManager)init
{
  _COAlarmManagerConnectionProvider *v3;
  COAlarmManager *v4;

  v3 = objc_alloc_init(_COAlarmManagerConnectionProvider);
  v4 = -[COAlarmManager initWithConnectionProvider:](self, "initWithConnectionProvider:", v3);

  return v4;
}

- (id)initForAccessory:(id)a3 withConnectionProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  COAlarmManager *v11;
  NSObject *v12;
  void *v13;
  COHomeKitAccessoryMemento *v14;
  COHomeKitAccessoryMemento *memento;
  int v17;
  COAlarmManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MakeDTTimerClient(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[COAlarmManager initWithConnectionProvider:distributedTimersClient:](self, "initWithConnectionProvider:distributedTimersClient:", v8, v10);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessory, a3);
    COLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HMAccessory uniqueIdentifier](v11->_accessory, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218242;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_21214B000, v12, OS_LOG_TYPE_DEFAULT, "%p manager set accessory %@", (uint8_t *)&v17, 0x16u);

    }
    v14 = -[COHomeKitAccessoryMemento initWithHomeKitAccessory:]([COHomeKitAccessoryMemento alloc], "initWithHomeKitAccessory:", v7);
    memento = v11->_memento;
    v11->_memento = v14;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__COAlarmManager_dealloc__block_invoke;
  v4[3] = &unk_24CD3EFE8;
  v4[4] = self;
  -[COAlarmManager _withLock:](self, "_withLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)COAlarmManager;
  -[COAlarmManager dealloc](&v3, sel_dealloc);
}

void __25__COAlarmManager_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "co_originalInterruptionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "co_setOriginalInterruptionHandler:", v2);

  objc_msgSend(v6, "co_originalInvalidationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "co_setOriginalInvalidationHandler:", v3);

  objc_msgSend(v6, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "dtClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "dtClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setDtClient:", 0);
  }

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_categoryTypeForAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[COAlarmManager accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "siriContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("COAlarmSiriContextTargetReferenceKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (COAlarmSiriContextTargetReferenceForAccessory(v5),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "compare:options:", v8, 1),
          v8,
          v9))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v5, "category");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "categoryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_24CD3EEA8;
  v7[4] = self;
  v7[5] = &v8;
  -[COAlarmManager _withLock:](self, "_withLock:", v7);
  objc_msgSend((id)v9[5], "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  COAlarmManagerMediator *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmManagerServiceConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = (void *)MEMORY[0x24BDD1990];
    v9 = &unk_254B4A0F8;
    objc_msgSend(v8, "interfaceWithProtocol:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_postNotificationName_withUserInfo_callback_, 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedInterface:", v10);
    v36 = -[COAlarmManagerMediator initWithAlarmManager:]([COAlarmManagerMediator alloc], "initWithAlarmManager:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedObject:");
    v18 = &unk_254B4FA38;

    v35 = v18;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_alarmsAsAccessory_asInstance_withCallback_, 0, 1);
    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_alarmsAsAccessory_asInstance_forAccessories_callback_, 0, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRemoteObjectInterface:", v19);
    objc_initWeak(location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "interruptionHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidationHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v28);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v29);
    v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v31 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v40[3] = &unk_24CD3F498;
    v32 = v28;
    v41 = v32;
    objc_copyWeak(&v42, location);
    objc_msgSend(v30, "setInterruptionHandler:", v40);
    v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v37[0] = v31;
    v37[1] = 3221225472;
    v37[2] = __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_111;
    v37[3] = &unk_24CD3F498;
    v34 = v29;
    v38 = v34;
    objc_copyWeak(&v39, location);
    objc_msgSend(v33, "setInvalidationHandler:", v37);
    objc_msgSend(*(id *)(a1 + 32), "setLastConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resume");
    objc_destroyWeak(&v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);

  }
}

void __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();

  }
}

void __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_111(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_111_cold_1();

  }
}

- (void)_lostConnectionToService
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  COAlarmManager *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[COAlarmManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registeredNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[COAlarmManager _registerObserverWithName:](self, "_registerObserverWithName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v6);
  }

  COLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p posting reset notification", buf, 0xCu);
  }

  -[COAlarmManager postNotificationName:withUserInfo:callback:](self, "postNotificationName:withUserInfo:callback:", CFSTR("COAlarmManagerStateReset"), 0, &__block_literal_global_4);
}

- (id)_dispatchOpWithName:(id)a3 forAlarm:(id)a4 distributedTimers:(id)a5 coordination:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *, void *);
  id v13;
  id v14;
  uint32_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint32_t v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint32_t v45;
  uint8_t buf[4];
  COAlarmManager *v47;
  __int16 v48;
  uint32_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *, void *))a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v15 = arc4random();
  COLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "alarmID");
    v33 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[COAlarmManager dtClient](self, "dtClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v47 = self;
    v48 = 1024;
    v49 = v15;
    v50 = 2114;
    v51 = v10;
    v52 = 2114;
    v53 = v17;
    v54 = 2048;
    v55 = v18;
    _os_log_impl(&dword_21214B000, v16, OS_LOG_TYPE_DEFAULT, "%p (%u) %{public}@ alarm %{public}@ [DT: %p]", buf, 0x30u);

    v11 = v33;
  }

  v19 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke;
  v41[3] = &unk_24CD3F620;
  v45 = v15;
  v20 = v10;
  v42 = v20;
  v21 = v11;
  v43 = v21;
  v22 = v14;
  v44 = v22;
  v38[0] = v19;
  v38[1] = 3221225472;
  v38[2] = __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke_114;
  v38[3] = &unk_24CD3F648;
  v38[4] = self;
  v23 = (id)MEMORY[0x212BE9A2C](v41);
  v39 = v23;
  v24 = v13;
  v40 = v24;
  v34[0] = v19;
  v34[1] = 3221225472;
  v34[2] = __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke_2;
  v34[3] = &unk_24CD3F670;
  v37 = v15;
  v25 = (void (**)(_QWORD))(id)MEMORY[0x212BE9A2C](v38);
  v35 = v25;
  v26 = v23;
  v36 = v26;
  v27 = (void *)MEMORY[0x212BE9A2C](v34);
  -[COAlarmManager dtClient](self, "dtClient");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D5A0]), "initWithMTAlarm:", v21);
    -[COAlarmManager dtClient](self, "dtClient");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v30, v29, v27);

  }
  else
  {
    v25[2](v25);
  }
  v31 = v22;

  return v31;
}

void __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke_cold_1(a1, (uint64_t)v3, v5);

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "alarmID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = 67109634;
      v9[1] = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%u: %{public}@ alarm %{public}@ done", (uint8_t *)v9, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

void __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke_114(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_remoteInterfaceWithErrorHandler:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = v3;
  }

}

void __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "code") != 8)
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DTError"));

  if (!v6)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  COLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_DWORD *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

- (void)_updateCanDispatch
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[COAlarmManager dtClient](self, "dtClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 == 0) == -[COAlarmManager canDispatch](self, "canDispatch"))
    return;
  v5 = -[COAlarmManager canDispatch](self, "canDispatch");
  if (v4)
  {
    if (!v5)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!v5)
LABEL_4:
    -[COAlarmManager setCanDispatch:](self, "setCanDispatch:", v4 == 0);
LABEL_5:
  -[COAlarmManager observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registeredNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("COAlarmManagerCanDispatchDidUpdate"));

  if (v8)
  {
    -[COAlarmManager accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[COAlarmManager accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = CFSTR("COAccessoryDispatchabilityKey");
      v16 = v11;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[COAlarmManager canDispatch](self, "canDispatch"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COAlarmManagerCanDispatchDidUpdate"), self, v14);
    -[COAlarmManager _handleNotification:](self, "_handleNotification:", v15);

  }
}

- (void)_emitNotificationForName:(id)a3 alarm:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = *MEMORY[0x24BE67778];
    v20 = v7;
    v21 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[COAlarmManager observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registeredNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v6);

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", v6, self, v11);
    -[COAlarmManager _handleNotification:](self, "_handleNotification:", v15);

  }
  -[COAlarmManager observers](self, "observers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registeredNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", CFSTR("COAlarmManagerAlarmsChanged"));

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COAlarmManagerAlarmsChanged"), self, v11);
    -[COAlarmManager _handleNotification:](self, "_handleNotification:", v19);

  }
}

- (void)_handleDTTimerClientEvent:(int64_t)a3 dtTimer:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  _BOOL4 v12;
  const char *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  _BYTE v18[22];
  __int16 v19;
  id v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  COLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = -[COAlarmManager dtMonitoring](self, "dtMonitoring");
    v13 = "no";
    *(_DWORD *)v18 = 134218754;
    *(_WORD *)&v18[12] = 2048;
    *(_QWORD *)&v18[4] = self;
    if (v12)
      v13 = "yes";
    *(_QWORD *)&v18[14] = a3;
    v19 = 2112;
    v20 = v6;
    v21 = 2080;
    v22 = v13;
    _os_log_debug_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEBUG, "%p got Distributed Timers event: %ld [%@] (dtMonitoring: %s)", v18, 0x2Au);
  }

  if (a3 != 11)
  {
    if (v6)
    {
      objc_msgSend(v6, "mtAlarm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        COLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[COAlarmManager _handleDTTimerClientEvent:dtTimer:].cold.2();

        v8 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      v8 = 0;
    }
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
        COLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v18 = 134218240;
          *(_QWORD *)&v18[4] = self;
          *(_WORD *)&v18[12] = 2048;
          *(_QWORD *)&v18[14] = a3;
          _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p ignored DistributedTimers event %ld", v18, 0x16u);
        }
        goto LABEL_28;
      case 3:
        -[COAlarmManager observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "registeredNames");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", CFSTR("COAlarmManagerStateReset"));

        if (v16)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COAlarmManagerStateReset"), self, 0);
          -[COAlarmManager _handleNotification:](self, "_handleNotification:", v17);

        }
        goto LABEL_29;
      case 4:
        -[COAlarmManager _updateCanDispatch](self, "_updateCanDispatch");
        goto LABEL_29;
      case 5:
        v11 = CFSTR("COAlarmManagerAlarmsAdded");
        goto LABEL_25;
      case 6:
        v11 = CFSTR("COAlarmManagerAlarmsUpdated");
        goto LABEL_25;
      case 7:
        v11 = CFSTR("COAlarmManagerAlarmsRemoved");
        goto LABEL_25;
      case 8:
      case 12:
        v11 = CFSTR("COAlarmManagerFiringAlarmChanged");
        goto LABEL_25;
      case 9:
        v11 = CFSTR("COAlarmManagerFiringAlarmDismissed");
        goto LABEL_25;
      case 10:
        v11 = CFSTR("COAlarmManagerAlarmFired");
LABEL_25:
        -[COAlarmManager _emitNotificationForName:alarm:](self, "_emitNotificationForName:alarm:", v11, v8, *(_OWORD *)v18);
        break;
      default:
        COLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[COAlarmManager _handleDTTimerClientEvent:dtTimer:].cold.1();
LABEL_28:

        break;
    }
    goto LABEL_29;
  }
  -[COAlarmManager _updateMonitoring](self, "_updateMonitoring");
LABEL_30:

}

- (void)_activateDistributedTimersMonitoring
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21214B000, v0, v1, "%p activating DTTimerClient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__COAlarmManager__activateDistributedTimersMonitoring__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleDTTimerClientEvent:dtTimer:", a2, v5);

}

- (void)_updateMonitoring
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21214B000, v0, v1, "%p no registered observers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __35__COAlarmManager__updateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__COAlarmManager__updateMonitoring__block_invoke_cold_1();

}

void __35__COAlarmManager__updateMonitoring__block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v13 = 134218498;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v3;
      v8 = "%p failed to remove observer for %@ from coordinated: %@";
      v9 = v4;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v5)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = 134218242;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v8 = "%p removed observer for %@ from coordinated";
    v9 = v4;
    v10 = 22;
    goto LABEL_6;
  }

}

- (id)_alarmsForAccessory:(id)a3 includingSleepAlarm:(BOOL)a4
{
  id v6;
  id v7;
  uint32_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  id v28;
  id v29;
  uint32_t v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint32_t v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  uint32_t v41;
  uint8_t buf[4];
  COAlarmManager *v43;
  __int16 v44;
  uint32_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v8 = arc4random();
  COLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[COAlarmManager dtClient](self, "dtClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = "Y";
    *(_DWORD *)buf = 134218754;
    v44 = 1024;
    v43 = self;
    if (!v11)
      v12 = "N";
    v45 = v8;
    v46 = 2114;
    v47 = v10;
    v48 = 2080;
    v49 = v12;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p (%u) retrieving alarms for %{public}@ [DT: %s]", buf, 0x26u);

  }
  v13 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke;
  v39[3] = &unk_24CD3F708;
  v41 = v8;
  v14 = v7;
  v40 = v14;
  v15 = (void *)MEMORY[0x212BE9A2C](v39);
  v35[0] = v13;
  v35[1] = 3221225472;
  v35[2] = __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_126;
  v35[3] = &unk_24CD3F770;
  v38 = a4;
  v37 = v8;
  v16 = v14;
  v36 = v16;
  v17 = (void *)MEMORY[0x212BE9A2C](v35);
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_130;
  v31[3] = &unk_24CD3F7C0;
  v31[4] = self;
  v18 = v15;
  v33 = v18;
  v19 = v6;
  v32 = v19;
  v20 = v17;
  v34 = v20;
  v21 = (void (**)(_QWORD))MEMORY[0x212BE9A2C](v31);
  -[COAlarmManager dtClient](self, "dtClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[COAlarmManager dtClient](self, "dtClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_3;
    v26[3] = &unk_24CD3F7E8;
    v30 = v8;
    v27 = v21;
    v28 = v18;
    v29 = v20;
    objc_msgSend(v23, "fetchTimersWithCompletionHandler:", v26);

  }
  else
  {
    v21[2](v21);
  }
  v24 = v16;

  return v24;
}

void __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

void __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_126(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 44))
  {
    objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_128);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v6, "removeObjectsAtIndexes:", v5);
      v7 = objc_msgSend(v6, "copy");

      v4 = (void *)v7;
    }

  }
  COLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_DWORD *)(a1 + 40);
    v10[0] = 67109378;
    v10[1] = v9;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_21214B000, v8, OS_LOG_TYPE_DEFAULT, "%u: retrieving alarms done: %@", (uint8_t *)v10, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);
}

uint64_t __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSleepAlarm");
}

void __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_130(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_remoteInterfaceWithErrorHandler:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_2_131;
  v5[3] = &unk_24CD3F798;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "alarmsAsAccessory:asInstance:withCallback:", v3, v4, v5);

}

uint64_t __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_2_131(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 8
      && (objc_msgSend(v7, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DTError")),
          v8,
          v9))
    {
      COLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_DWORD *)(a1 + 56);
        v13[0] = 67109120;
        v13[1] = v11;
        _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", (uint8_t *)v13, 8u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    AlarmsForDTTimers(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)_handleNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  COAlarmManager *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p forwarding notification %@: %@", (uint8_t *)&v9, 0x20u);

  }
  -[COAlarmManager observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v4);

}

- (void)postNotificationName:(id)a3 withUserInfo:(id)a4 callback:(id)a5
{
  objc_class *v8;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x24BDD16C8];
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithName:object:userInfo:", v11, self, v10);

  -[COAlarmManager _handleNotification:](self, "_handleNotification:", v12);
  v9[2](v9, 0);

}

- (id)alarms
{
  void *v3;
  void *v4;

  -[COAlarmManager memento](self, "memento");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmManager _alarmsForAccessory:includingSleepAlarm:](self, "_alarmsForAccessory:includingSleepAlarm:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)alarmsIncludingSleepAlarm:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[COAlarmManager memento](self, "memento");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmManager _alarmsForAccessory:includingSleepAlarm:](self, "_alarmsForAccessory:includingSleepAlarm:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)alarmsForAccessory:(id)a3
{
  id v4;
  COHomeKitAccessoryMemento *v5;
  void *v6;

  v4 = a3;
  v5 = -[COHomeKitAccessoryMemento initWithHomeKitAccessory:]([COHomeKitAccessoryMemento alloc], "initWithHomeKitAccessory:", v4);

  -[COAlarmManager _alarmsForAccessory:includingSleepAlarm:](self, "_alarmsForAccessory:includingSleepAlarm:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)alarmsForAccessories:(id)a3
{
  id v4;
  id v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD);
  id v27;
  id v28;
  uint32_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint32_t v36;
  _QWORD v37[4];
  id v38;
  uint32_t v39;
  uint8_t buf[4];
  COAlarmManager *v41;
  __int16 v42;
  uint32_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v6 = arc4random();
  COLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "count");
    -[COAlarmManager dtClient](self, "dtClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = "Y";
    *(_DWORD *)buf = 134219010;
    v42 = 1024;
    v41 = self;
    if (!v9)
      v10 = "N";
    v43 = v6;
    v44 = 2048;
    v45 = v8;
    v46 = 2114;
    v47 = v4;
    v48 = 2080;
    v49 = v10;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p (%u) retrieving alarms for %ld:%{public}@ [DT: %s]", buf, 0x30u);

  }
  v11 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke;
  v37[3] = &unk_24CD3F708;
  v39 = v6;
  v12 = v5;
  v38 = v12;
  v13 = (void *)MEMORY[0x212BE9A2C](v37);
  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke_133;
  v34[3] = &unk_24CD3F810;
  v36 = v6;
  v14 = v12;
  v35 = v14;
  v15 = (void *)MEMORY[0x212BE9A2C](v34);
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke_135;
  v30[3] = &unk_24CD3F7C0;
  v30[4] = self;
  v16 = v13;
  v32 = v16;
  v17 = v4;
  v31 = v17;
  v18 = v15;
  v33 = v18;
  v19 = (void (**)(_QWORD))MEMORY[0x212BE9A2C](v30);
  -[COAlarmManager dtClient](self, "dtClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[COAlarmManager dtClient](self, "dtClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke_5;
    v24[3] = &unk_24CD3F8C8;
    v29 = v6;
    v26 = v19;
    v27 = v16;
    v25 = v17;
    v28 = v18;
    objc_msgSend(v21, "fetchTimersWithCompletionHandler:", v24);

  }
  else
  {
    v19[2](v19);
  }
  v22 = v14;

  return v22;
}

void __39__COAlarmManager_alarmsForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

void __39__COAlarmManager_alarmsForAccessories___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%u: retrieving alarms done: %@", (uint8_t *)v6, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
}

void __39__COAlarmManager_alarmsForAccessories___block_invoke_135(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "_remoteInterfaceWithErrorHandler:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "na_map:", &__block_literal_global_137);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "memento");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke_3;
  v6[3] = &unk_24CD3F8A0;
  v8 = a1[6];
  v7 = a1[5];
  v9 = a1[7];
  objc_msgSend(v2, "alarmsAsAccessory:asInstance:forAccessories:callback:", v4, v5, v3, v6);

}

COHomeKitAccessoryMemento *__39__COAlarmManager_alarmsForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  COHomeKitAccessoryMemento *v3;

  v2 = a2;
  v3 = -[COHomeKitAccessoryMemento initWithHomeKitAccessory:]([COHomeKitAccessoryMemento alloc], "initWithHomeKitAccessory:", v2);

  return v3;
}

void __39__COAlarmManager_alarmsForAccessories___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)a1[4];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke_4;
    v9[3] = &unk_24CD3F878;
    v10 = v8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

void __39__COAlarmManager_alarmsForAccessories___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);

}

void __39__COAlarmManager_alarmsForAccessories___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 8
      && (objc_msgSend(v7, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DTError")),
          v8,
          v9))
    {
      COLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        v23 = v11;
        _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%u: falling back to coordination", buf, 8u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    AlarmsForDTTimers(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __39__COAlarmManager_alarmsForAccessories___block_invoke_141;
    v19[3] = &unk_24CD3F878;
    v20 = v13;
    v21 = v12;
    v15 = v12;
    v16 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
    (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v16, v17, v18);

  }
}

uint64_t __39__COAlarmManager_alarmsForAccessories___block_invoke_141(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

- (id)alarmsForAccessoryMementos:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  COAlarmManager *v23;
  _QWORD v24[4];
  id v25;
  COAlarmManager *v26;
  uint8_t buf[4];
  COAlarmManager *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[COAlarmManager dtClient](self, "dtClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, MEMORY[0x24BDBD1B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v7);
    v8 = v5;

  }
  else
  {
    COLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "na_map:", &__block_literal_global_144);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v28 = self;
      v29 = 2048;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p retrieving alarms for %ld:%@...", buf, 0x20u);

    }
    v12 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_145;
    v24[3] = &unk_24CD3F6E0;
    v26 = self;
    v13 = v5;
    v25 = v13;
    -[COAlarmManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[COAlarmManager memento](self, "memento");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[COAlarmManager instanceID](self, "instanceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_146;
    v20[3] = &unk_24CD3F958;
    v23 = self;
    v21 = v4;
    v17 = v13;
    v22 = v17;
    objc_msgSend(v14, "alarmsAsAccessory:asInstance:forAccessories:callback:", v15, v16, v21, v20);

    v18 = v17;
  }

  return v5;
}

uint64_t __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_145_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

void __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  COLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_146_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v20 = v9;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_21214B000, v8, OS_LOG_TYPE_DEFAULT, "%p returned %@", buf, 0x16u);
    }

    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = *(void **)(a1 + 32);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_148;
    v16 = &unk_24CD3F930;
    v17 = v5;
    v18 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v13);
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v12, v13, v14, v15, v16);

  }
}

void __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_148(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

- (BOOL)_canDispatchForAssociatedAccessory
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;

  COLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[COAlarmManager _canDispatchForAssociatedAccessory].cold.5(self, v3);

  -[COAlarmManager dtClient](self, "dtClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_9;
  v5 = objc_msgSend(MEMORY[0x24BE2D5B0], "statusFlags");
  if ((v5 & 1) != 0)
  {
    COLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      -[COAlarmManager _canDispatchForAssociatedAccessory].cold.4();
    v9 = 0;
  }
  else
  {
    if ((v5 & 2) == 0)
    {
      COLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[COAlarmManager _canDispatchForAssociatedAccessory].cold.2();

LABEL_9:
      -[COAlarmManager accessory](self, "accessory");
      v7 = objc_claimAutoreleasedReturnValue();
      -[COAlarmManager instanceID](self, "instanceID");
      v8 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = (v7 | v8) == 0;
      if (v7 | v8)
      {
        COLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[COAlarmManager _canDispatchForAssociatedAccessory].cold.1();

        -[COAlarmManager provider](self, "provider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "alarmManagerServiceConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[COAlarmManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &__block_literal_global_150);
        v14 = MEMORY[0x24BDAC760];
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_2;
        v21[3] = &unk_24CD3F9A0;
        v21[4] = &v22;
        v21[5] = self;
        objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[COAlarmManager memento](self, "memento");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v14;
        v20[1] = 3221225472;
        v20[2] = __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_151;
        v20[3] = &unk_24CD3F9C8;
        v20[4] = &v22;
        objc_msgSend(v15, "canDispatchAsAccessory:asInstance:reply:", v16, v8, v20);

        v9 = *((_BYTE *)v23 + 24) != 0;
      }
      else
      {
        v9 = 1;
      }
      _Block_object_dispose(&v22, 8);

      goto LABEL_20;
    }
    -[COAlarmManager dtClient](self, "dtClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18 == 0;

    COLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
      -[COAlarmManager _canDispatchForAssociatedAccessory].cold.3();
  }
LABEL_20:

  return v9;
}

void __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_2_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_151(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)addAlarm:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  COAlarmManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__COAlarmManager_addAlarm___block_invoke_2;
  v8[3] = &unk_24CD3FA30;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[COAlarmManager _dispatchOpWithName:forAlarm:distributedTimers:coordination:](self, "_dispatchOpWithName:forAlarm:distributedTimers:coordination:", CFSTR("add"), v5, &__block_literal_global_156, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __27__COAlarmManager_addAlarm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addTimer:completionHandler:");
}

void __27__COAlarmManager_addAlarm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "memento");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAlarm:asAccessory:asInstance:withCallback:", v5, v10, v9, v7);

}

- (id)updateAlarm:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  COAlarmManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__COAlarmManager_updateAlarm___block_invoke_2;
  v8[3] = &unk_24CD3FA30;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[COAlarmManager _dispatchOpWithName:forAlarm:distributedTimers:coordination:](self, "_dispatchOpWithName:forAlarm:distributedTimers:coordination:", CFSTR("update"), v5, &__block_literal_global_160, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __30__COAlarmManager_updateAlarm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTimer:completionHandler:");
}

void __30__COAlarmManager_updateAlarm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "memento");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAlarm:asAccessory:asInstance:withCallback:", v5, v10, v9, v7);

}

- (id)removeAlarm:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  COAlarmManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__COAlarmManager_removeAlarm___block_invoke_2;
  v8[3] = &unk_24CD3FA30;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[COAlarmManager _dispatchOpWithName:forAlarm:distributedTimers:coordination:](self, "_dispatchOpWithName:forAlarm:distributedTimers:coordination:", CFSTR("remove"), v5, &__block_literal_global_163, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __30__COAlarmManager_removeAlarm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeTimer:completionHandler:");
}

void __30__COAlarmManager_removeAlarm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "memento");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAlarm:asAccessory:asInstance:withCallback:", v5, v10, v9, v7);

}

- (id)snoozeAlarmWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  COAlarmManager *v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67818]), "initWithIdentifier:", v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__COAlarmManager_snoozeAlarmWithIdentifier___block_invoke_2;
  v10[3] = &unk_24CD3FA30;
  v11 = v4;
  v12 = self;
  v7 = v4;
  -[COAlarmManager _dispatchOpWithName:forAlarm:distributedTimers:coordination:](self, "_dispatchOpWithName:forAlarm:distributedTimers:coordination:", CFSTR("snooze"), v6, &__block_literal_global_166, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __44__COAlarmManager_snoozeAlarmWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snoozeTimer:completionHandler:");
}

void __44__COAlarmManager_snoozeAlarmWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "memento");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snoozeAlarmWithIdentifier:asAccessory:asInstance:withCallback:", v5, v10, v9, v7);

}

- (id)dismissAlarmWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  COAlarmManager *v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67818]), "initWithIdentifier:", v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__COAlarmManager_dismissAlarmWithIdentifier___block_invoke_2;
  v10[3] = &unk_24CD3FA30;
  v11 = v4;
  v12 = self;
  v7 = v4;
  -[COAlarmManager _dispatchOpWithName:forAlarm:distributedTimers:coordination:](self, "_dispatchOpWithName:forAlarm:distributedTimers:coordination:", CFSTR("dismiss"), v6, &__block_literal_global_169, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __45__COAlarmManager_dismissAlarmWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dismissTimer:completionHandler:");
}

void __45__COAlarmManager_dismissAlarmWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "memento");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissAlarmWithIdentifier:asAccessory:asInstance:withCallback:", v5, v10, v9, v7);

}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  int v20;
  COAlarmManager *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  COLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134218242;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_21214B000, v11, OS_LOG_TYPE_DEFAULT, "%p adding alarm observer for %@", (uint8_t *)&v20, 0x16u);
  }

  -[COAlarmManager observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registeredNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserverForName:observable:queue:usingBlock:", v8, self, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[COAlarmManager _activateDistributedTimersMonitoring](self, "_activateDistributedTimersMonitoring");
  if (!-[COAlarmManager dtMonitoring](self, "dtMonitoring"))
  {
    COLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134218242;
      v21 = self;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%p using Coordination for observer %@", (uint8_t *)&v20, 0x16u);
    }

    v16 = objc_msgSend(v13, "containsObject:", v8);
    COLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
        -[COAlarmManager addObserverForName:queue:usingBlock:].cold.1((uint64_t)self);

    }
    else
    {
      if (v18)
        -[COAlarmManager addObserverForName:queue:usingBlock:].cold.2((uint64_t)self);

      -[COAlarmManager _registerObserverWithName:](self, "_registerObserverWithName:", v8);
    }
  }

  return v14;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  COAlarmManager *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  COAlarmManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = self;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p removing alarm observer...", buf, 0xCu);
  }

  -[COAlarmManager observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", v4);
  if (!-[COAlarmManager dtMonitoring](self, "dtMonitoring"))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registeredNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
    {
      COLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[COAlarmManager removeObserver:].cold.1((uint64_t)self);

      v11 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __33__COAlarmManager_removeObserver___block_invoke;
      v18[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v18[4] = self;
      -[COAlarmManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[COAlarmManager memento](self, "memento");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[COAlarmManager instanceID](self, "instanceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __33__COAlarmManager_removeObserver___block_invoke_170;
      v15[3] = &unk_24CD3F6E0;
      v17 = self;
      v16 = v7;
      objc_msgSend(v12, "removeObserverForNotificationName:asAccessory:asInstance:withCallback:", v16, v13, v14, v15);

    }
  }

}

void __33__COAlarmManager_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__COAlarmManager__updateMonitoring__block_invoke_cold_1();

}

void __33__COAlarmManager_removeObserver___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __33__COAlarmManager_removeObserver___block_invoke_170_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p removed last alarm observer for %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_registerObserverWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  COAlarmManager *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  COAlarmManager *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v22 = self;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p registering observer with service for %@", buf, 0x16u);
  }

  -[COAlarmManager accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    _COAssociatedAccessories(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __44__COAlarmManager__registerObserverWithName___block_invoke;
    v19[3] = &unk_24CD3FAD8;
    v10 = v8;
    v20 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);

  }
  else
  {
    v10 = 0;
  }
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __44__COAlarmManager__registerObserverWithName___block_invoke_2;
  v18[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v18[4] = self;
  -[COAlarmManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmManager memento](self, "memento");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COAlarmManager instanceID](self, "instanceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __44__COAlarmManager__registerObserverWithName___block_invoke_173;
  v15[3] = &unk_24CD3F6E0;
  v16 = v4;
  v17 = self;
  v14 = v4;
  objc_msgSend(v11, "addObserverForNotificationName:asAccessory:asInstance:constraints:withCallback:", v14, v12, v13, v10, v15);

}

void __44__COAlarmManager__registerObserverWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __44__COAlarmManager__registerObserverWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  COLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__COAlarmManager__registerObserverWithName___block_invoke_2_cold_1();

}

void __44__COAlarmManager__registerObserverWithName___block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__COAlarmManager__registerObserverWithName___block_invoke_173_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p added alarm observer for %@", (uint8_t *)&v8, 0x16u);
  }

}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSXPCConnection)lastConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_lastConnection);
}

- (void)setLastConnection:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnection, a3);
}

- (DTTimerClient)dtClient
{
  return self->_dtClient;
}

- (void)setDtClient:(id)a3
{
  objc_storeStrong((id *)&self->_dtClient, a3);
}

- (BOOL)dtMonitoring
{
  return self->_dtMonitoring;
}

- (void)setDtMonitoring:(BOOL)a3
{
  self->_dtMonitoring = a3;
}

- (BOOL)canDispatch
{
  return self->_canDispatch;
}

- (void)setCanDispatch:(BOOL)a3
{
  self->_canDispatch = a3;
}

- (COAlarmManagerConnectionProvider)provider
{
  return self->_provider;
}

- (COObserverSet)observers
{
  return self->_observers;
}

- (COHomeKitAccessoryMemento)memento
{
  return self->_memento;
}

- (NSUUID)instanceID
{
  return self->_instanceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_memento, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_dtClient, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_accessory, 0);
}

void __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to alarm service interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__COAlarmManager__remoteInterfaceWithErrorHandler___block_invoke_111_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to alarm service invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__COAlarmManager__dispatchOpWithName_forAlarm_distributedTimers_coordination___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alarmID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109890;
  v8[1] = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2112;
  v14 = a2;
  _os_log_error_impl(&dword_21214B000, a3, OS_LOG_TYPE_ERROR, "%u: %{public}@ alarm %{public}@ failed: %@", (uint8_t *)v8, 0x26u);

  OUTLINED_FUNCTION_9();
}

- (void)_handleDTTimerClientEvent:dtTimer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p unhandled DistributedTimers event: %lu", v2, v3);
  OUTLINED_FUNCTION_1();
}

- (void)_handleDTTimerClientEvent:dtTimer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21214B000, v0, v1, "%p ignoring Distributed Timers non-alarm event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __35__COAlarmManager__updateMonitoring__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get alarm remote proxy - %@");
  OUTLINED_FUNCTION_1();
}

void __58__COAlarmManager__alarmsForAccessory_includingSleepAlarm___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_21214B000, v0, v1, "%u: retrieving alarms failed: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_145_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to retrieve alarms (%@)");
  OUTLINED_FUNCTION_1();
}

void __45__COAlarmManager_alarmsForAccessoryMementos___block_invoke_146_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p retrieving alarms failed (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)_canDispatchForAssociatedAccessory
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dtClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dtClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = "yes";
  v8 = 134218498;
  v9 = a1;
  if (!v6)
    v7 = "no";
  v10 = 2048;
  v11 = v4;
  v12 = 2080;
  v13 = v7;
  _os_log_debug_impl(&dword_21214B000, a2, OS_LOG_TYPE_DEBUG, "%p _canDispatchForAssociatedAccessory: %p, %s", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_9();
}

void __52__COAlarmManager__canDispatchForAssociatedAccessory__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to check if can dispatch (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)addObserverForName:(uint64_t)a1 queue:usingBlock:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v1, v2, "%p repeated add alarm observer for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)addObserverForName:(uint64_t)a1 queue:usingBlock:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v1, v2, "%p is getting a new alarm observer for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)removeObserver:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21214B000, v1, v2, "%p removing last alarm observer for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __33__COAlarmManager_removeObserver___block_invoke_170_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_21214B000, v0, v1, "%p failed to remove alarm observer for %@ - %@");
}

void __44__COAlarmManager__registerObserverWithName___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get alarm remote proxy for add - %@");
  OUTLINED_FUNCTION_1();
}

void __44__COAlarmManager__registerObserverWithName___block_invoke_173_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_21214B000, v0, v1, "%p failed to add alarm observer for %@ - %@");
}

@end
