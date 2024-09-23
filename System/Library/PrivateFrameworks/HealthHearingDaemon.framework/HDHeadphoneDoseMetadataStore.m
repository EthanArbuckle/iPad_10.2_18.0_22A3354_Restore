@implementation HDHeadphoneDoseMetadataStore

- (HDHeadphoneDoseMetadataStore)initWithProfile:(id)a3
{
  id v4;
  HDHeadphoneDoseMetadataStore *v5;
  HDHeadphoneDoseMetadataStore *v6;
  uint64_t v7;
  HDKeyValueDomain *domain;
  int v9;
  char v10;
  id WeakRetained;
  HDHeadphoneDoseMetadataStore *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHeadphoneDoseMetadataStore;
  v5 = -[HDHeadphoneDoseMetadataStore init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE40AD0]), "initWithCategory:domainName:profile:", 0, CFSTR("Hearing"), v4);
    domain = v6->_domain;
    v6->_domain = (HDKeyValueDomain *)v7;

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_doseLimit = 1.0;
    v9 = objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall");
    v10 = 0;
    if (v9)
      v10 = objc_msgSend(MEMORY[0x24BDD4198], "isTestingDevice") ^ 1;
    v6->_shouldLoadDoseLimitOverride = v10;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, 0);

    v12 = v6;
  }

  return v6;
}

- (void)_lock_loadDoseLimitOverrideIfNeeded
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    if (self->_shouldLoadDoseLimitOverride)
    {
      self->_shouldLoadDoseLimitOverride = 0;
      -[HDHeadphoneDoseMetadataStore _lock_loadDoseLimitOverride](self, "_lock_loadDoseLimitOverride");
    }
  }
}

- (void)_lock_loadDoseLimitOverride
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 138543874;
  v3 = CFSTR("_SevenDayHeadphoneExposureDoseNotificationThreshold");
  v4 = 2048;
  v5 = 0x3FF0000000000000;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_21A0AA000, log, OS_LOG_TYPE_ERROR, "Read invalid value for AppleInternal key %{public}@, using default %.2f%% instead of %.2f%%", (uint8_t *)&v2, 0x20u);
}

- (BOOL)shouldNotifyUserForAccumulatedDose:(double)a3
{
  HDHeadphoneDoseMetadataStore *v4;
  os_unfair_lock_s *p_lock;

  v4 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneDoseMetadataStore _lock_loadDoseLimitOverrideIfNeeded](v4, "_lock_loadDoseLimitOverrideIfNeeded");
  LOBYTE(v4) = v4->_doseLimit <= a3;
  os_unfair_lock_unlock(p_lock);
  return (char)v4;
}

- (BOOL)updateCacheWithFireDate:(id)a3 fromRemoteNotification:(BOOL)a4 error:(id *)a5
{
  return -[HDHeadphoneDoseMetadataStore _updateCacheWithFireDate:fromRemoteNotification:changed:error:](self, "_updateCacheWithFireDate:fromRemoteNotification:changed:error:", a3, a4, 0, a5);
}

- (int64_t)updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDHeadphoneDoseMetadataStore _updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:now:error:](self, "_updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:now:error:", v7, v8, a4);

  return v9;
}

- (int64_t)updatePreviousSevenDayRemoteNotificationFireDateWith:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDHeadphoneDoseMetadataStore _updatePreviousSevenDayNotificationFireDateWith:fromRemoteNotification:isLocalDevice:now:error:](self, "_updatePreviousSevenDayNotificationFireDateWith:fromRemoteNotification:isLocalDevice:now:error:", v7, 1, 0, v8, a4);

  return v9;
}

