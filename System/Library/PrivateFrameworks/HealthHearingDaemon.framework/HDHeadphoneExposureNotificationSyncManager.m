@implementation HDHeadphoneExposureNotificationSyncManager

- (HDHeadphoneExposureNotificationSyncManager)initWithProfile:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HDHeadphoneExposureNotificationSyncManager *v10;

  v4 = (objc_class *)MEMORY[0x24BE40B48];
  v5 = a3;
  v6 = [v4 alloc];
  HKCreateSerialDispatchQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProfile:clientIdentifier:queue:", v5, CFSTR("com.apple.Health.Hearing.HAE.Notification.SyncManager"), v7);

  objc_msgSend(v5, "notificationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDHeadphoneExposureNotificationSyncManager initWithProfile:notificationSyncClient:notificationManager:](self, "initWithProfile:notificationSyncClient:notificationManager:", v5, v8, v9);

  return v10;
}

- (HDHeadphoneExposureNotificationSyncManager)initWithProfile:(id)a3 notificationSyncClient:(id)a4 notificationManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDHeadphoneExposureNotificationSyncManager *v11;
  HDHeadphoneExposureNotificationSyncManager *v12;
  id v13;
  uint64_t v14;
  HKObserverSet *observers;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDHeadphoneExposureNotificationSyncManager;
  v11 = -[HDHeadphoneExposureNotificationSyncManager init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_notificationSyncClient, a4);
    -[HDNotificationSyncClient setDelegate:](v12->_notificationSyncClient, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_notificationManager, a5);
    v13 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v14 = objc_msgSend(v13, "initWithName:loggingCategory:", CFSTR("Headphone Exposure Notification Sync Observers"), *MEMORY[0x24BDD3000]);
    observers = v12->_observers;
    v12->_observers = (HKObserverSet *)v14;

  }
  return v12;
}

- (BOOL)notifyHAENotificationAddedWithSample:(id)a3 error:(id *)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HDNotificationSyncClient *notificationSyncClient;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3000];
  v8 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v10 = v21;
    _os_log_impl(&dword_21A0AA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify HAE Notification added with sample requested.", buf, 0xCu);

  }
  objc_msgSend(v6, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", 691200.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHeadphoneExposureNotificationSyncManager _generateResetDosageCategoryIdentifierWithDate:](self, "_generateResetDosageCategoryIdentifierWithDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3D88]), "initWithAction:categoryIdentifier:expirationDate:", 1, v14, v12);
  notificationSyncClient = self->_notificationSyncClient;
  v19 = 0;
  -[HDNotificationSyncClient sendNotificationInstruction:criteria:error:](notificationSyncClient, "sendNotificationInstruction:criteria:error:", v15, 0, &v19);
  v17 = v19;
  if (v17)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      -[HDHeadphoneExposureNotificationSyncManager notifyHAENotificationAddedWithSample:error:].cold.1();
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  return v17 == 0;
}

- (id)_generateResetDosageCategoryIdentifierWithDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("HDHAENSyncCategoryResetDosageEvent");
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_computeFireDateFromResetDosageCategoryIdentifier:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", v6);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      -[HDHeadphoneExposureNotificationSyncManager _computeFireDateFromResetDosageCategoryIdentifier:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)v11 = 138543362;
    *(_QWORD *)&v11[4] = objc_opt_class();
    v10 = *(id *)&v11[4];
    _os_log_impl(&dword_21A0AA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] added observer", v11, 0xCu);

  }
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", v7, v6, *(_OWORD *)v11);

}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_notifyObserversResetDosageForFireDate:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__HDHeadphoneExposureNotificationSyncManager__notifyObserversResetDosageForFireDate___block_invoke;
  v7[3] = &unk_24DC5F590;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __85__HDHeadphoneExposureNotificationSyncManager__notifyObserversResetDosageForFireDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveResetDosageToFireDate:", *(_QWORD *)(a1 + 32));
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  switch(a4)
  {
    case 3:
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
        -[HDHeadphoneExposureNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:].cold.2(v7);
      break;
    case 2:
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
        -[HDHeadphoneExposureNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:].cold.1(v8);
      break;
    case 1:
      -[HDHeadphoneExposureNotificationSyncManager _handleDismissNotification](self, "_handleDismissNotification");
      break;
  }

}

