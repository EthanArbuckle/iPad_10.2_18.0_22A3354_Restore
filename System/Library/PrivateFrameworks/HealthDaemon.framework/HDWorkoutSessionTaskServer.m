@implementation HDWorkoutSessionTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB61C8];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "workoutConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "validateIgnoringDeviceSupport:error:", 0, a5);

    LOBYTE(v10) = 0;
    if (v11)
    {
      objc_msgSend(v8, "workoutConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fitnessPlusCatalogWorkoutId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && !objc_msgSend(v9, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], a5))
        LOBYTE(v10) = 0;
      else
        LOBYTE(v10) = +[HDWorkoutSessionTaskServer _getRecoveredWorkoutSessionServer:forConfiguration:client:error:]((uint64_t)a1, &v15, v8, v9, a5);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Missing session UUID"));
  }

  return (char)v10;
}

+ (uint64_t)_getRecoveredWorkoutSessionServer:(void *)a3 forConfiguration:(void *)a4 client:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  id v18;

  v8 = a3;
  v9 = a4;
  objc_opt_self();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "workoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v11, "recoveredWorkoutSessionServerWithIdentifier:error:", v12, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;

  if (v13 || !v14)
  {
    v16 = objc_msgSend(v8, "requiresRecovery");
    if (v13 || !v16)
    {
      *a2 = objc_retainAutorelease(v13);
      v15 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Session requires recovery but no matching session record was found."));
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  if (!a5)
  {
    _HKLogDroppedError();
    goto LABEL_10;
  }
  v15 = 0;
  *a5 = objc_retainAutorelease(v14);
LABEL_11:

  return v15;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18;
  HDWorkoutSessionTaskServer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  HDWorkoutSessionTaskServer *v27;
  uint64_t v28;
  HKWorkoutSessionTaskConfiguration *taskConfiguration;
  uint64_t v30;
  HKSource *clientSource;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v37 = 0;
  v16 = +[HDWorkoutSessionTaskServer _getRecoveredWorkoutSessionServer:forConfiguration:client:error:]((uint64_t)a1, &v37, v13, v14, a7);
  v17 = v37;
  v18 = v37;
  v19 = 0;
  if (v16)
  {
    objc_msgSend(v14, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sourceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "createOrUpdateSourceForClient:error:", v14, a7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v21, "clientSourceForSourceEntity:error:", v22, a7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v19 = [HDWorkoutSessionTaskServer alloc];
        v24 = v13;
        v25 = v23;
        v26 = v24;
        v33 = v25;
        v36 = v25;
        v34 = v26;
        v35 = v18;
        if (v19)
        {
          v38.receiver = v19;
          v38.super_class = (Class)HDWorkoutSessionTaskServer;
          v27 = objc_msgSendSuper2(&v38, sel_initWithUUID_configuration_client_delegate_, v12, v26, v14, v15);
          v19 = v27;
          if (v27)
          {
            v27->_lock._os_unfair_lock_opaque = 0;
            v28 = objc_msgSend(v26, "copy");
            taskConfiguration = v19->_taskConfiguration;
            v19->_taskConfiguration = (HKWorkoutSessionTaskConfiguration *)v28;

            v30 = objc_msgSend(v36, "copy");
            clientSource = v19->_clientSource;
            v19->_clientSource = (HKSource *)v30;

            if (v35)
              objc_storeStrong((id *)&v19->_sessionServer, v17);
          }
        }
        v23 = v33;

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (void)connectionConfigured
{
  _QWORD *v3;
  NSObject *v4;
  HDWorkoutSessionServer *sessionServer;
  HKDataFlowLink *v6;
  HKDataFlowLink *workoutDataFlowLink;
  HDWorkoutSessionServer *v8;
  HKDataFlowLink *v9;
  void *v10;
  int v11;
  HDWorkoutSessionTaskServer *v12;
  __int16 v13;
  HDWorkoutSessionServer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (_QWORD *)MEMORY[0x1E0CB5380];
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    sessionServer = self->_sessionServer;
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = sessionServer;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection configured with session server: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  _HKInitializeLogging();
  v6 = (HKDataFlowLink *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6588]), "initWithProcessor:sourceProtocol:destinationProtocol:loggingCategory:", self, &unk_1EF1A1298, &unk_1EF1B99A8, *v3);
  workoutDataFlowLink = self->_workoutDataFlowLink;
  self->_workoutDataFlowLink = v6;

  v8 = self->_sessionServer;
  if (v8)
  {
    v9 = self->_workoutDataFlowLink;
    -[HDWorkoutSessionServer workoutDataFlowLink](v8, "workoutDataFlowLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataFlowLink addSource:](v9, "addSource:", v10);

    -[HDWorkoutSessionServer setTaskServer:](self->_sessionServer, "setTaskServer:", self);
    -[HDWorkoutSessionServer addObserver:queue:](self->_sessionServer, "addObserver:queue:", self, 0);
  }
}

- (int64_t)sessionType
{
  return -[HKWorkoutSessionTaskConfiguration sessionType](self->_taskConfiguration, "sessionType");
}

- (BOOL)requiresCoreLocationAssertion
{
  return -[HKWorkoutSessionTaskConfiguration requiresCoreLocationAssertion](self->_taskConfiguration, "requiresCoreLocationAssertion");
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return -[HKWorkoutSessionTaskConfiguration supportsAppRelaunchForRecovery](self->_taskConfiguration, "supportsAppRelaunchForRecovery");
}

- (BOOL)shouldStopPreviousSession
{
  return -[HKWorkoutSessionTaskConfiguration shouldStopPreviousSession](self->_taskConfiguration, "shouldStopPreviousSession");
}

- (BOOL)supports3rdPartyAOT
{
  return -[HKWorkoutSessionTaskConfiguration supports3rdPartyAOT](self->_taskConfiguration, "supports3rdPartyAOT");
}

- (void)setAssociatedWorkoutBuilderEntity:(id)a3
{
  HDWorkoutBuilderEntity *v4;
  os_unfair_lock_s *p_lock;
  HDWorkoutBuilderEntity *builderEntity;
  HDWorkoutSessionServer *v7;
  HDWorkoutBuilderEntity *v8;

  v4 = (HDWorkoutBuilderEntity *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  builderEntity = self->_builderEntity;
  self->_builderEntity = v4;
  v8 = v4;

  v7 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  -[HDWorkoutSessionServer setAssociatedWorkoutBuilderEntity:](v7, "setAssociatedWorkoutBuilderEntity:", v8);

}

- (void)setWorkoutDataAccumulator:(id)a3
{
  os_unfair_lock_s *p_lock;
  HDWorkoutSessionServer *v5;
  id obj;

  p_lock = &self->_lock;
  obj = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_accumulator, obj);
  v5 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  -[HDWorkoutSessionServer setWorkoutDataAccumulator:](v5, "setWorkoutDataAccumulator:", obj);

}

- (void)remote_setupTaskServerWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HDWorkoutSessionTaskServer_remote_setupTaskServerWithCompletion___block_invoke;
  v6[3] = &unk_1E6CF13E8;
  v7 = v4;
  v5 = v4;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);

}

uint64_t __67__HDWorkoutSessionTaskServer_remote_setupTaskServerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0);
}

