@implementation HDDatabasePruningCoordinator

- (HDDatabasePruningCoordinator)initWithDaemon:(id)a3
{
  id v4;
  HDDatabasePruningCoordinator *v5;
  HDDatabasePruningCoordinator *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDatabasePruningCoordinator;
  v5 = -[HDDatabasePruningCoordinator init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_daemon, v4);
    objc_msgSend(v4, "primaryProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerProfileReadyObserver:queue:", v6, 0);

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDDatabasePruningCoordinator;
  -[HDDatabasePruningCoordinator dealloc](&v4, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  HDPeriodicActivity *v4;
  void *v5;
  void *v6;
  HDPeriodicActivity *v7;
  HDPeriodicActivity *activity;
  id WeakRetained;

  v4 = [HDPeriodicActivity alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLogInfrastructure();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:](v4, "initWithProfile:name:interval:delegate:loggingCategory:", v5, CFSTR("com.apple.healthd.prune-database"), self, v6, 28800.0);
  activity = self->_activity;
  self->_activity = v7;

}

+ (void)registerDisabledPeriodicActivitiesForUnsupportedDaemon:(id)a3
{
  id v3;

  HKLogInfrastructure();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HDPeriodicActivity registerDisabledPeriodicActivityWithName:loggingCategory:](HDPeriodicActivity, "registerDisabledPeriodicActivityWithName:loggingCategory:", CFSTR("com.apple.healthd.prune-database"), v3);

}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v5;
  id WeakRetained;
  void *v7;
  int v8;
  const char **v9;
  xpc_object_t xdict;

  v5 = (const char *)*MEMORY[0x1E0C80738];
  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v5, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  v9 = (const char **)MEMORY[0x1E0C808A8];
  if (!v8)
    v9 = (const char **)MEMORY[0x1E0C808B0];
  xpc_dictionary_set_BOOL(xdict, *v9, 1);

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  HDDaemon **p_daemon;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  HDDatabasePruningTask *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  id v28;
  id v29;
  void *v30;
  id WeakRetained;
  void *v32;
  id v33;
  id obj;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  _QWORD *v48;
  uint8_t buf[4];
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("HDPPTTestRunning")))
  {
    (*((void (**)(id, _QWORD, _QWORD, double))v5 + 2))(v5, 0, 0, 0.0);
  }
  else
  {
    v32 = v6;
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("pruneDatabase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_daemon = &self->_daemon;
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "profileManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allProfileIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __67__HDDatabasePruningCoordinator_performPeriodicActivity_completion___block_invoke;
    v38[3] = &unk_1E6CED3F8;
    v39 = v7;
    v33 = v5;
    v40 = v5;
    v11 = v7;
    v12 = v9;
    v13 = v38;
    if (self)
    {
      v29 = v11;
      v14 = objc_alloc_init(MEMORY[0x1E0D298C8]);
      v47[0] = v10;
      v47[1] = 3221225472;
      v47[2] = __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke;
      v47[3] = &unk_1E6CEFB98;
      v47[4] = self;
      v27 = v13;
      v48 = v13;
      objc_msgSend(v14, "setDidFinish:", v47);
      v35 = v14;
      objc_msgSend(v14, "beginTask");
      v15 = objc_loadWeakRetained((id *)&self->_daemon);
      objc_msgSend(v15, "profileManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v28 = v12;
      obj = v12;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v16)
      {
        v17 = v16;
        v36 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v44 != v36)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v37, "profileForIdentifier:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              _HKInitializeLogging();
              v21 = *MEMORY[0x1E0CB52C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v50 = v19;
                _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Pruning database for profile %{public}@", buf, 0xCu);
              }
              objc_msgSend(v20, "attachmentManager");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "runMaintenanceOperationIfNeeded");

              objc_msgSend(v35, "beginTask");
              v23 = -[HDDatabasePruningTask initWithProfile:]([HDDatabasePruningTask alloc], "initWithProfile:", v20);
              v24 = objc_loadWeakRetained((id *)p_daemon);
              objc_msgSend(v24, "maintenanceWorkCoordinator");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v41[0] = MEMORY[0x1E0C809B0];
              v41[1] = 3221225472;
              v41[2] = __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke_201;
              v41[3] = &unk_1E6CEB718;
              v41[4] = v19;
              v42 = v35;
              -[HDDatabasePruningTask enqueueMaintenanceOperationOnCoordinator:takeAccessibilityAssertion:nowDate:completion:](v23, "enqueueMaintenanceOperationOnCoordinator:takeAccessibilityAssertion:nowDate:completion:", v25, 1, v26, v41);

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v17);
      }

      objc_msgSend(v35, "finishTask");
      v12 = v28;
      v11 = v29;
      v13 = v27;
    }

    v6 = v32;
    v5 = v33;
  }

}

void __67__HDDatabasePruningCoordinator_performPeriodicActivity_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "invalidate");
  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);

}

void __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a4;
  objc_msgSend(v7, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    v11 = (void *)MEMORY[0x1E0C99EA0];
    v12 = v9;
    objc_msgSend(v11, "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("HDDatabasePruningLastAttemptDateKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("HDDatabasePruningCompletedKey"));

  }
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "firstObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a3, v16);
}

uint64_t __100__HDDatabasePruningCoordinator__pruneProfilesWithIdentifiers_takeAccessibilityAssertion_completion___block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "Finished pruning database for profile %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "finishTask");
}

- (id)diagnosticDescription
{
  const char *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v2 = "in";
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("HDDatabasePruningLastAttemptDateKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("HDDatabasePruningCompletedKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
      v2 = "";
  }
  else
  {
    v4 = 0;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  HKDiagnosticStringFromDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("Last attempt: %@ (%scomplete)"), v8, v2);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
