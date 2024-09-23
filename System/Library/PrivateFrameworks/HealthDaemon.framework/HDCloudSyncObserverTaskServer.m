@implementation HDCloudSyncObserverTaskServer

- (HDCloudSyncObserverTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDCloudSyncObserverTaskServer *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *progressTracker;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncObserverTaskServer;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v12, sel_initWithUUID_configuration_client_delegate_, a3, 0, a5, a6);
  if (v6)
  {
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_filter = 0;
    v6->_isObservingSyncRequests = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressTracker = v6->_progressTracker;
    v6->_progressTracker = v9;

  }
  return v6;
}

- (void)connectionInvalidated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HDStandardTaskServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudSyncCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[HDStandardTaskServer profile](self, "profile");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudSyncManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4A20];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;

  v5 = *MEMORY[0x1E0CB59B0];
  v6 = a3;
  LOBYTE(v5) = objc_msgSend(v6, "hasRequiredEntitlement:error:", v5, a4);
  LOBYTE(a4) = objc_msgSend(v6, "hasRequiredArrayEntitlement:containing:error:", *MEMORY[0x1E0CB59C0], *MEMORY[0x1E0CB4D90], a4);

  return v5 | a4;
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6400], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6400], "serverInterface");
}

- (void)remote_startObservingSyncStatusWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  NSObject *queue;
  void (**v7)(void);
  _QWORD block[5];
  id v9;
  void (**v10)(void);

  v7 = (void (**)(void))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudSyncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke;
    block[3] = &unk_1E6CEA160;
    block[4] = self;
    v9 = v5;
    v10 = v7;
    dispatch_sync(queue, block);

  }
  else
  {
    v7[2]();
  }

}

void __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  uint64_t v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6CE7868;
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  -[HDCloudSyncObserverTaskServer _queue_instantiateCloudSyncObserverStatus:](v4, v3);

}

void __79__HDCloudSyncObserverTaskServer_remote_startObservingSyncStatusWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__cloudKitIdentityUpdated_, *MEMORY[0x1E0C94870], 0);

  objc_msgSend(*(id *)(a1 + 40), "addObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 40));
      if (*(_BYTE *)(v6 + 64))
      {
        _HKInitializeLogging();
        v7 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v10 = v6;
          _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Observering sync status is YES. No need to inform client again.", buf, 0xCu);
        }
      }
      else
      {
        *(_BYTE *)(v6 + 64) = 1;
        -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](v6);
      }
    }
  }
  else
  {
    -[HDCloudSyncObserverTaskServer _queue_didFailToPopulateStatusWithError:](*(_QWORD *)(a1 + 32), v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_queue_didFailToPopulateStatusWithError:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 40);
    v4 = a2;
    dispatch_assert_queue_V2(v3);
    *(_BYTE *)(a1 + 64) = 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__HDCloudSyncObserverTaskServer__queue_didFailToPopulateStatusWithError___block_invoke;
    v6[3] = &unk_1E6CE8030;
    v6[4] = a1;
    objc_msgSend((id)a1, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientRemote_didFailToPopulateStatusWithError:", v4);

  }
}

- (void)_queue_instantiateCloudSyncObserverStatus:(uint64_t)a1
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  void (**v9)(id, uint64_t, _QWORD);

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(_QWORD *)(a1 + 48))
    {
      v3[2](v3, 1, 0);
    }
    else
    {
      objc_msgSend((id)a1, "profile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cloudSyncManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke;
      v7[3] = &unk_1E6CF1D98;
      v7[4] = a1;
      v8 = v5;
      v9 = v3;
      v6 = v5;
      objc_msgSend(v6, "accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:", v7);

    }
  }

}

- (id)remote_startSyncIfRestoreNotCompletedWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke;
  v16[3] = &unk_1E6CED470;
  v19 = v7;
  v16[4] = self;
  v17 = v6;
  v10 = v8;
  v18 = v10;
  v11 = v6;
  v12 = v7;
  dispatch_sync(queue, v16);
  v13 = v18;
  v14 = v10;

  return v14;
}

