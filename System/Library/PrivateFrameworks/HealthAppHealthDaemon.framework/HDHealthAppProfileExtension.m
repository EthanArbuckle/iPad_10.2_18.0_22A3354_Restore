@implementation HDHealthAppProfileExtension

- (HDHealthAppProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDHealthAppProfileExtension *v5;
  HDHealthAppProfileExtension *v6;
  HDHealthAppDataObserver *v7;
  id WeakRetained;
  uint64_t v9;
  HDHealthAppDataObserver *dataObserver;
  HDHealthAppSharingEntryObserver *v11;
  id v12;
  uint64_t v13;
  HDHealthAppSharingEntryObserver *sharingEntryObserver;
  HDHealthAppLabConceptObserver *v15;
  id v16;
  uint64_t v17;
  HDHealthAppLabConceptObserver *labConceptObserver;
  HDHAHealthAppApplicationInstallationManager *v19;
  id v20;
  uint64_t v21;
  HDHAHealthAppApplicationInstallationManager *appInstallationManager;
  HDHealthAppEmergencySOSManager *v23;
  id v24;
  uint64_t v25;
  HDHealthAppEmergencySOSManager *emergencySOSManager;
  objc_class *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  HDAnalyticsDailyEventManager *dailyAnalyticsManager;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  HDNotificationSyncClient *healthSharingNotificationSyncClient;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  HDNotificationSyncClient *healthAppNewDeviceNotificationSyncClient;
  HDAppAnalyticsUpdateManager *v46;
  HDAppAnalyticsUpdateManager *appAnalyticsUpdateManager;
  id v48;
  void *v49;
  id v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HDHealthAppProfileExtension;
  v5 = -[HDHealthAppProfileExtension init](&v52, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDHealthAppDataObserver alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v9 = -[HDHealthAppDataObserver initWithProfile:](v7, "initWithProfile:", WeakRetained);
    dataObserver = v6->_dataObserver;
    v6->_dataObserver = (HDHealthAppDataObserver *)v9;

    v11 = [HDHealthAppSharingEntryObserver alloc];
    v12 = objc_loadWeakRetained((id *)&v6->_profile);
    v13 = -[HDHealthAppSharingEntryObserver initWithProfile:](v11, "initWithProfile:", v12);
    sharingEntryObserver = v6->_sharingEntryObserver;
    v6->_sharingEntryObserver = (HDHealthAppSharingEntryObserver *)v13;

    v15 = [HDHealthAppLabConceptObserver alloc];
    v16 = objc_loadWeakRetained((id *)&v6->_profile);
    v17 = -[HDHealthAppLabConceptObserver initWithProfile:](v15, "initWithProfile:", v16);
    labConceptObserver = v6->_labConceptObserver;
    v6->_labConceptObserver = (HDHealthAppLabConceptObserver *)v17;

    v19 = [HDHAHealthAppApplicationInstallationManager alloc];
    v20 = objc_loadWeakRetained((id *)&v6->_profile);
    v21 = -[HDHAHealthAppApplicationInstallationManager initWithProfile:](v19, "initWithProfile:", v20);
    appInstallationManager = v6->_appInstallationManager;
    v6->_appInstallationManager = (HDHAHealthAppApplicationInstallationManager *)v21;

    v23 = [HDHealthAppEmergencySOSManager alloc];
    v24 = objc_loadWeakRetained((id *)&v6->_profile);
    v25 = -[HDHealthAppEmergencySOSManager initWithProfile:](v23, "initWithProfile:", v24);
    emergencySOSManager = v6->_emergencySOSManager;
    v6->_emergencySOSManager = (HDHealthAppEmergencySOSManager *)v25;

    _HKInitializeLogging();
    v27 = (objc_class *)MEMORY[0x24BDD3918];
    v28 = (id)*MEMORY[0x24BDD3070];
    v29 = [v27 alloc];
    v30 = objc_loadWeakRetained((id *)&v6->_profile);
    v31 = (void *)objc_msgSend(v29, "initWithLoggingCategory:healthDataSource:", v28, v30);

    v32 = objc_alloc(MEMORY[0x24BE40A28]);
    v33 = objc_loadWeakRetained((id *)&v6->_profile);
    v34 = objc_msgSend(v32, "initWithProfile:eventSubmissionManager:logCategory:eventConstructor:", v33, v31, v28, &__block_literal_global);
    dailyAnalyticsManager = v6->_dailyAnalyticsManager;
    v6->_dailyAnalyticsManager = (HDAnalyticsDailyEventManager *)v34;

    v36 = objc_alloc(MEMORY[0x24BE40B48]);
    v37 = *MEMORY[0x24BDD2F28];
    HKCreateSerialDispatchQueue();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "initWithProfile:clientIdentifier:queue:", v4, v37, v38);
    healthSharingNotificationSyncClient = v6->_healthSharingNotificationSyncClient;
    v6->_healthSharingNotificationSyncClient = (HDNotificationSyncClient *)v39;

    -[HDNotificationSyncClient setDelegate:](v6->_healthSharingNotificationSyncClient, "setDelegate:", v6);
    v41 = objc_alloc(MEMORY[0x24BE40B48]);
    v42 = objc_loadWeakRetained((id *)&v6->_profile);
    HKCreateSerialDispatchQueue();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v41, "initWithProfile:clientIdentifier:queue:", v42, CFSTR("NewDeviceSetup"), v43);
    healthAppNewDeviceNotificationSyncClient = v6->_healthAppNewDeviceNotificationSyncClient;
    v6->_healthAppNewDeviceNotificationSyncClient = (HDNotificationSyncClient *)v44;

    -[HDNotificationSyncClient setDelegate:](v6->_healthAppNewDeviceNotificationSyncClient, "setDelegate:", v6);
    v46 = -[HDAppAnalyticsUpdateManager initWithProfile:]([HDAppAnalyticsUpdateManager alloc], "initWithProfile:", v4);
    appAnalyticsUpdateManager = v6->_appAnalyticsUpdateManager;
    v6->_appAnalyticsUpdateManager = v46;

    v48 = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(v48, "healthDaemon");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "registerDaemonReadyObserver:queue:", v6, 0);

    v50 = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(v50, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

HDHealthAppDailyAnalyticsEvent *__47__HDHealthAppProfileExtension_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDHealthAppDailyAnalyticsEvent *v3;

  v2 = a2;
  v3 = -[HDHealthAppDailyAnalyticsEvent initWithProfile:]([HDHealthAppDailyAnalyticsEvent alloc], "initWithProfile:", v2);

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDHealthAppProfileExtension;
  -[HDHealthAppProfileExtension dealloc](&v4, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23DB70000, v4, OS_LOG_TYPE_DEFAULT, "Health app profile extension reported daemon ready, starting observing for alert sample types", v6, 2u);
  }
  -[HDHealthAppProfileExtension dataObserver](self, "dataObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id buf[2];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23DB70000, v5, OS_LOG_TYPE_DEFAULT, "Health app profile extension reported profile ready, starting observing for Health app install status, and pausing sharing if necessary", (uint8_t *)buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_initWeak(buf, self);
  objc_copyWeak(&v7, buf);
  MobileInstallationWaitForSystemAppMigrationWithCompletion();
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);

}

