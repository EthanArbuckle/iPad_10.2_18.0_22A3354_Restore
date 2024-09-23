@implementation HDMedicationDailyAnalyticsEvent

- (HDMedicationDailyAnalyticsEvent)initWithProfile:(id)a3
{
  id v4;
  HDMedicationDailyAnalyticsEvent *v5;
  HDMedicationDailyAnalyticsEvent *v6;
  void *v7;
  uint64_t v8;
  NSUserDefaults *medicationsUserDefaults;
  uint64_t v10;
  HDKeyValueDomain *medicationsKeyValueDomain;
  uint64_t v12;
  NSCalendar *calendar;
  uint64_t v14;
  NSDate *currentDate;
  uint64_t v16;
  HKMedicationsCriticalNotificationsStore *criticalNotificationsStore;
  HDMedicationDoseEventDailyAnalytics *v18;
  HDMedicationDoseEventDailyAnalytics *doseEventAnalytics;
  HDMedicationUserDomainConceptDailyAnalytics *v20;
  HDMedicationUserDomainConceptDailyAnalytics *medicationConceptAnalytics;
  HDMedicationOntologyDailyAnalytics *v22;
  HDMedicationOntologyDailyAnalytics *ontologyAnalytics;
  HDMedicationScheduleDailyAnalytics *v24;
  HDMedicationScheduleDailyAnalytics *scheduleAnalytics;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDMedicationDailyAnalyticsEvent;
  v5 = -[HDMedicationDailyAnalyticsEvent init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "healthMedicationsProfileExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicationUserDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    medicationsUserDefaults = v6->_medicationsUserDefaults;
    v6->_medicationsUserDefaults = (NSUserDefaults *)v8;

    objc_msgSend(MEMORY[0x1E0D294B8], "hdmd_defaultDomainWithProfile:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    medicationsKeyValueDomain = v6->_medicationsKeyValueDomain;
    v6->_medicationsKeyValueDomain = (HDKeyValueDomain *)v10;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = objc_claimAutoreleasedReturnValue();
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v12;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    currentDate = v6->_currentDate;
    v6->_currentDate = (NSDate *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2C4F8]), "initWithUserDefaults:", v6->_medicationsUserDefaults);
    criticalNotificationsStore = v6->_criticalNotificationsStore;
    v6->_criticalNotificationsStore = (HKMedicationsCriticalNotificationsStore *)v16;

    v18 = -[HDMedicationDoseEventDailyAnalytics initWithProfile:calendar:currentDate:]([HDMedicationDoseEventDailyAnalytics alloc], "initWithProfile:calendar:currentDate:", v4, v6->_calendar, v6->_currentDate);
    doseEventAnalytics = v6->_doseEventAnalytics;
    v6->_doseEventAnalytics = v18;

    v20 = -[HDMedicationUserDomainConceptDailyAnalytics initWithProfile:medicationsKeyValueDomain:calendar:currentDate:]([HDMedicationUserDomainConceptDailyAnalytics alloc], "initWithProfile:medicationsKeyValueDomain:calendar:currentDate:", v4, v6->_medicationsKeyValueDomain, v6->_calendar, v6->_currentDate);
    medicationConceptAnalytics = v6->_medicationConceptAnalytics;
    v6->_medicationConceptAnalytics = v20;

    v22 = -[HDMedicationOntologyDailyAnalytics initWithProfile:]([HDMedicationOntologyDailyAnalytics alloc], "initWithProfile:", v4);
    ontologyAnalytics = v6->_ontologyAnalytics;
    v6->_ontologyAnalytics = v22;

    v24 = -[HDMedicationScheduleDailyAnalytics initWithProfile:]([HDMedicationScheduleDailyAnalytics alloc], "initWithProfile:", v4);
    scheduleAnalytics = v6->_scheduleAnalytics;
    v6->_scheduleAnalytics = v24;

  }
  return v6;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.meds.daily");
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isImproveHealthAndActivityEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB4740]);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "medicationScheduleManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notificationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "areDoseRemindersEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("hasMedsNotificationsEnabled"));

  v15 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v15, "notificationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "areHealthNotificationsAuthorized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB46F0]);

  }
  objc_msgSend(v5, "environmentDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activePairedDeviceProductType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CB4700]);
  -[HDMedicationDailyAnalyticsEvent _isImproveHealthRecordsAllowedPayloadWithDataSource:](self, "_isImproveHealthRecordsAllowedPayloadWithDataSource:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v20);

  -[HDMedicationDoseEventDailyAnalytics makeUnrestrictedEventPayloadWithDataSource:error:](self->_doseEventAnalytics, "makeUnrestrictedEventPayloadWithDataSource:error:", v5, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v21);

  -[HDMedicationUserDomainConceptDailyAnalytics makeUnrestrictedEventPayloadWithDataSource:error:](self->_medicationConceptAnalytics, "makeUnrestrictedEventPayloadWithDataSource:error:", v5, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v22);

  -[HDMedicationOntologyDailyAnalytics makeUnrestrictedEventPayloadWithDataSource:error:](self->_ontologyAnalytics, "makeUnrestrictedEventPayloadWithDataSource:error:", v5, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v23);

  -[HDMedicationScheduleDailyAnalytics makeUnrestrictedEventPayloadWithDataSource:error:](self->_scheduleAnalytics, "makeUnrestrictedEventPayloadWithDataSource:error:", v5, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v24);

  -[HDMedicationDailyAnalyticsEvent _fetchDeviceContextAnalytics](self, "_fetchDeviceContextAnalytics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v25);

  -[HDMedicationDailyAnalyticsEvent _fetchNotificationSettingsAnalyticsWithDataSource:includingCriticalMedsCount:](self, "_fetchNotificationSettingsAnalyticsWithDataSource:includingCriticalMedsCount:", v5, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_addEntriesFromNonNilDictionary:", v26);

  return v6;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:](self, "_userCharacteristicsAnalyticsPayloadWithDataSource:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  -[HDMedicationDailyAnalyticsEvent _lifestyleInteractionsAnalyticsPayload](self, "_lifestyleInteractionsAnalyticsPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  -[HDMedicationDailyAnalyticsEvent _reminderAnalyticsPayload](self, "_reminderAnalyticsPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v10);

  -[HDMedicationDoseEventDailyAnalytics makeIHAGatedEventPayloadWithDataSource:error:](self->_doseEventAnalytics, "makeIHAGatedEventPayloadWithDataSource:error:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v11);

  -[HDMedicationUserDomainConceptDailyAnalytics makeIHAGatedEventPayloadWithDataSource:error:](self->_medicationConceptAnalytics, "makeIHAGatedEventPayloadWithDataSource:error:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v12);

  -[HDMedicationOntologyDailyAnalytics makeIHAGatedEventPayloadWithDataSource:error:](self->_ontologyAnalytics, "makeIHAGatedEventPayloadWithDataSource:error:", v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v13);

  -[HDMedicationScheduleDailyAnalytics makeIHAGatedEventPayloadWithDataSource:error:](self->_scheduleAnalytics, "makeIHAGatedEventPayloadWithDataSource:error:", v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v14);

  -[HDMedicationDailyAnalyticsEvent _fetchNotificationSettingsAnalyticsWithDataSource:includingCriticalMedsCount:](self, "_fetchNotificationSettingsAnalyticsWithDataSource:includingCriticalMedsCount:", v6, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v15);
  return v7;
}

- (id)_userCharacteristicsAnalyticsPayloadWithDataSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "healthDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v6, "biologicalSexWithError:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;

  if (v7)
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB4718]);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:].cold.3();

      objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB4750], *MEMORY[0x1E0CB4718]);
      v9 = v8;
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:].cold.2((uint64_t)self, v9);
    }
    v8 = 0;
  }

  objc_msgSend(v4, "healthDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environmentDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  objc_msgSend(v11, "ageWithCurrentDate:error:", v13, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;

  if (v14)
  {
    HKMedicationsBucketedDecadeForAge();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB4708]);

