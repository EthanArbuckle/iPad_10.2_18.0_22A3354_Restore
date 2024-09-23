@implementation CNHealthStoreManager

void __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsFetching:", objc_msgSend(*(id *)(a1 + 32), "isListeningToChanges") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "setMedicalIDData:", *(_QWORD *)(a1 + 40));
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__30290;
  v12 = __Block_byref_object_dispose__30291;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_204;
  v7[3] = &unk_1E204DD50;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = &v8;
  objc_msgSend(v2, "performBlock:", v7);

  v4 = (void *)v9[5];
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_2;
  v5[3] = &unk_1E204BAF8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

  _Block_object_dispose(&v8, 8);
}

void __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void (**v5)(id, void *, id);
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if (!+[CNHealthStoreManager shouldShowEmergencyContacts](CNHealthStoreManager, "shouldShowEmergencyContacts"))return;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke_2;
  v7[3] = &unk_1E204F098;
  v7[4] = WeakRetained;
  v8 = a1[4];
  v9 = a1[5];
  objc_msgSend(v3, "performBlock:", v7);

  objc_msgSend(WeakRetained, "medicalIDData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_5:
    v5 = (void (**)(id, void *, id))a1[5];
    objc_msgSend(WeakRetained, "medicalIDData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6, a1[4]);

    goto LABEL_6;
  }
  if ((objc_msgSend(WeakRetained, "needsFetching") & 1) == 0)
    goto LABEL_5;
LABEL_6:
  if (objc_msgSend(WeakRetained, "needsFetching"))
    objc_msgSend(WeakRetained, "updateAndDispatchMedicalIDData");

}

- (BOOL)needsFetching
{
  return self->_needsFetching;
}

- (CNScheduler)stateLock
{
  return self->_stateLock;
}

- (void)updateAndDispatchMedicalIDData
{
  void *v3;
  _QWORD v4[5];

  -[CNHealthStoreManager workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)setNeedsFetching:(BOOL)a3
{
  self->_needsFetching = a3;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (BOOL)isListeningToChanges
{
  return self->_isListeningToChanges;
}

+ (BOOL)shouldShowEmergencyContacts
{
  if ((CNUIIsContacts() || CNUIIsMobilePhone())
    && -[objc_class isHealthDataAvailable](getHKHealthStoreClass(), "isHealthDataAvailable"))
  {
    return -[objc_class isSupportedOnThisDevice](getHKMedicalIDViewControllerClass_30315(), "isSupportedOnThisDevice");
  }
  else
  {
    return 0;
  }
}

uint64_t __38__CNHealthStoreManager_medicalIDStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyMedicalIDStore");
}

- (id)registerMedicalIDDataHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[CNHealthStoreManager workQueue](self, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke;
  v12[3] = &unk_1E204BAA8;
  objc_copyWeak(&v15, &location);
  v7 = v5;
  v13 = v7;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "performBlock:", v12);

  v9 = v14;
  v10 = v7;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

+ (id)emergencyContactMatchingContact:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "allLinkedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CNHealthStoreManager_emergencyContactMatchingContact___block_invoke;
  v7[3] = &unk_1E204BA80;
  v8 = v3;
  v4 = v3;
  v5 = (void *)objc_msgSend(v7, "copy");

  return v5;
}

- (void)startListeningForChanges
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  -[CNHealthStoreManager setIsListeningToChanges:](self, "setIsListeningToChanges:", 1);
  objc_initWeak(&location, self);
  -[CNHealthStoreManager workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CNHealthStoreManager_startListeningForChanges__block_invoke;
  v4[3] = &unk_1E204F910;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "performBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void)setIsListeningToChanges:(BOOL)a3
{
  self->_isListeningToChanges = a3;
}

- (CNHealthStoreManager)initWithEnvironment:(id)a3 healthStore:(id)a4 medicalIDStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNHealthStoreManager *v12;
  CNHealthStoreManager *v13;
  void *v14;
  uint64_t v15;
  CNScheduler *workQueue;
  void *v17;
  uint64_t v18;
  CNScheduler *stateLock;
  uint64_t v20;
  NSMutableDictionary *medicalIDDataHandlers;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CNHealthStoreManager;
  v12 = -[CNHealthStoreManager init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a3);
    objc_storeStrong((id *)&v13->_healthStore, a4);
    objc_storeStrong((id *)&v13->_medicalIDStore, a5);
    objc_msgSend(v9, "defaultSchedulerProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "newSerialSchedulerWithName:", CFSTR("com.apple.Contacts.CNHealthStoreManager.workQueue"));
    workQueue = v13->_workQueue;
    v13->_workQueue = (CNScheduler *)v15;

    v13->_needsFetching = 1;
    objc_msgSend(v9, "defaultSchedulerProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "newSynchronousSerialSchedulerWithName:", CFSTR("com.apple.Contacts.CNHealthStoreManager.stateLock"));
    stateLock = v13->_stateLock;
    v13->_stateLock = (CNScheduler *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    medicalIDDataHandlers = v13->_medicalIDDataHandlers;
    v13->_medicalIDDataHandlers = (NSMutableDictionary *)v20;

  }
  return v13;
}

- (CNHealthStoreManager)initWithEnvironment:(id)a3
{
  return -[CNHealthStoreManager initWithEnvironment:healthStore:medicalIDStore:](self, "initWithEnvironment:healthStore:medicalIDStore:", a3, 0, 0);
}

- (void)notifyHandlersWithMedicalIDData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNHealthStoreManager workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke;
  v7[3] = &unk_1E2050400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, *(_QWORD *)(a1 + 32), a2);
}

