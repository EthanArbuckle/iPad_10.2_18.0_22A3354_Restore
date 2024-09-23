@implementation HDMedicationNotificationSyncManager

- (HDMedicationNotificationSyncManager)initWithProfileExtension:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HDMedicationNotificationSyncManager *v11;

  v4 = (objc_class *)MEMORY[0x1E0D29508];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB7680];
  HKCreateSerialDispatchQueue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithProfile:clientIdentifier:queue:", v7, v8, v9);

  v11 = -[HDMedicationNotificationSyncManager initWithProfileExtension:notificationSyncClient:](self, "initWithProfileExtension:notificationSyncClient:", v5, v10);
  return v11;
}

- (HDMedicationNotificationSyncManager)initWithProfileExtension:(id)a3 notificationSyncClient:(id)a4
{
  id v6;
  id v7;
  HDMedicationNotificationSyncManager *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  HDNotificationManager *notificationManager;
  NSMutableDictionary *v13;
  NSMutableDictionary *scheduleDict;
  NSMutableDictionary *v15;
  NSMutableDictionary *broadcastedScheduleItemIdentifiers;
  id v17;
  uint64_t v18;
  HDSyncIdentityManager *syncIdentityManager;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDMedicationNotificationSyncManager;
  v8 = -[HDMedicationNotificationSyncManager init](&v22, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_profile, v9);

    objc_storeStrong((id *)&v8->_notificationSyncClient, a4);
    -[HDNotificationSyncClient setDelegate:](v8->_notificationSyncClient, "setDelegate:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&v8->_profile);
    objc_msgSend(WeakRetained, "notificationManager");
    v11 = objc_claimAutoreleasedReturnValue();
    notificationManager = v8->_notificationManager;
    v8->_notificationManager = (HDNotificationManager *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scheduleDict = v8->_scheduleDict;
    v8->_scheduleDict = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    broadcastedScheduleItemIdentifiers = v8->_broadcastedScheduleItemIdentifiers;
    v8->_broadcastedScheduleItemIdentifiers = v15;

    *(_QWORD *)&v8->_scheduleDictLock._os_unfair_lock_opaque = 0;
    v17 = objc_loadWeakRetained((id *)&v8->_profile);
    objc_msgSend(v17, "syncIdentityManager");
    v18 = objc_claimAutoreleasedReturnValue();
    syncIdentityManager = v8->_syncIdentityManager;
    v8->_syncIdentityManager = (HDSyncIdentityManager *)v18;

    objc_msgSend(v6, "medicationScheduleManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerSynchronousObserver:", v8);

  }
  return v8;
}

- (HDMedicationNotificationSyncManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (int64_t)isScheduleItemOnHold:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int64_t v12;

  v6 = a3;
  -[HDNotificationSyncClient notificationHoldInstructionsWithError:](self->_notificationSyncClient, "notificationHoldInstructionsWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    HKLogMedication();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[HDMedicationNotificationSyncManager isScheduleItemOnHold:errorOut:].cold.1();

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB6920], "categoryIdentifierFromScheduleItemIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v11))
      v12 = 1;
    else
      v12 = 2;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)scheduleManager:(id)a3 transaction:(id)a4 willReschedule:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    v12 = 138543618;
    v13 = v10;
    v14 = 2048;
    v15 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will reschedule for %ld local schedules", (uint8_t *)&v12, 0x16u);

  }
  -[HDMedicationNotificationSyncManager _willRescheduleLocalSchedules:transaction:]((uint64_t)self, v7, v8);

}

- (void)_willRescheduleLocalSchedules:(void *)a3 transaction:
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  v5 = a2;
  if (a1)
  {
    v9 = 0;
    -[HDMedicationNotificationSyncManager _fetchAllScheduleItemsWithTransaction:error:](a1, a3, (uint64_t)&v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v6)
    {
      -[HDMedicationNotificationSyncManager _cacheScheduleItems:forSchedules:](a1, v6, v5);
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationSyncManager _willRescheduleLocalSchedules:transaction:].cold.1();

    }
  }

}

- (void)scheduleManager:(id)a3 transaction:(id)a4 didReschedule:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    v12 = 138543618;
    v13 = v10;
    v14 = 2048;
    v15 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did reschedule for %ld local schedules", (uint8_t *)&v12, 0x16u);

  }
  -[HDMedicationNotificationSyncManager _didRescheduleLocalSchedules:transaction:]((uint64_t)self, v7, v8);

}