void __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke(uint64_t a1)
{
  dispatch_queue_t *v2;
  void **v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD v48[4];
  _BYTE buf[24];
  void *v50;
  uint64_t v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = (void **)(a1 + 32);
  v2 = *(dispatch_queue_t **)(a1 + 32);
  v40 = 0;
  v4 = -[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v2, &v40);
  v5 = v40;
  v6 = *v3;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudSyncCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAccountInManateeUnavailableCFUState");

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 706, CFSTR("Manatee container is unavailable, device is in CFU state"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithErrorRequiringUserAction:](*(_QWORD *)(a1 + 32), v12);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v5 = v12;
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 40);
        v18 = (void *)MEMORY[0x1E0C99D68];
        v19 = v15;
        objc_msgSend(v18, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromDate();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2114;
        v50 = v21;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: start syncIfRestoreNotCompleted: date (%{public}@)", buf, 0x20u);

      }
      v23 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_225;
      v38[3] = &unk_1E6CEFAD0;
      v39 = *(id *)(a1 + 56);
      v24 = v22;
      v37 = v38;
      if (v23)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v23 + 40));
        v48[0] = 0;
        v48[1] = v48;
        v48[2] = 0x2020000000;
        v48[3] = -1;
        objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc(MEMORY[0x1E0D29810]);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke;
        v50 = &unk_1E6CF1C30;
        v54 = v48;
        v51 = v23;
        v27 = v24;
        v52 = v27;
        v53 = v37;
        v28 = (void *)objc_msgSend(v26, "initWithDescription:completion:", CFSTR("Determine if sync is complete enough stop stop waiting"), buf);
        v29 = v24;
        v30 = *(_QWORD *)(v23 + 40);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_232;
        v44[3] = &unk_1E6CF1CF8;
        v44[4] = v23;
        v47 = v48;
        v45 = v27;
        v31 = v25;
        v46 = v31;
        v32 = v30;
        v24 = v29;
        objc_msgSend(v28, "addTaskOnQueue:task:", v32, v44);
        v33 = *(_QWORD *)(v23 + 40);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_241;
        v41[3] = &unk_1E6CF1D20;
        v43 = v48;
        v41[4] = v23;
        v34 = v31;
        v42 = v34;
        objc_msgSend(v28, "addTaskOnQueue:task:", v33, v41);
        objc_msgSend(v28, "begin");
        v35 = v42;
        v36 = v34;

        _Block_object_dispose(v48, 8);
      }
      else
      {
        v36 = 0;
      }

      objc_msgSend(*(id *)(a1 + 48), "addChild:withPendingUnitCount:", v36, 1);
    }
  }
  else
  {
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithSyncEnabled:]((uint64_t)v6, 0);
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "hk_sanitizedError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 4, v14);

  }
}

- (uint64_t)_queue_verifyCloudSyncEnabledWithError:(dispatch_queue_t *)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  dispatch_queue_t *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  dispatch_assert_queue_V2(a1[5]);
  -[dispatch_queue_t profile](a1, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudSyncCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "canPerformCloudSyncWithError:", &v12);
  v8 = v12;

  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = a1;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: syncIfRestoreNotCompleted triggered, but Health cloud sync is not enabled: %{public}@", buf, 0x16u);
    }
    v10 = v8;
    if (v10)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  return v7;
}

- (void)_queue_didUpdateSyncStatusWithSyncEnabled:(uint64_t)a1
{
  _QWORD v4[5];
  char v5;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithSyncEnabled___block_invoke;
    v4[3] = &unk_1E6CF1C08;
    v4[4] = a1;
    v5 = a2;
    -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:](a1, v4);
  }
}

- (void)_queue_didUpdateSyncStatusWithErrorRequiringUserAction:(uint64_t)a1
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __88__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithErrorRequiringUserAction___block_invoke;
    v4[3] = &unk_1E6CE8080;
    v4[4] = a1;
    v5 = v3;
    -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:](a1, v4);

  }
}

void __90__HDCloudSyncObserverTaskServer_remote_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_225(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)_queue_didUpdateSyncStatus
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(_BYTE *)(a1 + 64))
    {
      _HKInitializeLogging();
      v2 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v7 = a1;
        v8 = 2114;
        v9 = v3;
        _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client didUpdateObserverWithSyncStatus: with status: %{public}@", buf, 0x16u);
      }
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __59__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatus__block_invoke;
      v5[3] = &unk_1E6CE8030;
      v5[4] = a1;
      objc_msgSend((id)a1, "remoteObjectProxyWithErrorHandler:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientRemote_didUpdateObserverWithSyncStatus:", *(_QWORD *)(a1 + 48));

    }
  }
}

void __75__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithSyncEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "syncEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setSyncEnabled:", v3 != 0);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

- (void)_queue_updateSyncStatusWithBlock:(uint64_t)a1
{
  void (**v3)(_QWORD);
  _QWORD v4[5];
  void (**v5)(_QWORD);

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__HDCloudSyncObserverTaskServer__queue_updateSyncStatusWithBlock___block_invoke;
    v4[3] = &unk_1E6CED3F8;
    v4[4] = a1;
    v5 = v3;
    -[HDCloudSyncObserverTaskServer _queue_instantiateCloudSyncObserverStatus:](a1, v4);

  }
}

