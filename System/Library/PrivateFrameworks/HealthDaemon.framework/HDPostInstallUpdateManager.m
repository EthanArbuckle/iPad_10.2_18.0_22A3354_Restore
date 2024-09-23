@implementation HDPostInstallUpdateManager

- (HDPostInstallUpdateManager)initWithDaemon:(id)a3
{
  id v4;
  HDPostInstallUpdateManager *v5;
  HDPostInstallUpdateManager *v6;
  uint64_t v7;
  OS_dispatch_queue *monitoringQueue;
  id v9;
  void *v10;
  uint64_t v11;
  HKObserverSet *observers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDPostInstallUpdateManager;
  v5 = -[HDPostInstallUpdateManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    monitoringQueue = v6->_monitoringQueue;
    v6->_monitoringQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogInfrastructure();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithName:loggingCategory:", CFSTR("post-install-update-handlers"), v10);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v11;

  }
  return v6;
}

- (void)start
{
  xpc_object_t empty;
  _QWORD v4[4];
  id v5;
  id location;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C80860], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808B0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808A0], 1);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__HDPostInstallUpdateManager_start__block_invoke;
  v4[3] = &unk_1E6CF2A90;
  objc_copyWeak(&v5, &location);
  xpc_activity_register("com.apple.healthd.post-install-update", empty, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __35__HDPostInstallUpdateManager_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  _xpc_activity_s *v6;
  _xpc_activity_s *v7;
  xpc_activity_state_t state;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _xpc_activity_s *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _xpc_activity_s *v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _xpc_activity_s *v30;
  NSObject *v31;
  _xpc_activity_s *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  _xpc_activity_s *v56;
  id v57;
  _QWORD *v58;
  void *v59;
  _xpc_activity_s *v60;
  _QWORD block[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD *v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  _xpc_activity_s *v77;
  __int128 buf;
  void *v79;
  void *v80;
  id v81;
  _xpc_activity_s *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1BCCACAC4]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (_xpc_activity_s *)v3;
  v7 = v6;
  v60 = v6;
  if (WeakRetained)
  {
    state = xpc_activity_get_state(v6);
    if (state == 2)
    {
      v12 = v60;
      _HKInitializeLogging();
      HKLogInfrastructure();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_loadWeakRetained((id *)WeakRetained + 4);
        objc_msgSend(v14, "behavior");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentOSBuild");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Updated to %{public}@; performing post-install update tasks.",
          (uint8_t *)&buf,
          0xCu);

      }
      v17 = objc_alloc_init(MEMORY[0x1E0D298C8]);
      v18 = MEMORY[0x1E0C809B0];
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke;
      v76[3] = &unk_1E6CF8A08;
      v76[4] = WeakRetained;
      v19 = v12;
      v77 = v19;
      objc_msgSend(v17, "setDidFinish:", v76);
      v20 = objc_loadWeakRetained((id *)WeakRetained + 4);
      objc_msgSend(v20, "behavior");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isDeviceSupported");

      if ((v22 & 1) != 0)
      {
        v59 = v4;
        objc_msgSend(v17, "beginTask");
        objc_msgSend(v17, "beginTask");
        v74[0] = v18;
        v74[1] = 3221225472;
        v74[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_191;
        v74[3] = &unk_1E6CE80E8;
        v57 = v17;
        v23 = v17;
        v75 = v23;
        v24 = v74;
        v25 = objc_loadWeakRetained((id *)WeakRetained + 4);
        objc_msgSend(v25, "primaryProfile");
        v26 = v18;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "medicalIDDataManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = v26;
        *((_QWORD *)&buf + 1) = 3221225472;
        v79 = __76__HDPostInstallUpdateManager__migrateEmergencySOSIfNecessaryWithCompletion___block_invoke;
        v80 = &unk_1E6CE77F0;
        v29 = v24;
        v81 = v29;
        objc_msgSend(v28, "runEmergencyContactConsolidationWithCompletion:", &buf);

        v56 = v19;
        v30 = v19;
        dispatch_assert_queue_not_V2(*((dispatch_queue_t *)WeakRetained + 2));
        v31 = *((_QWORD *)WeakRetained + 2);
        *(_QWORD *)&buf = v26;
        *((_QWORD *)&buf + 1) = 3221225472;
        v79 = __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke;
        v80 = &unk_1E6CE8080;
        v58 = WeakRetained;
        v81 = WeakRetained;
        v32 = v30;
        v82 = v32;
        dispatch_sync(v31, &buf);

        v33 = objc_loadWeakRetained((id *)WeakRetained + 4);
        objc_msgSend(v33, "primaryProfile");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "medicalIDDataManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v70 = 0;
        objc_msgSend(v35, "fetchMedicalIDWithError:", &v70);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)v70;

        if (!v36)
        {
          if (v37)
          {
            _HKInitializeLogging();
            v38 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v37;
              _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "Failed to fetch MedicalID during database migration with error %{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
        }

        v39 = objc_loadWeakRetained((id *)WeakRetained + 4);
        objc_msgSend(v39, "profileManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        objc_msgSend(v40, "allProfileIdentifiers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, &buf, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v71;
          v45 = MEMORY[0x1E0C809B0];
          do
          {
            v46 = 0;
            do
            {
              if (*(_QWORD *)v71 != v44)
                objc_enumerationMutation(v41);
              objc_msgSend(v40, "profileForIdentifier:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v46), v56);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {
                objc_msgSend(v23, "beginTask");
                v68[0] = v45;
                v68[1] = 3221225472;
                v68[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_2;
                v68[3] = &unk_1E6CE80E8;
                v48 = v23;
                v69 = v48;
                -[HDPostInstallUpdateManager _triggerMigrationForProfile:protected:completion:](v47, 0, v68);
                objc_msgSend(v48, "beginTask");
                v66[0] = v45;
                v66[1] = 3221225472;
                v66[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_3;
                v66[3] = &unk_1E6CE80E8;
                v67 = v48;
                -[HDPostInstallUpdateManager _triggerMigrationForProfile:protected:completion:](v47, 1, v66);

              }
              ++v46;
            }
            while (v43 != v46);
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, &buf, 16);
          }
          while (v43);
        }

        objc_msgSend(v23, "beginTask");
        v49 = dispatch_group_create();
        WeakRetained = v58;
        v50 = (void *)v58[3];
        v51 = MEMORY[0x1E0C809B0];
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_4;
        v63[3] = &unk_1E6CF8A30;
        v52 = v23;
        v64 = v52;
        v65 = v58;
        objc_msgSend(v50, "notifyObserversInGroup:handler:", v49, v63);
        dispatch_get_global_queue(0, 0);
        v53 = objc_claimAutoreleasedReturnValue();
        block[0] = v51;
        block[1] = 3221225472;
        block[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_195;
        block[3] = &unk_1E6CE80E8;
        v54 = v52;
        v62 = v54;
        dispatch_group_notify(v49, v53, block);

        objc_msgSend(v54, "finishTask");
        v4 = v59;
        v19 = v56;
        v17 = v57;
      }
      else
      {
        _HKInitializeLogging();
        v55 = *MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B7802000, v55, OS_LOG_TYPE_DEFAULT, "Current device is not supported; skipping post-install update since profiles are not available.",
            (uint8_t *)&buf,
            2u);
        }
        objc_msgSend(v17, "beginTask");
        objc_msgSend(v17, "finishTask");
      }

      goto LABEL_29;
    }
    v7 = v60;
    if (!state)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

      v7 = v60;
      if (v10)
      {
        HKLogInfrastructure();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Checking in for post-install update handler.", (uint8_t *)&buf, 2u);
        }

LABEL_29:
        v7 = v60;
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_monitoringQueue_stopMonitoringForDeferral
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

    }
  }
}

