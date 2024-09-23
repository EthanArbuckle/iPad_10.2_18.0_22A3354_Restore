@implementation ICNASnapshotBackgroundTask

- (ICNASnapshotBackgroundTask)initWithAnalyticsController:(id)a3 eventReporter:(id)a4 snapshotReporter:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICNASnapshotBackgroundTask *v12;
  ICNASnapshotBackgroundTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICNASnapshotBackgroundTask;
  v12 = -[ICNASnapshotBackgroundTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_analyticsController, a3);
    objc_storeStrong((id *)&v13->_eventReporter, a4);
    objc_storeStrong((id *)&v13->_snapshotReporter, a5);
    v13->_shouldStartSession = objc_msgSend(v9, "sessionState") == 0;
  }

  return v13;
}

+ (id)makeTaskRequest
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92680]), "initWithIdentifier:", CFSTR("com.notes.analytics.snapshotBackgroundTask"));
  objc_msgSend(v2, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v2, "setRequiresExternalPower:", 1);
  return v2;
}

- (void)didRegister:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v3 = a3;
  -[ICNASnapshotBackgroundTask eventReporter](self, "eventReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitSnapshotRegisterEventIsSuccessful:", v3);

  +[ICNASnapshotReporter sharedReporter](ICNASnapshotReporter, "sharedReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleSnapshotIfNecessary");

  dispatch_get_global_queue(-32768, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 1000000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__ICNASnapshotBackgroundTask_didRegister___block_invoke;
  v10[3] = &unk_1E771BEA8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, v9, v10);

}

void __42__ICNASnapshotBackgroundTask_didRegister___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "snapshotReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRunSnapshotManually");

  if (v3)
  {
    v4 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2;
    block[3] = &unk_1E771BE80;
    v5 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v4, v5, block);
  }
}

uint64_t __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "runTaskWithCompletion:", 0);
}

- (void)handleTaskExpiration
{
  void *v3;

  -[ICNASnapshotBackgroundTask eventReporter](self, "eventReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitSnapshotCompletionEventIsSuccessful:", 0);

  -[ICNASnapshotBackgroundTask cleanupWithCompletion:](self, "cleanupWithCompletion:", &__block_literal_global_2);
}

void __50__ICNASnapshotBackgroundTask_handleTaskExpiration__block_invoke()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __50__ICNASnapshotBackgroundTask_handleTaskExpiration__block_invoke_cold_1();

}

- (void)runTaskWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICNASnapshotBackgroundTask runTaskWithCompletion:].cold.1();

  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 27);
  if (-[ICNASnapshotBackgroundTask shouldStartSession](self, "shouldStartSession"))
  {
    objc_msgSend(MEMORY[0x1E0D639E0], "referralURLForSnapshotBackgroundTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotBackgroundTask startAnalyticsSessionWithReferralURL:referralApplication:](self, "startAnalyticsSessionWithReferralURL:referralApplication:", v6, 0);

  }
  -[ICNASnapshotBackgroundTask analyticsController](self, "analyticsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSnapshotReferralDataToSessionLevel");

  -[ICNASnapshotBackgroundTask eventReporter](self, "eventReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitSnapshotTriggeredEvent");

  +[ICNASnapshotReporter sharedReporter](ICNASnapshotReporter, "sharedReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldSnapshot");

  if (v10)
  {
    +[ICNASnapshotReporter sharedReporter](ICNASnapshotReporter, "sharedReporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke;
    v17[3] = &unk_1E771C658;
    v17[4] = self;
    v18 = v4;
    v12 = v4;
    objc_msgSend(v11, "reallyPerformSnapshotWithCompletionHandler:", v17);

    v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_13;
    v15[3] = &unk_1E771C630;
    v16 = v4;
    v14 = v4;
    -[ICNASnapshotBackgroundTask cleanupWithCompletion:](self, "cleanupWithCompletion:", v15);
    v13 = v16;
  }

}

void __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "eventReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submitSnapshotCompletionEventIsSuccessful:", 1);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2;
  v4[3] = &unk_1E771C630;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "cleanupWithCompletion:", v4);

}

uint64_t __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1();

  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 28);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BDCEC000, v2, OS_LOG_TYPE_INFO, "Snapshot not run", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 28);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)startAnalyticsSessionWithReferralURL:(id)a3 referralApplication:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICNASnapshotBackgroundTask analyticsController](self, "analyticsController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startSessionWithReferralURL:referralApplication:startingSessionType:", v7, v6, CFSTR("global"));

}

- (void)cleanupWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  if (-[ICNASnapshotBackgroundTask shouldStartSession](self, "shouldStartSession"))
  {
    -[ICNASnapshotBackgroundTask analyticsController](self, "analyticsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endSessionSynchronously:forSessionType:endReason:successHandler:", 0, CFSTR("notes"), 7, v5);

  }
  else if (v5)
  {
    v5[2]();
  }

}

- (ICNAController)analyticsController
{
  return self->_analyticsController;
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (ICNASnapshotReporter)snapshotReporter
{
  return self->_snapshotReporter;
}

- (BOOL)shouldStartSession
{
  return self->_shouldStartSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReporter, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
}

void __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Running snapshot manually", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__ICNASnapshotBackgroundTask_handleTaskExpiration__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1BDCEC000, v0, OS_LOG_TYPE_ERROR, "Snapshot background task expired", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runTaskWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Snapshot background task started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Snapshot background task completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