- (BOOL)rebuildCachedFireDateFromLocalHAENStoreIfNeededWithError:(id *)a3
{
  BOOL v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[8];
  id v11;

  v11 = 0;
  v5 = -[HDHeadphoneDoseMetadataStore _shouldRebuildPreviousSevenDayNotificationWithError:](self, "_shouldRebuildPreviousSevenDayNotificationWithError:", &v11);
  v6 = v11;
  if (v6)
  {
    if (a3)
    {
      v7 = 0;
      *a3 = objc_retainAutorelease(v6);
    }
    else
    {
      _HKLogDroppedError();
      v7 = 0;
    }
  }
  else if (v5)
  {
    v7 = -[HDHeadphoneDoseMetadataStore rebuildCachedFireDateFromLocalHAENStoreWithError:](self, "rebuildCachedFireDateFromLocalHAENStoreWithError:", a3);
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21A0AA000, v8, OS_LOG_TYPE_DEFAULT, "Rebuild largest recent dose is not needed yet.", v10, 2u);
    }
    v7 = 1;
  }

  return v7;
}

- (BOOL)rebuildCachedFireDateFromLocalHAENStoreWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDHeadphoneDoseMetadataStore _rebuildCachedFireDateFromLocalHAENStoreWithNow:error:](self, "_rebuildCachedFireDateFromLocalHAENStoreWithNow:error:", v5, a3);

  return (char)a3;
}

- (id)collectionIntervalForDoseAccumulated:(double)a3
{
  double doseLimit;
  double v7;

  if ((objc_msgSend(MEMORY[0x24BE456A0], "unitTesting_forceDefaultHeadphoneDataCollectionInterval") & 1) != 0)
    return 0;
  os_unfair_lock_lock(&self->_lock);
  doseLimit = self->_doseLimit;
  os_unfair_lock_unlock(&self->_lock);
  v7 = doseLimit - a3;
  if (doseLimit - a3 <= 0.01)
    return &unk_24DC668E0;
  if (v7 <= 0.03)
    return &unk_24DC668F8;
  if (v7 <= 0.05)
    return &unk_24DC66910;
  if (v7 <= 0.1)
    return &unk_24DC66928;
  if (v7 <= 0.3)
    return &unk_24DC67070;
  if (v7 >= 0.6)
    return 0;
  return &unk_24DC67080;
}

- (void)profileDidBecomeReady:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneDoseMetadataStore _lock_loadDoseLimitOverrideIfNeeded](self, "_lock_loadDoseLimitOverrideIfNeeded");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_rebuildCachedFireDateFromLocalHAENStoreWithNow:(id)a3 error:(id *)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  _BOOL4 v13;
  os_log_t v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3000];
  v8 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A0AA000, v8, OS_LOG_TYPE_DEFAULT, "Rebuilding Previous 7-day HAEN Fire Date.", buf, 2u);
  }
  if ((objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled") & 1) != 0)
  {
    v20 = 0;
    -[HDHeadphoneDoseMetadataStore _mostRecentSevenDayLocalNotificationWithNow:error:](self, "_mostRecentSevenDayLocalNotificationWithNow:error:", v6, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    v11 = v10;
    if (!v9 && v10)
    {
      if (a4)
      {
        v12 = 0;
        *a4 = objc_retainAutorelease(v10);
LABEL_20:

        goto LABEL_21;
      }
      _HKLogDroppedError();
LABEL_15:
      v12 = 0;
      goto LABEL_20;
    }
    if (!-[HDHeadphoneDoseMetadataStore _setPreviousSevenDayLocalNotificationFireDate:error:](self, "_setPreviousSevenDayLocalNotificationFireDate:error:", v9, a4))goto LABEL_15;
    v13 = -[HDHeadphoneDoseMetadataStore _setShouldRebuildPreviousSevenDayNotification:error:](self, "_setShouldRebuildPreviousSevenDayNotification:error:", 0, a4);
    v12 = 0;
    if (!v13)
      goto LABEL_20;
    _HKInitializeLogging();
    v14 = *v7;
    v15 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        v16 = "Updated Previous 7-day HAEN Fire Date to %@.";
        v17 = v14;
        v18 = 12;
LABEL_18:
        _os_log_impl(&dword_21A0AA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "Cleared Previous 7-day HAEN Fire Date, no recent HAENs.";
      v17 = v14;
      v18 = 2;
      goto LABEL_18;
    }
    v12 = 1;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 111, CFSTR("Feature Disabled: 7-Day HAEN"));
  v12 = 0;
LABEL_21:

  return v12;
}

- (id)_mostRecentSevenDayLocalNotificationWithNow:(id)a3 error:(id *)a4
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
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  void *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE40E20];
  HKHeadphoneAudioExposureEventType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v9;
  HDCategorySampleEntityPredicateForValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v10;
  HDSampleEntityPredicateForEndDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v14 = (void *)MEMORY[0x24BE40A50];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v14, "entityEnumeratorWithProfile:", WeakRetained);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPredicate:", v13);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSortDescriptors:", v18);

  objc_msgSend(v16, "setLimitCount:", 1);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __82__HDHeadphoneDoseMetadataStore__mostRecentSevenDayLocalNotificationWithNow_error___block_invoke;
  v22[3] = &unk_24DC5F1E8;
  v22[4] = &v23;
  if (objc_msgSend(v16, "enumerateWithError:handler:", a4, v22))
    v19 = (void *)v24[5];
  else
    v19 = 0;
  v20 = v19;

  _Block_object_dispose(&v23, 8);
  return v20;
}