- (void)_fetchOrSetupServerWithCompletion:(uint64_t)a1
{
  void (**v3)(id, id, _QWORD);
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(id, id, _QWORD);
  _QWORD aBlock[5];

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(id *)(a1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (v4)
    {
      v3[2](v3, v4, 0);
    }
    else
    {
      v5 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke;
      aBlock[3] = &unk_1E6CF14B0;
      aBlock[4] = a1;
      v6 = _Block_copy(aBlock);
      v7 = objc_msgSend(*(id *)(a1 + 48), "sessionType");
      objc_msgSend((id)a1, "profile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "workoutManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == 1)
      {
        objc_msgSend((id)a1, "taskUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v5;
        v13[1] = 3221225472;
        v13[2] = __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke_322;
        v13[3] = &unk_1E6CF14D8;
        v14 = v6;
        v15 = v3;
        objc_msgSend(v9, "mirroredSessionServerWithUUID:completion:", v10, v13);

        v4 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "workoutConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "taskUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sessionServerWithConfiguration:sessionUUID:clientBundleIdentifier:taskServer:", v11, v12, 0, a1);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(void *, id))v6 + 2))(v6, v4);
        v3[2](v3, v4, 0);
      }

    }
  }

}

- (void)remote_setupMirroredSessionWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__HDWorkoutSessionTaskServer_remote_setupMirroredSessionWithHandler___block_invoke;
  v6[3] = &unk_1E6CF1460;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);

}

