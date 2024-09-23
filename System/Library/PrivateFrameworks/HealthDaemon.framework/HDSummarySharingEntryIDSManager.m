@implementation HDSummarySharingEntryIDSManager

- (HDSummarySharingEntryIDSManager)initWithProfile:(id)a3
{
  id v4;
  HDSummarySharingEntryIDSManager *v5;
  HDSummarySharingEntryIDSManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSOperationQueue *v9;
  NSOperationQueue *operationQueue;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HKObserverSet *observers;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDSummarySharingEntryIDSManager;
  v5 = -[HDSummarySharingEntryIDSManager init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, v6->_queue);
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogSharing();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "initWithName:loggingCategory:", v13, v14);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v15;

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained;
  void *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HDSummarySharingEntryIDSManager_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E6CE80E8;
  v7[4] = self;
  objc_msgSend(v5, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v7);

}

void __57__HDSummarySharingEntryIDSManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v1;
  HDIDSInvitationManager *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 16));
    if (!*(_QWORD *)(v1 + 48))
    {
      v2 = -[HDIDSInvitationManager initWithServiceIdentifier:messageClass:schema:]([HDIDSInvitationManager alloc], "initWithServiceIdentifier:messageClass:schema:", CFSTR("com.apple.private.alloy.health.sync.sharingsetup"), objc_opt_class(), CFSTR("1"));
      v3 = *(void **)(v1 + 48);
      *(_QWORD *)(v1 + 48) = v2;

      objc_msgSend(*(id *)(v1 + 48), "setDelegate:", v1);
    }
  }
}

- (void)addObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HDSummarySharingEntryIDSManager_removeObserver___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__HDSummarySharingEntryIDSManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  if (!result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
  return result;
}

- (void)beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  HDSummarySharingEntryIDSManager *v11;
  BOOL v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke;
  block[3] = &unk_1E6CF7348;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke(uint64_t a1)
{
  void *v2;
  HDIDSReachabilityOperation *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "operationCount") && !*(_BYTE *)(a1 + 48))
  {
    _HKInitializeLogging();
    HKLogSharing();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2048;
      v20 = v13;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating reachability operation for %ld identifiers.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "updateDestinations:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "cancelAllOperations");
    objc_initWeak(&location, *(id *)(a1 + 40));
    v3 = [HDIDSReachabilityOperation alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_3;
    v14[3] = &unk_1E6CF7320;
    objc_copyWeak(&v15, &location);
    v14[4] = *(_QWORD *)(a1 + 40);
    v4 = -[HDIDSReachabilityOperation initWithIdentifers:serviceIdentifier:updateHandler:](v3, "initWithIdentifers:serviceIdentifier:updateHandler:", v2, CFSTR("com.apple.private.alloy.health.sync.sharingsetup"), v14);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D342B0]), "initWithService:delegate:queue:", CFSTR("com.apple.private.alloy.health.sync.sharingsetup"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setQueryController:", v7);
    _HKInitializeLogging();
    HKLogSharing();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Enqueing reachability operation for %ld identifiers.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addOperation:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

id __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "_appearsToBeEmail"))
  {
    v3 = (id)_IDSCopyIDForEmailAddress();
  }
  else if (objc_msgSend(v2, "_appearsToBePhoneNumber"))
  {
    v3 = (id)IDSCopyIDForPhoneNumber();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

void __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_4;
  v11[3] = &unk_1E6CF72F8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "notifyObservers:", v11);

}

uint64_t __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_4(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "summarySharingEntryIDSManager:didUpdateReachabilityStatus:error:", a1[4], a1[5], a1[6]);
}

- (void)inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id WeakRetained;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SEL v34;
  int64_t v35;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, CFSTR("invite"), a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v37 = self;
    v38 = 2113;
    v39 = v15;
    _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Inviting to share data with contact identifier %{private}@", buf, 0x16u);
  }

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke;
  v28[3] = &unk_1E6CF73C0;
  v28[4] = self;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = a2;
  v35 = a7;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v19;
  objc_msgSend(v22, "fetchCloudKitAccountInfoWithCompletion:", v28);

}

