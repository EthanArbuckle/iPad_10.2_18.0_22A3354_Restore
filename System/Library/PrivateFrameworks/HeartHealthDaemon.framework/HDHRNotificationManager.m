@implementation HDHRNotificationManager

- (HDHRNotificationManager)initWithProfile:(id)a3
{
  id v4;
  HDHRNotificationManager *v5;
  HDHRNotificationManager *v6;
  const char *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDHRNotificationManager;
  v5 = -[HDHRNotificationManager init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = (const char *)HKDispatchQueueName();
    v8 = dispatch_queue_create(v7, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    -[HDHRNotificationManager _subscribeToFakingNotifications](v6, "_subscribeToFakingNotifications");
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerForDaemonReady:", v6);

    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      v15 = v14;
      _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] was created", buf, 0xCu);

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HDHRNotificationManager _unsubscribeToFakingNotifications](self, "_unsubscribeToFakingNotifications");
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v5 = v17;
    _os_log_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stop observing heart rate events", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forDataType:", self, v8);

  v9 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v9, "dataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forDataType:", self, v11);

  v12 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v12, "dataManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "lowCardioFitnessEventType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:forDataType:", self, v14);

  v15.receiver = self;
  v15.super_class = (Class)HDHRNotificationManager;
  -[HDHRNotificationManager dealloc](&v15, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v16 = 138543362;
    v17 = (id)objc_opt_class();
    v6 = v17;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] start observing heart rate events", (uint8_t *)&v16, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forDataType:", self, v9);

  v10 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v10, "dataManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:forDataType:", self, v12);

  v13 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v13, "dataManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "lowCardioFitnessEventType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:forDataType:", self, v15);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  os_log_t v15;
  _BOOL4 v16;
  NSObject *queue;
  int *v18;
  _QWORD block[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[16];
  _BYTE v25[4];
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v18 = &v26;
    v9 = (os_log_t *)MEMORY[0x1E0CB52E8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "sourceRevision", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_isLocalDevice");

        _HKInitializeLogging();
        v15 = *v9;
        v16 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG);
        if (v14)
        {
          if (v16)
            -[HDHRNotificationManager samplesAdded:anchor:].cold.1((uint64_t)v25, v15);
          queue = self->_queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __47__HDHRNotificationManager_samplesAdded_anchor___block_invoke;
          block[3] = &unk_1E87EFB30;
          block[4] = self;
          block[5] = v11;
          dispatch_async(queue, block);
        }
        else if (v16)
        {
          -[HDHRNotificationManager samplesAdded:anchor:].cold.2((uint64_t)v24, v15);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v7);
  }

}

uint64_t __47__HDHRNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_showNotificationForHeartEvent:", *(_QWORD *)(a1 + 40));
}

- (id)_userNotificationCenter
{
  if (_userNotificationCenter_onceToken != -1)
    dispatch_once(&_userNotificationCenter_onceToken, &__block_literal_global_10);
  return (id)_userNotificationCenter_userNotificationCenter;
}

void __50__HDHRNotificationManager__userNotificationCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v1 = (void *)_userNotificationCenter_userNotificationCenter;
  _userNotificationCenter_userNotificationCenter = v0;

}