void __69__HDWorkoutSessionTaskServer_remote_setupMirroredSessionWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void (*v18)(uint64_t, _QWORD, id);
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB7068];
    v7 = a3;
    v8 = [v6 alloc];
    objc_msgSend(v5, "state");
    v9 = HKWorkoutSessionStateFromServerState();
    objc_msgSend(v5, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v8, "_initWithSessionState:startDate:endDate:currentActivity:", v9, v10, v11, v12);

    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v14;
      v19 = 138543618;
      v20 = v15;
      v21 = 2048;
      v22 = objc_msgSend(v13, "sessionState");
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Setting up mirrored session server with session state:%ld", (uint8_t *)&v19, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void (**)(uint64_t, _QWORD, id))(v17 + 16);
    v13 = a3;
    v18(v17, 0, v13);
  }

}

- (void)remote_setTargetState:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionTaskServer_remote_setTargetState_date_completion___block_invoke;
  v12[3] = &unk_1E6CF1410;
  v14 = v9;
  v15 = a3;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v12);

}

void __68__HDWorkoutSessionTaskServer_remote_setTargetState_date_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = a1[6];
    v8 = a1[4];
    v10 = v5;
    objc_msgSend(a2, "setTargetState:date:error:", v7, v8, &v10);
    v9 = v10;

    (*(void (**)(void))(a1[5] + 16))();
    v6 = v9;
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void)remote_syncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HDWorkoutSessionTaskServer *v10;
  int64_t v11;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HDWorkoutSessionTaskServer_remote_syncSessionEvent_date___block_invoke;
  v8[3] = &unk_1E6CF1438;
  v10 = self;
  v11 = a3;
  v9 = v6;
  v7 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v8);

}

void __59__HDWorkoutSessionTaskServer_remote_syncSessionEvent_date___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "syncSessionEvent:date:", a1[6], a1[4]);
  }
  else
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v4 = a1[5];
      v5 = 138543362;
      v6 = v4;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to sync session event because there is no session server", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)remote_recoverWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke;
  v6[3] = &unk_1E6CF1460;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);

}

void __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_2;
    v14[3] = &unk_1E6CE8030;
    v14[4] = v5;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "state");
    v7 = HKWorkoutSessionStateFromServerState();
    objc_msgSend(v3, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v3;
        _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Session server %{public}@ start date is nil", buf, 0xCu);
      }
    }
    objc_msgSend(v6, "client_didChangeToState:date:", v7, v8);
    objc_msgSend(v3, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "client_didUpdateStartDate:endDate:", v10, v11);

    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_298;
    v12[3] = &unk_1E6CE77F0;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v6, "client_synchronizeWithCompletion:", v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of start date: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __59__HDWorkoutSessionTaskServer_remote_recoverWithCompletion___block_invoke_298(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__HDWorkoutSessionTaskServer_remote_beginNewActivityWithConfiguration_date_metadata_completion___block_invoke;
  v18[3] = &unk_1E6CF1488;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v18);

}

void __96__HDWorkoutSessionTaskServer_remote_beginNewActivityWithConfiguration_date_metadata_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = a1[6];
    v11 = v5;
    objc_msgSend(a2, "beginNewActivityWithConfiguration:date:metadata:error:", v7, v8, v9, &v11);
    v10 = v11;

    v6 = v10;
  }
  (*(void (**)(void))(a1[7] + 16))();

}

