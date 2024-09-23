@implementation HKSummarySharingEntryStore

- (HKSummarySharingEntryStore)initWithHealthStore:(id)a3
{
  id v5;
  HKSummarySharingEntryStore *v6;
  HKSummarySharingEntryStore *v7;
  uint64_t v8;
  OS_dispatch_queue *resourceQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *fetchedEntriesByUUID;
  HKObserverSet *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HKObserverSet *observers;
  HKTaskServerProxyProvider *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HKTaskServerProxyProvider *proxyProvider;
  HKTaskServerProxyProvider *v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HKSummarySharingEntryStore;
  v6 = -[HKSummarySharingEntryStore init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    HKCreateSerialDispatchQueue(v7, CFSTR("resource"));
    v8 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v7->_resourceQueue;
    v7->_resourceQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchedEntriesByUUID = v7->_fetchedEntriesByUUID;
    v7->_fetchedEntriesByUUID = v10;

    v12 = [HKObserverSet alloc];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogSharing();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HKObserverSet initWithName:loggingCategory:](v12, "initWithName:loggingCategory:", v14, v15);
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v16;

    v18 = [HKTaskServerProxyProvider alloc];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v18, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v20, v7, v21);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v22;

    objc_initWeak(&location, v7);
    v24 = v7->_proxyProvider;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __50__HKSummarySharingEntryStore_initWithHealthStore___block_invoke;
    v26[3] = &unk_1E37F0130;
    objc_copyWeak(&v27, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v24, "setAutomaticProxyReconnectionHandler:", v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __50__HKSummarySharingEntryStore_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchSharingEntriesWithCompletion:", &__block_literal_global_64);

}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3C9D50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_clientRemote_sharingEntriesDidUpdate_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F408);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_fetchSharingEntriesWithCompletionHandler_, 0, 1);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion_, 3, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_updateAuthorizationIdentifiersForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_updateAuthorizationIdentifiersForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion_, 2, 0);

  return v2;
}

- (id)exportedInterface
{
  return +[HKSummarySharingEntryStore clientInterface](HKSummarySharingEntryStore, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKSummarySharingEntryStore serverInterface](HKSummarySharingEntryStore, "serverInterface");
}

- (NSArray)sharingEntries
{
  NSObject *resourceQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__HKSummarySharingEntryStore_sharingEntries__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __44__HKSummarySharingEntryStore_sharingEntries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)fetchSharingEntriesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke;
  v10[3] = &unk_1E37F0180;
  v10[4] = self;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_94;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E37F0158;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "remote_fetchSharingEntriesWithCompletionHandler:", v4);

}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_91;
    v11[3] = &unk_1E37E8DD0;
    v11[4] = v8;
    v12 = v5;
    v10 = *(id *)(a1 + 40);
    v13 = 0;
    v14 = v10;
    dispatch_async(v9, v11);

  }
}

uint64_t __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_91(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(v7, "UUID", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_notifyObservers");
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40) != 0, *(_QWORD *)(a1 + 48));
}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke;
  v16[3] = &unk_1E37F01A8;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "remote_beginObservingReachabilityStatusForIdentifiers:isInitialQuery:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  NSObject *v23;
  HKTaskServerProxyProvider *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD, _QWORD, _QWORD);
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  int64_t v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  proxyProvider = self->_proxyProvider;
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke;
  v35[3] = &unk_1E37E67C0;
  v35[4] = self;
  v36 = v19;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v35);
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v38 = self;
    v39 = 2112;
    v40 = v15;
    v41 = 2112;
    v42 = v16;
    v43 = 2112;
    v44 = v17;
    _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Inviting %@ (%@ %@)", buf, 0x2Au);
  }

  if (objc_msgSend(v18, "count"))
  {
    v24 = self->_proxyProvider;
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_105;
    v28[3] = &unk_1E37F01D0;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v34 = a7;
    v33 = v22;
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2;
    v26[3] = &unk_1E37E6B38;
    v27 = v33;
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v24, "fetchProxyWithHandler:errorHandler:", v28, v26);

    v25 = v29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No sharing authorization to add."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v22)[2](v22, 0, v25);
  }

}

void __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Invite sharing finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_105(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_inviteSharingDataWithIdentifier:firstName:lastName:sharingAuthorizations:userWheelchairMode:completion:", a1[4], a1[5], a1[6], a1[7], a1[9], a1[8]);
}

