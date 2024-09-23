@implementation HDMedicationNotificationManager

- (HDMedicationNotificationManager)init
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

- (HDMedicationNotificationManager)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v6;
  id v7;
  HDMedicationNotificationManager *v8;
  HDMedicationNotificationManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HDRestorableAlarm *restorableAlarm;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HDRestorableAlarm *expirationAlarm;
  HDRestorableAlarm *v22;
  uint64_t v23;
  HDRestorableAlarm *v24;
  uint64_t v25;
  NSDate *dateAnchor;
  HKCalendarCache *v27;
  HKCalendarCache *calendarCache;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HDMedicationNotificationManager;
  v8 = -[HDMedicationNotificationManager init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0D29570]);
    objc_msgSend(v6, "healthDaemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithProfile:clientIdentifier:eventHandlerQueue:", v14, CFSTR("HDMedicationNotificationManager"), v9->_queue);
    restorableAlarm = v9->_restorableAlarm;
    v9->_restorableAlarm = (HDRestorableAlarm *)v15;

    v17 = objc_alloc(MEMORY[0x1E0D29570]);
    objc_msgSend(v6, "healthDaemon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithProfile:clientIdentifier:eventHandlerQueue:", v19, CFSTR("MedicationExpirationAlarmIdentifier"), v9->_queue);
    expirationAlarm = v9->_expirationAlarm;
    v9->_expirationAlarm = (HDRestorableAlarm *)v20;

    objc_initWeak(&location, v9);
    v22 = v9->_restorableAlarm;
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke;
    v32[3] = &unk_1E6E009B8;
    objc_copyWeak(&v33, &location);
    -[HDRestorableAlarm beginReceivingEventsWithHandler:](v22, "beginReceivingEventsWithHandler:", v32);
    v24 = v9->_expirationAlarm;
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke_2;
    v30[3] = &unk_1E6E009B8;
    objc_copyWeak(&v31, &location);
    -[HDRestorableAlarm beginReceivingEventsWithHandler:](v24, "beginReceivingEventsWithHandler:", v30);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v25 = objc_claimAutoreleasedReturnValue();
    dateAnchor = v9->_dateAnchor;
    v9->_dateAnchor = (NSDate *)v25;

    v27 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E0CB6360]);
    calendarCache = v9->_calendarCache;
    v9->_calendarCache = v27;

    objc_storeStrong((id *)&v9->_userDefaults, a4);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:date:", v6, v5, v7);

}

void __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[HDMedicationNotificationManager _queue_alarm:didReceiveDueExpirationEvents:]((uint64_t)WeakRetained, v6, v5);

}

- (void)_queue_alarm:(void *)a3 didReceiveDueExpirationEvents:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    HKLogMedication();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = a1;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due expiration events: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(v6, "hk_map:", &__block_literal_global_7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "notificationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeDeliveredNotificationsForScheduleItemIdentifiers:", v9);

      -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:](a1, v5, v6);
    }

  }
}

- (BOOL)rescheduleMedicationsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  BOOL v7;
  int v9;
  HDMedicationNotificationManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling medications", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDMedicationNotificationManager _rescheduleMedicationsFromDate:error:](self, "_rescheduleMedicationsFromDate:error:", v6, a3);

  return v7;
}

- (BOOL)areDoseRemindersEnabled
{
  return -[HDMedicationNotificationManager _doseReminderSettingIsDisabled]((uint64_t)self) ^ 1;
}

- (uint64_t)_doseReminderSettingIsDisabled
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  id WeakRetained;
  void *v6;

  if (result)
  {
    v1 = result;
    v2 = *MEMORY[0x1E0D2C2B8];
    objc_msgSend(*(id *)(result + 56), "objectForKey:", *MEMORY[0x1E0D2C2B8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_msgSend(*(id *)(v1 + 56), "BOOLForKey:", v2);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
      objc_msgSend(WeakRetained, "notificationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "areHealthNotificationsAuthorized");

    }
    return v4 ^ 1u;
  }
  return result;
}

- (BOOL)_rescheduleMedicationsFromDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  HDMedicationNotificationManager *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling medications from date: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:error:](self, "_scheduleMedicationsFromDate:clearNotSentItems:error:", v6, 1, a4);
  return v8;
}

- (BOOL)_scheduleMedicationsFromDate:(id)a3 clearNotSentItems:(BOOL)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  BOOL v20;
  BOOL v21;
  uint8_t buf[4];
  HDMedicationNotificationManager *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[HDMedicationNotificationManager areDoseRemindersEnabled](self, "areDoseRemindersEnabled");
  _HKInitializeLogging();
  HKLogMedication();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v23 = self;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling medications from date: %{public}@, clearItems: %{public}@, areDoseRemindersEnabled: %{public}@", buf, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__HDMedicationNotificationManager__scheduleMedicationsFromDate_clearNotSentItems_error___block_invoke;
  v18[3] = &unk_1E6E009E0;
  v18[4] = self;
  v19 = v8;
  v20 = a4;
  v21 = v9;
  v15 = v8;
  v16 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMedicationScheduleItemEntity, "performWriteTransactionWithHealthDatabase:error:block:", v14, a5, v18);

  return v16;
}

uint64_t __88__HDMedicationNotificationManager__scheduleMedicationsFromDate_clearNotSentItems_error___block_invoke(uint64_t a1, void *a2, NSObject **a3)
{
  return -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), a2, a3);
}