- (void)_didRescheduleLocalSchedules:(void *)a3 transaction:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[HDMedicationNotificationSyncManager _getAndReleaseCachedScheduleItemsForSchedules:](a1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    -[HDMedicationNotificationSyncManager _fetchAllScheduleItemsWithTransaction:error:](a1, v6, (uint64_t)&v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v8)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__HDMedicationNotificationSyncManager__didRescheduleLocalSchedules_transaction___block_invoke;
      v11[3] = &unk_1E6E00CB0;
      v12 = v5;
      v13 = v7;
      v14 = a1;
      v15 = v8;
      objc_msgSend(v6, "onCommit:orRollback:", v11, 0);

      v10 = v12;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationSyncManager _willRescheduleLocalSchedules:transaction:].cold.1();
    }

  }
}

- (id)_fetchAllScheduleItemsWithTransaction:(uint64_t)a3 error:
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  if (!a1)
    return 0;
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a2;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__HDMedicationNotificationSyncManager__fetchAllScheduleItemsWithTransaction_error___block_invoke;
  v11[3] = &unk_1E6E00290;
  v12 = v6;
  v7 = v6;
  LODWORD(a3) = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", 0, 0, v5, a3, v11);

  if ((_DWORD)a3)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)_cacheScheduleItems:(void *)a3 forSchedules:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(a1 + 8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    v6 = v15;
  }

}

- (id)_getAndReleaseCachedScheduleItemsForSchedules:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "UUID", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __80__HDMedicationNotificationSyncManager__didRescheduleLocalSchedules_transaction___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v20;
    *(_QWORD *)&v4 = 138543618;
    v17 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "UUID", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 48), "_handleScheduleItemsChangeForSchedule:withOldScheduleItems:andNewScheduleItems:", v8, v12, *(_QWORD *)(a1 + 56));
        }
        else
        {
          _HKInitializeLogging();
          HKLogMedication();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (void *)objc_opt_class();
            v18 = v14;
            objc_msgSend(v8, "UUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "UUIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v24 = v14;
            v25 = 2114;
            v26 = v16;
            _os_log_error_impl(&dword_1B815E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Weird, beforeChangeItems is nil. scheduleUUID=[%{public}@]", buf, 0x16u);

          }
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v5);
  }

}

uint64_t __83__HDMedicationNotificationSyncManager__fetchAllScheduleItemsWithTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

  return 1;
}

- (void)_handleScheduleItemsChangeForSchedule:(id)a3 withOldScheduleItems:(id)a4 andNewScheduleItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  HDMedicationNotificationSyncManager *v21;
  HDMedicationNotificationSyncManager *v22;
  NSObject *v23;
  NSObject *v24;
  HDMedicationNotificationSyncManager *v25;
  HDMedicationNotificationSyncManager *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  HDMedicationNotificationSyncManager *v36;
  __int16 v37;
  NSObject *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
            -[NSObject addObject:](v29, "addObject:", v15);
          if (-[HDMedicationNotificationSyncManager _shouldSendHoldInstructionForOldScheduleItem:compareWithNewScheduleItem:](self, "_shouldSendHoldInstructionForOldScheduleItem:compareWithNewScheduleItem:", v16, v17))
          {
            -[HDMedicationNotificationSyncManager _broadcastNotificationSchedule:withOldScheduleItem:andNewScheduleItem:]((uint64_t)self, v30, v16);
          }
          else
          {
            _HKInitializeLogging();
            HKLogMedication();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

            if (v19)
            {
              HKLogMedication();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                v21 = (HDMedicationNotificationSyncManager *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                v36 = v21;
                v37 = 2114;
                v38 = v16;
                v39 = 2114;
                v40 = v17;
                v22 = v21;
                _os_log_debug_impl(&dword_1B815E000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Not broadcasting for oldItem=[%{public}@], newItem=[%{public}@]", buf, 0x20u);

              }
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v12);
    }

    v23 = v29;
    if (-[NSObject count](v29, "count"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2112;
        v38 = v29;
        _os_log_impl(&dword_1B815E000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing delivered notifications from local device for scheduleItemIdentifiers: %@", buf, 0x16u);
      }

      -[HDNotificationManager removeDeliveredNotificationsForScheduleItemIdentifiers:](self->_notificationManager, "removeDeliveredNotificationsForScheduleItemIdentifiers:", v29);
    }
    v8 = v28;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (HDMedicationNotificationSyncManager *)objc_opt_class();
      v26 = v25;
      objc_msgSend(v30, "UUID");
      v27 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      v37 = 2114;
      v38 = v27;
      _os_log_impl(&dword_1B815E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] oldItems is empty. scheduleUUID=[%{public}@]", buf, 0x16u);

    }
  }

}