- (void)_queue_showNotificationForHeartEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  HDHRNotificationManager *v64;
  void *v65;
  void *v66;
  _QWORD block[5];
  id v68;
  id v69;
  id v70;
  const __CFString *v71;
  void *v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateByAddingDays:toDate:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "hk_isAfterDate:", v7);

  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB52E8];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v6)
  {
    if (v10)
    {
      v13 = v9;
      *(_DWORD *)buf = 138543874;
      v74 = (id)objc_opt_class();
      v75 = 2112;
      v76 = v4;
      v77 = 2114;
      v78 = v7;
      v14 = v74;
      _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] showing notification for event: %@, expiration date: %{public}@", buf, 0x20u);

    }
    v15 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v15, "setDateStyle:", 0);
    objc_msgSend(v15, "setTimeStyle:", 1);
    objc_msgSend(v4, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CB72B0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v19;
    objc_msgSend(v19, "_beatsPerMinute");
    v21 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", llround(v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringFromNumber:numberStyle:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "categoryType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    v66 = v23;
    if (v26)
    {
      v63 = v15;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_TACHYCARDIA_TITLE"), &stru_1E87F0B08, CFSTR("Localizable"));
      v28 = v7;
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0CB3940];
      v64 = self;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_TACHYCARDIA_MESSAGE_FORMAT"), &stru_1E87F0B08, CFSTR("Localizable"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v17;
      v60 = v23;
      v33 = v29;
      v7 = v28;
      objc_msgSend(v30, "stringWithFormat:", v32, v60, v17);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = CFSTR("Tachycardia");
    }
    else
    {
      objc_msgSend(v4, "categoryType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (v38)
      {
        v63 = v15;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_BRADYCARDIA_TITLE"), &stru_1E87F0B08, CFSTR("Localizable"));
        v33 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)MEMORY[0x1E0CB3940];
        v64 = self;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_BRADYCARDIA_MESSAGE_FORMAT"), &stru_1E87F0B08, CFSTR("Localizable"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v17;
        objc_msgSend(v40, "stringWithFormat:", v42, v66, v17);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = CFSTR("Bradycardia");
      }
      else
      {
        objc_msgSend(v4, "categoryType");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6380], "lowCardioFitnessEventType");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
        {
          _HKInitializeLogging();
          v59 = (void *)*MEMORY[0x1E0CB52E8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
            -[HDHRNotificationManager _queue_showNotificationForHeartEvent:].cold.2(v59, (uint64_t)self, v4);
          goto LABEL_17;
        }
        v62 = v17;
        v63 = v15;
        v64 = self;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("HEART_RATE_LOW_CARDIO_FITNESS_TITLE"), 0);
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("HEART_RATE_LOW_CARDIO_FITNESS_MESSAGE"), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = CFSTR("LowCardioFitness");
      }
    }
    v46 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
    objc_msgSend(v46, "setTitle:", v33);
    objc_msgSend(v46, "setBody:", v34);
    objc_msgSend(v46, "setCategoryIdentifier:", v35);
    objc_msgSend(v46, "setThreadIdentifier:", v35);
    objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", 25);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAlertTopic:", *MEMORY[0x1E0DBF768]);
    objc_msgSend(v46, "setSound:", v47);
    objc_msgSend(v4, "endDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDate:", v48);

    v61 = v7;
    objc_msgSend(v46, "setExpirationDate:", v7);
    v70 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v70);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v70;
    v51 = (void *)v33;
    if (v49)
    {
      v71 = CFSTR("HeartRateEventData");
      v72 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setUserInfo:", v52);

    }
    else
    {
      _HKInitializeLogging();
      v53 = (void *)*MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        -[HDHRNotificationManager _queue_showNotificationForHeartEvent:].cold.1(v53);
    }
    v54 = (void *)MEMORY[0x1E0CEC740];
    objc_msgSend(v4, "UUID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "UUIDString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "requestWithIdentifier:content:trigger:", v56, v46, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke;
    block[3] = &unk_1E87EFAE0;
    block[4] = v64;
    v68 = v57;
    v69 = v4;
    v58 = v57;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v17 = v62;
    v15 = v63;
    v23 = v66;
    v7 = v61;
LABEL_17:

    goto LABEL_18;
  }
  if (v10)
  {
    v11 = v9;
    *(_DWORD *)buf = 138543618;
    v74 = (id)objc_opt_class();
    v75 = 2112;
    v76 = v4;
    v12 = v74;
    _os_log_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] not showing expired notification for event: %@", buf, 0x16u);

  }
LABEL_18:

}

void __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2;
  v4[3] = &unk_1E87F0310;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addNotificationRequest:withCompletionHandler:", v3, v4);

}