- (id)_finishHandlerForOperation:(void *)a3 completion:
{
  id v5;
  id v6;
  _QWORD aBlock[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__HDSummarySharingEntryIDSManager__finishHandlerForOperation_completion___block_invoke;
    aBlock[3] = &unk_1E6CE7868;
    aBlock[4] = a1;
    v9 = v5;
    v10 = v6;
    a1 = _Block_copy(aBlock);

  }
  return a1;
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  HDCodableSummarySharingEntry *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  HDCodableSummarySharingEntry *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  HDCodableSummarySharingEntry *v55;
  id v56;
  _QWORD *v57;
  id WeakRetained;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *log;
  __int128 v72;
  void *v73;
  void *v74;
  _QWORD v75[4];
  uint64_t v76;
  id v77;
  HDCodableSummarySharingEntry *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint64_t v89;
  _BYTE v90[24];
  void *v91;
  HDCodableSummarySharingEntry *v92;
  _QWORD *v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = v9;
    if (v8)
    {
      if (objc_msgSend(v9, "_appearsToBeEmail"))
      {
        v11 = _IDSCopyIDForEmailAddress();
        goto LABEL_13;
      }
      if (objc_msgSend(v10, "_appearsToBePhoneNumber"))
      {
        v11 = _IDSCopyIDForPhoneNumberWithOptions();
LABEL_13:
        v15 = (void *)v11;

        if (v15)
        {
          v69 = v6;
          v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v70 = v5;
          objc_msgSend(v5, "emailAddress");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, 0);

          v73 = *(void **)(a1 + 32);
          v68 = v15;
          if (!v73)
            goto LABEL_52;
          v19 = objc_alloc(MEMORY[0x1E0CA6E38]);
          v20 = (void *)objc_msgSend(v19, "initWithQueue:", MEMORY[0x1E0C80D38]);
          v88 = 0;
          objc_msgSend(v20, "getSubscriptionInfoWithError:", &v88);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v88;
          if (v22)
          {
            v23 = v22;
            _HKInitializeLogging();
            HKLogSharing();
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v95 = v73;
              v96 = 2114;
              v97 = v23;
              _os_log_error_impl(&dword_1B7802000, log, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to get CTXPCServiceSubscriptionInfo with error, %{public}@", buf, 0x16u);
            }
            v24 = 0;
          }
          else
          {
            v67 = v18;
            objc_msgSend(v21, "subscriptionsInUse");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v66 = a1;
              log = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v65 = v21;
              objc_msgSend(v21, "subscriptionsInUse");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
              if (v29)
              {
                v30 = v29;
                v23 = 0;
                v31 = *(_QWORD *)v85;
                v32 = log;
                do
                {
                  for (i = 0; i != v30; ++i)
                  {
                    if (*(_QWORD *)v85 != v31)
                      objc_enumerationMutation(v28);
                    v34 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                    if (objc_msgSend(v34, "isSimDataOnly"))
                    {
                      _HKInitializeLogging();
                      HKLogSharing();
                      v35 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543362;
                        v95 = v73;
                        _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sim is data only. Skipping...", buf, 0xCu);
                      }
                    }
                    else
                    {
                      v83 = v23;
                      objc_msgSend(v20, "getPhoneNumber:error:", v34, &v83);
                      v35 = objc_claimAutoreleasedReturnValue();
                      v36 = v83;

                      _HKInitializeLogging();
                      if (v36)
                      {
                        HKLogSharing();
                        v37 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v95 = v73;
                          v96 = 2114;
                          v97 = v36;
                          _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to get sim Phone Number with error, %{public}@", buf, 0x16u);
                        }
                      }
                      else
                      {
                        v38 = (void *)*MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                        {
                          v39 = v38;
                          -[NSObject number](v35, "number");
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138477827;
                          v95 = v40;
                          _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "Found sim phone number %{private}@", buf, 0xCu);

                          v32 = log;
                        }
                        -[NSObject number](v35, "number");
                        v37 = objc_claimAutoreleasedReturnValue();
                        -[NSObject addObject:](v32, "addObject:", v37);
                      }

                      v23 = v36;
                    }

                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
                }
                while (v30);
              }
              else
              {
                v23 = 0;
                v32 = log;
              }

              v24 = -[NSObject count](v32, "count") ? (uint64_t)-[NSObject copy](v32, "copy") : 0;
              a1 = v66;
              v18 = v67;
              v21 = v65;
            }
            else
            {
              _HKInitializeLogging();
              HKLogSharing();
              log = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v95 = v73;
                _os_log_error_impl(&dword_1B7802000, log, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: CTXPCServiceSubscriptionContext returned nil when fetching sim phone number.", buf, 0xCu);
              }
              v23 = 0;
              v24 = 0;
            }
          }

          if (v24)
          {
            v74 = (void *)v24;
            objc_msgSend(v18, "addObjectsFromArray:", v24);
          }
          else
          {
LABEL_52:
            v74 = 0;
          }
          v41 = [HDCodableSummarySharingEntry alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = *(_QWORD *)(a1 + 40);
          v43 = v89;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = *(_QWORD *)(a1 + 48);
          v72 = *(_OWORD *)(a1 + 56);
          v46 = *(_QWORD *)(a1 + 88);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:](v41, "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v42, 0, 0, v43, v44, v45, v72, v46, 0, 0, 0, 0, v47, v48, 0,
                  0,
                  0);

          v50 = *(void **)(a1 + 64);
          v51 = MEMORY[0x1E0C809B0];
          v75[0] = MEMORY[0x1E0C809B0];
          v75[1] = 3221225472;
          v75[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_221;
          v75[3] = &unk_1E6CF7398;
          v52 = *(void **)(a1 + 40);
          v76 = *(_QWORD *)(a1 + 32);
          v53 = v76;
          v77 = v52;
          v78 = v49;
          v82 = *(id *)(a1 + 72);
          v79 = v70;
          v80 = v18;
          v13 = v68;
          v81 = v13;
          v54 = v18;
          v55 = v49;
          v56 = v50;
          v57 = v75;
          if (v53)
          {
            WeakRetained = objc_loadWeakRetained((id *)(v53 + 8));
            objc_msgSend(WeakRetained, "cloudSyncManager");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "sharedSummaryManager");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v90 = v51;
            *(_QWORD *)&v90[8] = 3221225472;
            *(_QWORD *)&v90[16] = __137__HDSummarySharingEntryIDSManager__setupSharingWithOutgoingCodableSummarySharingEntry_sharingAuthorizations_localAccountInfo_completion___block_invoke;
            v91 = &unk_1E6CF7578;
            v93 = v57;
            v92 = v55;
            v61 = (id)objc_msgSend(v60, "setupSharingWithOutgoingSummarySharingEntry:sharingAuthorizations:completion:", v92, v56, v90);

          }
          v5 = v70;
          v6 = v69;
          v25 = v74;