uint64_t __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acceptInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HKTaskServerProxyProvider *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke;
  v21[3] = &unk_1E37E67C0;
  v21[4] = self;
  v22 = v7;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Accepting invitation %{public}@", buf, 0x16u);

  }
  v13 = self->_proxyProvider;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_106;
  v18[3] = &unk_1E37F0180;
  v19 = v6;
  v20 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v13, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Accept invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_106(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_acceptInvitationWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)declineInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HKTaskServerProxyProvider *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke;
  v21[3] = &unk_1E37E67C0;
  v21[4] = self;
  v22 = v7;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Declining invitation %{public}@", buf, 0x16u);

  }
  v13 = self->_proxyProvider;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_107;
  v18[3] = &unk_1E37F0180;
  v19 = v6;
  v20 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v13, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Decline invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_107(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_declineInvitationWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revokeInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HKTaskServerProxyProvider *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke;
  v21[3] = &unk_1E37E67C0;
  v21[4] = self;
  v22 = v7;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Revoking invitation %{public}@", buf, 0x16u);

  }
  v13 = self->_proxyProvider;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_108;
  v18[3] = &unk_1E37F0180;
  v19 = v6;
  v20 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v13, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Revoke invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_108(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_revokeInvitationWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)leaveInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HKTaskServerProxyProvider *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke;
  v21[3] = &unk_1E37E67C0;
  v21[4] = self;
  v22 = v7;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Leaving invitation %{public}@", buf, 0x16u);

  }
  v13 = self->_proxyProvider;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_109;
  v18[3] = &unk_1E37F0180;
  v19 = v6;
  v20 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v13, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Leave invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_109(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_leaveInvitationWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unpauseInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HKTaskServerProxyProvider *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke;
  v21[3] = &unk_1E37E67C0;
  v21[4] = self;
  v22 = v7;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Unpause invitation %{public}@", buf, 0x16u);

  }
  v13 = self->_proxyProvider;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_110;
  v18[3] = &unk_1E37F0180;
  v19 = v6;
  v20 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v13, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Unpause invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_110(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unpauseInvitationWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSharingAuthorizationsForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 completion:(id)a6
{
  -[HKSummarySharingEntryStore updateSharingAuthorizationsForInvitationUUID:sharingAuthorizationsToAdd:sharingAuthorizationsToDelete:deleteOnCommit:completion:](self, "updateSharingAuthorizationsForInvitationUUID:sharingAuthorizationsToAdd:sharingAuthorizationsToDelete:deleteOnCommit:completion:", a3, a4, a5, 0, a6);
}

- (void)updateSharingAuthorizationsForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  HKTaskServerProxyProvider *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke;
  v34[3] = &unk_1E37E67C0;
  v34[4] = self;
  v35 = v15;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v37 = self;
    v38 = 2114;
    v39 = v20;
    v40 = 2113;
    v41 = v13;
    v42 = 2113;
    v43 = v14;
    _os_log_impl(&dword_19A0E6000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating invitation sharing authorizations with UUID %{public}@. %{private}@ %{private}@", buf, 0x2Au);

  }
  v21 = self->_proxyProvider;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_111;
  v28[3] = &unk_1E37F01F8;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v33 = a6;
  v32 = v18;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2;
  v26[3] = &unk_1E37E69F8;
  v26[4] = self;
  v27 = v32;
  v22 = v32;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v21, "fetchProxyWithHandler:errorHandler:", v28, v26);

}

void __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Update sharing authorizations finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_111(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateAuthorizationIdentifiersForInvitationUUID:sharingAuthorizationsToAdd:sharingAuthorizationsToDelete:deleteOnCommit:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateNotificationStatusWithUUID:(id)a3 notificationStatus:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  int64_t v21;
  uint8_t buf[4];
  HKSummarySharingEntryStore *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v23 = self;
    v24 = 2114;
    v25 = v11;
    v26 = 2049;
    v27 = a4;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating notification status with UUID %{public}@. %{private}ld", buf, 0x20u);

  }
  proxyProvider = self->_proxyProvider;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke;
  v18[3] = &unk_1E37F0220;
  v19 = v8;
  v21 = a4;
  v20 = v9;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2;
  v16[3] = &unk_1E37E69F8;
  v16[4] = self;
  v17 = v20;
  v14 = v20;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateNotificationStatusWithUUID:notificationStatus:completion:", a1[4], a1[6], a1[5]);
}

void __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)clientRemote_sharingEntriesDidUpdate:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HKSummarySharingEntryStore *v9;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HKSummarySharingEntryStore_clientRemote_sharingEntriesDidUpdate___block_invoke;
  v7[3] = &unk_1E37E6980;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(resourceQueue, v7);

}

uint64_t __67__HKSummarySharingEntryStore_clientRemote_sharingEntriesDidUpdate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        objc_msgSend(v7, "UUID", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_notifyObservers");
}

- (void)clientRemote_reachabilityStatusDidUpdate:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HKSummarySharingEntryStore_clientRemote_reachabilityStatusDidUpdate_error___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __77__HKSummarySharingEntryStore_clientRemote_reachabilityStatusDidUpdate_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summarySharingEntryStore:didUpdateReachabilityStatus:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_notifyObservers
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__HKSummarySharingEntryStore__notifyObservers__block_invoke;
  v3[3] = &unk_1E37F0248;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __46__HKSummarySharingEntryStore__notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HKSummarySharingEntryStore__notifyObservers__block_invoke_2;
  block[3] = &unk_1E37E6770;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __46__HKSummarySharingEntryStore__notifyObservers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sharingEntryStoreDidUpdate");
}

- (HKSummarySharingEntryStoreDelegate)delegate
{
  return (HKSummarySharingEntryStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fetchedEntriesByUUID, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Failed to fetch sharing entries with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Failed to update sharing authorizations with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Failed to update notification status with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
