@implementation HDNotificationSyncManager

- (HDNotificationSyncManager)initWithProfile:(id)a3
{
  id v4;
  HDNotificationSyncManager *v5;
  HDNotificationSyncManager *v6;
  HDNotificationInstructionManager *v7;
  HDNotificationInstructionManager *notificationInstructionManager;
  id WeakRetained;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDNotificationSyncManager;
  v5 = -[HDNotificationSyncManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = -[HDNotificationInstructionManager initWithProfile:]([HDNotificationInstructionManager alloc], "initWithProfile:", v4);
    notificationInstructionManager = v6->_notificationInstructionManager;
    v6->_notificationInstructionManager = v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerDaemonReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationInstructionSyncService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:queue:", self, 0);

}

void __91__HDNotificationSyncManager__sendNanoSyncNotificationInstructionMessage_requestIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5330];
  v6 = *MEMORY[0x1E0CB5330];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = v5;
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully sent NanoSync message", (uint8_t *)&v9, 0xCu);
LABEL_7:

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = v5;
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v4;
    v8 = v10;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error sending NanoSync message: %{public}@", (uint8_t *)&v9, 0x16u);
    goto LABEL_7;
  }

}

- (void)nanoSyncManagerDidReceiveNotificationInstructionRequest:(id)a3 receivedDate:(id)a4 sendingDeviceName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDNotificationInstructionMessage *v13;
  void *v14;
  HDNotificationSyncManager *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  HDNotificationInstructionMessage *v20;
  void *v21;
  void *v22;
  HDNotificationInstruction *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  HDNotificationInstructionManager *notificationInstructionManager;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  void (**v34)(_QWORD, _QWORD, void *);
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v33 = a6;
  v12 = a4;
  v13 = [HDNotificationInstructionMessage alloc];
  objc_msgSend(v10, "notificationInstruction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pluginManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "notificationInstructionCriteriaClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HDNotificationInstructionMessage initWithCodableNotificationInstructionMessage:criteriaClasses:](v13, "initWithCodableNotificationInstructionMessage:criteriaClasses:", v14, v19);

  v21 = v11;
  objc_msgSend(v10, "requestIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HDNotificationInstruction initWithMessageIdentifier:receivedDate:sendingDeviceName:message:]([HDNotificationInstruction alloc], "initWithMessageIdentifier:receivedDate:sendingDeviceName:message:", v22, v12, v11, v20);

  _HKInitializeLogging();
  v24 = (void *)*MEMORY[0x1E0CB5330];
  v25 = *MEMORY[0x1E0CB5330];
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v24;
      *(_DWORD *)buf = 138543618;
      v39 = (id)objc_opt_class();
      v40 = 2114;
      v41 = v22;
      v27 = v39;
      _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully received NanoSync instruction: %{public}@", buf, 0x16u);

    }
    notificationInstructionManager = v15->_notificationInstructionManager;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __127__HDNotificationSyncManager_nanoSyncManagerDidReceiveNotificationInstructionRequest_receivedDate_sendingDeviceName_completion___block_invoke;
    v35[3] = &unk_1E6CE7868;
    v35[4] = v15;
    v36 = v22;
    v29 = v33;
    v37 = v33;
    -[HDNotificationInstructionManager insertNotificationInstruction:completion:](notificationInstructionManager, "insertNotificationInstruction:completion:", v23, v35);

  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v31 = v24;
      *(_DWORD *)buf = 138544130;
      v39 = (id)objc_opt_class();
      v40 = 2114;
      v41 = v10;
      v42 = 2114;
      v43 = v22;
      v44 = 2114;
      v45 = v11;
      v32 = v39;
      _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to instantiate HDNotificationInstructionMessage from NanoSync request: %{public}@ %{public}@, sendingDeviceName: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 129, CFSTR("Unable to instantiate HDNotificationInstructionMessage from NanoSync request"), v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v34;
    v34[2](v34, 0, v30);

  }
}

void __127__HDNotificationSyncManager_nanoSyncManagerDidReceiveNotificationInstructionRequest_receivedDate_sendingDeviceName_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v6;
      v11 = v9;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error persisting new instruction %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2, v6, v5);

}

- (void)notificationInstructionSyncService:(id)a3 didReceiveNotificationInstruction:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  HDNotificationInstructionManager *notificationInstructionManager;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v5;
    v8 = v12;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received new instruction: %{public}@", buf, 0x16u);

  }
  notificationInstructionManager = self->_notificationInstructionManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HDNotificationSyncManager_notificationInstructionSyncService_didReceiveNotificationInstruction___block_invoke;
  v10[3] = &unk_1E6CE77C8;
  v10[4] = self;
  -[HDNotificationInstructionManager insertNotificationInstruction:completion:](notificationInstructionManager, "insertNotificationInstruction:completion:", v5, v10);

}

void __98__HDNotificationSyncManager_notificationInstructionSyncService_didReceiveNotificationInstruction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error persisting new instruction: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (BOOL)sendNotificationInstructionMessage:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  HDCodableNotificationInstructionRequest *v15;
  HDCodableNotificationInstructionRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v28;
  _BYTE buf[24];
  void *v30;
  HDNotificationSyncManager *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  p_profile = &self->_profile;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationInstructionSyncService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v11 = objc_msgSend(v10, "sendNotificationInstructionMessage:identifier:error:", v7, &v28, a4);
  v12 = v28;

  v13 = v12;
  if (self)
  {
    v14 = v7;
    v15 = objc_alloc_init(HDCodableNotificationInstructionRequest);
    v16 = v15;
    if (v13)
    {
      -[HDCodableNotificationInstructionRequest setRequestIdentifier:](v15, "setRequestIdentifier:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableNotificationInstructionRequest setRequestIdentifier:](v16, "setRequestIdentifier:", v18);

    }
    objc_msgSend(v14, "codableMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCodableNotificationInstructionRequest setNotificationInstruction:](v16, "setNotificationInstruction:", v19);
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = (void *)objc_opt_class();
      v23 = v22;
      -[HDCodableNotificationInstructionRequest requestIdentifier](v16, "requestIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending NanoSync message: %{public}@", buf, 0x16u);

    }
    v25 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v25, "nanoSyncManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __91__HDNotificationSyncManager__sendNanoSyncNotificationInstructionMessage_requestIdentifier___block_invoke;
    v30 = &unk_1E6CE77C8;
    v31 = self;
    objc_msgSend(v26, "sendNotificationInstructionMessageRequest:completion:", v16, buf);

  }
  return v11;
}

- (HDNotificationInstructionManager)notificationInstructionManager
{
  return self->_notificationInstructionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInstructionManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
