@implementation HDMCNotificationSyncManager

- (HDMCNotificationSyncManager)initWithProfile:(id)a3
{
  id v4;
  HDMCNotificationSyncManager *v5;
  HDMCNotificationSyncManager *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  HDNotificationSyncClient *notificationSyncClient;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMCNotificationSyncManager;
  v5 = -[HDMCNotificationSyncManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x24BE40B48]);
    v8 = *MEMORY[0x24BE46AC8];
    HKCreateSerialDispatchQueue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithProfile:clientIdentifier:queue:", v4, v8, v9);
    notificationSyncClient = v6->_notificationSyncClient;
    v6->_notificationSyncClient = (HDNotificationSyncClient *)v10;

    -[HDNotificationSyncClient setDelegate:](v6->_notificationSyncClient, "setDelegate:", v6);
  }

  return v6;
}

- (void)sendNotificationInstructionsForSchedulingChanges:(id)a3 sampleInfo:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __91__HDMCNotificationSyncManager_sendNotificationInstructionsForSchedulingChanges_sampleInfo___block_invoke;
  v4[3] = &unk_24DB21CB8;
  v4[4] = self;
  objc_msgSend(a3, "hdmc_enumerateNotificationInstructionsFromAnalysisSampleInfo:block:", a4, v4);
}

void __91__HDMCNotificationSyncManager_sendNotificationInstructionsForSchedulingChanges_sampleInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v15 = 0;
  v7 = objc_msgSend(v6, "sendNotificationInstruction:criteria:error:", v5, a3, &v15);
  v8 = v15;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x24BDD3030];
  v10 = *MEMORY[0x24BDD3030];
  if (!v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = v9;
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v17 = v14;
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v8;
    v13 = v14;
    _os_log_error_impl(&dword_21961B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error sending %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v9;
    v12 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2114;
    v19 = v5;
    v13 = v12;
    _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sent %{public}@", buf, 0x16u);
LABEL_4:

  }
LABEL_6:

}

- (id)holdInstructionCategoryIdentifiersWithError:(id *)a3
{
  return (id)-[HDNotificationSyncClient notificationHoldInstructionsWithError:](self->_notificationSyncClient, "notificationHoldInstructionsWithError:", a3);
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void (**unitTest_didProcessNotificationInstruction)(void);
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromHKNotificationInstructionAction();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %{public}@", (uint8_t *)&v18, 0x16u);

  }
  if (a4 == 2)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD3048];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      v18 = 138543362;
      v19 = v14;
      v15 = v14;
      _os_log_impl(&dword_21961B000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received hold instruction. Doing nothing.", (uint8_t *)&v18, 0xCu);

    }
  }
  else if (a4 == 1)
  {
    -[HDMCNotificationSyncManager _handleDismissInstructionWithClient:](self, "_handleDismissInstructionWithClient:", v6);
  }
  else
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x24BDD3048];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_ERROR))
      -[HDMCNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:].cold.1(v16);
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction)
    unitTest_didProcessNotificationInstruction[2]();

}

- (void)_handleDismissInstructionWithClient:(id)a3
{
  id v4;
  void **v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  HDMCNotificationSyncManager *v12;
  HDMCNotificationSyncManager *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  HDMCNotificationSyncManager *v25;
  HDMCNotificationSyncManager *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  HDMCNotificationSyncManager *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void **)MEMORY[0x24BDD3030];
  v6 = *MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = self;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling dismiss instruction", buf, 0xCu);
  }
  v28 = 0;
  objc_msgSend(v4, "pendingNotificationDismissInstructionsWithError:", &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;
  _HKInitializeLogging();
  v9 = *v5;
  v10 = *v5;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v9;
      v12 = (HDMCNotificationSyncManager *)objc_opt_class();
      v13 = v12;
      objc_msgSend(v7, "messageIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v12;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification dismiss instructions with identifiers: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v7, "categoryIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "notificationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removePendingNotificationsWithIdentifiers:", v16);

    v19 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v19, "notificationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeDeliveredNotificationsWithIdentifiers:", v16);

    v27 = v8;
    LODWORD(v20) = objc_msgSend(v4, "markPendingNotificationInstructionsAsProcessed:error:", v7, &v27);
    v21 = v27;

    _HKInitializeLogging();
    v22 = *v5;
    v23 = *v5;
    if ((_DWORD)v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v22;
        v25 = (HDMCNotificationSyncManager *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = v25;
        v31 = 2114;
        v32 = v16;
        v26 = v25;
        _os_log_impl(&dword_21961B000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed notifications: %{public}@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[HDMCNotificationSyncManager _handleDismissInstructionWithClient:].cold.2(v22);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HDMCNotificationSyncManager _handleDismissInstructionWithClient:].cold.1(v9);
    v21 = v8;
  }

}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationSyncClient:(void *)a1 didReceiveInstructionWithAction:.cold.1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_4(a1);
  v2 = (id)OUTLINED_FUNCTION_3();
  NSStringFromHKNotificationInstructionAction();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_21961B000, v3, v4, "[%{public}@] Unexpected notification instruction received: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Pending notification dismiss instructions returned nil with error = [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
