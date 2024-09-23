@implementation HDHealthAppDaemonExtension

- (HDHealthAppDaemonExtension)initWithDaemon:(id)a3
{
  id v4;
  void *v5;
  HDHealthAppDaemonExtension *v6;

  v4 = a3;
  HKCreateSerialDispatchQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDHealthAppDaemonExtension initWithDaemon:queue:](self, "initWithDaemon:queue:", v4, v5);

  return v6;
}

- (HDHealthAppDaemonExtension)initWithDaemon:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HDHealthAppDaemonExtension *v8;
  HDHealthAppDaemonExtension *v9;
  id WeakRetained;
  id v11;
  void *v12;
  HDHealthAppRestorableAlarmManager *v13;
  id v14;
  uint64_t v15;
  HDHealthAppRestorableAlarmManager *restorableAlarmManager;
  HDHealthAppSharingReminderRestorableAlarm *v17;
  id v18;
  uint64_t v19;
  HDHealthAppSharingReminderRestorableAlarm *sharableReminderAlarm;
  uint64_t v21;
  _HKDelayedOperation *delayedOperation;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthAppDaemonExtension;
  v8 = -[HDHealthAppDaemonExtension init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_observerLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_daemon, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_daemon);
    objc_msgSend(WeakRetained, "registerDaemonReadyObserver:queue:", v9, v9->_queue);

    v11 = objc_loadWeakRetained((id *)&v9->_daemon);
    objc_msgSend(v11, "primaryProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerProfileReadyObserver:queue:", v9, v9->_queue);

    v13 = [HDHealthAppRestorableAlarmManager alloc];
    v14 = objc_loadWeakRetained((id *)&v9->_daemon);
    v15 = -[HDHealthAppRestorableAlarmManager initWithDaemon:](v13, "initWithDaemon:", v14);
    restorableAlarmManager = v9->_restorableAlarmManager;
    v9->_restorableAlarmManager = (HDHealthAppRestorableAlarmManager *)v15;

    v17 = [HDHealthAppSharingReminderRestorableAlarm alloc];
    v18 = objc_loadWeakRetained((id *)&v9->_daemon);
    v19 = -[HDHealthAppSharingReminderRestorableAlarm initWithDaemon:](v17, "initWithDaemon:", v18);
    sharableReminderAlarm = v9->_sharableReminderAlarm;
    v9->_sharableReminderAlarm = (HDHealthAppSharingReminderRestorableAlarm *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD41D0]), "initWithMode:queue:delay:block:", 1, v9->_queue, &__block_literal_global_1, 0.5);
    delayedOperation = v9->_delayedOperation;
    v9->_delayedOperation = (_HKDelayedOperation *)v21;

  }
  return v9;
}

void __51__HDHealthAppDaemonExtension_initWithDaemon_queue___block_invoke()
{
  NSObject *v0;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v1;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v2;
  _QWORD v3[4];
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v4;
  uint8_t buf[16];

  _HKInitializeLogging();
  v0 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23DB70000, v0, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension requesting background generation because of profile list change", buf, 2u);
  }
  v1 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__HDHealthAppDaemonExtension_initWithDaemon_queue___block_invoke_193;
  v3[3] = &unk_250E7E1B8;
  v4 = v1;
  v2 = v1;
  -[HealthAppHealthDaemonOrchestrationClient requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:](v2, "requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:", v3);

}

void __51__HDHealthAppDaemonExtension_initWithDaemon_queue___block_invoke_193()
{
  NSObject *v0;
  uint8_t v1[16];

  _HKInitializeLogging();
  v0 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23DB70000, v0, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension background generation operation return", v1, 2u);
  }
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[_HKDelayedOperation invalidate](self->_delayedOperation, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "profileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProfileManagerObserver:", self);

  v5 = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(v5, "primaryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingEntryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)HDHealthAppDaemonExtension;
  -[HDHealthAppDaemonExtension dealloc](&v8, sel_dealloc);
}