void __53__HDHealthAppProfileExtension_profileDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  os_log_t *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __53__HDHealthAppProfileExtension_profileDidBecomeReady___block_invoke_cold_1((uint64_t)v3, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applicationIsInstalled:", *MEMORY[0x24BDD4608]);

    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = (os_log_t *)MEMORY[0x24BDD3070];
      v8 = *MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "Health App is not installed on this device. Updating pause state for sharing entries.", buf, 2u);
      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "profile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sharingEntryManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v12 = objc_msgSend(v11, "pauseActiveEntriesWithError:", &v15);
      v13 = v15;

      if ((v12 & 1) == 0)
      {
        _HKInitializeLogging();
        v14 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = v13;
          _os_log_impl(&dword_23DB70000, v14, OS_LOG_TYPE_DEFAULT, "Failed to update pause state for sharing entries %{public}@", buf, 0xCu);
        }
      }

    }
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = (void *)*MEMORY[0x24BDD4608];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v8)
        {

LABEL_15:
          _HKInitializeLogging();
          v15 = *MEMORY[0x24BDD3070];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_23DB70000, v15, OS_LOG_TYPE_DEFAULT, "Health App has been uninstalled", v16, 2u);
          }
          -[HDHealthAppProfileExtension _healthAppWasUninstalled:](self, "_healthAppWasUninstalled:", v10);
          goto LABEL_18;
        }
        v12 = v11;
        if (v8)
        {
          objc_msgSend(v10, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v8);

          if (v14)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

}