void __94__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithAccountSupportsSecureContainer___block_invoke(uint64_t a1)
{
  int v2;
  int v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "accountSupportsSecureContainer");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAccountSupportsSecureContainer:", v3 != 0);
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

void __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPushDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastPushDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLastPushDate:", *(_QWORD *)(a1 + 40));
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

void __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPullDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastPullDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLastPullDate:", *(_QWORD *)(a1 + 40));
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

void __80__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastLitePushDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastLitePushDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLastLitePushDate:", *(_QWORD *)(a1 + 40));
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

void __84__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPulledUpdateDate___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lastPulledUpdateDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4 || (v2 = objc_msgSend(*(id *)(a1 + 40), "hk_isAfterDate:", v4), v3 = (void *)v4, v2))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLastPulledUpdateDate:", *(_QWORD *)(a1 + 40));
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
    v3 = (void *)v4;
  }

}

void __83__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithRestoreCompleteDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "restoreCompletionDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setRestoreCompletionDate:", *(_QWORD *)(a1 + 40));
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

void __88__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithErrorRequiringUserAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "errorRequiringUserAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setErrorRequiringUserAction:", *(_QWORD *)(a1 + 40));
    -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus](*(_QWORD *)(a1 + 32));
  }
}

void __59__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client didUpdateObserverWithSyncStatus: with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_queue_syncDidStart
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  dispatch_queue_t *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)MEMORY[0x1E0C99D68];
      v4 = v2;
      objc_msgSend(v3, "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = a1;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client syncDidStart with date: (%{public}@", buf, 0x16u);

    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__HDCloudSyncObserverTaskServer__queue_syncDidStart__block_invoke;
    v8[3] = &unk_1E6CE8030;
    v8[4] = a1;
    -[dispatch_queue_t remoteObjectProxyWithErrorHandler:](a1, "remoteObjectProxyWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientRemote_syncDidStart");

  }
}