- (uint64_t)_scheduleMedicationsFromDate:(int)a3 clearNotSentItems:(int)a4 areDoseRemindersEnabled:(void *)a5 transaction:(NSObject *)a6 error:
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  char v31;
  id v32;
  BOOL v33;
  id v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  NSObject *v58;
  _BOOL4 v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  char v69;
  char v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  id v77;
  NSObject *v78;
  _BOOL4 v79;
  NSObject *v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  _BOOL4 v84;
  NSObject *v85;
  NSObject *v86;
  BOOL v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  char v94;
  NSObject *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  NSObject *v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  unsigned __int8 v121;
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  id v125;
  __int16 v126;
  id v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a5;
  if (!a1)
  {
    v19 = 0;
    goto LABEL_148;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v123 = a1;
    v124 = 2114;
    v125 = v11;
    v126 = 2114;
    v127 = v14;
    _os_log_impl(&dword_1B815E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling medications with transactions from date: %{public}@, clearItems: %{public}@", buf, 0x20u);

  }
  if (-[HDMedicationNotificationManager _schedulingIsEnabled](a1))
  {
    if (a4)
    {
      v120 = 0;
      -[HDMedicationNotificationManager _removeDeliveredNotificationsLoggedAsTakenOrSkippedNotFromNotificationInterfaceWithError:](a1, &v120);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v120;
      _HKInitializeLogging();
      HKLogMedication();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v123 = a1;
          v124 = 2114;
          v125 = v15;
          _os_log_impl(&dword_1B815E000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempted to remove delivered notifications taken or skipped outside of notification UI: %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.12();
      }

      v119 = v16;
      v20 = -[HDMedicationNotificationManager _removeExpirationEventsForIdentifiers:error:](a1, v15, (uint64_t)&v119);
      v21 = v119;

      _HKInitializeLogging();
      HKLogMedication();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v20)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v123 = a1;
          v124 = 2114;
          v125 = v24;
          _os_log_impl(&dword_1B815E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed %{public}@ overdue expiration events", buf, 0x16u);

        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.11();
      }

    }
    v118 = 0;
    -[HDMedicationNotificationManager _notificationSentScheduleItemsWithTransaction:error:]((void *)a1, v12, (uint64_t)&v118);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v118;
    if (!v25)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.1();

      goto LABEL_78;
    }
    if (a3)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v123 = a1;
        _os_log_impl(&dword_1B815E000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing items", buf, 0xCu);
      }

      v117 = 0;
      -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:]((id *)a1, v11, 1, 1, v12, &v117);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v117;

      if (!v28)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v123 = a1;
          v124 = 2114;
          v125 = v11;
          v126 = 2114;
          v127 = v29;
          _os_log_error_impl(&dword_1B815E000, v44, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to prune schedule items before date %{public}@ error: %{public}@", buf, 0x20u);
        }

        v45 = v29;
        if (v45)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v45);
          else
            _HKLogDroppedError();
        }

        goto LABEL_78;
      }
      v116 = 0;
      v31 = -[HDMedicationNotificationManager _deleteNotInteractedAndNotLoggedDoseEventFor:transaction:error:](a1, v11, v30, (uint64_t)&v116);
      v32 = v116;
      if ((v31 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v123 = a1;
          v124 = 2114;
          v125 = v11;
          v126 = 2114;
          v127 = v32;
          _os_log_error_impl(&dword_1B815E000, v46, OS_LOG_TYPE_ERROR, "[%{public}@] Could not delete NotInteracted and NotLogged dosevents for date %{public}@ error: %{public}@", buf, 0x20u);
        }

        v47 = v32;
        if (v47)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v47);
          else
            _HKLogDroppedError();
        }

        goto LABEL_78;
      }
      v115 = 0;
      v33 = -[HDMedicationNotificationManager _removeAllScheduleItemsWithTransaction:error:](a1, v12, (uint64_t)&v115);
      v34 = v115;
      if (v33)
      {
        v35 = *(void **)(a1 + 24);
        v114 = 0;
        v36 = objc_msgSend(v35, "removeAllEventsWithError:", &v114);
        v105 = v114;
        if ((v36 & 1) != 0)
        {
          v113 = 0;
          -[HDMedicationNotificationManager _expirationEventsToRemoveAtDate:error:]((id *)a1, v11, (uint64_t)&v113);
          v37 = objc_claimAutoreleasedReturnValue();
          v101 = (void *)v37;
          v103 = v113;
          if (v37)
          {
            v38 = *(void **)(a1 + 32);
            v112 = 0;
            v39 = objc_msgSend(v38, "removeEvents:error:", v37, &v112);
            v99 = v112;
            if ((v39 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
              v40 = objc_claimAutoreleasedReturnValue();
              v41 = *(void **)(a1 + 40);
              *(_QWORD *)(a1 + 40) = v40;

              v42 = 0;
            }
            else
            {
              _HKInitializeLogging();
              HKLogMedication();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.8();

              v55 = v99;
              if (v55)
              {
                if (a6)
                  *a6 = objc_retainAutorelease(v55);
                else
                  _HKLogDroppedError();
              }

              v121 = 0;
              v42 = 1;
            }

          }
          else
          {
            _HKInitializeLogging();
            HKLogMedication();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.7();

            v53 = v103;
            if (v53)
            {
              if (a6)
                *a6 = objc_retainAutorelease(v53);
              else
                _HKLogDroppedError();
            }

            v121 = 0;
            v42 = 1;
          }

        }
        else
        {
          _HKInitializeLogging();
          HKLogMedication();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.9();

          v51 = v105;
          if (v51)
          {
            if (a6)
              *a6 = objc_retainAutorelease(v51);
            else
              _HKLogDroppedError();
          }

          v121 = 0;
          v42 = 1;
        }

      }
      else
      {
        _HKInitializeLogging();
        HKLogMedication();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.10();

        v49 = v34;
        if (v49)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v49);
          else
            _HKLogDroppedError();
        }

        v121 = 0;
        v42 = 1;
      }

      if (v42)
      {
LABEL_78:
        v19 = 0;
LABEL_147:

        goto LABEL_148;
      }
    }
    v56 = v11;
    objc_msgSend(v56, "dateByAddingTimeInterval:", 1814400.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "hk_isAfterOrEqualToDate:", v57))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);

      if (v59)
      {
        HKLogMedication();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v123 = a1;
          _os_log_impl(&dword_1B815E000, v60, OS_LOG_TYPE_INFO, "[%{public}@] Generation window already scheduled.", buf, 0xCu);
        }

      }
      v121 = 1;
      goto LABEL_146;
    }
    v61 = v57;
    v62 = v26;
    v63 = v56;
    if (objc_msgSend(*(id *)(a1 + 40), "hk_isAfterOrEqualToDate:", v56))
    {
      v63 = *(id *)(a1 + 40);

    }
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0;
    v106 = v63;
    -[HDMedicationNotificationManager _activeSchedulesFromDate:calendar:transaction:error:](a1, v63, v64, v12, (uint64_t)&v111);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v65;
    v104 = v111;
    if (!v65)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.2();

      v76 = v104;
      v77 = v104;
      v26 = v62;
      v57 = v61;
      if (v77)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v77);
        else
          _HKLogDroppedError();
      }

      v121 = 0;
      goto LABEL_145;
    }
    if (!objc_msgSend(v65, "count"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = os_log_type_enabled(v78, OS_LOG_TYPE_INFO);

      v26 = v62;
      v57 = v61;
      if (v79)
      {
        HKLogMedication();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v123 = a1;
          _os_log_impl(&dword_1B815E000, v80, OS_LOG_TYPE_INFO, "[%{public}@] No active schedules.", buf, 0xCu);
        }

      }
      v121 = 1;
      v76 = v104;
      goto LABEL_145;
    }
    v110 = 0;
    -[HDMedicationNotificationManager _generateScheduleItemsWithSchedules:fromDate:endDate:calendar:error:](a1, v65, v106, v61, v64, (uint64_t)&v110);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v66;
    v100 = v110;
    if (!v66)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v81 = objc_claimAutoreleasedReturnValue();
      v26 = v62;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.3();

      v82 = v100;
      v76 = v104;
      v57 = v61;
      if (v82)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v82);
        else
          _HKLogDroppedError();
      }

      v121 = 0;
      goto LABEL_144;
    }
    v97 = v64;
    v67 = objc_msgSend(v66, "count");
    v68 = v66;
    v26 = v62;
    if (!v67)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v83 = objc_claimAutoreleasedReturnValue();
      v84 = os_log_type_enabled(v83, OS_LOG_TYPE_INFO);

      v57 = v61;
      if (v84)
      {
        HKLogMedication();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v123 = a1;
          _os_log_impl(&dword_1B815E000, v85, OS_LOG_TYPE_INFO, "[%{public}@] No generated schedule items.", buf, 0xCu);
        }

      }
      v121 = 1;
      goto LABEL_143;
    }
    v109 = 0;
    v69 = -[HDMedicationNotificationManager _saveScheduleItems:notificationSentScheduleItems:transaction:error:](a1, v68, v25, v12, &v109);
    v96 = v109;
    v57 = v61;
    if ((v69 & 1) != 0)
    {
      v107 = 0;
      v70 = -[HDMedicationNotificationManager _scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:](a1, v12, v56, &v107);
      v71 = v107;
      v94 = v70;
      if ((v70 & 1) != 0)
      {
        v72 = v57;
        v73 = *(NSObject **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v72;
        v74 = v96;
        v64 = v97;
LABEL_141:
        LOBYTE(a6) = v94;
        goto LABEL_142;
      }
      _HKInitializeLogging();
      HKLogMedication();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.4();

      v90 = v71;
      v73 = v90;
      v74 = v96;
      v64 = v97;
      if (v90)
      {
        if (a6)
        {
          v73 = objc_retainAutorelease(v90);
          *a6 = v73;
          v71 = v73;
          goto LABEL_141;
        }
        _HKLogDroppedError();
      }
      v71 = v73;
      goto LABEL_141;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.6();

    v108 = 0;
    v87 = -[HDMedicationNotificationManager _removeAllScheduleItemsNotSentWithTransaction:error:]((void *)a1, v12, (uint64_t)&v108);
    v95 = v108;
    v64 = v97;
    if (!v87)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.5();

      v92 = v95;
      v73 = v92;
      if (v92)
      {
        v74 = v96;
        if (a6)
        {
          v73 = objc_retainAutorelease(v92);
          *a6 = v73;
          LOBYTE(a6) = 0;
        }
        else
        {
          _HKLogDroppedError();
        }
        v71 = v73;
      }
      else
      {
        LOBYTE(a6) = 0;
        v71 = 0;
        v74 = v96;
      }
      goto LABEL_142;
    }
    v74 = v96;
    v88 = v96;
    v73 = v88;
    if (v88)
    {
      if (!a6)
      {
        _HKLogDroppedError();
        goto LABEL_138;
      }
      v73 = objc_retainAutorelease(v88);
      *a6 = v73;
    }
    LOBYTE(a6) = 0;
LABEL_138:
    v71 = v95;
LABEL_142:

    v121 = a6;
LABEL_143:
    v76 = v104;
LABEL_144:

LABEL_145:
    v56 = v106;
LABEL_146:

    v19 = v121;
    goto LABEL_147;
  }
  v19 = 1;
