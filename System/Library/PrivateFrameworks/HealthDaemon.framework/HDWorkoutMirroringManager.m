@implementation HDWorkoutMirroringManager

- (HDWorkoutMirroringManager)initWithWorkoutManager:(id)a3
{
  id v4;
  HDWorkoutMirroringManager *v5;
  HDWorkoutMirroringManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *assertionsByBundleIdentifier;
  HDMirroredWorkoutAnalyticsCollector *v9;
  HDMirroredWorkoutAnalyticsCollector *analyticsCollector;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDWorkoutMirroringManager;
  v5 = -[HDWorkoutMirroringManager init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_workoutManager, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionsByBundleIdentifier = v6->_assertionsByBundleIdentifier;
    v6->_assertionsByBundleIdentifier = v7;

    v9 = objc_alloc_init(HDMirroredWorkoutAnalyticsCollector);
    analyticsCollector = v6->_analyticsCollector;
    v6->_analyticsCollector = v9;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_workoutManager);
    objc_msgSend(WeakRetained, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerProfileReadyObserver:queue:", v6, 0);

    v13 = objc_loadWeakRetained((id *)&v6->_workoutManager);
    objc_msgSend(v13, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rapportMessenger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forSchemaIdentifier:", v6, 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t i;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  os_unfair_lock_t lock;
  objc_super v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  HDWorkoutMirroringManager *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_assertionsByBundleIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = (os_log_t *)MEMORY[0x1E0CB5380];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "isValid"))
        {
          v15 = 0;
          v10 = objc_msgSend(v9, "invalidateSyncWithError:", &v15);
          v11 = v15;
          if ((v10 & 1) == 0)
          {
            _HKInitializeLogging();
            v12 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v21 = self;
              v22 = 2114;
              v23 = v11;
              _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to invalidate existing background runtime assertion with error: %{public}@", buf, 0x16u);
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  v14.receiver = self;
  v14.super_class = (Class)HDWorkoutMirroringManager;
  -[HDWorkoutMirroringManager dealloc](&v14, sel_dealloc);
}

- (void)setActiveSessionBundleIdentifier:(id)a3
{
  HDWorkoutManager **p_workoutManager;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_workoutManager = &self->_workoutManager;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workoutManager);
  objc_msgSend(WeakRetained, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDMirroredWorkoutSessionKeyValueDomainWithProfile(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  LOBYTE(WeakRetained) = objc_msgSend(v7, "setString:forKey:error:", v4, CFSTR("active-session-bundle-id"), &v10);

  v8 = v10;
  if ((WeakRetained & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[mirroring] Failed to persist the active mirrored session bundle identifier: %{public}@.", buf, 0xCu);
    }
  }

}

- (id)activeSessionBundleIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
  objc_msgSend(WeakRetained, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDMirroredWorkoutSessionKeyValueDomainWithProfile(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v4, "stringForKey:error:", CFSTR("active-session-bundle-id"), &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[mirroring] Failed to read active session bundle identifier: %{public}@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)profileDidBecomeReady:(id)a3
{
  -[HDWorkoutMirroringManager recoverMirroredWorkoutSessionWithCompletion:](self, "recoverMirroredWorkoutSessionWithCompletion:", 0);
}

- (void)rapportMessenger:(id)a3 didReceiveRequest:(id)a4 data:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  HDCodableWorkoutSessionSyncTransaction *v16;
  void *v17;
  int v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  HDCodableWorkoutSessionSyncTransaction *v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("startMirroring"));

  if (v15)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke;
    v68[3] = &unk_1E6CF13E8;
    v69 = (HDCodableWorkoutSessionSyncTransaction *)v13;
    -[HDWorkoutMirroringManager _createServerWithData:completion:](self, "_createServerWithData:completion:", v12, v68);
    v16 = v69;
  }
  else
  {
    objc_msgSend(v11, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("recoverSession"));

    if (v18)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
      objc_msgSend(WeakRetained, "currentWorkout");
      v16 = (HDCodableWorkoutSessionSyncTransaction *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HDCodableWorkoutSessionSyncTransaction syncController](v16, "syncController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "rapportMessenger:didReceiveRequest:data:responseHandler:", v10, v11, v12, v13);

      }
      else
      {
        v28 = objc_loadWeakRetained((id *)&self->_workoutManager);
        objc_msgSend(v28, "profile");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        +[HDWorkoutSessionServer sessionIdentifierForRecoveryInProfile:error:](HDWorkoutSessionServer, "sessionIdentifierForRecoveryInProfile:error:", v29, &v67);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v67;

        _HKInitializeLogging();
        v32 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          v44 = v32;
          v45 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v71 = v45;
          v72 = 2114;
          v73 = v30;
          v74 = 2114;
          v75 = v31;
          v46 = v45;
          _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Queried persisted session identifier: %{public}@, error: %{public}@", buf, 0x20u);

        }
        (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v31);

        v16 = 0;
      }
    }
    else
    {
      v16 = -[HDCodableWorkoutSessionSyncTransaction initWithData:]([HDCodableWorkoutSessionSyncTransaction alloc], "initWithData:", v12);
      v21 = (void *)MEMORY[0x1E0CB3A28];
      -[HDCodableWorkoutSessionSyncTransaction sessionUUID](v16, "sessionUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hk_UUIDWithData:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v58 = (void *)v23;
      if (v23)
      {
        v24 = objc_loadWeakRetained((id *)&self->_workoutManager);
        objc_msgSend(v24, "sessionServers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v26, "syncController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "rapportMessenger:didReceiveRequest:data:responseHandler:", v10, v11, v12, v13);

        }
        else
        {
          _HKInitializeLogging();
          v34 = (void *)*MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v51 = v34;
            v52 = (void *)objc_opt_class();
            v57 = v52;
            objc_msgSend(v11, "name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v71 = v52;
            v72 = 2114;
            v73 = v58;
            v74 = 2114;
            v75 = v53;
            _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session server %{public}@ doesn't exist to handle request %{public}@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isCompanionCapable");

          if (v36)
          {
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke_199;
            v60[3] = &unk_1E6D0FF50;
            v66 = v13;
            v61 = v58;
            v62 = 0;
            v63 = v10;
            v64 = v11;
            v65 = v12;
            -[HDWorkoutMirroringManager recoverMirroredWorkoutSessionWithCompletion:](self, "recoverMirroredWorkoutSessionWithCompletion:", v60);

          }
          else
          {
            v37 = objc_loadWeakRetained((id *)&self->_workoutManager);
            objc_msgSend(v37, "profile");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 0;
            +[HDWorkoutSessionServer sessionIdentifierForRecoveryInProfile:error:](HDWorkoutSessionServer, "sessionIdentifierForRecoveryInProfile:error:", v38, &v59);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v59;

            _HKInitializeLogging();
            v41 = (void *)*MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
            {
              v54 = v41;
              v55 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v71 = v55;
              v72 = 2114;
              v73 = v39;
              v74 = 2114;
              v75 = v40;
              v56 = v55;
              _os_log_error_impl(&dword_1B7802000, v54, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Queried persisted session identifier: %{public}@, error: %{public}@", buf, 0x20u);

            }
            if ((objc_msgSend(v58, "isEqual:", v39) & 1) != 0 || v40)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to complete mirrored workout session request (#3)."));
              v42 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Workout session %@ doesn't exist."), v58);
              v42 = objc_claimAutoreleasedReturnValue();
            }
            v43 = (void *)v42;
            (*((void (**)(id, _QWORD, uint64_t))v13 + 2))(v13, 0, v42);

          }
          v26 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v33 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          v47 = v33;
          v48 = (void *)objc_opt_class();
          v49 = v48;
          objc_msgSend(v11, "name");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v71 = v48;
          v72 = 2114;
          v73 = v50;
          _os_log_error_impl(&dword_1B7802000, v47, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Malformed incoming request %{public}@: session UUID is missing.", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to complete mirrored workout session request (#1)."));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v26);
      }

    }
  }

}