- (void)resetProfileObservers
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSSet *observedProfileIdentifiers;
  os_unfair_lock_t lock;
  HDHealthAppDaemonExtension *v25;
  id *location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  lock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  v3 = (void *)MEMORY[0x24BDBCF20];
  location = (id *)&self->_daemon;
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "profileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allProfileIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self;
  v8 = self->_observedProfileIdentifiers;
  v9 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (-[NSSet containsObject:](v8, "containsObject:", v15))
        {
          -[NSSet addObject:](v9, "addObject:", v15);
        }
        else
        {
          v16 = objc_loadWeakRetained(location);
          objc_msgSend(v16, "profileManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "profileForIdentifier:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 && objc_msgSend(v18, "profileType") == 2)
          {
            _HKInitializeLogging();
            v19 = (void *)*MEMORY[0x24BDD3070];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              objc_msgSend(v18, "profileIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v32 = v21;
              _os_log_impl(&dword_23DB70000, v20, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension observing changes for: %@", buf, 0xCu);

            }
            objc_msgSend(v18, "sharedSummaryManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "registerObserver:", v25);

            -[NSSet addObject:](v9, "addObject:", v15);
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v12);
  }

  observedProfileIdentifiers = v25->_observedProfileIdentifiers;
  v25->_observedProfileIdentifiers = v9;

  os_unfair_lock_unlock(lock);
}

- (void)daemonReady:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23DB70000, v5, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension reported daemon ready, starting observing for profile list changes", v10, 2u);
  }
  objc_msgSend(v4, "profileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addProfileManagerObserver:", self);

  -[HDHealthAppDaemonExtension resetProfileObservers](self, "resetProfileObservers");
  objc_msgSend(v4, "primaryProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharingEntryManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_msgSend(v4, "postInstallUpdateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "registerUpdateTaskHandler:queue:", self, 0);
}

- (void)profileDidBecomeReady:(id)a3
{
  void (**unitTest_profileReadyObserverDidFinish)(void);

  -[HDHealthAppDaemonExtension updateSharingReminderScheduledAlarm](self, "updateSharingReminderScheduledAlarm", a3);
  unitTest_profileReadyObserverDidFinish = (void (**)(void))self->_unitTest_profileReadyObserverDidFinish;
  if (unitTest_profileReadyObserverDidFinish)
    unitTest_profileReadyObserverDidFinish[2]();
}

- (void)profileListDidChange
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension profile list changed", buf, 2u);
  }
  -[HDHealthAppDaemonExtension resetProfileObservers](self, "resetProfileObservers");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HDHealthAppDaemonExtension_profileListDidChange__block_invoke;
  block[3] = &unk_250E7E128;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__HDHealthAppDaemonExtension_profileListDidChange__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delayedOperation");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "execute");

}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v6;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v7;
  id v8;
  _QWORD v9[4];
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v10;
  id v11;
  uint8_t buf[16];

  v4 = a4;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23DB70000, v5, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension requesting background generation because of install/update", buf, 2u);
  }
  v6 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HDHealthAppDaemonExtension_performPostInstallUpdateTaskForManager_completion___block_invoke;
  v9[3] = &unk_250E7E640;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  v8 = v4;
  -[HealthAppHealthDaemonOrchestrationClient requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:](v7, "requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:", v9);

}

uint64_t __80__HDHealthAppDaemonExtension_performPostInstallUpdateTaskForManager_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23DB70000, v2, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension background generation for all request returning", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)sharedSummaryManagerCommittedTransactionsDidChange:(id)a3
{
  NSObject *v3;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v4;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;
  _QWORD v6[4];
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v7;
  uint8_t buf[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension requesting background generation because transactions changed", buf, 2u);
  }
  v4 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__HDHealthAppDaemonExtension_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke;
  v6[3] = &unk_250E7E1B8;
  v7 = v4;
  v5 = v4;
  -[HealthAppHealthDaemonOrchestrationClient requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:](v5, "requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:", v6);

}