LABEL_16:
    goto LABEL_17;
  }
  if (v15)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[HDMedicationDailyAnalyticsEvent _userCharacteristicsAnalyticsPayloadWithDataSource:].cold.1();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], *MEMORY[0x1E0CB4708]);
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (id)_reminderAnalyticsPayload
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSUserDefaults objectForKey:](self->_medicationsUserDefaults, "objectForKey:", *MEMORY[0x1E0D2C320]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceDate:](self->_currentDate, "timeIntervalSinceDate:", v7);
    objc_msgSend(v8, "numberWithInt:", v9 <= 86400.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasReceivedMedicationReminderInPast24hrs"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasReceivedMedicationReminderInPast24hrs"));
  }
  -[NSUserDefaults objectForKey:](self->_medicationsUserDefaults, "objectForKey:", *MEMORY[0x1E0D2C318]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceDate:](self->_currentDate, "timeIntervalSinceDate:", v14);
    objc_msgSend(v15, "numberWithInt:", v16 <= 86400.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasOpenedAppOrLoggedFromMedicationReminderInPast24hrs"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hasOpenedAppOrLoggedFromMedicationReminderInPast24hrs"));
  }

  return v3;
}

- (id)_lifestyleInteractionsAnalyticsPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HDMedicationDailyAnalyticsEvent _readValueFromKeyValueDomainForKey:](self, "_readValueFromKeyValueDomainForKey:", *MEMORY[0x1E0D2C280]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hasLifestyleInteractionAlcoholEnabled"));

  -[HDMedicationDailyAnalyticsEvent _readValueFromKeyValueDomainForKey:](self, "_readValueFromKeyValueDomainForKey:", *MEMORY[0x1E0D2C2E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasLifestyleInteractionCannabisEnabled"));

  -[HDMedicationDailyAnalyticsEvent _readValueFromKeyValueDomainForKey:](self, "_readValueFromKeyValueDomainForKey:", *MEMORY[0x1E0D2C380]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasLifestyleInteractionTobaccoEnabled"));

  return v3;
}

- (id)_readValueFromKeyValueDomainForKey:(id)a3
{
  id v4;
  HDKeyValueDomain *medicationsKeyValueDomain;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  HDMedicationDailyAnalyticsEvent *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  medicationsKeyValueDomain = self->_medicationsKeyValueDomain;
  v6 = *MEMORY[0x1E0D2C2E8];
  v11 = 0;
  -[HDKeyValueDomain numberForKey:error:](medicationsKeyValueDomain, "numberForKey:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v8;
    }

  }
  return v7;
}

- (id)_isImproveHealthRecordsAllowedPayloadWithDataSource:(id)a3
{
  id v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id obj;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0;
  v27[0] = &v26;
  v27[1] = 0x3032000000;
  v27[2] = __Block_byref_object_copy__7;
  v27[3] = __Block_byref_object_dispose__7;
  v28 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  v6 = dispatch_semaphore_create(0);
  objc_msgSend(v4, "healthDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__HDMedicationDailyAnalyticsEvent__isImproveHealthRecordsAllowedPayloadWithDataSource___block_invoke;
  v16[3] = &unk_1E6E00D18;
  v18 = &v20;
  v19 = &v26;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:", v16);

  v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = (id *)(v27[0] + 40);
    obj = *(id *)(v27[0] + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &obj, 100, CFSTR("Timed out calling isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion."));
    objc_storeStrong(v10, obj);
  }
  v11 = v21[5];
  if (v11)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D2C290]);
LABEL_5:
    v12 = v5;
    goto LABEL_10;
  }
  if (!*(_QWORD *)(v27[0] + 40))
    goto LABEL_5;
  _HKInitializeLogging();
  HKLogMedication();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[HDMedicationDailyAnalyticsEvent _isImproveHealthRecordsAllowedPayloadWithDataSource:].cold.1((uint64_t)self, (uint64_t)v27, v13);

  v12 = 0;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __87__HDMedicationDailyAnalyticsEvent__isImproveHealthRecordsAllowedPayloadWithDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_fetchDeviceContextAnalytics
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "deviceContextManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v3, "numberOfDeviceContextsPerDeviceType:", &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E6E10F88);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = &unk_1E6E10FA0;
    v9 = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E6E10FB8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = &unk_1E6E10FA0;
    v13 = v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E6E10FD0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = &unk_1E6E10FA0;
    v17 = v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E6E10FE8);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = &unk_1E6E10FA0;
    v21 = v20;

    v25[0] = CFSTR("countPairediPhone");
    v25[1] = CFSTR("countPairedWatch");
    v26[0] = v9;
    v26[1] = v17;
    v25[2] = CFSTR("countPairediPad");
    v25[3] = CFSTR("countPairedVisionPro");
    v26[2] = v13;
    v26[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HDMedicationDailyAnalyticsEvent _fetchDeviceContextAnalytics].cold.1();
    v22 = 0;
  }

  return v22;
}