void __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](*(_QWORD *)(a1 + 32));
  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke_2;
  v11[3] = &unk_1E6CE8080;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  dispatch_source_set_event_handler(v6, v11);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = dispatch_walltime(0, 1000000000);
  dispatch_source_set_timer(v9, v10, 0x3B9ACA00uLL, 0x1DCD6500uLL);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));

}

void __69__HDPostInstallUpdateManager__startMonitoringForDeferralForActivity___block_invoke_2(uint64_t a1)
{
  xpc_activity_state_t state;
  NSObject *v3;
  uint8_t v4[16];

  state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (state != 4)
  {
    if (state == 3)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "Post-install update activity requested deferal. Completing activity.", v4, 2u);
      }

      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
      -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](*(_QWORD *)(a1 + 40));
    }
    else
    {
      -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](*(_QWORD *)(a1 + 40));
    }
  }
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "behavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentOSBuild");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "Finished post-install update tasks after updating to %{public}@.", buf, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_189;
  block[3] = &unk_1E6CE80E8;
  block[4] = v6;
  dispatch_async(v7, block);
  if (xpc_activity_get_state(*(xpc_activity_t *)(a1 + 40)) == 4
    && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to update XPC activity state after completing post-install update.", buf, 2u);
    }

  }
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_189(uint64_t a1)
{
  -[HDPostInstallUpdateManager _monitoringQueue_stopMonitoringForDeferral](*(_QWORD *)(a1 + 32));
}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_191(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTask");
}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTask");
}