- (void)remote_endCurrentActivityOnDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HDWorkoutSessionTaskServer_remote_endCurrentActivityOnDate_completion___block_invoke;
  v10[3] = &unk_1E6CF1460;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v10);

}

void __73__HDWorkoutSessionTaskServer_remote_endCurrentActivityOnDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(a2, "endCurrentActivityOnDate:error:", v7, &v9);
    v8 = v9;

    v6 = v8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)remote_enableAutomaticDetectionForActivityConfigurations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HDWorkoutSessionTaskServer_remote_enableAutomaticDetectionForActivityConfigurations_completion___block_invoke;
  v10[3] = &unk_1E6CF1460;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v10);

}

void __98__HDWorkoutSessionTaskServer_remote_enableAutomaticDetectionForActivityConfigurations_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(a2, "enableAutomaticDetectionForActivityConfigurations:error:", v7, &v9);
    v8 = v9;

    v6 = v8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)remote_startMirroringToCompanionDeviceWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  _QWORD v6[4];
  void (**v7)(id, _QWORD, void *);

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[HDWorkoutSessionTaskServer sessionType](self, "sessionType"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot start mirroring from a mirrored session"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__HDWorkoutSessionTaskServer_remote_startMirroringToCompanionDeviceWithCompletion___block_invoke;
    v6[3] = &unk_1E6CF13E8;
    v7 = v4;
    -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);

  }
}

void __83__HDWorkoutSessionTaskServer_remote_startMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(a2, "startMirroringToCompanionDeviceWithCompletion:", *(_QWORD *)(a1 + 32));
    v5 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Session server is nil."));
    v6 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = (void *)v6;
  }

}

- (void)remote_stopMirroringToCompanionDeviceWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  _QWORD v6[4];
  void (**v7)(id, _QWORD, void *);

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[HDWorkoutSessionTaskServer sessionType](self, "sessionType"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot stop mirroring from a mirrored session"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__HDWorkoutSessionTaskServer_remote_stopMirroringToCompanionDeviceWithCompletion___block_invoke;
    v6[3] = &unk_1E6CF13E8;
    v7 = v4;
    -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v6);

  }
}

void __82__HDWorkoutSessionTaskServer_remote_stopMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(a2, "stopMirroringToCompanionDeviceWithCompletion:", *(_QWORD *)(a1 + 32));
    v5 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Session server is nil."));
    v6 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = (void *)v6;
  }

}

- (void)remote_sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HDWorkoutSessionTaskServer_remote_sendDataToRemoteWorkoutSession_completion___block_invoke;
  v10[3] = &unk_1E6CF1460;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HDWorkoutSessionTaskServer _fetchOrSetupServerWithCompletion:]((uint64_t)self, v10);

}

void __79__HDWorkoutSessionTaskServer_remote_sendDataToRemoteWorkoutSession_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(a2, "sendDataToRemoteWorkoutSession:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Session server is nil."));
    v6 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = (void *)v6;
  }

}

- (void)observeWorkoutSessionServer:(id)a3
{
  objc_msgSend(a3, "addObserver:queue:", self, 0);
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  HDWorkoutSessionTaskServer *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__HDWorkoutSessionTaskServer_workoutSession_didChangeToState_fromState_date___block_invoke;
  v15[3] = &unk_1E6CE8030;
  v15[4] = self;
  v10 = a3;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "client_didUpdateStartDate:endDate:", v12, v13);
  if ((unint64_t)a4 <= 0x11 && ((1 << a4) & 0x3E1C2) != 0)
  {
    objc_msgSend(v11, "client_didChangeToState:date:", HKWorkoutSessionStateFromServerState(), v9);
    if (!v9)
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_fault_impl(&dword_1B7802000, v14, OS_LOG_TYPE_FAULT, "Session task server %{public}@ state change date is nil", buf, 0xCu);
      }
    }
  }

}