- (id)_fetchNotificationSettingsAnalyticsWithDataSource:(id)a3 includingCriticalMedsCount:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v28 = a4;
  v30[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = -[NSUserDefaults hk_BOOLForKey:defaultValue:](self->_medicationsUserDefaults, "hk_BOOLForKey:defaultValue:", *MEMORY[0x1E0D2C360], 1);
  v8 = -[NSUserDefaults BOOLForKey:](self->_medicationsUserDefaults, "BOOLForKey:", *MEMORY[0x1E0D2C2C0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "areHealthCriticalAlertsAuthorized");

  v12 = (id)*MEMORY[0x1E0CB46A8];
  -[NSUserDefaults objectForKey:](self->_medicationsUserDefaults, "objectForKey:", *MEMORY[0x1E0D2C2F0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    v17 = -[HDMedicationDailyAnalyticsEvent _bucketedWeeksSinceDate:dataSource:](self, "_bucketedWeeksSinceDate:dataSource:", v16, v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v18;
  }
  v29[0] = CFSTR("hasTimeZoneChangeNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v29[1] = CFSTR("hasFollowUpRemindersEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  v29[2] = CFSTR("hasCriticalAlertsNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = CFSTR("weeksSinceFirstEnteredDataTypeRoom");
  v30[2] = v21;
  v30[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v22);

  if (v28)
  {
    v23 = -[HKMedicationsCriticalNotificationsStore identifiersCount](self->_criticalNotificationsStore, "identifiersCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicationDailyAnalyticsBucketForCount(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("numberOfCriticalAlertMeds"));
  }
  v26 = (void *)objc_msgSend(v6, "copy");

  return v26;
}

- (id)_fetchFeatureSettingsAnalyticsWithDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "seahorse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hasPregnancyModeEnabled"));

  return v3;
}

- (int64_t)_bucketedWeeksSinceDate:(id)a3 dataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;

  v5 = a3;
  objc_msgSend(a4, "environmentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bucketedNumberOfWeeksSinceDate:minimumBinningValue:", v5, 120);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)*MEMORY[0x1E0CB46A8];
  if (v7)
    v8 = v7;
  v9 = v8;

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleAnalytics, 0);
  objc_storeStrong((id *)&self->_ontologyAnalytics, 0);
  objc_storeStrong((id *)&self->_medicationConceptAnalytics, 0);
  objc_storeStrong((id *)&self->_doseEventAnalytics, 0);
  objc_storeStrong((id *)&self->_criticalNotificationsStore, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_medicationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_medicationsKeyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_userCharacteristicsAnalyticsPayloadWithDataSource:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error when determining age, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_userCharacteristicsAnalyticsPayloadWithDataSource:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1B815E000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] No error when fetching biological sex but also didn't get object", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_userCharacteristicsAnalyticsPayloadWithDataSource:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Error when determining biological sex, continuing daily analytics submission: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_isImproveHealthRecordsAllowedPayloadWithDataSource:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0(&dword_1B815E000, a2, a3, "[%{public}@] Failed to get health records opt-in status with error: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_fetchDeviceContextAnalytics
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Failed to get deviceContextsDict with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