LABEL_56:

          goto LABEL_57;
        }
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 80), CFSTR("Unable to create email address or phone number from identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        HKLogSharing();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v63 = *(_QWORD *)(a1 + 32);
          v64 = *(void **)(a1 + 40);
          *(_DWORD *)v90 = 138543875;
          *(_QWORD *)&v90[4] = v63;
          *(_WORD *)&v90[12] = 2114;
          *(_QWORD *)&v90[14] = v25;
          *(_WORD *)&v90[22] = 2113;
          v91 = v64;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error %{public}@ creating destination from identifier %{private}@", v90, 0x20u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
        v13 = 0;
        goto LABEL_56;
      }
    }

    goto LABEL_20;
  }
  _HKInitializeLogging();
  HKLogSharing();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v62 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v90 = 138543618;
    *(_QWORD *)&v90[4] = v62;
    *(_WORD *)&v90[12] = 2114;
    *(_QWORD *)&v90[14] = v6;
    _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error fetching cloudkit email address %{public}@", v90, 0x16u);
  }

  objc_msgSend(v6, "hd_cloudKitErrorRequiringUserAction");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = v13;
  else
    v14 = v6;
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0, v14);
LABEL_57:

}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_221(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(*(id *)(a1 + 56), "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrimaryContactIdentifier:", v11);

    objc_msgSend(v10, "setAllContactIdentifiers:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v10, "setFirstName:", 0);
    objc_msgSend(v10, "setLastName:", 0);
    _HKInitializeLogging();
    HKLogSharing();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543619;
      v37 = v13;
      v38 = 2113;
      v39 = v14;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sending sharing invitation to identifier %{private}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_223;
    v26[3] = &unk_1E6CF7370;
    v16 = *(_QWORD *)(a1 + 32);
    v27 = v10;
    v28 = v16;
    v17 = *(_QWORD *)(a1 + 72);
    v32 = *(id *)(a1 + 80);
    v29 = v7;
    v30 = v8;
    v31 = *(id *)(a1 + 40);
    v18 = v10;
    objc_msgSend(v15, "sendInvitationToIdentifier:expirationDate:codableObject:serverAcknowledgedBlock:", v17, 0, v18, v26);

    v19 = v27;
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      v37 = v24;
      v38 = 2114;
      v39 = v9;
      v40 = 2113;
      v41 = v25;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error %{public}@ received nil pairing info for identifier %{private}@", buf, 0x20u);
    }

    objc_msgSend(v9, "hd_cloudKitErrorRequiringUserAction");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setStatus:", 4);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(NSObject **)(v21 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_222;
    block[3] = &unk_1E6CE7FB8;
    block[4] = v21;
    v34 = *(id *)(a1 + 48);
    v35 = *(id *)(a1 + 40);
    dispatch_sync(v22, block);
    if (v18)
      v23 = v18;
    else
      v23 = v9;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), 0, v23);

    v19 = v34;
  }

}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_222(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v13 = 0;
  v4 = -[HDSummarySharingEntryIDSManager _queue_insertOrReplaceCodableEntry:ignoreIfExists:shouldResolveCNContact:error:](v2, v3, 0, 0, (uint64_t)&v13);
  v5 = v13;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = a1 + 40;
      v8 = *(void **)(a1 + 40);
      v9 = *(_QWORD *)(v10 + 8);
      v11 = v6;
      objc_msgSend(v8, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544131;
      v15 = v7;
      v16 = 2113;
      v17 = v9;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error inserting revoked invitation with contact identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

    }
  }

}

- (uint64_t)_queue_insertOrReplaceCodableEntry:(uint64_t)a3 ignoreIfExists:(uint64_t)a4 shouldResolveCNContact:(uint64_t)a5 error:
{
  NSObject *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = *(NSObject **)(a1 + 16);
  v10 = a2;
  dispatch_assert_queue_V2(v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "sharingEntryManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v12, "insertOrReplaceCodableEntries:ignoreIfExists:shouldResolveCNContact:syncProvenance:error:", v13, a3, a4, 0, a5);
  return v14;
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(a1 + 48);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_3;
    block[3] = &unk_1E6CF7410;
    v22 = v8;
    v23 = v5;
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v24 = v10;
    v25 = v11;
    v26 = *(id *)(a1 + 64);
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 72);
    dispatch_sync(v9, block);

  }
  else
  {
    v12 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 4);
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "cloudSyncManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sharedSummaryManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2;
    v29[3] = &unk_1E6CECC08;
    v18 = *(id *)(a1 + 72);
    v30 = v12;
    v31 = v18;
    v19 = v12;
    v20 = (id)objc_msgSend(v16, "revokeParticipantWithOutgoingSummarySharingEntry:completion:", v17, v29);

  }
}