void __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  HDHRNotificationAnalytics *v8;

  v3 = a2;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
      __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2_cold_1(a1, v4);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "notificationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "areHealthNotificationsAuthorized");
  else
    v7 = 0;
  v8 = -[HDHRNotificationAnalytics initWithEventSample:areHealthNotificationsAuthorized:]([HDHRNotificationAnalytics alloc], "initWithEventSample:areHealthNotificationsAuthorized:", *(_QWORD *)(a1 + 40), v7);
  -[HDHRNotificationAnalytics submit](v8, "submit");

}

- (void)_queue_fakeNotificationWithEventType:(id)a3 withData:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  CFAbsoluteTime Current;
  uint64_t v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  dispatch_time_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v58;
  _QWORD block[6];
  id v60;
  _BYTE *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id obj;
  uint8_t v67[128];
  uint8_t v68[4];
  void *v69;
  __int16 v70;
  void *v71;
  void *v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  _QWORD v78[4];

  v4 = a4;
  v78[1] = *MEMORY[0x1E0C80C00];
  v54 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v54, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v74 = v10;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking %{public}@ notification, withData: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dateByAddingTimeInterval:", -600.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A28], "_quantityWithBeatsPerMinute:", 120.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v54, "isEqual:", v12);

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB6A28], "_quantityWithBeatsPerMinute:", 40.0);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v15 = (void *)MEMORY[0x1E0CB6378];
  v77 = *MEMORY[0x1E0CB72B0];
  v78[0] = v11;
  v52 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "categorySampleWithType:value:startDate:endDate:metadata:", v54, 0, v55, v53, v16);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__3;
    v75 = __Block_byref_object_dispose__3;
    v76 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v20, "dataProvenanceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "defaultLocalDataProvenance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v24 = *(_QWORD *)&buf[8];
    obj = *(id *)(*(_QWORD *)&buf[8] + 40);
    v25 = objc_msgSend(v18, "insertDataObjects:withProvenance:creationDate:error:", v19, v22, &obj, Current);
    objc_storeStrong((id *)(v24 + 40), obj);

    if (v25)
    {
      _HKInitializeLogging();
      v26 = (id)*MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_opt_class();
        *(_DWORD *)v68 = 138543618;
        v69 = v27;
        v70 = 2112;
        v71 = v58;
        v28 = v27;
        _os_log_impl(&dword_1CC29C000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved event sample: %@", v68, 0x16u);

      }
    }
    else
    {
      _HKInitializeLogging();
      v26 = (id)*MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        -[HDHRNotificationManager _queue_fakeNotificationWithEventType:withData:].cold.1(v29, (uint64_t)&buf[8], (uint64_t)v68, v26);
      }
    }

    objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v54, "isEqual:", v30);

    if (v31)
      v32 = &unk_1E88001E0;
    else
      v32 = &unk_1E88001C8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = *MEMORY[0x1E0CB5CB0];
    while (objc_msgSend(v32, "count") > v34)
    {
      objc_msgSend(&unk_1E88001B0, "objectAtIndexedSubscript:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      objc_msgSend(v55, "dateByAddingTimeInterval:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0CB6A40];
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v32, "objectAtIndexedSubscript:", v34);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      objc_msgSend(v40, "_quantityWithBeatsPerMinute:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "quantitySampleWithType:quantity:startDate:endDate:", v39, v42, v37, v37);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "addObject:", v43);
      ++v34;
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v56 = v33;
    v44 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v63;
      v46 = 0.0;
      v47 = MEMORY[0x1E0C809B0];
      v48 = MEMORY[0x1E0C80D38];
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v63 != v45)
            objc_enumerationMutation(v56);
          v50 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v49);
          v51 = dispatch_time(0, (uint64_t)(v46 * 1000000000.0));
          block[0] = v47;
          block[1] = 3221225472;
          block[2] = __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke;
          block[3] = &unk_1E87F0338;
          block[4] = self;
          block[5] = v50;
          v61 = buf;
          v60 = v58;
          dispatch_after(v51, v48, block);

          v46 = v46 + 2.0;
          ++v49;
        }
        while (v44 != v49);
        v44 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v44);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[HDHRNotificationManager _queue_showNotificationForHeartEvent:](self, "_queue_showNotificationForHeartEvent:", v58);
  }

}