LABEL_148:

  return v19;
}

- (uint64_t)_schedulingIsEnabled
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 8));
    objc_msgSend(WeakRetained, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "behavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "healthAppHiddenOrNotInstalled");

    if (v5)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543362;
        v8 = v1;
        _os_log_impl(&dword_1B815E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling disabled. Health app is hidden or not installed.", (uint8_t *)&v7, 0xCu);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (id)_removeDeliveredNotificationsLoggedAsTakenOrSkippedNotFromNotificationInterfaceWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  id v13;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HDMedicationNotificationManager _takenOrSkippedAlarmIdentifiersSince:error:](a1, (uint64_t)v4, (uint64_t)&v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "notificationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeDeliveredNotificationsForScheduleItemIdentifiers:", v5);

    }
    v10 = v5;
  }
  else
  {
    v11 = v6;
    if (v11)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  return v5;
}

- (uint64_t)_removeExpirationEventsForIdentifiers:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "allScheduledEventsWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __79__HDMedicationNotificationManager__removeExpirationEventsForIdentifiers_error___block_invoke;
      v10[3] = &unk_1E6E00C38;
      v11 = v5;
      objc_msgSend(v6, "hk_filter:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "removeEvents:error:", v7, a3);

    }
    else
    {
      v8 = v6 != 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_notificationSentScheduleItemsWithTransaction:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v5 = a2;
    -[HDMedicationNotificationManager _scheduleItemsSentPredicate](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMedicationNotificationManager _scheduleItemsWithPredicate:transaction:error:]((uint64_t)a1, v6, v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_pruneAllScheduleItemsBefore:(int)a3 createDoseEvents:(int)a4 excludeDoseEventCreationForGivenDate:(void *)a5 transaction:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  id *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a5;
  if (!a1)
  {
    v26 = 0;
    goto LABEL_30;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v34 = a1;
    v35 = 2114;
    v36 = v11;
    v37 = 2114;
    v38 = v14;
    v39 = 2114;
    v40 = v15;
    _os_log_impl(&dword_1B815E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pruning all schedule items with transaction before date: %{public}@, createDoseEvents: %{public}@, excludeDoseEventCreationForGivenDate: %{public}@", buf, 0x2Au);

  }
  HDMedicationScheduleItemPredicateForScheduledDateTime(3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a4)
  {
    objc_msgSend(a1[6], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startOfDayForDate:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationScheduleItemPredicateForScheduledDateTime(3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0;
  -[HDMedicationNotificationManager _scheduleItemsWithPredicate:transaction:error:]((uint64_t)a1, v17, v12, (uint64_t)&v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v32;
  if (v20)
  {
    if (!objc_msgSend(v20, "count") || !a3)
    {
LABEL_11:
      if (+[HDMedicationScheduleItemEntity deleteMedicationScheduleItemsWithPredicate:transaction:error:](HDMedicationScheduleItemEntity, "deleteMedicationScheduleItemsWithPredicate:transaction:error:", v16, v12, a6))
      {
        v25 = v20;
      }
      else
      {
        v25 = 0;
      }
      v26 = v25;
      goto LABEL_29;
    }
    v31 = 0;
    v22 = -[HDMedicationNotificationManager _saveNotInteractedDoseEventsForScheduleItems:transaction:error:](a1, v20, v12, (uint64_t)&v31);
    v23 = v31;
    v24 = v23;
    if ((v22 & 1) != 0)
    {

      goto LABEL_11;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:].cold.2();

    v28 = v24;
    if (v28)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v28);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:].cold.1();

    v28 = v21;
    if (v28)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v28);
      else
        _HKLogDroppedError();
    }
  }

  v26 = 0;
LABEL_29:

LABEL_30:
  return v26;
}

- (uint64_t)_deleteNotInteractedAndNotLoggedDoseEventFor:(uint64_t)a3 transaction:(uint64_t)a4 error:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = *(void **)(a1 + 48);
  v7 = a2;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startOfDayForDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v9, 86400.0);
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDateInterval();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationDoseEventEntityPredicateForStatuses();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForLogOrigin();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29840];
  v28[0] = v12;
  v28[1] = v13;
  v28[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "dataManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:recursiveDeleteAuthorizationBlock:error:", objc_opt_class(), v17, *MEMORY[0x1E0D29968], &v23, 1, 1, 0, a4);

  _HKInitializeLogging();
  HKLogMedication();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = a1;
    v26 = 2048;
    v27 = v23;
    _os_log_impl(&dword_1B815E000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %ld 'not interacted' and 'not logged' dose events", buf, 0x16u);
  }

  return v20;
}

- (BOOL)_removeAllScheduleItemsWithTransaction:(uint64_t)a3 error:
{
  id v5;
  NSObject *v6;
  _BOOL8 v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = a1;
    _os_log_impl(&dword_1B815E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all schedule items with transaction", (uint8_t *)&v9, 0xCu);
  }

  v7 = +[HDMedicationScheduleItemEntity deleteMedicationScheduleItemsWithPredicate:transaction:error:](HDMedicationScheduleItemEntity, "deleteMedicationScheduleItemsWithPredicate:transaction:error:", 0, v5, a3);
  return v7;
}