uint64_t __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _BYTE buf[24];
  void *v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setInvitationUUID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setCloudKitIdentifier:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 32);
  v32 = 0;
  LOBYTE(v3) = -[HDSummarySharingEntryIDSManager _queue_insertOrReplaceCodableEntry:ignoreIfExists:shouldResolveCNContact:error:](v4, v5, 0, 1, (uint64_t)&v32);
  v6 = v32;
  if ((v3 & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7 && !_HDIsUnitTesting)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 8));
      objc_msgSend(WeakRetained, "cloudSyncManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sharedSummaryManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __56__HDSummarySharingEntryIDSManager__attemptPushSummaries__block_invoke;
      v34 = &unk_1E6CE77C8;
      v35[0] = v7;
      v11 = (id)objc_msgSend(v10, "push:", buf);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 64);
      v24 = *(void **)(a1 + 40);
      v25 = v12;
      objc_msgSend(v24, "uniqueID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544131;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      v34 = v26;
      LOWORD(v35[0]) = 2114;
      *(_QWORD *)((char *)v35 + 2) = v6;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error inserting invitation with contact identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 56), "invitationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_225;
    v30[3] = &unk_1E6CEB718;
    v30[4] = *(_QWORD *)(a1 + 56);
    v31 = *(id *)(a1 + 40);
    objc_msgSend(v13, "rescindInvitationWithUUID:serverAcknowledgedBlock:", v14, v30);

    objc_msgSend(*(id *)(a1 + 72), "setStatus:", 4);
    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      v17 = objc_loadWeakRetained((id *)(v16 + 8));
    else
      v17 = 0;
    objc_msgSend(v17, "cloudSyncManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sharedSummaryManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_226;
    v27[3] = &unk_1E6CECC08;
    v20 = *(_QWORD *)(a1 + 72);
    v29 = *(id *)(a1 + 80);
    v28 = v6;
    v21 = (id)objc_msgSend(v19, "revokeParticipantWithOutgoingSummarySharingEntry:completion:", v20, v27);

  }
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_225(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v9 = v6;
      objc_msgSend(v7, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error attempting to rescinding invitation with UUID %{public}@. %{public}@", (uint8_t *)&v11, 0x20u);

    }
  }

}

uint64_t __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)acceptInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD aBlock[5];
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, CFSTR("accept"), a4);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = self;
    v55 = 2114;
    v56 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Accepting invitation with UUID %{public}@", buf, 0x16u);

  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "sharingEntryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  objc_msgSend(v11, "codableEntryWithUUID:errorOut:", v6, &v52);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v52;

  if (v12)
  {
    if (objc_msgSend(v12, "status"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1600, CFSTR("We found an entry in the database but it has the wrong status."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      HKLogSharing();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "status");
        HKStringForSharingStatus();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryContactIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v54 = self;
        v55 = 2114;
        v56 = v34;
        v57 = 2113;
        v58 = v35;
        v59 = 2114;
        v60 = v36;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);

      }
      _HKInitializeLogging();
      HKLogSharing();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "sharingEntry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v54 = self;
        v55 = 2113;
        v56 = v17;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v14);

    }
    else
    {
      objc_msgSend(v12, "sharingSetupMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v13;
      +[HDCloudSyncShareSetupMetadata cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:error:](HDCloudSyncShareSetupMetadata, "cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:error:", v19, &v51);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v51;

      if (v20)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke;
        aBlock[3] = &unk_1E6CF73E8;
        aBlock[4] = self;
        v22 = v12;
        v49 = v22;
        v23 = v7;
        v50 = v23;
        v40 = _Block_copy(aBlock);
        objc_msgSend(v20, "shareURLs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25)
        {
          v47 = v21;
          -[HDSummarySharingEntryIDSManager _profileForEntry:errorOut:]((uint64_t)self, v22, (uint64_t)&v47);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v47;

          if (v26)
          {
            objc_msgSend(v26, "cloudSyncManager");
            v39 = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_238;
            v41[3] = &unk_1E6CF7488;
            v41[4] = self;
            v29 = v26;
            v42 = v29;
            v30 = v40;
            v45 = v40;
            v43 = v20;
            v46 = v23;
            v44 = v22;
            objc_msgSend(v28, "acceptShare:completion:", v43, v41);

            v21 = v39;
          }
          else
          {
            _HKInitializeLogging();
            HKLogSharing();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v54 = self;
              v55 = 2114;
              v56 = v27;
              _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Unable to create profile. %{public}@", buf, 0x16u);
            }

            (*((void (**)(id, _QWORD, id))v23 + 2))(v23, 0, v27);
            v29 = 0;
            v21 = v27;
            v30 = v40;
          }
        }
        else
        {
          _HKInitializeLogging();
          HKLogSharing();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "UUIDString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = self;
            v55 = 2114;
            v56 = v38;
            _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: No share URLs found on invitation with UUID %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 710, CFSTR("Share setup metadata does not contain any share URLs"));
          v29 = (id)objc_claimAutoreleasedReturnValue();
          v30 = v40;
          (*((void (**)(void *, id))v40 + 2))(v40, v29);
        }

      }
      else
      {
        _HKInitializeLogging();
        HKLogSharing();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "sharingSetupMetadata");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v54 = self;
          v55 = 2113;
          v56 = v37;
          v57 = 2114;
          v58 = v21;
          _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to decode codable sharing setup metadata %{private}@: %{public}@", buf, 0x20u);

        }
        ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v21);
      }

      v13 = v21;
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v54 = self;
      v55 = 2114;
      v56 = v13;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
  }

}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_2;
  block[3] = &unk_1E6CE7E08;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_sync(v6, block);

}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hk_isHealthKitErrorWithCode:", 710))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(*(id *)(a1 + 48), "invitationUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);
    v18 = 0;
    if (v2)
    {
      v6 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v5, 2, 0, 0, (uint64_t)&v18);
      v7 = v18;
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
    v8 = v7;

    if ((v6 & 1) != 0)
    {
      v9 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 707, CFSTR("The share participant was not found. Invitation has been declined"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
    else
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        v12 = *(void **)(a1 + 48);
        v14 = v11;
        objc_msgSend(v12, "primaryContactIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544131;
        v20 = v13;
        v21 = 2113;
        v22 = v15;
        v23 = 2114;
        v24 = v16;
        v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating declined invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 32));
  }
}