BOOL __82__HDHeadphoneDoseMetadataStore__mostRecentSevenDayLocalNotificationWithNow_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  HKSafeObject();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5
      || (objc_msgSend(v4, "endDate"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "hk_isBeforeDate:", v6),
          v6,
          v7))
    {
      objc_msgSend(v4, "endDate");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }

  return v4 != 0;
}

+ (id)_earliestFireDateAllowedWithNow:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", -604800.0);
}

- (HKProfileIdentifier)_profileIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKProfileIdentifier *)v3;
}

- (id)_fetchPreviousSevenDayLocalNotificationFireDateWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeadphoneDoseMetadataStore _fetchPreviousSevenDayLocalNotificationFireDateWithNow:error:](self, "_fetchPreviousSevenDayLocalNotificationFireDateWithNow:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fetchPreviousSevenDayLocalNotificationFireDateWithNow:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HDKeyValueDomain dateForKey:error:](self->_domain, "dateForKey:error:", CFSTR("_PreviousSevenDayHeadphoneExposureNotificationFireDate"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HDHeadphoneDoseMetadataStore _filterForValidateFireDate:now:error:](self, "_filterForValidateFireDate:now:error:", v7, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_setPreviousSevenDayLocalNotificationFireDate:(id)a3 error:(id *)a4
{
  return -[HDKeyValueDomain setDate:forKey:error:](self->_domain, "setDate:forKey:error:", a3, CFSTR("_PreviousSevenDayHeadphoneExposureNotificationFireDate"), a4);
}

- (BOOL)_clearPreviousSevenDayLocalNotificationFireDateWithError:(id *)a3
{
  HDKeyValueDomain *domain;
  void *v5;

  domain = self->_domain;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("_PreviousSevenDayHeadphoneExposureNotificationFireDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDKeyValueDomain removeValuesForKeys:error:](domain, "removeValuesForKeys:error:", v5, a3);

  return (char)a3;
}

- (id)_fetchPreviousSevenDayRemoteNotificationFireDateWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeadphoneDoseMetadataStore _fetchPreviousSevenDayRemoteNotificationFireDateWithNow:error:](self, "_fetchPreviousSevenDayRemoteNotificationFireDateWithNow:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fetchPreviousSevenDayRemoteNotificationFireDateWithNow:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HDKeyValueDomain dateForKey:error:](self->_domain, "dateForKey:error:", CFSTR("_PreviousSevenDayHeadphoneExposureRemoteNotificationFireDate"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HDHeadphoneDoseMetadataStore _filterForValidateFireDate:now:error:](self, "_filterForValidateFireDate:now:error:", v7, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_setPreviousSevenDayRemoteNotificationFireDate:(id)a3 error:(id *)a4
{
  return -[HDKeyValueDomain setDate:forKey:error:](self->_domain, "setDate:forKey:error:", a3, CFSTR("_PreviousSevenDayHeadphoneExposureRemoteNotificationFireDate"), a4);
}

- (BOOL)_clearPreviousSevenDayRemoteNotificationFireDateWithError:(id *)a3
{
  HDKeyValueDomain *domain;
  void *v5;

  domain = self->_domain;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("_PreviousSevenDayHeadphoneExposureRemoteNotificationFireDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDKeyValueDomain removeValuesForKeys:error:](domain, "removeValuesForKeys:error:", v5, a3);

  return (char)a3;
}

- (BOOL)_shouldRebuildSevenDayStatisticsWithError:(id *)a3
{
  HDKeyValueDomain *domain;
  void *v5;
  id v6;
  char v7;
  id v9;

  domain = self->_domain;
  v9 = 0;
  -[HDKeyValueDomain numberForKey:error:](domain, "numberForKey:error:", CFSTR("_ShouldRebuildSevenDayHeadphoneExposureStatistics"), &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();

    goto LABEL_8;
  }
  if (!v5)
  {
LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_9:

  return v7;
}

- (BOOL)_setShouldRebuildSevenDayStatistics:(BOOL)a3 error:(id *)a4
{
  HDKeyValueDomain *domain;
  void *v6;

  domain = self->_domain;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDKeyValueDomain setNumber:forKey:error:](domain, "setNumber:forKey:error:", v6, CFSTR("_ShouldRebuildSevenDayHeadphoneExposureStatistics"), a4);

  return (char)a4;
}

- (BOOL)_shouldRebuildPreviousSevenDayNotificationWithError:(id *)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HDKeyValueDomain numberForKey:error:](self->_domain, "numberForKey:error:", CFSTR("_ShouldRebuildPreviousSevenDayHeadphoneExposureNotification"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (BOOL)_setShouldRebuildPreviousSevenDayNotification:(BOOL)a3 error:(id *)a4
{
  HDKeyValueDomain *domain;
  void *v6;

  domain = self->_domain;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDKeyValueDomain setNumber:forKey:error:](domain, "setNumber:forKey:error:", v6, CFSTR("_ShouldRebuildPreviousSevenDayHeadphoneExposureNotification"), a4);

  return (char)a4;
}

- (id)_info
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  -[HDHeadphoneDoseMetadataStore _infoDict](self, "_infoDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("recent_seven_day_haen_error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("recent_seven_day_haen_error"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Recent 7-Day HAEN:\t Error (%@)"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("recent_seven_day_haen_nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = CFSTR("Recent 7-Day HAEN:\t None");
      goto LABEL_6;
    }
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v5, "appendString:", CFSTR("Recent 7-Day HAEN:\n"));
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("previous_fire_date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tFireDate:\t  %@\n"), v10);

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("seven_day_dose"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\t7-Day Dose:\t  %@\n"), v11);

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accumulated_dose_from_fire_date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tAccumulated Dose: %@\n"), v12);

    v6 = objc_msgSend(v5, "copy");
  }
  v7 = (__CFString *)v6;

LABEL_6:
  return v7;
}

- (id)_infoDict
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = 0;
  +[HDHeadphoneAudioExposurePolicyDeterminer determinePreviousFireDateWithStore:error:](HDHeadphoneAudioExposurePolicyDeterminer, "determinePreviousFireDateWithStore:error:", self, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@"), v4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("previous_fire_date"));

    -[HDHeadphoneDoseMetadataStore _infoForSevenDayDoseAtFireDate:](self, "_infoForSevenDayDoseAtFireDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("seven_day_dose"));

    -[HDHeadphoneDoseMetadataStore _infoForAccumulatedDoseAtFireDate:](self, "_infoForAccumulatedDoseAtFireDate:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accumulated_dose_from_fire_date"));

    v10 = (id)objc_msgSend(v3, "copy");
  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error (%@)"), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("recent_seven_day_haen_error"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("recent_seven_day_haen_nil"));
    }
    v10 = v3;
  }
  v12 = v10;

  return v12;
}

- (id)_fetchDoseLimitInfoWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneDoseMetadataStore _lock_fetchDoseLimitInfoWithError:](self, "_lock_fetchDoseLimitInfoWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_fetchDoseLimitInfoWithError:(id *)a3
{
  HDKeyValueDomain *domain;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  double doseLimit;
  double v11;
  double v12;
  const __CFString *v13;
  double v14;
  double v15;
  void *v16;
  void *v18;
  double v19;
  const __CFString *v20;
  id v22;

  os_unfair_lock_assert_owner(&self->_lock);
  domain = self->_domain;
  v22 = 0;
  -[HDKeyValueDomain numberForKey:error:](domain, "numberForKey:error:", CFSTR("_SevenDayHeadphoneExposureDoseNotificationThreshold"), &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    doseLimit = self->_doseLimit;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v12 = doseLimit - v11;
      if (v12 < 0.0)
        v12 = -v12;
      v13 = CFSTR("[Current] %.2f%%\n [After Reboot] %@");
      if (v12 <= 2.22044605e-16)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v6, "doubleValue");
        v15 = v14;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f%% (Override)"), v14 * 100.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 > 5.0 || v15 < 0.01)
          v13 = CFSTR("[Current] %.2f%%\n [Invalid] %@");
      }
    }
    else
    {
      v19 = doseLimit + -1.0;
      if (doseLimit + -1.0 < 0.0)
        v19 = -(doseLimit + -1.0);
      if (v19 <= 2.22044605e-16)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f%% (Default)"), 0x4059000000000000);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = CFSTR("[Current] %.2f%%\n [After Reboot] %@");
    }
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v13, self->_doseLimit * 100.0, v16);
    }
    else
    {
      v20 = CFSTR("Override");
      if (!v6)
        v20 = CFSTR("Default");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f%% (%@)"), self->_doseLimit * 100.0, v20);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    v18 = 0;
    *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }

  return v18;
}