- (id)_expirationEventsToRemoveAtDate:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1[4], "allScheduledEventsWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__HDMedicationNotificationManager__expirationEventsToRemoveAtDate_error___block_invoke;
      v8[3] = &unk_1E6E00BB0;
      v9 = v5;
      objc_msgSend(v6, "hk_map:", v8);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)_activeSchedulesFromDate:(void *)a3 calendar:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id WeakRetained;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _QWORD v57[4];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v48 = v8;
  if (a1)
  {
    v9 = v8;
    v10 = a4;
    objc_msgSend(a3, "startOfDayForDate:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", 1814400.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationSchedulePredicateForStartDateTime(3);
    v13 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v11;
    HDMedicationSchedulePredicateForEndDateTime(6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D29840];
    v60[0] = v13;
    v60[1] = v14;
    v44 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateMatchingAllPredicates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    HDMedicationSchedulePredicateForNilEndDateTime();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D29840];
    v45 = (void *)v13;
    v59[0] = v13;
    v59[1] = v18;
    v42 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateMatchingAllPredicates:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    +[HDMedicationScheduleEntity availableSchedulePredicate](HDMedicationScheduleEntity, "availableSchedulePredicate");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0D29840];
    v43 = (void *)v17;
    v58[0] = v17;
    v58[1] = v21;
    v41 = (void *)v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predicateMatchingAnyPredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29848], "doesNotContainPredicateWithProperty:values:", CFSTR("schedule_type"), &unk_1E6E11550);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationSchedulePredicateForActiveMedications();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0D29840];
    v40 = (void *)v22;
    v57[0] = v22;
    v57[1] = v26;
    v57[2] = v25;
    v57[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateMatchingAllPredicates:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = a1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "medicationScheduleManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "medicationSchedulesWithPredicate:transaction:error:", v30, v10, a5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    HKLogMedication();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v50 = v31;
      v51 = 2114;
      v52 = v48;
      v53 = 2114;
      v54 = v37;
      v55 = 2114;
      v56 = v38;
      _os_log_impl(&dword_1B815E000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Active schedules from date: %{public}@, %{public}@ active schedules: %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)_generateScheduleItemsWithSchedules:(void *)a3 fromDate:(void *)a4 endDate:(void *)a5 calendar:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDNotificationEngineConfiguration *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  if (a1)
  {
    v12 = a5;
    v13 = a4;
    v14 = a3;
    v15 = -[HDNotificationEngineConfiguration initWithCalendar:startGenerationDate:endGenerationDate:]([HDNotificationEngineConfiguration alloc], "initWithCalendar:startGenerationDate:endGenerationDate:", v12, v14, v13);

    +[HDMedicationNotificationEngine generateForSchedules:configuration:error:](HDMedicationNotificationEngine, "generateForSchedules:configuration:error:", v11, v15, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544386;
      v24 = a1;
      v25 = 2114;
      v26 = v18;
      v27 = 2114;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      v31 = 2114;
      v32 = v21;
      _os_log_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generated %{public}@ schedule items: %{public}@, for %{public}@ schedules: %{public}@", (uint8_t *)&v23, 0x34u);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (uint64_t)_saveScheduleItems:(void *)a3 notificationSentScheduleItems:(void *)a4 transaction:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  id v36;
  id obj;
  id v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v36 = a3;
  v10 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = a1;
      v47 = 2114;
      v48 = v12;
      v49 = 2114;
      v50 = v13;
      _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving %{public}@ schedule items with transaction: %{public}@", buf, 0x20u);

    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v9;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = v14;
      v33 = a1;
      v34 = a5;
      v35 = v9;
      v16 = *(_QWORD *)v41;
      v17 = v36;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __102__HDMedicationNotificationManager__saveScheduleItems_notificationSentScheduleItems_transaction_error___block_invoke;
          v39[3] = &unk_1E6E00AB0;
          v39[4] = v19;
          objc_msgSend(v17, "hk_firstObjectPassingTest:", v39);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v19;
          if (v20 && objc_msgSend(v20, "notificationSent"))
          {
            v22 = objc_alloc(MEMORY[0x1E0D2C4A8]);
            objc_msgSend(v21, "scheduledDateTime");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doses");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "initWithScheduledDateTime:notificationSent:doses:", v23, 1, v24);

            v17 = v36;
            v21 = (id)v25;
          }
          v38 = 0;
          +[HDMedicationScheduleItemEntity insertMedicationScheduleItem:transaction:error:](HDMedicationScheduleItemEntity, "insertMedicationScheduleItem:transaction:error:", v21, v10, &v38);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v38;

          if (!v26)
          {
            _HKInitializeLogging();
            HKLogMedication();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[HDMedicationNotificationManager _saveScheduleItems:notificationSentScheduleItems:transaction:error:].cold.1(v33, (uint64_t)v27, v29);

            v30 = v27;
            v31 = v30;
            if (v30)
            {
              if (v34)
                *v34 = objc_retainAutorelease(v30);
              else
                _HKLogDroppedError();
            }

            v28 = 0;
            goto LABEL_24;
          }

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v15)
          continue;
        break;
      }
      v28 = 1;
LABEL_24:
      v9 = v35;
    }
    else
    {
      v28 = 1;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)_removeAllScheduleItemsNotSentWithTransaction:(uint64_t)a3 error:
{
  id v5;
  NSObject *v6;
  void *v7;
  _BOOL8 v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = a1;
    _os_log_impl(&dword_1B815E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all not sent schedule items with transaction", (uint8_t *)&v10, 0xCu);
  }

  -[HDMedicationNotificationManager _scheduleItemsNotSentPredicate](a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HDMedicationScheduleItemEntity deleteMedicationScheduleItemsWithPredicate:transaction:error:](HDMedicationScheduleItemEntity, "deleteMedicationScheduleItemsWithPredicate:transaction:error:", v7, v5, a3);

  return v8;
}

- (uint64_t)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:(void *)a3 date:(NSObject *)a4 error:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_32;
  }
  v8 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = a1;
    _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling restorable alarms with next schedule items", buf, 0xCu);
  }

  v29 = 0;
  v30 = 0;
  -[HDMedicationNotificationManager _nextScheduleItemsWithTransaction:date:snoozeFireDates:error:](a1, v8, v7, &v30, (uint64_t)&v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v30;
  v12 = v29;
  if (!v10)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[HDMedicationNotificationManager _scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:].cold.1();

    v24 = v12;
    v21 = v24;
    if (v24)
    {
      if (a4)
      {
        v21 = objc_retainAutorelease(v24);
        v20 = 0;
        *a4 = v21;
LABEL_30:

        goto LABEL_31;
      }
      _HKLogDroppedError();
    }
    v20 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v11, "count"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (v14)
      {
        HKLogMedication();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = a1;
          v33 = 2114;
          v34 = v16;
          _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Snoozed %{public}@ notification with identifiers, removing from Notifications Center", buf, 0x16u);

        }
      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "notificationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeDeliveredNotificationsForScheduleItemIdentifiers:", v19);

    }
    v28 = 0;
    v20 = -[HDMedicationNotificationManager _scheduleRestorableAlarmWithItems:date:snoozeFireDates:error:](a1, v10, v7, v11, (uint64_t)&v28);
    v21 = v28;
    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:].cold.2();

      v21 = v21;
      if (v21)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

    }
    goto LABEL_30;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v25 = objc_claimAutoreleasedReturnValue();
  v20 = 1;
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);

  if (v26)
  {
    HKLogMedication();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = a1;
      _os_log_impl(&dword_1B815E000, v21, OS_LOG_TYPE_INFO, "[%{public}@] Cannot add next alarm. There are no more schedule items.", buf, 0xCu);
    }
    goto LABEL_30;
  }
LABEL_31:

LABEL_32:
  return v20;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  HDMedicationNotificationManager *v16;
  HDMedicationNotificationManager *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  id WeakRetained;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  char v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  id v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id *location;
  id v53;
  _QWORD v54[5];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  HDMedicationNotificationManager *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  HKLogMedication();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v62 = self;
    v63 = 2114;
    v64 = v12;
    v65 = 2114;
    v66 = v9;
    _os_log_impl(&dword_1B815E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due events: %{public}@", buf, 0x20u);

  }
  if ((-[HDMedicationNotificationManager _notificationIsEnabled]((uint64_t)self) & 1) != 0)
  {
    v46 = v10;
    v47 = v9;
    -[HDMedicationNotificationManager _alarm:filterDueEventsToHandle:date:]((uint64_t)self, v8, v9, v10);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (!v51)
      goto LABEL_34;
    location = (id *)&self->_profile;
    v49 = *(_QWORD *)v57;
    v50 = v8;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v57 != v49)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v13);
        _HKInitializeLogging();
        HKLogMedication();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (HDMedicationNotificationManager *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v62 = v16;
          v63 = 2114;
          v64 = v14;
          v17 = v16;
          _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling due event: %{public}@", buf, 0x16u);

        }
        objc_msgSend(v14, "eventIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scheduleItemIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v18);

        if ((v20 & 1) != 0)
        {
          v21 = 0;
LABEL_18:
          v22 = 0;
          goto LABEL_19;
        }
        v21 = objc_msgSend(v14, "isFollowUpNotificationEvent");
        v22 = objc_msgSend(v14, "isCriticalNotificationEvent");
        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(WeakRetained, "notificationManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "areHealthCriticalAlertsAuthorized");

        if ((_DWORD)v22 && (v25 & 1) == 0)
        {
          _HKInitializeLogging();
          HKLogMedication();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            HKSensitiveLogItem();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = self;
            v63 = 2114;
            v64 = v27;
            _os_log_impl(&dword_1B815E000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Critical alerts are unauthorized for a critical due event: %{public}@. Falling back to time-sensitive", buf, 0x16u);

          }
          goto LABEL_18;
        }
LABEL_19:
        v28 = objc_msgSend(v14, "clientOptions") & 1;
        v29 = (void *)MEMORY[0x1E0D2C508];
        objc_msgSend(v14, "scheduleItemIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dueDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "notificationNotMissedWithScheduleItemIdentifier:dueDate:isBatchingDoses:isCritical:isFollowUp:", v30, v31, v28, v22, v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(MEMORY[0x1E0CEC740], "hkmd_requestForNotification:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          HKLogMedication();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v62 = self;
            v63 = 2114;
            v64 = v33;
            _os_log_impl(&dword_1B815E000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posting notification with request: %{public}@", buf, 0x16u);
          }

          v35 = objc_loadWeakRetained(location);
          objc_msgSend(v35, "notificationManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke;
          v54[3] = &unk_1E6E00A08;
          v54[4] = self;
          v55 = v18;
          objc_msgSend(v36, "postNotificationWithRequest:completion:", v33, v54);

          v37 = objc_loadWeakRetained(location);
          objc_msgSend(v37, "healthMedicationsProfileExtension");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "medicationScheduleManager");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v21 & 1) != 0)
          {
            v40 = 0;
          }
          else
          {
            objc_msgSend(v14, "scheduleItemIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0;
            v43 = objc_msgSend(v39, "updateNotificationSent:scheduleItemIdentifier:error:", 1, v42, &v53);
            v40 = v53;

            if ((v43 & 1) == 0)
            {
              _HKInitializeLogging();
              HKLogMedication();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v62 = self;
                v63 = 2114;
                v64 = v40;
                _os_log_error_impl(&dword_1B815E000, v44, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to update notification sent to YES: %{public}@", buf, 0x16u);
              }

            }
          }
          v8 = v50;
          -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvent:]((uint64_t)self, v50, v14);

        }
        else
        {
          _HKInitializeLogging();
          HKLogMedication();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v62 = self;
            v63 = 2114;
            v64 = v18;
            _os_log_error_impl(&dword_1B815E000, v41, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to make the notification object for due item identifier: %{public}@", buf, 0x16u);
          }

          v8 = v50;
          -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvent:]((uint64_t)self, v50, v14);
        }

        ++v13;
      }
      while (v51 != v13);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (!v51)
      {
LABEL_34:

        v10 = v46;
        v9 = v47;
        goto LABEL_38;
      }
    }
  }
  _HKInitializeLogging();
  HKLogMedication();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = self;
    _os_log_impl(&dword_1B815E000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications are disabled. Removing alarmEvents.", buf, 0xCu);
  }

  -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:]((uint64_t)self, v8, v9);
LABEL_38:

}

- (uint64_t)_notificationIsEnabled
{
  uint64_t v1;
  NSObject *v2;
  const char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if ((-[HDMedicationNotificationManager _schedulingIsEnabled](result) & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 138543362;
        v5 = v1;
        v3 = "[%{public}@] Notification disabled. Scheduling is disabled.";
        goto LABEL_8;
      }
LABEL_9:

      return 0;
    }
    if (-[HDMedicationNotificationManager _doseReminderSettingIsDisabled](v1))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 138543362;
        v5 = v1;
        v3 = "[%{public}@] Notification disabled. Dose reminder is toggled off.";
LABEL_8:
        _os_log_impl(&dword_1B815E000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v4, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    return 1;
  }
  return result;
}

- (void)_alarm:(void *)a3 confirmDeliveryByRemovingEvents:
{
  id v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v10 = 0;
    v6 = objc_msgSend(a2, "removeEvents:error:", v5, &v10);
    v7 = v10;
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v12 = a1;
        v13 = 2114;
        v14 = v5;
        _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed event: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v12 = a1;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1B815E000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to confirm delivery by removing event for client identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }

  }
}

- (id)_alarm:(void *)a3 filterDueEventsToHandle:(void *)a4 date:
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v30;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v7 = a3;
  v8 = a4;
  if (!a1)
  {
    v9 = 0;
    v27 = v32;
    goto LABEL_22;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = v7;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v12)
    goto LABEL_17;
  v13 = v12;
  v14 = *(_QWORD *)v35;
  v33 = v9;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if (-[HDMedicationNotificationManager _isDueEventExpired:fromDate:](a1, v16, v8))
      {
        _HKInitializeLogging();
        HKLogMedication();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v39 = v18;
          v40 = 2114;
          v41 = v16;
          v19 = v18;
          v20 = v17;
          v21 = "[%{public}@] Stale event. Removing alarmEvent: %{public}@";
LABEL_13:
          _os_log_impl(&dword_1B815E000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);

          v9 = v33;
        }
      }
      else
      {
        v22 = -[HDMedicationNotificationManager _isDueEventOnHold:](a1, v16);
        v23 = v9;
        if (!v22)
          goto LABEL_15;
        _HKInitializeLogging();
        HKLogMedication();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v39 = v24;
          v40 = 2114;
          v41 = v16;
          v19 = v24;
          v20 = v17;
          v21 = "[%{public}@] Due event is on-hold: %{public}@";
          goto LABEL_13;
        }
      }

      v23 = v10;
LABEL_15:
      objc_msgSend(v23, "addObject:", v16, v30);
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  }
  while (v13);
