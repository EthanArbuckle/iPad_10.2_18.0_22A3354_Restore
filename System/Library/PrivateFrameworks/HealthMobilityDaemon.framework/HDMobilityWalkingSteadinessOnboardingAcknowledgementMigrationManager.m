@implementation HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager

- (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *v8;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id WeakRetained;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager;
  v8 = -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v9, 0);

  }
  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), objc_opt_class());
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "daemon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDaemonReadyObserver:queue:", self, 0);

}

- (void)daemonReady:(id)a3
{
  -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _enqueueMigration](self, "_enqueueMigration", a3);
  -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _startObservation](self, "_startObservation");
}

- (void)_startObservation
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:featureIdentifier:queue:", self, *MEMORY[0x24BDD2EA0], self->_queue);

  v7 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v7, "onboardingCompletionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerObserver:featureIdentifier:queue:", self, *MEMORY[0x24BDD2EA8], self->_queue);

}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  NSObject *v5;
  int v6;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_2160FB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature settings changed for classifications, triggering migration", (uint8_t *)&v6, 0xCu);
  }
  -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _enqueueMigration](self, "_enqueueMigration");
}

- (void)onboardingCompletionManager:(id)a3 didUpdateOnboardingCompletionsForFeatureIdentifier:(id)a4
{
  NSObject *v5;
  int v6;
  HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_2160FB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion changed for notifications, triggering migration", (uint8_t *)&v6, 0xCu);
  }
  -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _enqueueMigration](self, "_enqueueMigration");
}

- (void)_enqueueMigration
{
  id WeakRetained;
  void *v4;
  OS_dispatch_queue *queue;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke;
  v6[3] = &unk_24D4DF948;
  v6[4] = self;
  objc_msgSend(v4, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v6);

}

void __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maintenanceWorkCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE40AF8];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 16);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke_2;
  v10[3] = &unk_24D4DF948;
  v10[4] = v7;
  objc_msgSend(v5, "maintenanceOperationWithName:queue:synchronousBlock:", v6, v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueMaintenanceOperation:", v9);

}

uint64_t __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reconcileFeatures");
}

- (void)_queue_reconcileFeatures
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Error while retrieving onboarding completions, stopping onboarding acknowledgement migration: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = objc_alloc(MEMORY[0x24BDD3DD8]);
  v7 = *MEMORY[0x24BDD2EA8];
  objc_msgSend(v5, "completionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v7, 1, v8, v9, 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "onboardingCompletionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  LOBYTE(v9) = objc_msgSend(v12, "insertOnboardingCompletion:error:", v10, &v22);
  v13 = v22;

  _HKInitializeLogging();
  v14 = *MEMORY[0x24BDD3040];
  v15 = *MEMORY[0x24BDD3040];
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:].cold.1((uint64_t)self, v14, v16, v17, v18, v19, v20, v21);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:].cold.2();
  }

}

- (void)_queue_migrateNotificationOnboardingCompletionToOnboardingAcknowledgement
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Error while setting onboarding acknowledged setting: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (id)_queue_fetchFirstOnboardingCompletion
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "onboardingCompletionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD2EA0];
  v9 = 0;
  objc_msgSend(v3, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v5)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _queue_fetchFirstOnboardingCompletion].cold.1();
    v7 = 0;
  }

  return v7;
}

- (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManagerDelegate)delegate
{
  return (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2160FB000, a2, a3, "[%{public}@] Notification onboarding completion saved to reflect onboarding acknowledgement in classifications feature setting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Error while setting onboarding completion for notifications: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_fetchFirstOnboardingCompletion
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2160FB000, v0, v1, "[%{public}@] Error while retrieving onboarding completions for classifications, stopping onboarding acknowledgement migration: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