- (void)_handleDismissNotification
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_2_0();
  v3 = OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v4, v5, "[%{public}@] Mark pending notification instruction as processed failed with error = [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (id)_resetDosageEventIdentifiersFromNotificationCategoryIdentifiers:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("SELF beginswith[c] '");
  v9[1] = CFSTR("HDHAENSyncCategoryResetDosageEvent");
  v9[2] = CFSTR("'");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24DC61090);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleResetDosageEventsWithIdentifiers:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x24BDD3000];
  v6 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)v14 = 138543362;
    *(_QWORD *)&v14[4] = objc_opt_class();
    v8 = *(id *)&v14[4];
    _os_log_impl(&dword_21A0AA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling reset dosage events from identifiers", v14, 0xCu);

  }
  -[HDHeadphoneExposureNotificationSyncManager _extractLatestFireDateFromResetDosageEvents:](self, "_extractLatestFireDateFromResetDosageEvents:", v4, *(_OWORD *)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HDHeadphoneExposureNotificationSyncManager _notifyObserversResetDosageForFireDate:](self, "_notifyObserversResetDosageForFireDate:", v9);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = v12;
      v13 = v12;
      _os_log_impl(&dword_21A0AA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Lastest fired date found nil when extracting from category identifiers", v14, 0xCu);

    }
  }

}

- (id)_extractLatestFireDateFromResetDosageEvents:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v22;
    v10 = (os_log_t *)MEMORY[0x24BDD3000];
    *(_QWORD *)&v6 = 138543619;
    v20 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[HDHeadphoneExposureNotificationSyncManager _computeFireDateFromResetDosageCategoryIdentifier:](self, "_computeFireDateFromResetDosageCategoryIdentifier:", v12, v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (!v8 || objc_msgSend(v8, "hk_isBeforeDate:", v13))
          {
            v14 = v13;

            v8 = v14;
          }
        }
        else
        {
          _HKInitializeLogging();
          v15 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
          {
            v16 = v15;
            v17 = (void *)objc_opt_class();
            *(_DWORD *)buf = v20;
            v26 = v17;
            v27 = 2113;
            v28 = v12;
            v18 = v17;
            _os_log_error_impl(&dword_21A0AA000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Fire date found nil when computing from category identifier, found: %{private}@", buf, 0x16u);

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
}

- (void)notifyHAENotificationAddedWithSample:error:.cold.1()
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

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1);
  v2 = (void *)OUTLINED_FUNCTION_2_0();
  v3 = OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v4, v5, "[%{public}@] Notification send dismiss instructions returned with error = [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_computeFireDateFromResetDosageCategoryIdentifier:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v2);
  v3 = (id)OUTLINED_FUNCTION_2_0();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_4(&dword_21A0AA000, v4, v5, "[%{public}@] Unable to compute fire date from identifier, found %lu components", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)notificationSyncClient:(void *)a1 didReceiveInstructionWithAction:.cold.1(void *a1)
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

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_10();
  v3 = OUTLINED_FUNCTION_7_1(v2);

  OUTLINED_FUNCTION_8_0();
}

- (void)notificationSyncClient:(void *)a1 didReceiveInstructionWithAction:.cold.2(void *a1)
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

  OUTLINED_FUNCTION_5(a1);
  v2 = (void *)OUTLINED_FUNCTION_10();
  v3 = OUTLINED_FUNCTION_7_1(v2);

  OUTLINED_FUNCTION_8_0();
}

@end
