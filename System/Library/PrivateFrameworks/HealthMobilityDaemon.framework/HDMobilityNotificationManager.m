@implementation HDMobilityNotificationManager

- (HDMobilityNotificationManager)initWithProfile:(id)a3 walkingSteadinessAvailabilityManager:(id)a4
{
  id v6;
  id v7;
  HDMobilityNotificationManager *v8;
  HDMobilityNotificationManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v13;
  HKMobilityWalkingSteadinessAnalyticsManager *v14;
  HKMobilityWalkingSteadinessAnalyticsManager *analyticsManager;
  uint64_t v16;
  HKFeatureStatusManager *walkingSteadinessFeatureStatusManager;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  HDMobilityNotificationManager *v21;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HDMobilityNotificationManager;
  v8 = -[HDMobilityNotificationManager init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerForDaemonReady:", v9);

    v14 = (HKMobilityWalkingSteadinessAnalyticsManager *)objc_alloc_init(MEMORY[0x24BE46D98]);
    analyticsManager = v9->_analyticsManager;
    v9->_analyticsManager = v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v7, v6, 0);
    walkingSteadinessFeatureStatusManager = v9->_walkingSteadinessFeatureStatusManager;
    v9->_walkingSteadinessFeatureStatusManager = (HKFeatureStatusManager *)v16;

    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_2160FB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] was created", buf, 0xCu);

    }
    v21 = v9;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v10 = objc_opt_class();
    _os_log_impl(&dword_2160FB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stop observing walking steadiness events", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKMobilityWalkingSteadinessEventType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forDataType:", self, v7);

  v8.receiver = self;
  v8.super_class = (Class)HDMobilityNotificationManager;
  -[HDMobilityNotificationManager dealloc](&v8, sel_dealloc);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v9 = 138543362;
    v10 = objc_opt_class();
    _os_log_impl(&dword_2160FB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] start observing walking steadiness events", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKMobilityWalkingSteadinessEventType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forDataType:", self, v8);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  os_log_t v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *queue;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  _QWORD block[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    v10 = (os_log_t *)MEMORY[0x24BDD3040];
    *(_QWORD *)&v7 = 138543362;
    v22 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "_source", v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_isLocalDevice");

        _HKInitializeLogging();
        v15 = *v10;
        v16 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
        if ((v14 & 1) != 0)
        {
          if (v16)
          {
            v17 = v15;
            v18 = objc_opt_class();
            *(_DWORD *)buf = v22;
            v29 = v18;
            _os_log_impl(&dword_2160FB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detected AppleWalkingSteadinessEvent added with local device source", buf, 0xCu);

          }
          queue = self->_queue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke;
          block[3] = &unk_24D4DF998;
          block[4] = self;
          block[5] = v12;
          dispatch_async(queue, block);
        }
        else if (v16)
        {
          v20 = v15;
          v21 = objc_opt_class();
          *(_DWORD *)buf = v22;
          v29 = v21;
          _os_log_impl(&dword_2160FB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detected AppleWalkingSteadinessEvent added with non-local device source", buf, 0xCu);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

}

uint64_t __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2;
  v4[3] = &unk_24D4DF970;
  v4[4] = v2;
  return objc_msgSend(v2, "_queue_showNotificationForLocalSteadinessEvent:completion:", v1, v4);
}

void __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3040];
  v7 = *MEMORY[0x24BDD3040];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = 138543362;
      v10 = objc_opt_class();
      _os_log_impl(&dword_2160FB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notified user for AppleWalkingSteadinessEvent successfully.", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (void)_queue_showNotificationForLocalSteadinessEvent:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD v30[5];
  HKMobilityWalkingSteadinessAnalyticsManager *v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMobilityNotificationManager.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(v7, "_source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_isLocalDevice");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMobilityNotificationManager.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event._source._isLocalDevice"));

  }
  objc_msgSend(v7, "categoryType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "code");

  if (v12 != 250)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMobilityNotificationManager.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.categoryType.code == _HKDataTypeAppleWalkingSteadinessEvent"));

  }
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_2160FB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] showing notification for event: %@", buf, 0x16u);

  }
  v15 = objc_msgSend(v7, "value");
  HKMobilityNotificationCategoryForWalkingSteadinessEventValue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "notificationManager");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy_;
    v30[4] = __Block_byref_object_dispose_;
    v31 = self->_analyticsManager;
    v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke;
    v23[3] = &unk_24D4DF9E8;
    v23[4] = self;
    v24 = v16;
    v27 = buf;
    v26 = v8;
    v29 = v15;
    v25 = v7;
    v28 = v30;
    objc_msgSend(v18, "removeDeliveredNotificationsWithCategoryIdentifier:completionHandler:", v24, v23);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("Unknown notification category for walking steadiness event value: %ld"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v19);

  }
}

void __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  os_log_t *v8;
  os_log_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource *v19;
  id WeakRetained;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seahorse");

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v29 = 0;
    objc_msgSend(v5, "featureStatusWithError:", &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    v8 = (os_log_t *)MEMORY[0x24BDD3040];
    if (!v6)
    {
      _HKInitializeLogging();
      v9 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v31 = v11;
        v32 = 2114;
        v33 = v7;
        _os_log_impl(&dword_2160FB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to get featureStatus. error: %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE46D38]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "areAllRequirementsSatisfied");

    _HKInitializeLogging();
    v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      v32 = 1024;
      LODWORD(v33) = v13;
      _os_log_impl(&dword_2160FB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Firing notification with shouldHidePregnancyContent: %d", buf, 0x12u);

    }
    objc_msgSend(MEMORY[0x24BDF8858], "hkmobility_requestForCategory:shouldHidePregnancyContent:", *(_QWORD *)(a1 + 40), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "postNotificationWithRequest:completion:", v17, *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8858], "hkmobility_requestForCategory:shouldHidePregnancyContent:", *(_QWORD *)(a1 + 40), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "postNotificationWithRequest:completion:", v18, *(_QWORD *)(a1 + 56));

  }
  v19 = [HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v21 = *(_QWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource initWithProfile:category:value:date:](v19, "initWithProfile:category:value:date:", WeakRetained, v22, v21, v23);

  v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke_207;
  v27[3] = &unk_24D4DF9C0;
  v26 = *(void **)(a1 + 40);
  v27[4] = *(_QWORD *)(a1 + 32);
  v28 = v26;
  objc_msgSend(v25, "submitNotificationEventWithDataSource:resultHandler:", v24, v27);

}

void __91__HDMobilityNotificationManager__queue_showNotificationForLocalSteadinessEvent_completion___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "status") == 1)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_2160FB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to submit notification analytics for category: %@, error: %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSteadinessFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __53__HDMobilityNotificationManager_samplesAdded_anchor___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = 138543618;
  v6 = objc_opt_class();
  v7 = 2112;
  v8 = a3;
  _os_log_fault_impl(&dword_2160FB000, v4, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to notify user for AppleWalkingSteadinessEvent with error: %@", (uint8_t *)&v5, 0x16u);

}

@end