uint64_t __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke_199(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10)
  {
    v9 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to complete mirrored workout session request (#2)."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v8);
    goto LABEL_5;
  }
  objc_msgSend(v10, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "syncController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rapportMessenger:didReceiveRequest:data:responseHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
LABEL_5:

  }
}

- (void)_createServerWithData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  os_unfair_lock_s *p_lock;
  HDCodableWorkoutSessionSyncTransaction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HDWorkoutManager **p_workoutManager;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  HDMirroredWorkoutSessionServer *v27;
  void *v28;
  void *v29;
  HDMirroredWorkoutSessionServer *v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = -[HDCodableWorkoutSessionSyncTransaction initWithData:]([HDCodableWorkoutSessionSyncTransaction alloc], "initWithData:", v6);
  v10 = (void *)MEMORY[0x1E0CB3A28];
  -[HDCodableWorkoutSessionSyncTransaction sessionUUID](v9, "sessionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_UUIDWithData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB6E20];
  -[HDCodableWorkoutSessionSyncTransaction configuration](v9, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workoutConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createWithCodable:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableWorkoutSessionSyncTransaction configuration](v9, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sourceBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v16 && v18)
  {
    v40 = v16;
    v41 = v6;
    p_workoutManager = &self->_workoutManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
    objc_msgSend(WeakRetained, "sessionServers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      os_unfair_lock_unlock(&self->_lock);
      v7[2](v7, v22, 0);
      v16 = v40;
      v6 = v41;
    }
    else
    {
      v42 = 0;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v18, 0, &v42);
      v39 = v42;
      if (v24)
      {
        objc_msgSend(v24, "applicationState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isInstalled");

        if ((v26 & 1) != 0)
        {
          -[HDWorkoutMirroringManager setActiveSessionBundleIdentifier:](self, "setActiveSessionBundleIdentifier:", v18);
          v27 = [HDMirroredWorkoutSessionServer alloc];
          v37 = objc_loadWeakRetained((id *)p_workoutManager);
          objc_msgSend(v37, "profile");
          v38 = v24;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableWorkoutSessionSyncTransaction globalState](v9, "globalState");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v40;
          v30 = -[HDMirroredWorkoutSessionServer initWithProfile:configuration:sessionUUID:globalState:clientBundleIdentifier:](v27, "initWithProfile:configuration:sessionUUID:globalState:clientBundleIdentifier:", v28, v40, v12, v29, v18);

          v24 = v38;
          v31 = objc_loadWeakRetained((id *)p_workoutManager);
          objc_msgSend(v31, "_didCreateMirroredSessionServer:", v30);

          os_unfair_lock_unlock(p_lock);
          v7[2](v7, v30, 0);
          v6 = v41;
        }
        else
        {
          os_unfair_lock_unlock(&self->_lock);
          _HKInitializeLogging();
          v34 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v44 = v18;
            _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "[mirroring] Ignoring workout session mirroring request because the companion app %{public}@ is not installed.", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 552, CFSTR("Application is not installed on companion device."));
          v30 = (HDMirroredWorkoutSessionServer *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, HDMirroredWorkoutSessionServer *))v7)[2](v7, 0, v30);
          v16 = v40;
          v6 = v41;
        }
        v33 = v39;
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
        _HKInitializeLogging();
        v32 = *MEMORY[0x1E0CB5380];
        v33 = v39;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v39;
          _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "[mirroring] Unable to fetch LSApplicationRecord to start mirrored workout session with error: %{public}@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to start mirroring workout session."));
        v30 = (HDMirroredWorkoutSessionServer *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, HDMirroredWorkoutSessionServer *))v7)[2](v7, 0, v30);
        v16 = v40;
        v6 = v41;
      }

      v22 = 0;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v35 = v23;
      -[HDCodableWorkoutSessionSyncTransaction configuration](v9, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v12;
      v45 = 2114;
      v46 = v36;
      v47 = 2114;
      v48 = v6;
      _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[mirroring] Cannot start mirroring with invalid request. Session UUID: %{public}@, configuration: %{public}@, data: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to start mirroring workout session."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v22);
  }

}

- (void)recoverMirroredWorkoutSessionWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  HDRapportRequestIdentifier *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6CF13E8;
  v20 = v4;
  v6 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCompanionCapable");

  if ((v8 & 1) != 0)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      v12 = v11;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Running session recovering.", buf, 0xCu);

    }
    v13 = -[HDRapportRequestIdentifier initWithSchemaIdentifier:name:]([HDRapportRequestIdentifier alloc], "initWithSchemaIdentifier:name:", 0, CFSTR("recoverSession"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
    objc_msgSend(WeakRetained, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rapportMessenger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_214;
    v17[3] = &unk_1E6D0FF78;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v16, "sendRequest:data:completion:", v13, 0, v17);

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

uint64_t __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[mirroring] Failed to recover mirrored workout session: %{public}@", buf, 0xCu);
    }
  }
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_215;
    v10[3] = &unk_1E6CF13E8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_createServerWithData:completion:", v5, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeSessionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "launchClientWithBundleIdentifier:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setActiveSessionBundleIdentifier:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_215(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)launchClientWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  HDWorkoutMirroringManager *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D23170];
    v10 = *MEMORY[0x1E0D22D00];
    v11[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__HDWorkoutMirroringManager_launchClientWithBundleIdentifier___block_invoke;
    v7[3] = &unk_1E6D0FFA0;
    v8 = v4;
    v9 = self;
    objc_msgSend(v5, "hd_openApplication:optionsDictionary:completion:", v8, v6, v7);

  }
}