- (void)_triggerMigrationForProfile:(void *)a1 protected:(char)a2 completion:(void *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HDPostInstallUpdateManager__triggerMigrationForProfile_protected_completion___block_invoke;
  v10[3] = &unk_1E6CEBCC8;
  v13 = a2;
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", 0, v10);

}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTask");
}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "beginTask");
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Notifying %{public}@ for post-install update", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_192;
  v7[3] = &unk_1E6CEB718;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v6, "performPostInstallUpdateTaskForManager:completion:", v5, v7);

}

void __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_192(uint64_t a1, int a2, void *a3)
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
  v6 = *MEMORY[0x1E0CB52C0];
  v7 = *MEMORY[0x1E0CB52C0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Received successful post-install update completion from %{public}@.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Post install update failed for %{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishTask");

}

uint64_t __63__HDPostInstallUpdateManager__postInstallUpdateHandlerDidFire___block_invoke_195(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTask");
}

void __79__HDPostInstallUpdateManager__triggerMigrationForProfile_protected_completion___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  void **v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    v2 = CFSTR("protected");
  else
    v2 = CFSTR("unprotected");
  v3 = v2;
  _HKInitializeLogging();
  v4 = (void **)MEMORY[0x1E0CB52C0];
  v5 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    objc_msgSend(v6, "profileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v3;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Performing %{public}@ Health database migration for %{public}@...", buf, 0x16u);

  }
  if (*(_BYTE *)(a1 + 48))
    +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
  else
    +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v9, &v19, &__block_literal_global_98, 0);
  v12 = v19;

  _HKInitializeLogging();
  v13 = *v4;
  v14 = *v4;
  if (!v11)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v18 = *(void **)(a1 + 32);
    v16 = v13;
    objc_msgSend(v18, "profileIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v3;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v12;
    _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed %{public}@ Health database migration for %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 32);
    v16 = v13;
    objc_msgSend(v15, "profileIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v3;
    v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Finished %{public}@ Health database migration for %{public}@.", buf, 0x16u);
LABEL_12:

  }
LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79__HDPostInstallUpdateManager__triggerMigrationForProfile_protected_completion___block_invoke_201()
{
  return 1;
}

void __76__HDPostInstallUpdateManager__migrateEmergencySOSIfNecessaryWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5300];
  v7 = *MEMORY[0x1E0CB5300];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Migrated Emergency SOS completed successfully", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Migration for Emergency SOS failed: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)registerUpdateTaskHandler:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterUpdateTaskHandler:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_monitoringQueue, 0);
  objc_storeStrong((id *)&self->_activityPollSource, 0);
}

@end