LABEL_17:

  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_222);
  if ((unint64_t)objc_msgSend(v9, "count") >= 3)
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, (unint64_t)((double)(unint64_t)objc_msgSend(v9, "count") + -2.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v25);
    objc_msgSend(v9, "hk_mutableSubarrayWithRange:", (unint64_t)((double)(unint64_t)objc_msgSend(v9, "count") + -2.0), 2);
    v26 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v26;
  }
  v27 = v32;
  v28 = objc_msgSend(v10, "count", v30);
  v7 = v31;
  if (v28)
    -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:](a1, v32, v10);

LABEL_22:
  return v9;
}

- (void)_alarm:(void *)a3 confirmDeliveryByRemovingEvent:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9[0] = a3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:](a1, v7, v8);
  }
}

void __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1B815E000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did successfully post notification for due item: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    v10 = (void *)MEMORY[0x1E0D2C470];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    -[NSObject notificationManager](WeakRetained, "notificationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "areHealthNotificationsAuthorized");
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v10, "submitNotificationSentMetricWithHealthNotificationsAuthorizedStatus:dataSource:", v12, v13);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke_cold_1(a1, (uint64_t)v5, WeakRetained);
  }

}

uint64_t __78__HDMedicationNotificationManager__queue_alarm_didReceiveDueExpirationEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleItemIdentifier");
}

- (uint64_t)_isDueEventExpired:(void *)a3 fromDate:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v4 = a3;
    objc_msgSend(a2, "dueDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", 43200.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v4);
    return v7;
  }
  return result;
}

- (uint64_t)_isDueEventOnHold:(uint64_t)a1
{
  uint64_t v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v12;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medicationNotificationSyncManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "scheduleItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v8 = objc_msgSend(v6, "isScheduleItemOnHold:errorOut:", v7, &v12);
    v9 = v12;

    if (v8)
    {
      if (v8 != 2)
      {
        v2 = 1;
LABEL_9:

        return v2;
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HDMedicationNotificationManager _isDueEventOnHold:].cold.1();

    }
    v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

uint64_t __71__HDMedicationNotificationManager__alarm_filterDueEventsToHandle_date___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_scheduleItemsNotSentPredicate
{
  if (a1)
  {
    HDMedicationScheduleItemPredicateForNotificationSent(MEMORY[0x1E0C9AAA0], 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __102__HDMedicationNotificationManager__saveScheduleItems_notificationSentScheduleItems_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)_scheduleItemsSentPredicate
{
  if (a1)
  {
    HDMedicationScheduleItemPredicateForNotificationSent(MEMORY[0x1E0C9AAB0], 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_nextScheduleItemsWithTransaction:(void *)a3 date:(_QWORD *)a4 snoozeFireDates:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("scheduled_date_time"), objc_opt_class(), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    -[HDMedicationNotificationManager _takenOrSkippedItemDoseIdentifiersNearDate:error:](a1, v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v23 = v11;
      v38[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __96__HDMedicationNotificationManager__nextScheduleItemsWithTransaction_date_snoozeFireDates_error___block_invoke;
      v27[3] = &unk_1E6E00AD8;
      v27[4] = a1;
      v28 = v13;
      v24 = v9;
      v15 = v9;
      v29 = v15;
      v30 = v12;
      v16 = v10;
      v31 = v16;
      v17 = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", 0, v14, v26, a5, v27);

      if (a4)
        *a4 = objc_retainAutorelease(v16);
      _HKInitializeLogging();
      HKLogMedication();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = a1;
        v34 = 2114;
        v35 = v19;
        v36 = 2114;
        v37 = v20;
        _os_log_impl(&dword_1B815E000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Next %{public}@ schedule items: %{public}@", buf, 0x20u);

      }
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v9 = v24;
      v11 = v23;

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_takenOrSkippedItemDoseIdentifiersNearDate:(uint64_t)a3 error:
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = (id)a1;
  if (a1)
  {
    -[HDMedicationNotificationManager _takenOrSkippedDoseEventsNearDate:error:](a1, a2, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiersNearDate_error___block_invoke;
    v6[3] = &unk_1E6E00B40;
    v6[4] = v3;
    objc_msgSend(v4, "hk_mapToSet:", v6);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __96__HDMedicationNotificationManager__nextScheduleItemsWithTransaction_date_snoozeFireDates_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((-[HDMedicationNotificationManager _takenOrSkippedItemDoseIdentifiers:containsAllItemDoseIdentifiersForItem:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v4 = *(_QWORD *)(a1 + 32);
    v23 = 0;
    v24 = 0;
    v5 = -[HDMedicationNotificationManager _snoozedDoseEventDate:forScheduleItem:error:](v4, &v24, v3, &v23);
    v6 = v24;
    v7 = v23;
    if (v5)
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "_snoozeDuration");
        objc_msgSend(v6, "dateByAddingTimeInterval:");
        v8 = objc_claimAutoreleasedReturnValue();
        if ((-[NSObject hk_isAfterOrEqualToDate:](v8, "hk_isAfterOrEqualToDate:", *(_QWORD *)(a1 + 56)) & 1) == 0
          && !HDIsUnitTesting())
        {
          goto LABEL_16;
        }
        v9 = *(void **)(a1 + 64);
        objc_msgSend(v3, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        _HKInitializeLogging();
        HKLogMedication();
        v11 = objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

        if (!(_DWORD)v10)
          goto LABEL_16;
        HKLogMedication();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v3, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HKSensitiveLogItem();
          v15 = objc_claimAutoreleasedReturnValue();
          HKSensitiveLogItem();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v26 = v13;
          v27 = 2114;
          v28 = v15;
          v29 = 2114;
          v30 = v16;
          _os_log_impl(&dword_1B815E000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Will add alarm for snoozed item identifier: %{public}@ snoozeFireDate: %{public}@", buf, 0x20u);

        }
        goto LABEL_15;
      }
      _HKInitializeLogging();
      HKLogMedication();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

      if (!v20)
      {
LABEL_17:

        goto LABEL_18;
      }
      HKLogMedication();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v21 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v3, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v21;
        v27 = 2114;
        v28 = v12;
        _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_INFO, "[%{public}@] No snooze dose event found for item identifier: %{public}@", buf, 0x16u);
        goto LABEL_14;
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v3, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2114;
        v28 = v12;
        v29 = 2114;
        v30 = v7;
        _os_log_error_impl(&dword_1B815E000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to query snoozed date for item identifier: %{public}@ error: %{public}@", buf, 0x20u);
LABEL_14:

LABEL_15:
      }
    }
LABEL_16:

    goto LABEL_17;
  }
LABEL_18:

  return 1;
}

- (uint64_t)_takenOrSkippedItemDoseIdentifiers:(void *)a3 containsAllItemDoseIdentifiersForItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "doses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __108__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiers_containsAllItemDoseIdentifiersForItem___block_invoke;
    v10[3] = &unk_1E6E00B88;
    v11 = v5;
    v12 = a1;
    v13 = v7;
    a1 = objc_msgSend(v8, "hk_allObjectsPassTest:", v10);

  }
  return a1;
}

- (BOOL)_snoozedDoseEventDate:(void *)a3 forScheduleItem:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v16;

  if (!a1)
    return 0;
  v7 = a3;
  objc_msgSend(v7, "doses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_map:", &__block_literal_global_240);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  -[HDMedicationNotificationManager _snoozedDoseEventWithScheduleItemIdentifier:medicationIdentifiers:error:](a1, (uint64_t)v10, v9, (uint64_t)&v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v11)
  {
    if (a2)
    {
      objc_msgSend(v11, "endDate");
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 1;
  }
  else
  {
    v14 = v12;
    v13 = v14 == 0;
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

  }
  return v13;
}

uint64_t __79__HDMedicationNotificationManager__snoozedDoseEventDate_forScheduleItem_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "medicationIdentifier");
}

- (id)_snoozedDoseEventWithScheduleItemIdentifier:(void *)a3 medicationIdentifiers:(uint64_t)a4 error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = a3;
  HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForMedicationIdentifiers();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationDoseEventEntityPredicateForStatus();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForStatus();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForStatus();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29840];
  v20[0] = v7;
  v20[1] = v8;
  v20[2] = v9;
  v20[3] = v10;
  v20[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateMatchingAllPredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D294D8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v16, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v15, WeakRetained, 0, v14, 0, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_takenOrSkippedDoseEventsNearDate:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingTimeInterval:", 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForEndDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D29840];
  v23[0] = v7;
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationDoseEventEntityPredicateForStatuses();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D29840];
  v22[0] = v12;
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateMatchingAllPredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D294D8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v18, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v17, WeakRetained, 0, v16, 0, 0, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __84__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiersNearDate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "scheduleItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMedicationNotificationManager _uniqueDoseIdentifierFromItemIdentifier:medicationidentifier:](v2, (uint64_t)v4, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_uniqueDoseIdentifierFromItemIdentifier:(uint64_t)a3 medicationidentifier:
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a2, a3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __108__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiers_containsAllItemDoseIdentifiersForItem___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMedicationNotificationManager _uniqueDoseIdentifierFromItemIdentifier:medicationidentifier:](v3, (uint64_t)v6, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v2, "containsObject:", v8);

  return v9;
}

id __73__HDMedicationNotificationManager__expirationEventsToRemoveAtDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "dueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -43200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v5, "hk_isAfterDate:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)_scheduleRestorableAlarmWithItems:(void *)a3 date:(void *)a4 snoozeFireDates:(uint64_t)a5 error:
{
  id v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  char v20;
  id v21;
  double v22;
  void *v23;
  int v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  char v41;
  id v42;
  NSObject *v43;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  id *v49;
  int v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;

  v45 = a5;
  v54 = a2;
  v8 = a3;
  v9 = (id *)a1;
  v53 = v8;
  v48 = a4;
  if (a1)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v54, "count"));
    v50 = -[HDMedicationNotificationManager _followUpNotificationsEnabled](a1);
    v49 = (id *)a1;
    if (objc_msgSend(v54, "count"))
    {
      v10 = 0;
      while (1)
      {
        objc_msgSend(v54, "objectAtIndexedSubscript:", v10, v45);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scheduledDateTime");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_followUpDuration");
        objc_msgSend(v12, "dateByAddingTimeInterval:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "doses");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hk_mapToSet:", &__block_literal_global_250);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v17, "count");

        v18 = objc_msgSend(v12, "hk_isAfterOrEqualToDate:", v53);
        v52 = v15;
        if (!v18)
          break;
        v19 = objc_msgSend(v11, "notificationSent");
        if (v15)
          goto LABEL_9;
        v9 = v49;
        if ((v19 & 1) != 0)
        {
          v20 = 0;
          v55 = v12;
LABEL_18:
          v29 = v9[4];
          objc_msgSend(v11, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dateByAddingTimeInterval:", 43200.0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "medicationExpirationEventWithScheduleItemIdentifier:dueDate:", v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "addObject:", v32);
          goto LABEL_19;
        }
        v27 = v12;
LABEL_17:
        v55 = v27;
        objc_msgSend(v9[3], "medicationNotificationEventWithScheduleItem:dueDate:isFollowUp:isCritical:medicationsCount:", v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v28);

        v20 = 1;
        if (v18)
          goto LABEL_18;
LABEL_19:
        v33 = v50 & objc_msgSend(v13, "hk_isAfterOrEqualToDate:", v53);
        if ((v20 & 1) == 0 && v33)
        {
          if ((objc_msgSend(v11, "notificationSent") & 1) == 0)
            goto LABEL_25;
LABEL_24:
          objc_msgSend(v11, "doses");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "hk_map:", &__block_literal_global_251);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D2C4F8], "sharedInstance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "containsAtLeastOneOfIdentifiers:", v35);

          objc_msgSend(v9[3], "medicationNotificationEventWithScheduleItem:dueDate:isFollowUp:isCritical:medicationsCount:", v11, v13, 1, v37, v51);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v38);

          goto LABEL_25;
        }
        if (v33)
          goto LABEL_24;