- (id)nts_lazyMedicalIDStore
{
  HKMedicalIDStore *medicalIDStore;
  id v4;
  HKMedicalIDStore *v5;
  HKMedicalIDStore *v6;

  medicalIDStore = self->_medicalIDStore;
  if (!medicalIDStore)
  {
    v4 = -[CNHealthStoreManager nts_lazyHealthStore](self, "nts_lazyHealthStore");
    v5 = (HKMedicalIDStore *)objc_msgSend(objc_alloc((Class)getHKMedicalIDStoreClass[0]()), "initWithHealthStore:", self->_healthStore);
    v6 = self->_medicalIDStore;
    self->_medicalIDStore = v5;

    medicalIDStore = self->_medicalIDStore;
  }
  return medicalIDStore;
}

- (id)nts_lazyHealthStore
{
  HKHealthStore *healthStore;
  HKHealthStore *v4;
  HKHealthStore *v5;

  healthStore = self->_healthStore;
  if (!healthStore)
  {
    v4 = (HKHealthStore *)objc_alloc_init(getHKHealthStoreClass());
    v5 = self->_healthStore;
    self->_healthStore = v4;

    healthStore = self->_healthStore;
  }
  return healthStore;
}

void __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "medicalIDStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "medicalIDSetUpStatus");

  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyHandlersWithMedicalIDData:", 0);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "medicalIDStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke_2;
    v5[3] = &unk_1E204BAD0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "fetchMedicalIDDataWithCompletion:", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (HKMedicalIDStore)medicalIDStore
{
  cn_objectResultWithObjectLock();
  return (HKMedicalIDStore *)(id)objc_claimAutoreleasedReturnValue();
}

void __48__CNHealthStoreManager_startListeningForChanges__block_invoke(uint64_t a1)
{
  const char *v2;
  int *v3;
  NSObject *v4;
  id v5;
  _QWORD handler[4];
  id v7;

  v2 = (const char *)getkHKMedicalIDDidChangeNotification();
  v3 = (int *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__CNHealthStoreManager_startListeningForChanges__block_invoke_2;
  handler[3] = &unk_1E204BB20;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  notify_register_dispatch(v2, v3, v4, handler);

  objc_destroyWeak(&v7);
}

void __53__CNHealthStoreManager_registerMedicalIDDataHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  v2 = _Block_copy(v4);
  objc_msgSend(*(id *)(a1 + 32), "medicalIDDataHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)medicalIDDataHandlers
{
  return self->_medicalIDDataHandlers;
}

+ (id)identifiersForContactMatchingEmergencyContacts:(id)a3 contactStore:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    v11 = *MEMORY[0x1E0C966E8];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "nameContactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "nameContactIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "unifiedContactWithIdentifier:keysToFetch:error:", v15, v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "allLinkedIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v18);

          objc_msgSend(v13, "nameContactIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v6, "containsObject:", v19);

          if ((v16 & 1) == 0)
          {
            objc_msgSend(v13, "nameContactIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v20);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v21 = (void *)objc_msgSend(v6, "copy");
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_healthNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)CNHealthStoreManager;
  -[CNHealthStoreManager dealloc](&v3, sel_dealloc);
}

- (HKHealthStore)healthStore
{
  cn_objectResultWithObjectLock();
  return (HKHealthStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)unregisterHandlerForToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNHealthStoreManager stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNHealthStoreManager_unregisterHandlerForToken___block_invoke;
  v7[3] = &unk_1E2050400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)createMedicalIDFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNHealthStoreManager healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createMedicalIDData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "loadDataFromCNContact:", v4);
  return v6;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void)setMedicalIDStore:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDStore, a3);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_medicalIDDataHandlers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __48__CNHealthStoreManager_startListeningForChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAndDispatchMedicalIDData");

}

void __56__CNHealthStoreManager_notifyHandlersWithMedicalIDData___block_invoke_204(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "medicalIDDataHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__CNHealthStoreManager_updateAndDispatchMedicalIDData__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "notifyHandlersWithMedicalIDData:", v5);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch Medical ID: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

void __50__CNHealthStoreManager_unregisterHandlerForToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "medicalIDDataHandlers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

uint64_t __35__CNHealthStoreManager_healthStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyHealthStore");
}

+ (id)log
{
  if (log_cn_once_token_3[0] != -1)
    dispatch_once(log_cn_once_token_3, &__block_literal_global_30327);
  return (id)log_cn_once_object_3;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_4 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_4, &__block_literal_global_188);
  return (id)descriptorForRequiredKeys_cn_once_object_4;
}

uint64_t __56__CNHealthStoreManager_emergencyContactMatchingContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "nameContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "nameContactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __49__CNHealthStoreManager_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend((Class)get_HKMedicalIDDataClass[0](), "contactKeysToLoadForMedicalID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNHealthStoreManager descriptorForRequiredKeys]_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)descriptorForRequiredKeys_cn_once_object_4;
  descriptorForRequiredKeys_cn_once_object_4 = v2;

}

void __27__CNHealthStoreManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNHealthStoreManager");
  v1 = (void *)log_cn_once_object_3;
  log_cn_once_object_3 = (uint64_t)v0;

}

@end