- (id)_profileForEntry:(uint64_t)a3 errorOut:
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

    objc_msgSend(v8, "profileIdentifierForUUID:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v8, "profileForIdentifier:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", v11, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstName");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastName");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (!v15)
      {
        if (v16)
        {
          v15 = &stru_1E6D11BB8;
        }
        else
        {
          objc_msgSend(v5, "primaryContactIdentifier");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_msgSend(v8, "createProfileForIdentifier:firstName:lastName:error:", v13, v15, v17, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_238(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudSyncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_239;
    v23[3] = &unk_1E6CF7460;
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v8;
    v27 = *(id *)(a1 + 72);
    v25 = *(id *)(a1 + 56);
    v26 = v5;
    objc_msgSend(v7, "configureForShareSetupMetadata:acceptedShares:completion:", v9, v26, v23);

  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2114;
      v32 = v6;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Accepted CKShares are nil. %{public}@", buf, 0x16u);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v28 = 0;
    v13 = -[HDSummarySharingEntryIDSManager _deleteProfile:errorOut:](v11, v12, (uint64_t)&v28);
    v14 = v28;
    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogSharing();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "profileIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v19;
        v31 = 2114;
        v32 = v22;
        v33 = 2114;
        v34 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete shared profile with identifier %{public}@. %{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(v6, "hd_cloudKitErrorRequiringUserAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = v16;
    else
      v17 = v6;
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v17);

  }
}

- (uint64_t)_deleteProfile:(uint64_t)a3 errorOut:
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (result)
  {
    v4 = (id *)(result + 8);
    v5 = a2;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "profileIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "deleteProfile:error:", v9, a3);
    return v10;
  }
  return result;
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_239(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogSharing();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      objc_msgSend(a1[6], "primaryContactIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v38 = v8;
      v39 = 2113;
      v40 = v9;
      v41 = 2114;
      v42 = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sending accepted sharing invitation to identifier %{private}@ and UUID %{public}@", buf, 0x20u);

    }
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(a1[6], "invitationUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(a1[6], "setDateAccepted:");
    objc_msgSend(a1[4], "invitationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[6];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_240;
    v29[3] = &unk_1E6CF7438;
    v29[4] = a1[4];
    v30 = v16;
    v31 = v13;
    v32 = v14;
    v33 = a1[7];
    v35 = a1[8];
    v34 = a1[5];
    v17 = v14;
    v18 = v13;
    objc_msgSend(v15, "acceptInvitationWithUUID:codableObject:serverAcknowledgedBlock:", v18, v30, v29);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v24 = a1[4];
      *(_DWORD *)buf = 138543618;
      v38 = v24;
      v39 = 2114;
      v40 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to configure share setup metadata. %{public}@", buf, 0x16u);
    }

    v19 = (uint64_t)a1[4];
    v20 = a1[5];
    v36 = 0;
    v21 = -[HDSummarySharingEntryIDSManager _deleteProfile:errorOut:](v19, v20, (uint64_t)&v36);
    v18 = v36;
    if ((v21 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogSharing();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v25 = a1[4];
        objc_msgSend(a1[5], "profileIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v25;
        v39 = 2114;
        v40 = v28;
        v41 = 2114;
        v42 = v18;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete shared profile with identifier %{public}@. %{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      v23 = v17;
    else
      v23 = v5;
    (*((void (**)(id, _QWORD, id))a1[8] + 2))(a1[8], 0, v23);
  }

}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_240(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v11 = v6;
      objc_msgSend(v9, "primaryContactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544131;
      v22 = v10;
      v23 = 2113;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v27 = 2114;
      v28 = v5;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error accepting invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_241;
  block[3] = &unk_1E6CF7410;
  block[4] = v7;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 72);
  dispatch_sync(v8, block);

}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_241(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void (*v13)(void);
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  LOBYTE(v3) = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v3, 1, v4, v6, (uint64_t)&v22);
  v7 = v22;

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 72), "cloudSyncManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_242;
    v21[3] = &unk_1E6CE77C8;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "subscribeToDataAvailableNotificationsWithCompletion:", v21);

    objc_msgSend(*(id *)(a1 + 72), "cloudSyncManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sharedSummaryManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_243;
    v20[3] = &unk_1E6CE77C8;
    v20[4] = *(_QWORD *)(a1 + 32);
    v12 = (id)objc_msgSend(v11, "pull:", v20);

    -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 64);
      v17 = v14;
      objc_msgSend(v16, "primaryContactIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544131;
      v24 = v15;
      v25 = 2113;
      v26 = v18;
      v27 = 2114;
      v28 = v19;
      v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating accepted invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
  }
  v13();

}

- (uint64_t)_queue_updateEntryWithInvitationUUID:(uint64_t)a3 newStatus:(void *)a4 dateAccepted:(void *)a5 ownerParticipant:(uint64_t)a6 error:
{
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;

  if (result)
  {
    v10 = result;
    v11 = *(NSObject **)(result + 16);
    v12 = a5;
    v13 = a4;
    v14 = a2;
    dispatch_assert_queue_V2(v11);
    WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
    objc_msgSend(WeakRetained, "sharingEntryManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:", v14, a3, v13, v12, a6);

    return v17;
  }
  return result;
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_242(uint64_t a1, char a2, void *a3)
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
    HKLogSharing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to subscribe to data available after accepting share. %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_243(uint64_t a1, char a2, void *a3)
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
    HKLogSharing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to pull summaries after accepting share. %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)_attemptBestEffortCloudSynchronization
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (a1)
  {
    if (!_HDIsUnitTesting)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "cloudSyncManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sharedSummaryManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __73__HDSummarySharingEntryIDSManager__attemptBestEffortCloudSynchronization__block_invoke;
      v6[3] = &unk_1E6CE77C8;
      v6[4] = a1;
      v5 = (id)objc_msgSend(v4, "synchronizeWithCompletion:", v6);

    }
  }
}

- (void)declineInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, CFSTR("decline"), a4);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = self;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Declining invitation with UUID %{public}@", buf, 0x16u);

  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "sharingEntryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v11, "codableEntryWithUUID:errorOut:", v6, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;

  if (v12)
  {
    if (objc_msgSend(v12, "status"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1600, CFSTR("We found an entry in the database but it has the wrong status."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      HKLogSharing();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "status");
        HKStringForSharingStatus();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryContactIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v33 = self;
        v34 = 2114;
        v35 = v24;
        v36 = 2113;
        v37 = v25;
        v38 = 2114;
        v39 = v26;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);

      }
      _HKInitializeLogging();
      HKLogSharing();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "sharingEntry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v33 = self;
        v34 = 2113;
        v35 = v17;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v14);

    }
    else
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v12, "invitationUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithUUIDString:", v20);

      -[HDSummarySharingEntryIDSManager invitationManager](self, "invitationManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke;
      v27[3] = &unk_1E6CEFB70;
      v30 = v7;
      v27[4] = self;
      v28 = v21;
      v29 = v12;
      v23 = v21;
      objc_msgSend(v22, "declineInvitationWithUUID:serverAcknowledgedBlock:", v23, v27);

    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v13;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
  }

}