- (void)_broadcastNotificationSchedule:(uint64_t)a1 withOldScheduleItem:(void *)a2 andNewScheduleItem:(void *)a3
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *v13;
  void *v14;
  HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB6920];
    v7 = a2;
    v8 = [v6 alloc];
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithAction:scheduleItemIdentifier:", 2, v9);

    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "creationTimestamp");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria alloc];
    objc_msgSend(v7, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria initWithUUID:modificationDate:](v13, "initWithUUID:modificationDate:", v14, v12);
    _HKInitializeLogging();
    HKLogMedication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      objc_msgSend(v10, "categoryIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "expirationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v17;
      v35 = 2114;
      v36 = v19;
      v37 = 2114;
      v38 = v20;
      v39 = 2114;
      v40 = v12;

    }
    v21 = *(void **)(a1 + 56);
    v32 = 0;
    v22 = objc_msgSend(v21, "sendNotificationInstruction:criteria:error:", v10, v15, &v32);
    v23 = v32;
    if (v22)
    {
      objc_msgSend(v5, "identifier");
      v24 = objc_claimAutoreleasedReturnValue();
      -[HDMedicationNotificationSyncManager _updateNotificationSentTimeForScheduleItemIdentifier:](a1, v24);
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend(v5, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v29;
        v35 = 2114;
        v36 = v31;
        v37 = 2114;
        v38 = v23;

      }
    }

    _HKInitializeLogging();
    HKLogMedication();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_opt_class();
      v27 = v26;
      objc_msgSend(v10, "categoryIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v26;
      v35 = 2114;
      v36 = v28;

    }
  }

}

- (void)_updateNotificationSentTimeForScheduleItemIdentifier:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 28);
    v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v7, v4);
    os_unfair_lock_unlock(v3);

  }
}

- (BOOL)_clearMemoryCache
{
  os_unfair_lock_s *p_scheduleDictLock;

  p_scheduleDictLock = &self->_scheduleDictLock;
  os_unfair_lock_lock(&self->_scheduleDictLock);
  -[NSMutableDictionary removeAllObjects](self->_scheduleDict, "removeAllObjects");
  os_unfair_lock_unlock(p_scheduleDictLock);
  os_unfair_lock_lock(&self->_scheduleItemIdentifiersLock);
  -[NSMutableDictionary removeAllObjects](self->_broadcastedScheduleItemIdentifiers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_scheduleItemIdentifiersLock);
  return 1;
}

- (uint64_t)_hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 28);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v8 = v7;
      objc_msgSend(v5, "doubleValue");
      v10 = v8 - v9;

      if (v10 < 5.0)
      {
        a1 = 1;
LABEL_7:
        os_unfair_lock_unlock(v4);

        goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v3);
    }
    a1 = 0;
    goto LABEL_7;
  }
LABEL_8:

  return a1;
}