void __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CFAbsoluteTime Current;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  id v26;
  id obj;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)v2 + 8));
  objc_msgSend(v6, "dataProvenanceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultLocalDataProvenance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v4, "insertDataObjects:withProvenance:creationDate:error:", v5, v8, &obj, Current);
  objc_storeStrong((id *)(v10 + 40), obj);

  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E0CB52E8];
  v13 = *MEMORY[0x1E0CB52E8];
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v12;
      v15 = (void *)objc_opt_class();
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v17 = v15;
      _os_log_impl(&dword_1CC29C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved heart rate sample: %@", buf, 0x16u);

    }
    v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v18, "associationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v26 = *(id *)(v23 + 40);
    v24 = objc_msgSend(v19, "associateObjectUUIDs:objectUUID:error:", v21, v22, &v26);
    objc_storeStrong((id *)(v23 + 40), v26);

    if ((v24 & 1) == 0)
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_1(v2, v25);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_2(v2, v12);
  }

}

- (void)_subscribeToFakingNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRNotificationManager _subscribeToFakingNotification:type:withData:](self, "_subscribeToFakingNotification:type:withData:", CFSTR("com.apple.HeartRate.Tachycardia"), v3, 0);

  objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRNotificationManager _subscribeToFakingNotification:type:withData:](self, "_subscribeToFakingNotification:type:withData:", CFSTR("com.apple.HeartRate.TachycardiaWithData"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRNotificationManager _subscribeToFakingNotification:type:withData:](self, "_subscribeToFakingNotification:type:withData:", CFSTR("com.apple.HeartRate.Bradycardia"), v5, 0);

  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHRNotificationManager _subscribeToFakingNotification:type:withData:](self, "_subscribeToFakingNotification:type:withData:", CFSTR("com.apple.HeartRate.BradycardiaWithData"), v6, 1);

}