void __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  if ((a2 & 1) != 0
    || objc_msgSend(v8, "code") == 3
    || (objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 118) & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke_2;
    block[3] = &unk_1E6CF74B0;
    block[4] = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    v12 = v8;
    v13 = *(id *)(a1 + 56);
    dispatch_sync(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v14 = 0;
  if (v2)
  {
    v4 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v3, 2, 0, 0, (uint64_t)&v14);
    v5 = v14;
    if ((v4 & 1) != 0)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      goto LABEL_8;
    }
  }
  else
  {
    v5 = 0;
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 48);
    v10 = v7;
    objc_msgSend(v9, "primaryContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544131;
    v16 = v8;
    v17 = 2113;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating declined invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

  }
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_8:
  v6();

}

- (void)revokeInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  id v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, CFSTR("revoke"), a4);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = self;
    v58 = 2114;
    v59 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Revoking invitation with UUID %{public}@", buf, 0x16u);

  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "sharingEntryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v11, "codableEntryWithUUID:errorOut:", v6, &v55);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v55;

  if (v12)
  {
    if (objc_msgSend(v12, "status") == 1 || !objc_msgSend(v12, "status"))
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v12, "invitationUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);

      v21 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke;
      aBlock[3] = &unk_1E6CF7500;
      aBlock[4] = self;
      v41 = v6;
      v50 = v6;
      v22 = v20;
      v51 = v22;
      v23 = v12;
      v52 = v23;
      v42 = v13;
      v53 = v13;
      v24 = v7;
      v54 = v24;
      v25 = _Block_copy(aBlock);
      v26 = (void *)objc_msgSend(v23, "copy");
      if (objc_msgSend(v23, "status") == 1)
        v27 = 4;
      else
        v27 = 3;
      objc_msgSend(v26, "setStatus:", v27, v12);
      v40 = v7;
      v28 = v21;
      if (self)
        v29 = objc_loadWeakRetained((id *)&self->_profile);
      else
        v29 = 0;
      objc_msgSend(v29, "cloudSyncManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sharedSummaryManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v28;
      v44[1] = 3221225472;
      v44[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_246;
      v44[3] = &unk_1E6CF7550;
      v44[4] = self;
      v45 = v23;
      v46 = v22;
      v47 = v24;
      v48 = v25;
      v32 = v25;
      v33 = v22;
      v34 = (id)objc_msgSend(v31, "revokeParticipantWithOutgoingSummarySharingEntry:completion:", v26, v44);

      v7 = v40;
      v6 = v41;
      v13 = v42;
      v12 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1600, CFSTR("We found an entry in the database but it has the wrong status."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      HKLogSharing();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "status");
        HKStringForSharingStatus();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryContactIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v43 = v13;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v57 = self;
        v58 = 2114;
        v59 = v36;
        v60 = 2113;
        v61 = v37;
        v62 = 2114;
        v63 = v38;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);

        v13 = v43;
      }

      _HKInitializeLogging();
      HKLogSharing();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "sharingEntry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v57 = self;
        v58 = 2113;
        v59 = v17;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v14);

    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v57 = self;
      v58 = 2114;
      v59 = v13;
      _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
  }

}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_2;
  block[3] = &unk_1E6CF74D8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[1] = 3221225472;
  block[4] = v4;
  v8 = v5;
  v13 = a2;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 72);
  dispatch_sync(v6, block);

}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void (*v11)(void);
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogSharing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringForSharingStatus();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v3;
    v22 = 2114;
    v23 = v4;
    v24 = 2114;
    v25 = v5;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating invitation with UUID %{public}@ to %{public}@.", buf, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 80);
  v19 = 0;
  if (v6)
  {
    v9 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v6, v7, v8, 0, 0, (uint64_t)&v19);
    v10 = v19;
    if ((v9 & 1) != 0)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
      goto LABEL_10;
    }
  }
  else
  {
    v10 = 0;
  }
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v12;
    HKStringForSharingStatus();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "primaryContactIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544387;
    v21 = v13;
    v22 = 2114;
    v23 = v15;
    v24 = 2113;
    v25 = v16;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating %{public}@ invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x34u);

  }
  v11 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_10:
  v11();

}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_246(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invitationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_247;
    v13[3] = &unk_1E6CF7528;
    v7 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v6, "rescindInvitationWithUUID:serverAcknowledgedBlock:", v7, v13);

    v8 = v15;
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "primaryContactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v18 = v11;
      v19 = 2113;
      v20 = v5;
      v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error removing participant with identifier %{private}@: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v10 = v8;
    else
      v10 = v5;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v10);
  }

}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_247(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if ((a2 & 1) != 0
    || objc_msgSend(v5, "code") == 3
    || (v7 = objc_msgSend(v9, "hk_isHealthKitErrorWithCode:", 118), v6 = v9, (v7 & 1) != 0))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "status", v6) == 1)
      v8 = 4;
    else
      v8 = 3;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)leaveInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  id v32;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, CFSTR("leave"), a4);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = self;
    v35 = 2114;
    v36 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Leaving invitation with UUID %{public}@", buf, 0x16u);

  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "sharingEntryManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v11, "codableEntryWithUUID:errorOut:", v6, &v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v32;

  if (v12)
  {
    if (objc_msgSend(v12, "status") == 1)
    {
      v31 = v13;
      -[HDSummarySharingEntryIDSManager _profileForEntry:errorOut:]((uint64_t)self, v12, (uint64_t)&v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v31;

      if (v14)
      {
        objc_msgSend(v14, "cloudSyncManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke;
        v27[3] = &unk_1E6CE7818;
        v27[4] = self;
        v28 = v12;
        v30 = v7;
        v29 = v14;
        v17 = (id)objc_msgSend(v16, "leaveSharesWithCompletion:", v27);

      }
      else
      {
        _HKInitializeLogging();
        HKLogSharing();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v34 = self;
          v35 = 2114;
          v36 = v15;
          _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Unable to create profile. %{public}@", buf, 0x16u);
        }

        ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v15);
      }

      v13 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1600, CFSTR("We found an entry in the database but it has the wrong status."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      HKLogSharing();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "status");
        HKStringForSharingStatus();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "primaryContactIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v34 = self;
        v35 = 2114;
        v36 = v24;
        v37 = 2113;
        v38 = v25;
        v39 = 2114;
        v40 = v26;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);

      }
      _HKInitializeLogging();
      HKLogSharing();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "sharingEntry");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v34 = self;
        v35 = 2113;
        v36 = v22;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v19);

    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = self;
      v35 = 2114;
      v36 = v13;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
  }

}