void __52__HDCloudSyncObserverTaskServer__queue_syncDidStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client syncDidStart with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __73__HDCloudSyncObserverTaskServer__queue_didFailToPopulateStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client didFailToPopulateStatusWithError with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  char v23;
  _BYTE block[24];
  void *v25;
  __int128 v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == -1 && !a3)
  {
    v9 = a1[4];
    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      v23 = 0;
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__51;
      v20[4] = __Block_byref_object_dispose__51;
      v21 = 0;
      v11 = *(NSObject **)(v9 + 40);
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __63__HDCloudSyncObserverTaskServer__persistRestoreCompletionDate___block_invoke;
      v25 = &unk_1E6CF1D48;
      *(_QWORD *)&v26 = v9;
      v27 = v22;
      v12 = v10;
      *((_QWORD *)&v26 + 1) = v12;
      v28 = v20;
      dispatch_sync(v11, block);

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(v22, 8);

    }
  }
  v13 = a1[4];
  v14 = *(void **)(v13 + 56);
  *(_QWORD *)(v13 + 56) = 0;

  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v16 = a1[4];
    v17 = a1[5];
    v18 = v15;
    _HKCloudSyncObserverStatusToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)block = 138544130;
    *(_QWORD *)&block[4] = v16;
    *(_WORD *)&block[12] = 2114;
    *(_QWORD *)&block[14] = v17;
    *(_WORD *)&block[22] = 2114;
    v25 = v19;
    LOWORD(v26) = 2114;
    *(_QWORD *)((char *)&v26 + 2) = v8;
    _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: taskTree complete: status (%{public}@), error (%{public}@)", block, 0x2Au);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t, id);
  dispatch_queue_t *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void (**v24)(id, uint64_t, id);
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  _QWORD aBlock[5];
  id v54;
  void (**v55)(id, uint64_t, id);
  _BYTE *v56;
  uint64_t v57;
  id v58;
  _BYTE v59[12];
  __int16 v60;
  uint64_t v61;
  _BYTE buf[24];
  char v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(dispatch_queue_t **)(a1 + 32);
  v58 = 0;
  if (v7)
  {
    dispatch_assert_queue_V2(v7[5]);
    if (-[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v7, &v58))
    {
      *(_QWORD *)v59 = 0;
      -[HDCloudSyncObserverTaskServer _readRestoreCompletionDateWithError:](v7, v59);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(id *)v59;
      v10 = v9;
      if (v8 || !v9)
      {
        if (v8)
        {
          _HKInitializeLogging();
          v12 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v7;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v8;
            _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync restore was already completed on %{public}@.", buf, 0x16u);
          }
          v11 = 2;
        }
        else
        {
          -[dispatch_queue_t profile](v7, "profile");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cloudSyncManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "status");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastSuccessfulPullDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
            v11 = 1;
          else
            v11 = 3;
        }
      }
      else
      {
        v11 = -1;
      }

    }
    else
    {
      v11 = 4;
    }
  }
  else
  {
    v11 = 0;
  }
  v18 = v58;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cloudSyncCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v11)
  {
    case 4:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 4;
      v6[2](v6, 1, v18);
      break;
    case 3:
      -[HDCloudSyncObserverTaskServer _queue_syncDidStart](*(dispatch_queue_t **)(a1 + 32));
      v6[2](v6, 0, 0);
      break;
    case 2:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
      v6[2](v6, 0, 0);
      break;
    default:
      if (v21)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v63 = 0;
        v22 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2;
        aBlock[3] = &unk_1E6CF1C80;
        v23 = *(void **)(a1 + 40);
        aBlock[4] = *(_QWORD *)(a1 + 32);
        v56 = buf;
        v54 = v23;
        v24 = v6;
        v25 = *(_QWORD *)(a1 + 56);
        v55 = v24;
        v57 = v25;
        v51[0] = v22;
        v51[1] = 3221225472;
        v51[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_233;
        v51[3] = &unk_1E6CE77F0;
        v26 = _Block_copy(aBlock);
        v52 = v26;
        objc_msgSend(v21, "addCloudSyncProgressCompletion:", v51);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(_QWORD *)(a1 + 32);
            v30 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)v59 = 138543618;
            *(_QWORD *)&v59[4] = v29;
            v60 = 2114;
            v61 = v30;
            _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: active sync in progress, observe it", v59, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB38A8], "hd_progressMirroringProgress:", v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _HKInitializeLogging();
          v32 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v33 = *(_QWORD *)(a1 + 32);
            v34 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)v59 = 138543618;
            *(_QWORD *)&v59[4] = v33;
            v60 = 2114;
            v61 = v34;
            _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: start a sync and observe it", v59, 0x16u);
          }
          objc_msgSend(v21, "prepareAllProfilesForPeriodicSyncAndRestore");
          v35 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, 0, 7, 0);
          objc_msgSend(v21, "syncAllProfilesWithContext:completion:", v35, v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)(a1 + 48), "addChild:withPendingUnitCount:", v31, 1);
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v37 = *(_QWORD *)(a1 + 32);
          v38 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)v59 = 138543618;
          *(_QWORD *)&v59[4] = v37;
          v60 = 2114;
          v61 = v38;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: call client startHandler", v59, 0x16u);
        }
        -[HDCloudSyncObserverTaskServer _queue_syncDidStart](*(dispatch_queue_t **)(a1 + 32));
        objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", *(_QWORD *)(a1 + 48), "fractionCompleted");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_237;
        v47[3] = &unk_1E6CF1CD0;
        v40 = *(void **)(a1 + 40);
        v47[4] = *(_QWORD *)(a1 + 32);
        v41 = v40;
        v42 = *(_QWORD *)(a1 + 56);
        v48 = v41;
        v50 = v42;
        v43 = v26;
        v49 = v43;
        objc_msgSend(v39, "addObserverBlock:", v47);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = *(_QWORD *)(a1 + 32);
        v46 = *(void **)(v45 + 56);
        *(_QWORD *)(v45 + 56) = v44;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -1;
        v6[2](v6, 3, 0);
      }
      break;
  }

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_3;
  block[3] = &unk_1E6CF1C58;
  v16 = *(_QWORD *)(a1 + 56);
  block[4] = v6;
  v18 = a2;
  v13 = v7;
  v14 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v15 = v9;
  v17 = v10;
  v11 = v5;
  dispatch_async(v8, block);

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v4;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: syncCompletion already called", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    *(_BYTE *)(v2 + 24) = 1;
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(unsigned __int8 *)(a1 + 80);
      v10 = *(_QWORD *)(a1 + 48);
      v13 = 138544130;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 1026;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: syncCompletion called: result (%{public}id), error (%{public}@)", (uint8_t *)&v13, 0x26u);
    }
    if (*(_BYTE *)(a1 + 80))
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_QWORD *)(v12 + 24) == -1)
        *(_QWORD *)(v12 + 24) = 0;
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v11();
  }
}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_233(uint64_t a1, char a2, void *a3)
{
  id v5;
  char v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if ((a2 & 1) != 0 || (v6 = objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 726), v7 = v8, (v6 & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v7 = v8;
  }

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_237(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  id v12;
  __int128 v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2_238;
  block[3] = &unk_1E6CF1CA8;
  block[1] = 3221225472;
  block[4] = v4;
  v11 = v5;
  v12 = v3;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v13 = v9;
  v8 = v3;
  dispatch_async(v6, block);

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_2_238(_QWORD *a1)
{
  dispatch_queue_t *v2;
  int v3;
  id v4;
  os_log_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (dispatch_queue_t *)a1[4];
  v19 = 0;
  if (v2)
  {
    dispatch_assert_queue_V2(v2[5]);
    if ((-[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v2, &v19) & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithSyncEnabled:]((uint64_t)v2, 0);
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = v19;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB5370];
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = (void *)a1[6];
    v10 = v6;
    objc_msgSend(v9, "doubleValue");
    v12 = v11;
    _HKCloudSyncObserverStatusToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    v24 = 2048;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v4;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: waitUUID %{public}@: observer block called: progress (%03.3f%%), status (%{public}@), error (%{public}@)", buf, 0x34u);

  }
  if (v3)
  {
    _HKInitializeLogging();
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[4];
      v16 = a1[5];
      v17 = v14;
      _HKCloudSyncObserverStatusToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v18;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: waitUUID %{public}@: stop observer: status (%{public}@), error (%{public}@)", buf, 0x2Au);

    }
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = 4;
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __90__HDCloudSyncObserverTaskServer__queue_startSyncIfRestoreNotCompletedWithUUID_completion___block_invoke_241(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v13 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != 2)
  {
    v5 = a1[4];
    if (v5)
    {
      v6 = (void *)a1[5];
      v7 = *(NSObject **)(v5 + 40);
      v8 = v6;
      v9 = a2;
      dispatch_assert_queue_V2(v7);
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addChild:withPendingUnitCount:", v10, 1);

      v11 = *(_QWORD *)(v5 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke;
      v14[3] = &unk_1E6CED9E8;
      v14[4] = v5;
      v15 = v10;
      v12 = v10;
      objc_msgSend(v9, "addTaskOnQueue:task:", v11, v14);

    }
  }
  (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);

}

- (id)_readRestoreCompletionDateWithError:(id)a1
{
  id v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v2 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudSyncManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "restoreCompletionDateWithError:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (!v6 && v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v2;
        v14 = 2114;
        v15 = v7;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read the cloud sync restore status: %{public}@.", buf, 0x16u);
      }
      v2 = 0;
      goto LABEL_15;
    }
    if (v7)
    {
      if (!a2)
      {
        _HKLogDroppedError();
        if (!v6)
        {
LABEL_11:
          _HKInitializeLogging();
          v9 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v13 = v2;
            _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Restore complete status not set.", buf, 0xCu);
          }
        }
LABEL_14:
        v2 = v6;
LABEL_15:

        return v2;
      }
      *a2 = objc_retainAutorelease(v7);
    }
    if (!v6)
      goto LABEL_11;
    goto LABEL_14;
  }
  return v2;
}