- (void)_subscribeToFakingNotification:(id)a3 type:(id)a4 withData:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  NSObject *queue;
  id v13;
  NSMutableArray *fakingNotifyTokens;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  int out_token;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  out_token = 0;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  queue = self->_queue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __72__HDHRNotificationManager__subscribeToFakingNotification_type_withData___block_invoke;
  v19 = &unk_1E87F0360;
  objc_copyWeak(&v21, &location);
  v13 = v9;
  v20 = v13;
  v22 = a5;
  notify_register_dispatch(v11, &out_token, queue, &v16);
  fakingNotifyTokens = self->_fakingNotifyTokens;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](fakingNotifyTokens, "addObject:", v15);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __72__HDHRNotificationManager__subscribeToFakingNotification_type_withData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_fakeNotificationWithEventType:withData:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_unsubscribeToFakingNotifications
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_fakingNotifyTokens;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "intValue", (_QWORD)v8);
        if (notify_is_valid_token(v7))
          notify_cancel(v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)_queue_fakeCardioFitnessNotificationWithData:(BOOL)a3 repeat:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  BOOL v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  CFAbsoluteTime Current;
  int v69;
  id v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  HDHRHealthKitSyncManager *v78;
  id v79;
  HDHRHealthKitSyncManager *v80;
  id v81;
  id v82;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  void *v90;
  id obj;
  uint64_t v93;
  id *location;
  uint64_t v95;
  uint64_t v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  void *v103;
  _BYTE v104[128];
  void *v105;
  _QWORD v106[3];
  _QWORD v107[3];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  id v111;
  __int16 v112;
  void *v113;
  uint64_t v114;

  v5 = a4;
  v6 = a3;
  v114 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v109 = v9;
    v110 = 2112;
    v111 = v12;
    v112 = 2112;
    v113 = v13;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking Cardio Fitness notification, withData: %@, repeat: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingTimeInterval:", -1641600.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/(kg*min)"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17, 24.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/(kg*min)"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20, 19.0);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v14);
  objc_msgSend(v22, "duration");
  v24 = v23;

  v25 = (void *)MEMORY[0x1E0CB6378];
  objc_msgSend(MEMORY[0x1E0CB6380], "lowCardioFitnessEventType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0CB5570];
  v106[0] = *MEMORY[0x1E0CB55F8];
  v106[1] = v27;
  v90 = (void *)v21;
  v107[0] = v21;
  v107[1] = v18;
  v106[2] = *MEMORY[0x1E0CB7328];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "categorySampleWithType:value:startDate:endDate:metadata:", v26, 1, v15, v14, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v85 = v18;
    v86 = v15;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v30;
    v105 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id *)&self->_profile;
    v34 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v34, "dataProvenanceManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "defaultLocalDataProvenance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0;
    v37 = objc_msgSend(v32, "insertDataObjects:withProvenance:creationDate:error:", v33, v36, &v102, CFAbsoluteTimeGetCurrent());
    v38 = v102;

    _HKInitializeLogging();
    v39 = (void *)*MEMORY[0x1E0CB52E8];
    v89 = v14;
    v40 = *MEMORY[0x1E0CB52E8];
    if (v37)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v39;
        v42 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v109 = v42;
        v110 = 2112;
        v111 = v87;
        v43 = v42;
        _os_log_impl(&dword_1CC29C000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved event sample: %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      -[HDHRNotificationManager _queue_fakeCardioFitnessNotificationWithData:repeat:error:].cold.1(v39);
    }
    v84 = v38;
    v45 = objc_msgSend(&unk_1E88001F8, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0x1E0CB6000uLL;
    if (v45 >= 1)
    {
      v48 = 0;
      v49 = -floor(v24 / (double)(v45 - 1));
      v95 = *MEMORY[0x1E0CB5DA0];
      do
      {
        objc_msgSend(v89, "dateByAddingTimeInterval:", v49 * (double)(int)v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(void **)(v47 + 2600);
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/(kg*min)"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E88001F8, "objectAtIndexedSubscript:", v48);
        v53 = v47;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "doubleValue");
        objc_msgSend(v51, "quantityWithUnit:doubleValue:", v52);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = (void *)MEMORY[0x1E0CB6A40];
        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v95);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "quantitySampleWithType:quantity:startDate:endDate:", v57, v55, v50, v50);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "addObject:", v58);
        v47 = v53;

        ++v48;
      }
      while (v45 != v48);
    }
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    obj = v46;
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
    if (v96)
    {
      v93 = *(_QWORD *)v99;
      v59 = v84;
      while (1)
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v99 != v93)
            objc_enumerationMutation(obj);
          v61 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v60);
          v62 = objc_loadWeakRetained(location);
          objc_msgSend(v62, "dataManager");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v103 = v61;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_loadWeakRetained(location);
          objc_msgSend(v65, "dataProvenanceManager");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "defaultLocalDataProvenance");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          Current = CFAbsoluteTimeGetCurrent();
          v97 = v59;
          v69 = objc_msgSend(v63, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v64, v67, 1, &v97, Current);
          v70 = v97;

          _HKInitializeLogging();
          v71 = (void *)*MEMORY[0x1E0CB52E8];
          v72 = *MEMORY[0x1E0CB52E8];
          if (v69)
          {
            v59 = v70;
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              goto LABEL_23;
            v73 = v71;
            v74 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v109 = v74;
            v110 = 2112;
            v111 = v61;
            v75 = v74;
            _os_log_impl(&dword_1CC29C000, v73, OS_LOG_TYPE_DEFAULT, "[%{public}@] faking - saved VO2Max sample: %@", buf, 0x16u);
            goto LABEL_21;
          }
          v59 = v70;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v73 = v71;
            v76 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v109 = v76;
            v110 = 2114;
            v111 = v70;
            v75 = v76;
            _os_log_error_impl(&dword_1CC29C000, v73, OS_LOG_TYPE_ERROR, "[%{public}@] faking - failed to save VO2Max with error: %{public}@", buf, 0x16u);
LABEL_21:

          }
LABEL_23:

          ++v60;
        }
        while (v96 != v60);
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
        v96 = v77;
        if (!v77)
          goto LABEL_29;
      }
    }
    v59 = v84;