void __81__HDHealthAppDaemonExtension_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _HKInitializeLogging();
  v0 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23DB70000, v0, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension background generation for feed triggered by transactions request returning", v1, 2u);
  }
}

- (void)sharingEntriesDidUpdate:(id)a3
{
  id v4;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;
  uint64_t v6;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v17;
  _QWORD v18[5];
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDHealthAppDaemonExtension updateSharingReminderScheduledAlarm](self, "updateSharingReminderScheduledAlarm");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *)v4;
  v6 = -[HealthAppHealthDaemonOrchestrationClient countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  v7 = v5;
  if (!v6)
  {
LABEL_17:

    goto LABEL_18;
  }
  v8 = v6;
  v9 = 0;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v5);
      v12 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (objc_msgSend(v12, "direction") == 1 && !objc_msgSend(v12, "status")
        || !objc_msgSend(v12, "direction") && objc_msgSend(v12, "status") == 1)
      {
        v9 = 1;
      }

    }
    v8 = -[HealthAppHealthDaemonOrchestrationClient countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      v16 = v15;
      _os_log_impl(&dword_23DB70000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running background generation because sharing entries changed", buf, 0xCu);

    }
    v17 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__HDHealthAppDaemonExtension_sharingEntriesDidUpdate___block_invoke;
    v18[3] = &unk_250E7E668;
    v18[4] = self;
    v19 = v17;
    v7 = v17;
    -[HealthAppHealthDaemonOrchestrationClient runOrRequestBackgroundGenerationWithCompletion:](v7, "runOrRequestBackgroundGenerationWithCompletion:", v18);

    goto LABEL_17;
  }
LABEL_18:

}

void __54__HDHealthAppDaemonExtension_sharingEntriesDidUpdate___block_invoke()
{
  void *v0;
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v0 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v1 = v0;
    v3 = 138543362;
    v4 = (id)objc_opt_class();
    v2 = v4;
    _os_log_impl(&dword_23DB70000, v1, OS_LOG_TYPE_DEFAULT, "[%{public}@] background generation for feed triggered by sharing entries request returning", (uint8_t *)&v3, 0xCu);

  }
}

- (void)updateSharingReminderScheduledAlarm
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_3_0(v3);
  OUTLINED_FUNCTION_2(&dword_23DB70000, v5, v6, "[%{public}@] Could not fetch sharing entries: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (HDHealthAppRestorableAlarmManager)restorableAlarmManager
{
  return self->_restorableAlarmManager;
}

- (void)setRestorableAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_restorableAlarmManager, a3);
}

- (HDHealthAppSharingReminderRestorableAlarm)sharableReminderAlarm
{
  return self->_sharableReminderAlarm;
}

- (void)setSharableReminderAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_sharableReminderAlarm, a3);
}

- (id)unitTest_profileReadyObserverDidFinish
{
  return self->_unitTest_profileReadyObserverDidFinish;
}

- (void)setUnitTest_profileReadyObserverDidFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)setDaemon:(id)a3
{
  objc_storeWeak((id *)&self->_daemon, a3);
}

- (NSSet)observedProfileIdentifiers
{
  return self->_observedProfileIdentifiers;
}

- (void)setObservedProfileIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_observedProfileIdentifiers, a3);
}

- (os_unfair_lock_s)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(os_unfair_lock_s)a3
{
  self->_observerLock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (_HKDelayedOperation)delayedOperation
{
  return self->_delayedOperation;
}

- (void)setDelayedOperation:(id)a3
{
  objc_storeStrong((id *)&self->_delayedOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observedProfileIdentifiers, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_sharableReminderAlarm, 0);
  objc_storeStrong((id *)&self->_restorableAlarmManager, 0);
  objc_storeStrong(&self->_unitTest_profileReadyObserverDidFinish, 0);
}

@end