void __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke_2;
  v10[3] = &unk_1E6CE77F0;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "mergeCloudSyncJournalsWithCompletion:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", v9, 1);
}

uint64_t __84__HDCloudSyncObserverTaskServer__queue_mergeCloudSyncJournalsWithTaskTree_progress___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__HDCloudSyncObserverTaskServer__persistRestoreCompletionDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id obj;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 65))
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cloud sync restore was completed once successfully, we should not be restoring again.", buf, 0xCu);
    }
  }
  else
  {
    *(_BYTE *)(v2 + 65) = 1;
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudSyncManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v9 = objc_msgSend(v6, "persistRestoreCompletionDate:error:", v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;

  }
}

- (void)_cloudKitIdentityUpdated:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  HDCloudSyncObserverTaskServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received CKIdentityUpdateNotification", buf, 0xCu);
  }
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke;
  v7[3] = &unk_1E6CE77C8;
  v7[4] = self;
  objc_msgSend(v6, "accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:", v7);

}

void __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke_2;
  v4[3] = &unk_1E6CF1C08;
  v4[4] = v2;
  v5 = a2;
  dispatch_async(v3, v4);
}

void __58__HDCloudSyncObserverTaskServer__cloudKitIdentityUpdated___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  char v2;
  _QWORD v3[5];
  char v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_BYTE *)(a1 + 40);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __94__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithAccountSupportsSecureContainer___block_invoke;
    v3[3] = &unk_1E6CF1C08;
    v3[4] = v1;
    v4 = v2;
    -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:](v1, v3);
  }
}

void __66__HDCloudSyncObserverTaskServer__queue_updateSyncStatusWithBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  if ((a2 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    -[HDCloudSyncObserverTaskServer _queue_didFailToPopulateStatusWithError:](*(_QWORD *)(a1 + 32), v5);

}

void __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2;
  block[3] = &unk_1E6CEF010;
  v10 = v5;
  v11 = v6;
  v13 = *(id *)(a1 + 48);
  v14 = a2;
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  dispatch_async(v7, block);

}