- (void)doseEventsAdded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  HDNotificationSyncClient *notificationSyncClient;
  int v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v41 = v6;
    v42 = 2048;
    v43 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] New HKMedicationDoseEvents are added. Count: %lu", buf, 0x16u);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v37;
    *(_QWORD *)&v10 = 138543874;
    v32 = v10;
    v33 = v8;
    do
    {
      v13 = 0;
      v34 = v11;
      do
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
        if (-[HDMedicationNotificationSyncManager _shouldSendHoldInstructionForNewDoseEvent:](self, "_shouldSendHoldInstructionForNewDoseEvent:", v14, v32))
        {
          v15 = objc_alloc(MEMORY[0x1E0CB6920]);
          objc_msgSend(v14, "scheduleItemIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithAction:scheduleItemIdentifier:", 2, v16);

          v18 = objc_alloc(MEMORY[0x1E0D29500]);
          objc_msgSend(v14, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithUUID:", v19);

          _HKInitializeLogging();
          HKLogMedication();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)objc_opt_class();
            v23 = v22;
            objc_msgSend(v17, "categoryIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v22;
            v42 = 2114;
            v43 = (uint64_t)v24;

            v8 = v33;
          }

          notificationSyncClient = self->_notificationSyncClient;
          v35 = 0;
          v26 = -[HDNotificationSyncClient sendNotificationInstruction:criteria:error:](notificationSyncClient, "sendNotificationInstruction:criteria:error:", v17, v20, &v35);
          v27 = v35;
          if (v26)
          {
            objc_msgSend(v14, "scheduleItemIdentifier");
            v28 = objc_claimAutoreleasedReturnValue();
            -[HDMedicationNotificationSyncManager _updateNotificationSentTimeForScheduleItemIdentifier:]((uint64_t)self, v28);
          }
          else
          {
            _HKInitializeLogging();
            HKLogMedication();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = (void *)objc_opt_class();
              v30 = v29;
              objc_msgSend(v14, "scheduleItemIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v32;
              v41 = v29;
              v42 = 2114;
              v43 = (uint64_t)v31;
              v44 = 2114;
              v45 = v27;

              v8 = v33;
            }
          }

          v11 = v34;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v11);
  }

}

- (BOOL)_shouldSendHoldInstructionForOldScheduleItem:(id)a3 compareWithNewScheduleItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HDMedicationNotificationSyncManager _hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:]((uint64_t)self, v8);

  if ((self & 1) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB6920];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "instructionExpirationDateForDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "scheduledDateTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "hk_isBeforeDate:", v13);

    if ((v14 & 1) != 0)
    {
      LOBYTE(v9) = 0;
    }
    else if (v7)
    {
      objc_msgSend(v6, "doses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(v7, "doses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 <= objc_msgSend(v17, "count"))
      {
        objc_msgSend(v6, "doses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doses");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "hk_containsObjectsInArray:", v19))
        {
          objc_msgSend(v6, "scheduledDateTime");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "scheduledDateTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v20, "isEqual:", v21) ^ 1;

        }
        else
        {
          LOBYTE(v9) = 1;
        }

      }
      else
      {
        LOBYTE(v9) = 1;
      }

    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  return v9;
}

- (BOOL)_shouldSendHoldInstructionForNewDoseEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "scheduleItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDMedicationNotificationSyncManager _hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:]((uint64_t)self, v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "scheduleItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(v4, "status") == 4 || objc_msgSend(v4, "status") == 5)
      && objc_msgSend(v4, "logOrigin") == 2)
    {
      objc_msgSend(v4, "hd_dataOriginProvenance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "syncIdentity");
      -[HDSyncIdentityManager currentSyncIdentity](self->_syncIdentityManager, "currentSyncIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "entity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10 == objc_msgSend(v12, "persistentID");

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6;
  NSObject *v7;

  v6 = a3;
  switch(a4)
  {
    case 3:
      _HKInitializeLogging();
      HKLogMedication();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:].cold.1((uint64_t)self, v7);

      break;
    case 2:
      -[HDMedicationNotificationSyncManager _handleHoldInstructions]((uint64_t)self);
      break;
    case 1:
      -[HDMedicationNotificationSyncManager _handleDismissInstructions]((uint64_t)self);
      break;
  }

}

- (void)_handleDismissInstructions
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (void *)OUTLINED_FUNCTION_3_1();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v2, v3, "[%{public}@] Mark pending notification instruction as processed failed with error = [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleHoldInstructions
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (void *)OUTLINED_FUNCTION_3_1();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v2, v3, "[%{public}@] Notification hold instructions returned nil with error = [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

uint64_t __65__HDMedicationNotificationSyncManager__handleDismissInstructions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D2C308]);
}

- (HDNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_storeStrong((id *)&self->_broadcastedScheduleItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_scheduleDict, 0);
}

- (void)isScheduleItemOnHold:errorOut:.cold.1()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_0();
  v1 = (void *)OUTLINED_FUNCTION_3_1();
  v2 = OUTLINED_FUNCTION_0_1(v1);
  _os_log_debug_impl(&dword_1B815E000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] On hold items: [%{public}@]", v3, 0x16u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_willRescheduleLocalSchedules:transaction:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (void *)OUTLINED_FUNCTION_3_1();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v2, v3, "[%{public}@] Fetch schedule items returned nil with error: [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)notificationSyncClient:(uint64_t)a1 didReceiveInstructionWithAction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
}

@end