void __62__HDWorkoutMirroringManager_launchClientWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  v8 = *MEMORY[0x1E0CB5380];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = v7;
      v12 = 138543618;
      v13 = v9;
      v14 = 1024;
      LODWORD(v15) = objc_msgSend(v5, "pid");
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] Launched %{public}@ with pid: %d", (uint8_t *)&v12, 0x12u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier:pid:", *(_QWORD *)(a1 + 32), objc_msgSend(v5, "pid"));
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[mirroring] Failed to launch %{public}@ with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }

}

- (void)_takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];

  v4 = *(_QWORD *)&a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByBundleIdentifier, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isValid"))
    goto LABEL_4;
  v20 = 0;
  v9 = objc_msgSend(v8, "invalidateSyncWithError:", &v20);
  v10 = v20;
  v11 = v10;
  if ((v9 & 1) != 0)
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.healthd"), CFSTR("MirroredWorkoutSessionUpdate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("Mirrored Workout Session Update"), v11, v13);
    objc_msgSend(v14, "setInvalidationHandler:", &__block_literal_global_240);
    v19 = 0;
    v15 = objc_msgSend(v14, "acquireWithError:", &v19);
    v16 = v19;
    if (v15)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertionsByBundleIdentifier, "setObject:forKeyedSubscript:", v14, v6);
    }
    else
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = v6;
        v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[mirroring] Failed to acquire background runtime assertion for process %{public}@: %{public}@", buf, 0x16u);
      }
    }
    os_unfair_lock_unlock(p_lock);

    goto LABEL_12;
  }
  _HKInitializeLogging();
  v18 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[mirroring] Failed to invalidate existing background runtime assertion with error: %{public}@", buf, 0xCu);
  }
  os_unfair_lock_unlock(p_lock);
LABEL_12:

}

void __95__HDWorkoutMirroringManager__takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier_pid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] Background runtime assertion %{public}@ was invalidated with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

- (HDMirroredWorkoutAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCollector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_assertionsByBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_workoutManager);
}

@end