- (BOOL)_overrideDoseLimit:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;

  v6 = a3;
  v7 = v6;
  if (v6
    && ((objc_msgSend(v6, "doubleValue"), v8 < 0.01) || v8 > 5.0)
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Dose Limit %.2f%% is outside the range %.2f%% - %.2f%% (Default: %.2f%%)"), v8 * 100.0, 0x3FF0000000000000, 0x407F400000000000, 0x4059000000000000), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 3, v9), v10 = (void *)objc_claimAutoreleasedReturnValue(), v9, (v11 = v10) != 0))
  {
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();

    LOBYTE(v13) = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    v13 = -[HDKeyValueDomain setNumber:forKey:error:](self->_domain, "setNumber:forKey:error:", v7, CFSTR("_SevenDayHeadphoneExposureDoseNotificationThreshold"), a4);
    if (v13)
      -[HDHeadphoneDoseMetadataStore _lock_loadDoseLimitOverride](self, "_lock_loadDoseLimitOverride");
    os_unfair_lock_unlock(&self->_lock);
  }

  return v13;
}

- (id)_infoForSevenDayDoseAtFireDate:(id)a3
{
  HDProfile **p_profile;
  id v4;
  id WeakRetained;
  void *v6;

  p_profile = &self->_profile;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:earliestStartDate:profile:](HDHeadphoneAudioExposureStatisticsBucket, "_currentDoseStringForEndDate:earliestStartDate:profile:", v4, 0, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_infoForAccumulatedDoseAtFireDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id WeakRetained;
  __CFString *v11;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "dateByAddingTimeInterval:", -1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HDHeadphoneDoseMetadataStore _mostRecentSevenDayLocalNotificationWithNow:error:](self, "_mostRecentSevenDayLocalNotificationWithNow:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    +[HDHeadphoneAudioExposureStatisticsBucket _currentDoseStringForEndDate:earliestStartDate:profile:](HDHeadphoneAudioExposureStatisticsBucket, "_currentDoseStringForEndDate:earliestStartDate:profile:", v4, v6, WeakRetained);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if ((objc_msgSend(v7, "hk_isDatabaseAccessibilityError") & 1) != 0)
  {
    v11 = CFSTR("Locked (Data Inaccessible)");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fetch previous HAEN before %@ failed: %@"), v4, v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)_updateCacheWithFireDate:(id)a3 fromRemoteNotification:(BOOL)a4 changed:(BOOL *)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;

  v8 = a4;
  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseMetadataStore.m"), 459, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fireDate"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    v12 = (id *)&v21;
    -[HDHeadphoneDoseMetadataStore _fetchPreviousSevenDayLocalNotificationFireDateWithError:](self, "_fetchPreviousSevenDayLocalNotificationFireDateWithError:", &v21);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v22 = 0;
  v12 = (id *)&v22;
  -[HDHeadphoneDoseMetadataStore _fetchPreviousSevenDayRemoteNotificationFireDateWithError:](self, "_fetchPreviousSevenDayRemoteNotificationFireDateWithError:", &v22);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v13;
  v16 = *v12;
  v17 = v16;
  if (v15 || !v16)
  {
    if (v15 && (objc_msgSend(v15, "hk_isBeforeDate:", v11) & 1) == 0)
    {
      if (a5)
        *a5 = 0;
      v18 = 1;
    }
    else
    {
      if (v8)
        v19 = -[HDHeadphoneDoseMetadataStore _setPreviousSevenDayRemoteNotificationFireDate:error:](self, "_setPreviousSevenDayRemoteNotificationFireDate:error:", v11, a6);
      else
        v19 = -[HDHeadphoneDoseMetadataStore _setPreviousSevenDayLocalNotificationFireDate:error:](self, "_setPreviousSevenDayLocalNotificationFireDate:error:", v11, a6);
      v18 = v19;
      if (a5)
        *a5 = v19;
    }
  }
  else
  {
    if (a5)
      *a5 = 0;
    if (a6)
    {
      v18 = 0;
      *a6 = objc_retainAutorelease(v16);
    }
    else
    {
      _HKLogDroppedError();
      v18 = 0;
    }
  }

  return v18;
}

- (int64_t)_updatePreviousSevenDayLocalNotificationFireDateWithSamplesInserted:(id)a3 now:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t i;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v37;
  NSObject *log;
  void *v39;
  HDHeadphoneDoseMetadataStore *v40;
  id v41;
  char v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled") & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_earliestFireDateAllowedWithNow:", v9);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = v8;
    v44 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v44)
    {
      v40 = self;
      v41 = v8;
      v42 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v46;
      v13 = CFSTR("sample");
      while (2)
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v10);
          objc_opt_class();
          HKSafeObject();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

            v35 = 0;
            goto LABEL_23;
          }
          v16 = v15;
          if (objc_msgSend(v15, "hk_isHearingSevenDayDoseNotification"))
          {
            v17 = a5;
            v18 = v10;
            v19 = v13;
            objc_msgSend(v16, "endDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "hk_isAfterDate:", v9);

            if (v21)
            {
              _HKInitializeLogging();
              v22 = (void *)*MEMORY[0x24BDD3000];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
              {
                log = v22;
                objc_msgSend(v16, "endDate");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "timeIntervalSinceDate:", v9);
                v24 = v23;
                objc_msgSend(v16, "endDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "timeIntervalSince1970");
                v26 = (uint64_t)v25;
                objc_msgSend(v9, "timeIntervalSince1970");
                *(_DWORD *)buf = 134218496;
                v50 = v24;
                v51 = 2048;
                v52 = v26;
                v53 = 2048;
                v54 = (uint64_t)v27;
                _os_log_error_impl(&dword_21A0AA000, log, OS_LOG_TYPE_ERROR, "Ignoring incoming HAEN ending %f seconds in the future (endDate: %{time_t}ld, now: %{time_t}ld).", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v16, "endDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "hk_isAfterOrEqualToDate:", v43);

              if (v29)
              {
                if (!v11
                  || (objc_msgSend(v16, "endDate"),
                      v30 = (void *)objc_claimAutoreleasedReturnValue(),
                      v31 = objc_msgSend(v11, "hk_isBeforeDate:", v30),
                      v30,
                      v31))
                {
                  objc_msgSend(v16, "endDate");
                  v32 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v16, "sourceRevision");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "source");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v34, "_isLocalDevice");

                  v11 = (void *)v32;
                }
              }
            }
            v13 = v19;
            v10 = v18;
            a5 = v17;
          }

        }
        v44 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        if (v44)
          continue;
        break;
      }

      if (v11)
      {
        v35 = -[HDHeadphoneDoseMetadataStore _updatePreviousSevenDayNotificationFireDateWith:fromRemoteNotification:isLocalDevice:now:error:](v40, "_updatePreviousSevenDayNotificationFireDateWith:fromRemoteNotification:isLocalDevice:now:error:", v11, 0, v42 & 1, v9, a5);
        v8 = v41;
        goto LABEL_25;
      }
      v35 = 1;