- (void)_healthAppWasUninstalled:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4198], "resetBuddy", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sharingEntryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "pauseActiveEntriesWithError:", &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "Failed to update pause state for sharing entries %{public}@", buf, 0xCu);
    }
  }

}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void (**unitTest_didProcessNotificationInstruction)(void);
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3048];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3048], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHKNotificationInstructionAction();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_23DB70000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", (uint8_t *)&v13, 0x16u);

  }
  switch(a4)
  {
    case 1:
      -[HDHealthAppProfileExtension _handleDismissInstruction](self, "_handleDismissInstruction");
      break;
    case 2:
      -[HDHealthAppProfileExtension _handleHoldInstruction](self, "_handleHoldInstruction");
      break;
    case 3:
      -[HDHealthAppProfileExtension _handleSendInstruction](self, "_handleSendInstruction");
      break;
    default:
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
        -[HDHealthAppProfileExtension notificationSyncClient:didReceiveInstructionWithAction:].cold.1((uint64_t)self, a4, v11);
      break;
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction)
    unitTest_didProcessNotificationInstruction[2]();
}

- (void)_handleSendInstruction
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_23DB70000, v4, v5, "[%{public}@] Error retrieving send instructions: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __53__HDHealthAppProfileExtension__handleSendInstruction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3048];
  v5 = *MEMORY[0x24BDD3048];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__HDHealthAppProfileExtension__handleSendInstruction__block_invoke_cold_1(a1, v4);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v4;
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v7 = v9;
    _os_log_impl(&dword_23DB70000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posted AAAccountNotification", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_handleHoldInstruction
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_23DB70000, v4, v5, "[%{public}@] notification hold instructions returned nil with error = [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_handleDismissInstruction
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_2(&dword_23DB70000, v4, v5, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDNotificationSyncClient)healthSharingNotificationSyncClient
{
  return self->_healthSharingNotificationSyncClient;
}

- (void)setHealthSharingNotificationSyncClient:(id)a3
{
  objc_storeStrong((id *)&self->_healthSharingNotificationSyncClient, a3);
}

- (HDAppAnalyticsUpdateManager)appAnalyticsUpdateManager
{
  return self->_appAnalyticsUpdateManager;
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HDHealthAppDataObserver)dataObserver
{
  return self->_dataObserver;
}

- (void)setDataObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataObserver, a3);
}

- (HDHealthAppLabConceptObserver)labConceptObserver
{
  return self->_labConceptObserver;
}

- (void)setLabConceptObserver:(id)a3
{
  objc_storeStrong((id *)&self->_labConceptObserver, a3);
}

- (HDHealthAppSharingEntryObserver)sharingEntryObserver
{
  return self->_sharingEntryObserver;
}

- (void)setSharingEntryObserver:(id)a3
{
  objc_storeStrong((id *)&self->_sharingEntryObserver, a3);
}

- (HDHAHealthAppApplicationInstallationManager)appInstallationManager
{
  return self->_appInstallationManager;
}

- (void)setAppInstallationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appInstallationManager, a3);
}

- (HDAnalyticsDailyEventManager)dailyAnalyticsManager
{
  return self->_dailyAnalyticsManager;
}

- (void)setDailyAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_dailyAnalyticsManager, a3);
}

- (HDHealthAppEmergencySOSManager)emergencySOSManager
{
  return self->_emergencySOSManager;
}

- (void)setEmergencySOSManager:(id)a3
{
  objc_storeStrong((id *)&self->_emergencySOSManager, a3);
}

- (HDNotificationSyncClient)healthAppNewDeviceNotificationSyncClient
{
  return self->_healthAppNewDeviceNotificationSyncClient;
}

- (void)setHealthAppNewDeviceNotificationSyncClient:(id)a3
{
  objc_storeStrong((id *)&self->_healthAppNewDeviceNotificationSyncClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthAppNewDeviceNotificationSyncClient, 0);
  objc_storeStrong((id *)&self->_emergencySOSManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_appInstallationManager, 0);
  objc_storeStrong((id *)&self->_sharingEntryObserver, 0);
  objc_storeStrong((id *)&self->_labConceptObserver, 0);
  objc_storeStrong((id *)&self->_dataObserver, 0);
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_appAnalyticsUpdateManager, 0);
  objc_storeStrong((id *)&self->_healthSharingNotificationSyncClient, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __53__HDHealthAppProfileExtension_profileDidBecomeReady___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_23DB70000, a2, OS_LOG_TYPE_ERROR, "Error migrating system applications %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)notificationSyncClient:(os_log_t)log didReceiveInstructionWithAction:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_23DB70000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected notification instruction received: %ld", (uint8_t *)&v3, 0x16u);
}

void __53__HDHealthAppProfileExtension__handleSendInstruction__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_3();
  v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_2(&dword_23DB70000, v6, v7, "[%{public}@] Failed to post notifications %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1();
}

@end