void __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(v6 + 16);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke_248;
    v14[3] = &unk_1E6CED498;
    v14[4] = v6;
    v15 = v7;
    v17 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 48);
    dispatch_sync(v8, v14);

  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "primaryContactIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v19 = v12;
      v20 = 2114;
      v21 = v5;
      v22 = 2113;
      v23 = v13;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error %{public}@ unable to leave sharing with identifier %{private}@", buf, 0x20u);

    }
    objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v10;
    else
      v11 = v5;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v11);

  }
}

void __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke_248(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 40), "invitationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);
  v25 = 0;
  if (v2)
  {
    v6 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v5, 2, 0, 0, (uint64_t)&v25);
    v7 = v25;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = v7;

  if ((v6 & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 48);
    v24 = 0;
    v11 = -[HDSummarySharingEntryIDSManager _deleteProfile:errorOut:](v9, v10, (uint64_t)&v24);
    v12 = v24;
    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogSharing();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "profileIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v20;
        v28 = 2114;
        v29 = v23;
        v30 = 2114;
        v31 = v12;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete shared profile with identifier %{public}@. %{public}@", buf, 0x20u);

      }
    }
    -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v17 = v14;
      objc_msgSend(v15, "primaryContactIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544131;
      v27 = v16;
      v28 = 2113;
      v29 = v18;
      v30 = 2114;
      v31 = v19;
      v32 = 2114;
      v33 = v8;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Error updating entry with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __137__HDSummarySharingEntryIDSManager__setupSharingWithOutgoingCodableSummarySharingEntry_sharingAuthorizations_localAccountInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v11 = 0;
    objc_msgSend(a2, "codableSharingSetupMetadataWithError:", &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "setSharingSetupMetadata:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __73__HDSummarySharingEntryIDSManager__attemptBestEffortCloudSynchronization__block_invoke(uint64_t a1, char a2, void *a3)
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
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to synchronize with error %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void __56__HDSummarySharingEntryIDSManager__attemptPushSummaries__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Pushed summaries succeeded after invite completion", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to push summaries after invite completion with error %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

void __73__HDSummarySharingEntryIDSManager__finishHandlerForOperation_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "hd_errorForAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyticsSubmissionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "summarySharing_reportSetupOperation:success:error:", a1[5], a2, v6);

  if ((a2 & 1) == 0)
  {
    v10 = a1[4];
    v11 = v6;
    v12 = v11;
    if (v10 && objc_msgSend(v11, "hk_isHealthKitError"))
    {
      if (objc_msgSend(v12, "code") == 3)
      {

      }
      else
      {
        v13 = objc_msgSend(v12, "code");

        if (v13 != 1600)
          goto LABEL_11;
      }
      _HKInitializeLogging();
      HKLogSharing();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = a1[4];
        v19 = a1[5];
        v20 = 138543874;
        v21 = v18;
        v22 = 2114;
        v23 = v19;
        v24 = 2114;
        v25 = v12;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Setup operation %{public}@ failed with error %{public}@", (uint8_t *)&v20, 0x20u);
      }

      v15 = objc_loadWeakRetained((id *)(a1[4] + 8));
      objc_msgSend(v15, "daemon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "autoBugCaptureReporter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reportSummarySharingInvitationFailureForOperation:error:", a1[5], v12);

    }
    else
    {

    }
  }
LABEL_11:
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)invitationManager:(id)a3 didReceiveInvitation:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  HDSummarySharingEntryIDSManager *v18;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "codableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v10;
    v25 = 2113;
    v26 = v11;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HDSummarySharingEntryIDSManager_invitationManager_didReceiveInvitation___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  v16 = v6;
  v17 = v5;
  v18 = self;
  v13 = v5;
  v14 = v6;
  dispatch_sync(queue, block);

}

