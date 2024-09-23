@implementation HDMedicationTimeZoneManager

- (HDMedicationTimeZoneManager)initWithProfile:(id)a3
{
  id v4;
  HDMedicationTimeZoneManager *v5;
  HDMedicationTimeZoneManager *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id WeakRetained;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicationTimeZoneManager;
  v5 = -[HDMedicationTimeZoneManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hkmd_supportsTimeZone");

    if (v9)
    {
      HKCreateSerialDispatchQueue();
      v10 = objc_claimAutoreleasedReturnValue();
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v10;

      WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
      objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, v6->_queue);

    }
  }

  return v6;
}

- (void)handleTimeZoneChange
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  HDMedicationTimeZoneManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B815E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Time zone changed", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E80], "resetSystemTimeZone");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationTimeZoneManager _performTimeZoneDetectionOperationOrJournalWithProfile:motive:]((uint64_t)self, WeakRetained, 1);

}

- (void)_performTimeZoneDetectionOperationOrJournalWithProfile:(uint64_t)a3 motive:
{
  id v5;
  HDMedicationTimeZoneDetectionOperation *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a2;
    v6 = -[HDMedicationTimeZoneDetectionOperation initWithMotive:]([HDMedicationTimeZoneDetectionOperation alloc], "initWithMotive:", a3);
    v14 = 0;
    v7 = -[HDJournalableOperation performOrJournalWithProfile:error:](v6, "performOrJournalWithProfile:error:", v5, &v14);

    v8 = v14;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1BCCADA70](*(_QWORD *)(a1 + 32));
    if (v9)
      ((void (**)(_QWORD, uint64_t, BOOL, uint64_t, id))v9)[2](v9, v7, -[HDJournalableOperation didJournal](v6, "didJournal"), a3, v8);
    _HKInitializeLogging();
    HKLogMedication();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 == 2)
      {
        v11 = CFSTR("Schedule Change");
      }
      else if (a3 == 1)
      {
        v11 = CFSTR("TimeZone Change");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), a3);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      HKStringFromBool();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138544130;
      v16 = a1;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: TimeZone operation ran with motive: '%{public}@' and returned result: '%{public}@ error: '%{public}@'", buf, 0x2Au);

    }
  }
}

- (BOOL)_isAuthorizedToFireTimeZoneNotificationWithProfile:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  const char *v15;
  int v17;
  HDMedicationTimeZoneManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1BCCADA70](self->_unitTestingAuthorizedToFireTimeZoneNotificationHandler);
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(v4, "healthMedicationsProfileExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "medicationUserDefaults");
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0D2C360]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v11 && (objc_msgSend(v11, "BOOLValue") & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = self;
        v15 = "[%{public}@]: Should not fire timezone alert. Setting toggle off";
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v4, "notificationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "areHealthNotificationsAuthorized");

      if ((v13 & 1) != 0)
      {
        v7 = 1;
        goto LABEL_14;
      }
      _HKInitializeLogging();
      HKLogMedication();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = self;
        v15 = "[%{public}@]: Should not fire timezone alert. Health notifications not authorized.";
LABEL_12:
        _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0xCu);
      }
    }

    v7 = 0;
    goto LABEL_14;
  }
  v7 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5);
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unit testing. Handler returned value: '%{public}@'", (uint8_t *)&v17, 0x16u);
LABEL_14:

  }
  return v7;
}

- (BOOL)_updateTimeZoneOffsetOffset:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v7, "hdmd_timeZoneDomainWithProfile:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumber:forKey:error:", v10, *MEMORY[0x1E0D2C378], a5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "setDate:forKey:error:", v11, *MEMORY[0x1E0D2C370], a5);

  return (char)a5;
}

- (BOOL)_updateTimeZoneExperienceAsEnabled:(BOOL)a3 transaction:(id)a4 error:(id *)a5
{
  _BOOL8 v5;
  void *v7;
  HDProfile **p_profile;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  void *v30;
  uint8_t buf[4];
  HDMedicationTimeZoneManager *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v5 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D294B8];
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v7, "hdmd_timeZoneDomainWithProfile:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKLogMedication();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v12;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D2C350];
  v29 = 0;
  objc_msgSend(v10, "setNumber:forKey:error:", v13, v14, &v29);
  v15 = v29;

  if (v15)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[HDMedicationTimeZoneManager _updateTimeZoneExperienceAsEnabled:transaction:error:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC740], "hkmd_requestForTimeZoneNotification");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      _HKInitializeLogging();
      HKLogMedication();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject content](v16, "content");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = self;
        v33 = 2114;
        v34 = v19;
        _os_log_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Will post notification request: %{public}@", buf, 0x16u);

      }
      v20 = MEMORY[0x1BCCADA70](self->_unitTestingNotificationFiringHandler);
      v21 = (id)v20;
      if (v20)
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v16);
      v22 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v22, "notificationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke;
      v28[3] = &unk_1E6E011F0;
      v28[4] = self;
      objc_msgSend(v23, "postNotificationWithRequest:completion:", v16, v28);

    }
    else
    {
      v21 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v21, "notificationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v16, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeDeliveredNotificationsWithIdentifiers:", v26);

    }
  }

  return v15 == 0;
}

void __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  HKLogMedication();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1B815E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Did successfully post timezone changed notification", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

}

- (id)_mostRecentTimeZoneOffsetWithProfile:(id)a3
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D294B8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v3, "hdmd_timeZoneDomainWithProfile:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberForKey:error:", *MEMORY[0x1E0D2C378], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "medicationScheduleManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:queue:", self, self->_queue);

}

- (void)scheduleManager:(id)a3 didAddOrModifySchedules:(id)a4
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  HDMedicationTimeZoneManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: schedules modified re-evaluating our timezone tile status.", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDMedicationTimeZoneManager _performTimeZoneDetectionOperationOrJournalWithProfile:motive:]((uint64_t)self, WeakRetained, 2);

}

- (id)unitTestingAuthorizedToFireTimeZoneNotificationHandler
{
  return self->_unitTestingAuthorizedToFireTimeZoneNotificationHandler;
}

- (void)setUnitTestingAuthorizedToFireTimeZoneNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)unitTestingOperationDetectionHandler
{
  return self->_unitTestingOperationDetectionHandler;
}

- (void)setUnitTestingOperationDetectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)unitTestingNotificationFiringHandler
{
  return self->_unitTestingNotificationFiringHandler;
}

- (void)setUnitTestingNotificationFiringHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTestingNotificationFiringHandler, 0);
  objc_storeStrong(&self->_unitTestingOperationDetectionHandler, 0);
  objc_storeStrong(&self->_unitTestingAuthorizedToFireTimeZoneNotificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_updateTimeZoneExperienceAsEnabled:transaction:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
}

void __84__HDMedicationTimeZoneManager__updateTimeZoneExperienceAsEnabled_transaction_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1B815E000, a2, a3, "[%{public}@]: Failed to post timezone changed notification request error:%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