LABEL_25:

        if (objc_msgSend(v54, "count") <= (unint64_t)++v10)
          goto LABEL_26;
      }
      if (!v15)
      {
        v20 = 0;
        v55 = v12;
        v9 = v49;
        goto LABEL_19;
      }
LABEL_9:
      v21 = v15;

      v9 = v49;
      objc_msgSend(v49, "_snoozeDuration");
      objc_msgSend(v21, "dateByAddingTimeInterval:", -v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hk_isAfterOrEqualToDate:", v13);
      v25 = objc_msgSend(v21, "hk_isAfterOrEqualToDate:", v13);
      v55 = v21;
      if (v24)
      {
        v26 = v21;

        v13 = v26;
        v9 = v49;
      }

      if (((v24 | v25) & v50 & 1) != 0)
      {
        v20 = 0;
        if (!v18)
          goto LABEL_19;
        goto LABEL_18;
      }
      v27 = v55;
      goto LABEL_17;
    }
LABEL_26:
    v39 = objc_msgSend(v9[3], "scheduleEvents:error:", v47, v45, v45);
    if ((v39 & 1) != 0)
    {
      v40 = v9[4];
      v56 = 0;
      v41 = objc_msgSend(v40, "scheduleEvents:error:", v46, &v56);
      v42 = v56;
      if ((v41 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[HDMedicationNotificationManager _scheduleRestorableAlarmWithItems:date:snoozeFireDates:error:].cold.1();

      }
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (uint64_t)_followUpNotificationsEnabled
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    v2 = *MEMORY[0x1E0D2C2C0];
    objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0D2C2C0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v1 = objc_msgSend(*(id *)(v1 + 56), "BOOLForKey:", v2);
    else
      v1 = 0;

  }
  return v1;
}

uint64_t __96__HDMedicationNotificationManager__scheduleRestorableAlarmWithItems_date_snoozeFireDates_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "medicationIdentifier");
}

uint64_t __96__HDMedicationNotificationManager__scheduleRestorableAlarmWithItems_date_snoozeFireDates_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "medicationIdentifier");
}

- (id)_takenOrSkippedAlarmIdentifiersSince:(uint64_t)a3 error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  HDMedicationDoseEventEntityPredicateForScheduledDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationDoseEventEntityPredicateForStatuses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D29840];
  v16[0] = v5;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAllPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D294D8];
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v10, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v11, WeakRetained, 0, v9, 0, 0, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "hk_map:", &__block_literal_global_253_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __78__HDMedicationNotificationManager__takenOrSkippedAlarmIdentifiersSince_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleItemIdentifier");
}

uint64_t __79__HDMedicationNotificationManager__removeExpirationEventsForIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "scheduleItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)_addNotificationObserver:(id)a3
{
  HDProfile **p_profile;
  id v4;
  void *v5;
  id WeakRetained;

  p_profile = &self->_profile;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addNotificationObserver:", v4);

}

- (OS_dispatch_queue)unitTesting_restorableAlarmQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)unitTesting_expirationAlarmQueue
{
  return self->_queue;
}