void __74__HDSummarySharingEntryIDSManager_invitationManager_didReceiveInvitation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  HDCodableSummarySharingEntry *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HDCodableSummarySharingEntry *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "sharingAuthorizationsCount");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "sharingAuthorizations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HDSharingAuthorizationsFromCodableSharingAuthorizations(v4);
  }
  else
  {
    objc_msgSend(v3, "authorizationCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_256_0);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HDCodableSummarySharingEntry alloc];
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fromID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allContactIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (int)objc_msgSend(*(id *)(a1 + 32), "userWheelchairMode");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sharingSetupMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:](v5, "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v8, v9, 0, v10, v11, 0, 0, v26, v12, 0, 1, 0, 0, 0, v13,
          0,
          v14,
          0);

  objc_msgSend(MEMORY[0x1E0C97298], "hd_contactStoreWithHealthAppIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDCNContactForCodableEntry(v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "givenName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSummarySharingEntry setFirstName:](v15, "setFirstName:", v19);

    objc_msgSend(v18, "familyName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSummarySharingEntry setLastName:](v15, "setLastName:", v20);

  }
  v21 = *(_QWORD *)(a1 + 48);
  v27 = 0;
  v22 = -[HDSummarySharingEntryIDSManager _queue_insertOrReplaceCodableEntry:ignoreIfExists:shouldResolveCNContact:error:](v21, v15, 1, 1, (uint64_t)&v27);
  v23 = v27;
  if ((v22 & 1) == 0)
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      v30 = 2114;
      v31 = v23;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing invitation received but failed to insert HDCodableSummarySharingEntry with error %{public}@", buf, 0x16u);
    }
  }
  -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 48));

}

id __74__HDSummarySharingEntryIDSManager_invitationManager_didReceiveInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB6B90];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithAuthorizationIdentifier:", v3);

  return v4;
}

- (void)invitationManager:(id)a3 didRescindInvitation:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "codableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2113;
    v25 = v11;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received rescind invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HDSummarySharingEntryIDSManager_invitationManager_didRescindInvitation___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v16 = v5;
  v17 = v6;
  v13 = v6;
  v14 = v5;
  dispatch_sync(queue, block);

}

void __74__HDSummarySharingEntryIDSManager_invitationManager_didRescindInvitation___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v14 = 0;
  if (v2)
  {
    v5 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:]((uint64_t)v2, v3, 3, 0, 0, (uint64_t)&v14);
    v2 = v14;

    if ((v5 & 1) != 0)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
      goto LABEL_7;
    }
  }
  else
  {

  }
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 48);
    v9 = v6;
    objc_msgSend(v8, "primaryContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v16 = v7;
    v17 = 2113;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v2;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entry rescind received but failed to update database for identifier %{private}@, UUID %{public}@ and invitation UUID %{public}@ with error %{public}@", buf, 0x34u);

  }
LABEL_7:

}

- (void)invitationManager:(id)a3 didAcceptInvitation:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "codableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2113;
    v25 = v11;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received accept invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HDSummarySharingEntryIDSManager_invitationManager_didAcceptInvitation___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v16 = v5;
  v17 = v6;
  v13 = v6;
  v14 = v5;
  dispatch_sync(queue, block);

}

void __73__HDSummarySharingEntryIDSManager_invitationManager_didAcceptInvitation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 48), "dateAccepted");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v3, 1, v5, 0, (uint64_t)&v16);
  v7 = v16;

  if ((v6 & 1) != 0)
  {
    -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 48);
      v11 = v8;
      objc_msgSend(v10, "primaryContactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v18 = v9;
      v19 = 2113;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v15;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entry accepted received but failed to update database for identifier %{private}@, UUID %{public}@ and invitation UUID %{public}@ with error %{public}@", buf, 0x34u);

    }
  }

}

- (void)invitationManager:(id)a3 didDeclineInvitation:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  HDSummarySharingEntryIDSManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "codableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogSharing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2113;
    v25 = v11;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received decline invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HDSummarySharingEntryIDSManager_invitationManager_didDeclineInvitation___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v16 = v5;
  v17 = v6;
  v13 = v6;
  v14 = v5;
  dispatch_sync(queue, block);

}

void __74__HDSummarySharingEntryIDSManager_invitationManager_didDeclineInvitation___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v14 = 0;
  if (v2)
  {
    v5 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:]((uint64_t)v2, v3, 2, 0, 0, (uint64_t)&v14);
    v2 = v14;

    if ((v5 & 1) != 0)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(_QWORD *)(a1 + 32));
      goto LABEL_7;
    }
  }
  else
  {

  }
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 48);
    v9 = v6;
    objc_msgSend(v8, "primaryContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v16 = v7;
    v17 = 2113;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v2;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entry declined received but failed to update database for identifier %{private}@, UUID %{public}@ and invitation UUID %{public}@ with error %{public}@", buf, 0x34u);

  }
LABEL_7:

}

- (HDIDSInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManager, a3);
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_reachabilityOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_reachabilityQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