void __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_queue_t *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v39 = *(void **)(a1 + 32);
      v38 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      v52 = 2114;
      v53 = v39;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read account D2D encryption availability with error %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CB6408]);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 48);
      *(_QWORD *)(v5 + 48) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    }
    objc_msgSend(v3, "setAccountSupportsSecureContainer:", *(unsigned __int8 *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 40), "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudSyncCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setAccountProhibitedForCloudSync:", objc_msgSend(v10, "primaryAccountIsProhibitedFromCloudSync"));

    v11 = *(dispatch_queue_t **)(a1 + 40);
    v47 = 0;
    v12 = -[HDCloudSyncObserverTaskServer _queue_verifyCloudSyncEnabledWithError:](v11, &v47);
    v13 = v47;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setSyncEnabled:", v12);
    if (v13)
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v40 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v51 = v40;
        v52 = 2114;
        v53 = v13;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to verify cloud sync enabled with error %{public}@", buf, 0x16u);
      }
    }
    v15 = *(void **)(a1 + 40);
    v46 = 0;
    -[HDCloudSyncObserverTaskServer _readRestoreCompletionDateWithError:](v15, &v46);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v46;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setRestoreCompletionDate:", v16);

    if (v17)
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v41 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v51 = v41;
        v52 = 2114;
        v53 = v17;
        _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read restore completion date with error %{public}@", buf, 0x16u);
      }
    }
    v19 = *(id *)(a1 + 40);
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 40), "profile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HDCloudSyncKeyValueDomainWithProfile(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = CFSTR("HDCloudSyncKeyErrorRequiringUserAction");
      v49 = 0;
      objc_msgSend(v21, "dataForKey:error:", v22, &v49);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v49;
      v25 = v24;
      if (v23)
      {
        v43 = v17;
        v26 = v13;
        v27 = (void *)MEMORY[0x1E0CB3710];
        v28 = objc_opt_class();
        v48 = 0;
        objc_msgSend(v27, "unarchivedObjectOfClass:fromData:error:", v28, v23, &v48);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v48;
        v31 = v30;
        if (v29 || !v30)
        {
          v19 = v29;
          v33 = 0;
        }
        else
        {
          _HKInitializeLogging();
          v32 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v51 = v19;
            v52 = 2114;
            v53 = v31;
            _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive cloud sync error requiring user action: %{public}@", buf, 0x16u);
          }
          v33 = objc_retainAutorelease(v31);
          v19 = 0;
        }

        v13 = v26;
        v17 = v43;
      }
      else
      {
        if (v24)
        {
          _HKInitializeLogging();
          v34 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v51 = v19;
            v52 = 2114;
            v53 = v25;
            _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read cloud sync error requiring user action: %{public}@", buf, 0x16u);
          }
        }
        v33 = 0;
        v19 = 0;
      }

    }
    else
    {
      v33 = 0;
    }
    v35 = v33;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setErrorRequiringUserAction:", v19);

    if (v35)
    {
      _HKInitializeLogging();
      v36 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v42 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v51 = v42;
        v52 = 2114;
        v53 = v35;
        _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read error requiring user action with error %{public}@", buf, 0x16u);
      }
    }
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_244;
    v44[3] = &unk_1E6CF1D70;
    v37 = *(void **)(a1 + 48);
    v44[4] = *(_QWORD *)(a1 + 40);
    v45 = *(id *)(a1 + 56);
    objc_msgSend(v37, "fetchSyncStatusWithCompletion:", v44);

  }
}

void __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_244(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2_245;
  v12[3] = &unk_1E6CED498;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

uint64_t __75__HDCloudSyncObserverTaskServer__queue_instantiateCloudSyncObserverStatus___block_invoke_2_245(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch sync status with error %{public}@", (uint8_t *)&v11, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "lastSuccessfulPushDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setLastPushDate:", v4);

    objc_msgSend(*(id *)(a1 + 48), "lastSuccessfulPullDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setLastPullDate:", v5);

    objc_msgSend(*(id *)(a1 + 48), "lastSuccessfulLitePushDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setLastLitePushDate:", v6);

    objc_msgSend(*(id *)(a1 + 40), "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncLastPulledUpdateDate(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setLastPulledUpdateDate:", v8);

    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, 0);
  }
}

- (void)cloudSyncManager:(id)a3 didUpdateSyncEnabled:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithSyncEnabled:]((uint64_t)self, a4);
}