void __77__HDWorkoutSessionTaskServer_workoutSession_didChangeToState_fromState_date___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of state change: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)workoutSession:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HDWorkoutSessionTaskServer_workoutSession_didFailWithError___block_invoke;
  v7[3] = &unk_1E6CE8030;
  v7[4] = self;
  v5 = a4;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client_didFailWithError:", v5);

}

void __62__HDWorkoutSessionTaskServer_workoutSession_didFailWithError___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of failure: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (unint64_t)workoutDataDestinationState
{
  return 1;
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  id WeakRetained;

  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_accumulator);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    WeakRetained = 0;
  }
  return (HDWorkoutDataAccumulator *)WeakRetained;
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
  id v5;
  HKDataFlowLink *workoutDataFlowLink;
  id v7;
  _QWORD v8[4];
  id v9;
  HDWorkoutSessionTaskServer *v10;

  v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HDWorkoutSessionTaskServer_addQuantities_dataSource___block_invoke;
  v8[3] = &unk_1E6CE8008;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v8);

}

uint64_t __55__HDWorkoutSessionTaskServer_addQuantities_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addQuantities:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
  id v5;
  HKDataFlowLink *workoutDataFlowLink;
  id v7;
  _QWORD v8[4];
  id v9;
  HDWorkoutSessionTaskServer *v10;

  v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HDWorkoutSessionTaskServer_addOtherSamples_dataSource___block_invoke;
  v8[3] = &unk_1E6CE8008;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v8);

}

uint64_t __57__HDWorkoutSessionTaskServer_addOtherSamples_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addOtherSamples:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  HKDataFlowLink *workoutDataFlowLink;
  id v10;
  _QWORD v11[4];
  id v12;
  HDWorkoutSessionTaskServer *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  HDWorkoutSessionTaskServer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke;
  v14[3] = &unk_1E6CE8030;
  v14[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Notifying client of generated event", buf, 0xCu);
  }
  objc_msgSend(v7, "client_didGenerateEvents:", v5);
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke_307;
  v11[3] = &unk_1E6CE8008;
  v12 = v5;
  v13 = self;
  v10 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v11);

}

void __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of generated events: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __58__HDWorkoutSessionTaskServer_addWorkoutEvents_dataSource___block_invoke_307(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addWorkoutEvents:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  id v5;
  HKDataFlowLink *workoutDataFlowLink;
  id v7;
  _QWORD v8[4];
  id v9;
  HDWorkoutSessionTaskServer *v10;

  v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HDWorkoutSessionTaskServer_addMetadata_dataSource___block_invoke;
  v8[3] = &unk_1E6CE8008;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v8);

}

uint64_t __53__HDWorkoutSessionTaskServer_addMetadata_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addMetadata:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)updateWorkoutConfiguration:(id)a3 dataSource:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  HKDataFlowLink *workoutDataFlowLink;
  id v9;
  _QWORD v10[4];
  id v11;
  HDWorkoutSessionTaskServer *v12;
  _QWORD v13[5];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke;
  v13[3] = &unk_1E6CE8030;
  v13[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_didUpdateWorkoutConfiguration:", v5);
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke_308;
  v10[3] = &unk_1E6CE8008;
  v11 = v5;
  v12 = self;
  v9 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v10);

}

void __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of workout configuration update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __68__HDWorkoutSessionTaskServer_updateWorkoutConfiguration_dataSource___block_invoke_308(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWorkoutConfiguration:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didBeginActivity:(id)a3 dataSource:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKDataFlowLink *workoutDataFlowLink;
  id v10;
  _QWORD v11[4];
  id v12;
  HDWorkoutSessionTaskServer *v13;
  _QWORD v14[5];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke;
  v14[3] = &unk_1E6CE8030;
  v14[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_didBeginActivity:date:", v5, v8);

  workoutDataFlowLink = self->_workoutDataFlowLink;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke_309;
  v11[3] = &unk_1E6CE8008;
  v12 = v5;
  v13 = self;
  v10 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v11);

}