- (HDRestorableAlarm)unitTesting_restorableAlarm
{
  return self->_restorableAlarm;
}

- (HDRestorableAlarm)unitTesting_expirationAlarm
{
  return self->_expirationAlarm;
}

- (id)unitTesting_activeSchedulesFromDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0C99D48];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "autoupdatingCurrentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMedicationNotificationManager _activeSchedulesFromDate:calendar:transaction:error:]((uint64_t)self, v10, v11, v9, (uint64_t)a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)pruneAllScheduleItemsBeforeDate:(id)a3 createDoseEvents:(BOOL)a4 error:(id *)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__HDMedicationNotificationManager_pruneAllScheduleItemsBeforeDate_createDoseEvents_error___block_invoke;
  v15[3] = &unk_1E6E00C60;
  v17 = &v19;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v18 = a4;
  LODWORD(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMedicationScheduleItemEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __90__HDMedicationNotificationManager_pruneAllScheduleItemsBeforeDate_createDoseEvents_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (id)_scheduleItemsWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = a2;
  v9 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HDMedicationNotificationManager__scheduleItemsWithPredicate_transaction_error___block_invoke;
  v14[3] = &unk_1E6E00290;
  v15 = v9;
  v10 = v9;
  LODWORD(a4) = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", v8, 0, v7, a4, v14);

  if ((_DWORD)a4)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (uint64_t)_saveNotInteractedDoseEventsForScheduleItems:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v19;
  id *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    v8 = a3;
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HKSensitiveLogItem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = a1;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving not interacted dose events for schedule items: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(a1, "_notInteractedDoseEventsForScheduleItems:transaction:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = a1 + 1;
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:error:](HDMedicationsAppSourceSupport, "medicationsAppSourceEntityForProfile:error:", WeakRetained, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_loadWeakRetained(v12);
      objc_msgSend(v15, "dataManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v11, v14, 0, 0, a4, CFAbsoluteTimeGetCurrent());

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __81__HDMedicationNotificationManager__scheduleItemsWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (id)_notInteractedDoseEventsForScheduleItems:(id)a3 transaction:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  HDMedicationNotificationManager *v41;
  void *v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint8_t buf[4];
  HDMedicationNotificationManager *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v66 = 0;
  -[HDMedicationNotificationManager _medicationDoseEventsForScheduleItems:transaction:error:]((uint64_t)self, v5, v6, (uint64_t)&v66);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v66;
  if (!v7)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationNotificationManager _notInteractedDoseEventsForScheduleItems:transaction:].cold.1();

  }
  v41 = self;
  v42 = v8;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v63;
    v14 = *MEMORY[0x1E0CB55D0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "metadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v10, "addObject:", v17);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v12);
  }

  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v43 = v5;
  v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v59;
    v18 = 0x1E0CB6000uLL;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v59 != v45)
          objc_enumerationMutation(v43);
        v47 = v19;
        v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v19);
        objc_msgSend(v20, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v50 = v20;
        objc_msgSend(v20, "doses");
        v52 = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v55;
          v49 = *(_QWORD *)v55;
          do
          {
            v24 = 0;
            v51 = v22;
            do
            {
              if (*(_QWORD *)v55 != v23)
                objc_enumerationMutation(v52);
              v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v24);
              v26 = *(void **)(v18 + 2216);
              objc_msgSend(v25, "medicationIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "syncIdentifierForScheduleItemIdentifier:medicationIdentifier:", v53, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v10, "containsObject:", v28) & 1) == 0)
              {
                objc_msgSend(*(id *)(v18 + 2216), "syncVersionForStatus:", 1);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v18 + 2216), "_metadataWithSyncIdentifier:syncVersion:isLastScheduledDose:", v28, v29, objc_msgSend(v25, "isLastScheduledDose"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = *(void **)(v18 + 2216);
                objc_msgSend(v25, "medicationIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "dose");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "scheduledDateTime");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "scheduledDateTime");
                v35 = v10;
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "medicationDoseEventWithLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:metadata:", 2, v53, v32, v33, 0, v34, v36, 1, v30);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                v10 = v35;
                v18 = 0x1E0CB6000;
                objc_msgSend(v48, "addObject:", v37);

                v23 = v49;
                v22 = v51;

              }
              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
          }
          while (v22);
        }

        v19 = v47 + 1;
      }
      while (v47 + 1 != v46);
      v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v46);
  }

  _HKInitializeLogging();
  HKLogMedication();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    HKSensitiveLogItem();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v41;
    v69 = 2114;
    v70 = v39;
    _os_log_impl(&dword_1B815E000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not interacted dose events: %{public}@", buf, 0x16u);

  }
  return v48;
}

- (id)_medicationDoseEventsForScheduleItems:(uint64_t)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a1)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    HDMedicationDoseEventEntityPredicateForScheduleItemIdentifiers();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D294D8];
    objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v15, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v16, WeakRetained, 0, v14, 0, 0, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (double)_followUpDuration
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_userDefaults, "doubleForKey:", *MEMORY[0x1E0D2C2F8]);
  if (result == 0.0)
    return 1800.0;
  return result;
}

- (double)_snoozeDuration
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_userDefaults, "doubleForKey:", *MEMORY[0x1E0D2C300]);
  if (result == 0.0)
    return 600.0;
  return result;
}

- (void)setUnitTesting_restorableAlarmQueue:(id)a3
{
  self->_unitTesting_restorableAlarmQueue = (OS_dispatch_queue *)a3;
}

- (void)setUnitTesting_expirationAlarmQueue:(id)a3
{
  self->_unitTesting_expirationAlarmQueue = (OS_dispatch_queue *)a3;
}

- (void)setUnitTesting_restorableAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_unitTesting_restorableAlarm, a3);
}

- (void)setUnitTesting_expirationAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_unitTesting_expirationAlarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_expirationAlarm, 0);
  objc_storeStrong((id *)&self->_unitTesting_restorableAlarm, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_dateAnchor, 0);
  objc_storeStrong((id *)&self->_expirationAlarm, 0);
  objc_storeStrong((id *)&self->_restorableAlarm, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Fetching notification sent schedule items before rescheduling failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to fetch schedules with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to generate schedule items with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to schedule the initial restorable alarm: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to remove schedule items after failure to save schedule item with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to save generated schedule items with error: %{public}@.");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to fetch the expirations to remove with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to remove expiration alarms with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to remove restorable alarms with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to clear schedule items with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.11()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Removing overdue expiration events failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to remove notifications taken or skipped outside of notification UI: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to fetch schedule items with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to save Not Interacted Dose Events with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_saveScheduleItems:(NSObject *)a3 notificationSentScheduleItems:transaction:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1B815E000, a2, a3, "[%{public}@] Insert medication schedule items failed with error: %public@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to fetch the next rescheduled item with error: %{public}@.");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to schedule the initial restorable alarm with error: %{public}@.");
  OUTLINED_FUNCTION_2();
}

void __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1B815E000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post notification request for due item: %{public}@, error:%{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)_isDueEventOnHold:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@]: isScheduleItemOnHold returned error=[%{public}@], but treating it as not on hold");
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleRestorableAlarmWithItems:date:snoozeFireDates:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to schedule expiration alarms. %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_notInteractedDoseEventsForScheduleItems:transaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to fetch the existing dose events for schedule item with error: %{public}@.");
  OUTLINED_FUNCTION_2();
}

@end