LABEL_23:
      v8 = v41;
    }
    else
    {

      v11 = 0;
      v35 = 1;
    }
LABEL_25:

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 111, CFSTR("Feature Disabled: 7-Day HAEN"));
    v35 = 0;
  }

  return v35;
}

- (int64_t)_updatePreviousSevenDayNotificationFireDateWith:(id)a3 fromRemoteNotification:(BOOL)a4 isLocalDevice:(BOOL)a5 now:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  const __CFString *v23;
  int64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v9 = a5;
  v10 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  if (v10 && v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneDoseMetadataStore.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(!isLocalDevice && fromRemoteNotification) || !fromRemoteNotification"));

  }
  if ((objc_msgSend(MEMORY[0x24BE456A0], "isHeadphoneExposureNotificationsEnabled") & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_earliestFireDateAllowedWithNow:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hk_isAfterDate:", v14))
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v19 = v18;
        objc_msgSend(v13, "timeIntervalSince1970");
        v21 = (uint64_t)v20;
        objc_msgSend(v14, "timeIntervalSince1970");
        v23 = CFSTR("NO");
        *(_DWORD *)buf = 134218754;
        v31 = v19;
        v32 = 2048;
        if (v10)
          v23 = CFSTR("YES");
        v33 = v21;
        v34 = 2048;
        v35 = (uint64_t)v22;
        v36 = 2112;
        v37 = v23;
        _os_log_error_impl(&dword_21A0AA000, v17, OS_LOG_TYPE_ERROR, "Ignoring if fire date ending %f seconds in the future (endDate: %{time_t}ld, now: %{time_t}ld). Is fire date from remote notification: %@", buf, 0x2Au);

      }
    }
    else if (objc_msgSend(v13, "hk_isAfterOrEqualToDate:", v15))
    {
      buf[0] = 0;
      v25 = -[HDHeadphoneDoseMetadataStore _updateCacheWithFireDate:fromRemoteNotification:changed:error:](self, "_updateCacheWithFireDate:fromRemoteNotification:changed:error:", v13, v10, buf, a7);
      v26 = 2;
      if (v9)
        v26 = 3;
      if (buf[0])
        v27 = v26;
      else
        v27 = 1;
      if (v25)
        v24 = v27;
      else
        v24 = 0;
      goto LABEL_21;
    }
    v24 = 1;
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a7, 111, CFSTR("Feature Disabled: 7-Day HAEN"));
  v24 = 0;
LABEL_22:

  return v24;
}

- (id)_filterForValidateFireDate:(id)a3 now:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hk_isAfterDate:", v7))
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      -[HDHeadphoneDoseMetadataStore _filterForValidateFireDate:now:error:].cold.1(v8, v6, (uint64_t)v7);
    v9 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_earliestFireDateAllowedWithNow:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hk_isAfterOrEqualToDate:", v10))
      v9 = v6;
    else
      v9 = 0;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_filterForValidateFireDate:(void *)a1 now:(void *)a2 error:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "timeIntervalSinceDate:", a3);
  v7 = 134217984;
  v8 = v6;
  _os_log_fault_impl(&dword_21A0AA000, v5, OS_LOG_TYPE_FAULT, "Ignoring fetched HAEN ending %f seconds in the future.", (uint8_t *)&v7, 0xCu);

}

@end