void __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of workout configuration update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __58__HDWorkoutSessionTaskServer_didBeginActivity_dataSource___block_invoke_309(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didBeginActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didEndActivity:(id)a3 dataSource:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKDataFlowLink *workoutDataFlowLink;
  id v10;
  _QWORD v11[4];
  id v12;
  HDWorkoutSessionTaskServer *v13;
  _QWORD v14[5];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke;
  v14[3] = &unk_1E6CE8030;
  v14[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_didEndActivity:date:", v5, v8);

  workoutDataFlowLink = self->_workoutDataFlowLink;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke_310;
  v11[3] = &unk_1E6CE8008;
  v12 = v5;
  v13 = self;
  v10 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v11);

}

void __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of workout configuration update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __56__HDWorkoutSessionTaskServer_didEndActivity_dataSource___block_invoke_310(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didSuggestActivity:(id)a3 dataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HDWorkoutSessionTaskServer_didSuggestActivity_dataSource___block_invoke;
  v9[3] = &unk_1E6CE8030;
  v9[4] = self;
  v5 = a3;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "client_didSuggestWorkoutConfiguration:date:", v7, v8);
}

void __60__HDWorkoutSessionTaskServer_didSuggestActivity_dataSource___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of suggested workout configuration : %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  HDWorkoutSessionTaskServer *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __80__HDWorkoutSessionTaskServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  v15 = &unk_1E6CECF40;
  v16 = self;
  v8 = v7;
  v17 = v8;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "client_didReceiveDataFromRemoteWorkoutSession:completion:", v6, v8, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("No client to notify of received data from remote session"), v12, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v11);

  }
}

void __80__HDWorkoutSessionTaskServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of received data from remote session: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)didSyncStateEvent:(int64_t)a3 date:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  HDWorkoutSessionTaskServer *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HDWorkoutSessionTaskServer_didSyncStateEvent_date___block_invoke;
  v9[3] = &unk_1E6CE8030;
  v9[4] = self;
  v6 = a4;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client of synced state event: %ld ", buf, 0x16u);
  }
  objc_msgSend(v7, "client_didSyncSessionEvent:date:", a3, v6);

}

void __53__HDWorkoutSessionTaskServer_didSyncStateEvent_date___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of synced state event: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)didSyncTransitionToNewState:(int64_t)a3 date:(id)a4
{
  id v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  HDWorkoutSessionTaskServer *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__HDWorkoutSessionTaskServer_didSyncTransitionToNewState_date___block_invoke;
  v15[3] = &unk_1E6CE8030;
  v15[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5380];
  v9 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    HKWorkoutSessionStateToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client of state: %{public}@ update from remote session", buf, 0x16u);

  }
  if (!v6)
  {
    _HKInitializeLogging();
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
    {
      v13 = v12;
      HKWorkoutSessionStateToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v14;
      _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "Task server %{public}@ received a nil state change from mirrored session for state: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v7, "client_didChangeToState:date:", a3, v6);

}

void __63__HDWorkoutSessionTaskServer_didSyncTransitionToNewState_date___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of state update from remote session : %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)didSyncCurrentActivity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  HDWorkoutSessionTaskServer *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __53__HDWorkoutSessionTaskServer_didSyncCurrentActivity___block_invoke;
  v10 = &unk_1E6CEF7C8;
  v11 = self;
  v12 = v4;
  v5 = v4;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client_didSyncCurrentActivity:", v5, v7, v8, v9, v10, v11);

}

void __53__HDWorkoutSessionTaskServer_didSyncCurrentActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of synced activity: %{public}@, error: %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)remoteSessionDidRecover
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HDWorkoutSessionTaskServer_remoteSessionDidRecover__block_invoke;
  v3[3] = &unk_1E6CE8030;
  v3[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client_remoteSessionDidRecover");

}