LABEL_29:

    v78 = [HDHRHealthKitSyncManager alloc];
    v79 = objc_loadWeakRetained(location);
    v80 = -[HDHRHealthKitSyncManager initWithProfile:](v78, "initWithProfile:", v79);

    -[HDHRHealthKitSyncManager triggerImmediateSyncWithReason:loggingCategory:](v80, "triggerImmediateSyncWithReason:loggingCategory:", CFSTR("New fake Cardio Fitness notification sample has been added"), *MEMORY[0x1E0CB52E8]);
    v81 = v59;
    if (v81)
    {
      v82 = v81;
      v14 = v89;
      v18 = v85;
      v15 = v86;
      v30 = v87;
      if (a5)
      {
        v82 = objc_retainAutorelease(v81);
        *a5 = v82;
      }
      else
      {
        _HKLogDroppedError();
      }

      v44 = 0;
    }
    else
    {
      v44 = 1;
      v14 = v89;
      v18 = v85;
      v15 = v86;
      v30 = v87;
    }
  }
  else
  {
    -[HDHRNotificationManager _queue_showNotificationForHeartEvent:](self, "_queue_showNotificationForHeartEvent:", v30);
    v44 = 1;
  }

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakingNotifyTokens, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)samplesAdded:(uint64_t)a1 anchor:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = OUTLINED_FUNCTION_8_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_4_2();
  v4 = OUTLINED_FUNCTION_11_0(v3, 5.8381e-34);
  OUTLINED_FUNCTION_6_1(&dword_1CC29C000, v5, v6, "[%{public}@] Detected sample inserted with local device source");

  OUTLINED_FUNCTION_7_1();
}

- (void)samplesAdded:(uint64_t)a1 anchor:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = OUTLINED_FUNCTION_8_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_4_2();
  v4 = OUTLINED_FUNCTION_11_0(v3, 5.8381e-34);
  OUTLINED_FUNCTION_6_1(&dword_1CC29C000, v5, v6, "[%{public}@] Detected sample inserted with non-local device source");

  OUTLINED_FUNCTION_7_1();
}

- (void)_queue_showNotificationForHeartEvent:(void *)a1 .cold.1(void *a1)
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
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] error archiving event: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_showNotificationForHeartEvent:(void *)a3 .cold.2(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v4 = OUTLINED_FUNCTION_5(a1);
  v5 = (void *)OUTLINED_FUNCTION_4_2();
  v6 = v5;
  objc_msgSend(a3, "categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543618;
  v11 = v5;
  v12 = 2112;
  v13 = v9;
  _os_log_error_impl(&dword_1CC29C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] trying to show notification for unsupported event: %@", (uint8_t *)&v10, 0x16u);

}

void __64__HDHRNotificationManager__queue_showNotificationForHeartEvent___block_invoke_2_cold_1(uint64_t a1, void *a2)
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
  v4 = (void *)OUTLINED_FUNCTION_3_0();
  v5 = OUTLINED_FUNCTION_0_0(v4);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v6, v7, "[%{public}@] error requesting notification: %{public}@)", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_fakeNotificationWithEventType:(uint64_t)a3 withData:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = v6;
  v7 = a1;
  _os_log_error_impl(&dword_1CC29C000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] faking - failed to save event with error: %{public}@", (uint8_t *)a3, 0x16u);

  OUTLINED_FUNCTION_7_1();
}

void __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_10_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_5_2(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] faking - failed to associate heart rate with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __73__HDHRNotificationManager__queue_fakeNotificationWithEventType_withData___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_10_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_0();
  v4 = OUTLINED_FUNCTION_5_2(v3);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v5, v6, "[%{public}@] faking - failed to save heart rate with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_fakeCardioFitnessNotificationWithData:(void *)a1 repeat:error:.cold.1(void *a1)
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
  v2 = (void *)OUTLINED_FUNCTION_3_0();
  v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1CC29C000, v4, v5, "[%{public}@] faking - failed to save event with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

@end