- (void)cloudSyncManager:(id)a3 didUpdateLastPushDate:(id)a4
{
  NSObject *queue;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPushDate___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);

}

- (void)cloudSyncManager:(id)a3 didUpdateLastLitePushDate:(id)a4
{
  NSObject *queue;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastLitePushDate___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);

}

- (void)cloudSyncManager:(id)a3 didUpdateLastPullDate:(id)a4
{
  NSObject *queue;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPullDate___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);

}

- (void)cloudSyncManager:(id)a3 didUpdateLastPulledUpdateDate:(id)a4
{
  NSObject *queue;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithLastPulledUpdateDate___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);

}

- (void)cloudSyncManager:(id)a3 didUpdateErrorRequiringUserAction:(id)a4
{
  NSObject *queue;
  id v6;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatusWithErrorRequiringUserAction:]((uint64_t)self, v6);

}

- (void)cloudSyncManager:(id)a3 didUpdateRestoreCompletionDate:(id)a4
{
  NSObject *queue;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__HDCloudSyncObserverTaskServer__queue_didUpdateSyncStatusWithRestoreCompleteDate___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[HDCloudSyncObserverTaskServer _queue_updateSyncStatusWithBlock:]((uint64_t)self, v9);

}

- (void)cloudSyncManager:(id)a3 didUpdateDataUploadRequestStatus:(int64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9;
  HKCloudSyncObserverStatus *status;
  HKCloudSyncObserverStatus *v11;
  HKCloudSyncObserverStatus *v12;
  uint64_t v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v22 = a5;
  v9 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  status = self->_status;
  if (!status)
  {
    v11 = (HKCloudSyncObserverStatus *)objc_alloc_init(MEMORY[0x1E0CB6408]);
    v12 = self->_status;
    self->_status = v11;

    status = self->_status;
  }
  v13 = -[HKCloudSyncObserverStatus dataUploadRequestStatus](status, "dataUploadRequestStatus");
  v14 = v13 != a4;
  if (v13 != a4)
    -[HKCloudSyncObserverStatus setDataUploadRequestStatus:](self->_status, "setDataUploadRequestStatus:", a4);
  -[HKCloudSyncObserverStatus dataUploadRequestStartDate](self->_status, "dataUploadRequestStartDate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v22)
  {

    goto LABEL_12;
  }
  if (!v22)
  {

    goto LABEL_11;
  }
  -[HKCloudSyncObserverStatus dataUploadRequestStartDate](self->_status, "dataUploadRequestStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v22);

  if ((v17 & 1) == 0)
  {
LABEL_11:
    -[HKCloudSyncObserverStatus setDataUploadRequestStartDate:](self->_status, "setDataUploadRequestStartDate:", v22);
    v14 = 1;
  }
LABEL_12:
  -[HKCloudSyncObserverStatus dataUploadRequestCompletionDate](self->_status, "dataUploadRequestCompletionDate");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18 == v9)
  {

    if (!v14)
      goto LABEL_22;
  }
  else
  {
    v19 = v18;
    if (v9)
    {
      -[HKCloudSyncObserverStatus dataUploadRequestCompletionDate](self->_status, "dataUploadRequestCompletionDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqual:", v9);

      if ((v21 & 1) != 0)
      {
        if (!v14)
          goto LABEL_22;
        goto LABEL_21;
      }
    }
    else
    {

    }
    -[HKCloudSyncObserverStatus setDataUploadRequestCompletionDate:](self->_status, "setDataUploadRequestCompletionDate:", v9);
  }
LABEL_21:
  -[HDCloudSyncObserverTaskServer _queue_didUpdateSyncStatus]((uint64_t)self);
LABEL_22:

}

- (void)remote_startObservingSyncRequestsMatchingFilter:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__HDCloudSyncObserverTaskServer_remote_startObservingSyncRequestsMatchingFilter___block_invoke;
  v4[3] = &unk_1E6CE8058;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

_BYTE *__81__HDCloudSyncObserverTaskServer_remote_startObservingSyncRequestsMatchingFilter___block_invoke(uint64_t a1)
{
  _BYTE *result;
  void *v3;
  void *v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(a1 + 40);
  result = *(_BYTE **)(a1 + 32);
  if (!result[80])
  {
    objc_msgSend(result, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudSyncCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", *(_QWORD *)(a1 + 32));

    result = *(_BYTE **)(a1 + 32);
  }
  result[80] = 1;
  return result;
}

- (void)remote_stopObservingSyncRequests
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDCloudSyncObserverTaskServer_remote_stopObservingSyncRequests__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

_BYTE *__65__HDCloudSyncObserverTaskServer_remote_stopObservingSyncRequests__block_invoke(uint64_t a1)
{
  _BYTE *result;
  void *v3;
  void *v4;
  void *v5;

  result = *(_BYTE **)(a1 + 32);
  if (result[80])
  {
    objc_msgSend(result, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudSyncCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

    result = *(_BYTE **)(a1 + 32);
  }
  result[80] = 0;
  return result;
}

- (id)remote_retrieveProgressForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__HDCloudSyncObserverTaskServer_remote_retrieveProgressForIdentifier_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

  return 0;
}

void __81__HDCloudSyncObserverTaskServer_remote_retrieveProgressForIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  if (v2)
  {
    v4 = *(NSObject **)(v2 + 40);
    v5 = v1;
    dispatch_assert_queue_V2(v4);
    objc_msgSend(*(id *)(v2 + 88), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "setInvalidationBlock:", v3);
      objc_msgSend(v6, "progress");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    }
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

}

- (uint64_t)_shouldNotifyObserverAboutRequest:(uint64_t)a1
{
  id v3;
  uint64_t v4;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  if (*(_BYTE *)(a1 + 80))
    v4 = objc_msgSend(v3, "matchesFilter:", *(_QWORD *)(a1 + 72));
  else
    v4 = 0;

  return v4;
}

void __69__HDCloudSyncObserverTaskServer__queue_syncRequestDidStart_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client syncRequestDidStart: with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __77__HDCloudSyncObserverTaskServer__queue_syncRequestDidComplete_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call cloudSync observer client syncRequestDidComplete:success:error: with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)cloudSyncCoordinator:(id)a3 syncStartedForRequest:(id)a4 progress:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncStartedForRequest_progress___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