void __53__HDWorkoutSessionTaskServer_remoteSessionDidRecover__block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of remote session recovery: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)didDisconnectFromRemoteWithError:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke;
  v8[3] = &unk_1E6CE8030;
  v8[4] = self;
  v5 = a3;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke_313;
  v7[3] = &unk_1E6CE77C8;
  v7[4] = self;
  objc_msgSend(v6, "client_didDisconnectFromRemoteWithError:completion:", v5, v7);

}

void __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke(uint64_t a1, void *a2)
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
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to notify client of remote session disconnection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __63__HDWorkoutSessionTaskServer_didDisconnectFromRemoteWithError___block_invoke_313(uint64_t a1, int a2, void *a3)
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
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
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
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notified client of remote session disconnection with success: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  -[HDWorkoutSessionServer workoutDataDestination:requestsDataFrom:to:](self->_sessionServer, "workoutDataDestination:requestsDataFrom:to:", a3, a4, a5);
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  os_unfair_lock_s *p_lock;
  void (**v13)(id, uint64_t, _QWORD);
  HDWorkoutSessionServer *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  p_lock = &self->_lock;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  os_unfair_lock_lock(&self->_lock);
  v14 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  if (v14)
    -[HDWorkoutSessionServer workoutDataDestination:requestsFinalDataFrom:to:completion:](v14, "workoutDataDestination:requestsFinalDataFrom:to:completion:", v15, v10, v11, v13);
  else
    v13[2](v13, 1, 0);

}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  void *v5;
  HKWorkoutSessionTaskConfiguration *taskConfiguration;
  NSObject *v7;
  void *v8;
  int v9;
  HDWorkoutSessionTaskServer *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HKWorkoutSessionTaskConfiguration setWorkoutConfiguration:](self->_taskConfiguration, "setWorkoutConfiguration:", a4);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    taskConfiguration = self->_taskConfiguration;
    v7 = v5;
    -[HKWorkoutSessionTaskConfiguration workoutConfiguration](taskConfiguration, "workoutConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%{public}@:Updated workout configuration : %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)workoutDataDestination:(id)a3 didInsertEvent:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  HDWorkoutSessionServer *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_sessionServer;
  os_unfair_lock_unlock(p_lock);
  if (v8)
    -[HDWorkoutSessionServer workoutDataDestination:didInsertEvent:](v8, "workoutDataDestination:didInsertEvent:", v9, v6);

}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E78], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E78], "clientInterface");
}

- (void)connectionInvalidated
{
  NSObject *v3;
  HDWorkoutSessionServer *sessionServer;
  HDWorkoutSessionServer *v5;
  HDWorkoutSessionServer *v6;
  objc_super v7;
  uint8_t buf[4];
  HDWorkoutSessionTaskServer *v9;
  __int16 v10;
  HDWorkoutSessionServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    sessionServer = self->_sessionServer;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = sessionServer;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated with current session server: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_sessionServer;
  self->_sessionServer = 0;
  v6 = v5;

  os_unfair_lock_unlock(&self->_lock);
  -[HDWorkoutSessionServer invalidateTaskServer:](v6, "invalidateTaskServer:", self);
  v7.receiver = self;
  v7.super_class = (Class)HDWorkoutSessionTaskServer;
  -[HDStandardTaskServer connectionInvalidated](&v7, sel_connectionInvalidated);

}

void __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (!v4 || *(_QWORD *)(v5 + 56))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  }
  else
  {
    objc_storeStrong((id *)(v5 + 56), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(v7 + 56);
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: New session server set %{public}@", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(v4, "setTaskServer:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "addObserver:queue:", *(_QWORD *)(a1 + 32), 0);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(v4, "workoutDataFlowLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSource:", v10);

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
      objc_msgSend(v4, "setAssociatedWorkoutBuilderEntity:");
  }

}

void __64__HDWorkoutSessionTaskServer__fetchOrSetupServerWithCompletion___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, id))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (HKSource)clientSource
{
  return self->_clientSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_destroyWeak((id *)&self->_accumulator);
  objc_storeStrong((id *)&self->_builderEntity, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_sessionServer, 0);
  objc_storeStrong((id *)&self->_taskConfiguration, 0);
}

@end