void __85__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncStartedForRequest_progress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  HDCloudSyncObserverTaskServerStoredProgress *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE v14[24];
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    if (-[HDCloudSyncObserverTaskServer _shouldNotifyObserverAboutRequest:](v1, v3))
    {
      v5 = -[HDCloudSyncObserverTaskServerStoredProgress initWithProgress:]([HDCloudSyncObserverTaskServerStoredProgress alloc], "initWithProgress:", v4);
      v6 = *(void **)(v1 + 88);
      objc_msgSend(v3, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x1E0C99D68];
        v10 = v8;
        objc_msgSend(v9, "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromDate();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v14 = 138543618;
        *(_QWORD *)&v14[4] = v1;
        *(_WORD *)&v14[12] = 2114;
        *(_QWORD *)&v14[14] = v12;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client syncRequestDidStart: with date: (%{public}@", v14, 0x16u);

      }
      *(_QWORD *)v14 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v14[8] = 3221225472;
      *(_QWORD *)&v14[16] = __69__HDCloudSyncObserverTaskServer__queue_syncRequestDidStart_progress___block_invoke;
      v15 = &unk_1E6CE8030;
      v16 = v1;
      objc_msgSend((id)v1, "remoteObjectProxyWithErrorHandler:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clientRemote_syncRequestDidStart:", v3);

    }
  }

}

- (void)cloudSyncCoordinator:(id)a3 syncRequestDidCompleteForRequest:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v9 = a4;
  v10 = a6;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncRequestDidCompleteForRequest_success_error___block_invoke;
  v14[3] = &unk_1E6CEDB28;
  v14[4] = self;
  v15 = v9;
  v17 = a5;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, v14);

}

void __101__HDCloudSyncObserverTaskServer_cloudSyncCoordinator_syncRequestDidCompleteForRequest_success_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[24];
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    v6 = *(void **)(v1 + 88);
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(v1 + 88);
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

    objc_msgSend(v8, "invalidate");
    if (-[HDCloudSyncObserverTaskServer _shouldNotifyObserverAboutRequest:](v1, v4))
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)MEMORY[0x1E0C99D68];
        v13 = v11;
        objc_msgSend(v12, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HKDiagnosticStringFromDate();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v17 = 138543618;
        *(_QWORD *)&v17[4] = v1;
        *(_WORD *)&v17[12] = 2114;
        *(_QWORD *)&v17[14] = v15;
        _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling cloudSync observer client syncRequestDidComplete:success:error: with date: (%{public}@", v17, 0x16u);

      }
      *(_QWORD *)v17 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v17[8] = 3221225472;
      *(_QWORD *)&v17[16] = __77__HDCloudSyncObserverTaskServer__queue_syncRequestDidComplete_success_error___block_invoke;
      v18 = &unk_1E6CE8030;
      v19 = v1;
      objc_msgSend((id)v1, "remoteObjectProxyWithErrorHandler:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clientRemote_syncRequestDidComplete:success:error:", v4, v2 != 0, v5);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_waitForSyncObservations, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
