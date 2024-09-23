@implementation HDMCPluginServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDMCPluginServer *v17;
  id v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x24BE46AC8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDMCPluginServer initWithUUID:configuration:client:delegate:profileExtension:]([HDMCPluginServer alloc], "initWithUUID:configuration:client:delegate:profileExtension:", v11, v12, v13, v14, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

- (HDMCPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v13;
  id v14;
  HDMCPluginServer *v15;
  void *v16;
  uint64_t v17;
  OS_dispatch_queue *queue;
  void *v19;
  objc_super v21;

  v13 = a5;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDMCPluginServer;
  v15 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v21, sel_initWithUUID_configuration_client_delegate_, a3, a4, v13, a6);
  if (v15)
  {
    objc_msgSend(v13, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v15->_profile, v16);

    objc_storeStrong((id *)&v15->_profileExtension, a7);
    objc_storeStrong((id *)&v15->_client, a5);
    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x24BE40E10], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v15);

  }
  return v15;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE46AD0];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDD3310];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)remote_fetchScheduledNotificationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch scheduled notifications", buf, 0xCu);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HDMCPluginServer_remote_fetchScheduledNotificationsWithCompletion___block_invoke;
  v10[3] = &unk_24DB22500;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(queue, v10);

}

void __69__HDMCPluginServer_remote_fetchScheduledNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "notificationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "scheduledNotificationsWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)remote_saveDaySummaries:(id)a3 canOverrideCreationDate:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_opt_class();
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v12;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ day summaries", buf, 0x16u);

  }
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__HDMCPluginServer_remote_saveDaySummaries_canOverrideCreationDate_completion___block_invoke;
  v19[3] = &unk_24DB22710;
  v19[4] = self;
  v20 = v8;
  v22 = a4;
  v21 = v9;
  v17 = v9;
  v18 = v8;
  dispatch_async(queue, v19);

}

void __79__HDMCPluginServer_remote_saveDaySummaries_canOverrideCreationDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "analysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v4);
      v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
      v12 = *(void **)(a1 + 32);
      v13 = *(unsigned __int8 *)(a1 + 56);
      v15 = v10;
      v14 = objc_msgSend(v12, "_queue_reconcileSamplesToDeriveDaySummary:analysis:canOverrideCreationDate:error:", v11, v3, v13, &v15);
      v7 = v15;

      if (!v14)
        break;
      ++v9;
      v10 = v7;
      if (v6 == v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "_triggerImmediateSync");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)remote_saveBleedingFlow:(int64_t)a3 forBleedingType:(int64_t)a4 dayIndex:(int64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  NSObject *queue;
  id v22;
  void *v23;
  id v24;
  NSObject *log;
  id v26;
  int64_t v27;
  int64_t v28;
  _QWORD block[5];
  id v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    v12 = (void *)objc_opt_class();
    v26 = v12;
    HKSensitiveLogItem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v27 = a3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v28 = a5;
    v19 = a4;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = v15;
    v42 = 2112;
    v43 = v17;
    v44 = 2112;
    v45 = v20;
    _os_log_impl(&dword_21961B000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@: %@, %@: %@, day: %@", buf, 0x3Eu);

    v10 = v24;
    a4 = v19;
    a5 = v28;

    a3 = v27;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HDMCPluginServer_remote_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke;
  block[3] = &unk_24DB22738;
  v31 = a5;
  v32 = a3;
  v33 = a4;
  block[4] = self;
  v30 = v10;
  v22 = v10;
  dispatch_async(queue, block);

}

void __80__HDMCPluginServer_remote_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v3 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[8];
  v9 = 0;
  objc_msgSend(v3, "_queue_saveBleedingFlowByDayIndex:forBleedingType:calendarCache:error:", v6, v7, v2, &v9);
  v8 = v9;

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)remote_saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  NSObject *log;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  int64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    v11 = (void *)objc_opt_class();
    v21 = v11;
    HKSensitiveLogItem();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_21961B000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ %@ values: %@", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__HDMCPluginServer_remote_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke;
  block[3] = &unk_24DB22760;
  block[4] = self;
  v23 = v8;
  v24 = v9;
  v25 = a4;
  v18 = v9;
  v19 = v8;
  dispatch_async(queue, block);

}

void __81__HDMCPluginServer_remote_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[7];
  v7 = 0;
  objc_msgSend(v3, "_queue_saveBleedingFlowByDayIndex:forBleedingType:calendarCache:error:", v4, v5, v2, &v7);
  v6 = v7;
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)remote_saveMenstrualFlow:(int64_t)a3 dayIndex:(int64_t)a4 updateAdjacentDays:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *queue;
  id v19;
  NSObject *log;
  id v21;
  _QWORD block[5];
  id v23;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v6 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    v12 = (void *)objc_opt_class();
    v13 = (void *)MEMORY[0x24BDD16E0];
    v21 = v12;
    objc_msgSend(v13, "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v12;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v17;
    v33 = 1024;
    v34 = v6;
    _os_log_impl(&dword_21961B000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save menstrual flow: %@, day: %@, update adjacent days: %d", buf, 0x26u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HDMCPluginServer_remote_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke;
  block[3] = &unk_24DB22788;
  v26 = v6;
  v24 = a3;
  v25 = a4;
  block[4] = self;
  v23 = v10;
  v19 = v10;
  dispatch_async(queue, block);

}

void __84__HDMCPluginServer_remote_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  if (*(_BYTE *)(a1 + 64) && HKMCDaySummaryBleedingFlowHasFlow())
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v12 = 0;
    objc_msgSend(v3, "_queue_saveMenstrualFlowUpdatingAdjacentDays:dayIndex:calendarCache:error:", v4, v5, v2, &v12);
    v6 = v12;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", v10, v2, &v11);
    v6 = v11;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex:(id)a3 intermenstrualBleedingByDayIndex:(id)a4 addedCycleFactors:(id)a5 initialAnalysisWindow:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  os_log_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *queue;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  int64_t var1;
  id v48;
  int64_t var0;
  _QWORD block[5];
  id v51;
  id v52;
  id v53;
  id v54;
  int64_t v55;
  int64_t v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  var1 = a6.var1;
  var0 = a6.var0;
  v63 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v48 = a4;
  v12 = a5;
  v46 = a7;
  _HKInitializeLogging();
  v13 = (os_log_t *)MEMORY[0x24BDD3030];
  v14 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_opt_class();
    v17 = (void *)MEMORY[0x24BDD16E0];
    v18 = v16;
    objc_msgSend(v17, "numberWithInteger:", var0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v16;
    v59 = 2112;
    v60 = v19;
    _os_log_impl(&dword_21961B000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Confirm and save deviations with analysis window start: %@", buf, 0x16u);

  }
  _HKInitializeLogging();
  v20 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_opt_class();
    v23 = (void *)MEMORY[0x24BDD16E0];
    v24 = v22;
    objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v58 = v22;
    v59 = 2112;
    v60 = v25;
    v61 = 2112;
    v62 = v26;
    _os_log_impl(&dword_21961B000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ menstrual flow values: %@", buf, 0x20u);

  }
  _HKInitializeLogging();
  v27 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    v29 = (void *)objc_opt_class();
    v30 = (void *)MEMORY[0x24BDD16E0];
    v31 = v29;
    objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v48, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v58 = v29;
    v59 = 2112;
    v60 = v32;
    v61 = 2112;
    v62 = v33;
    _os_log_impl(&dword_21961B000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ intermenstrual bleeding values: %@", buf, 0x20u);

  }
  _HKInitializeLogging();
  v34 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v34;
    v36 = (void *)objc_opt_class();
    v37 = (void *)MEMORY[0x24BDD16E0];
    v38 = v36;
    objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v58 = v36;
    v59 = 2112;
    v60 = v39;
    v61 = 2112;
    v62 = v40;
    _os_log_impl(&dword_21961B000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %@ added cycle factors: %@", buf, 0x20u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke;
  block[3] = &unk_24DB22800;
  block[4] = self;
  v51 = v11;
  v52 = v48;
  v53 = v12;
  v55 = var0;
  v56 = var1;
  v54 = v46;
  v42 = v46;
  v43 = v12;
  v44 = v48;
  v45 = v11;
  dispatch_async(queue, block);

}

void __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v3 = objc_alloc_init(MEMORY[0x24BE40B20]);
  objc_msgSend(v3, "setCacheScope:", 1);
  objc_msgSend(v3, "setRequiresProtectedData:", 1);
  objc_msgSend(v3, "setRequiresWrite:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v6 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2;
  v39[3] = &unk_24DB22308;
  v7 = *(void **)(a1 + 40);
  v39[4] = *(_QWORD *)(a1 + 32);
  v40 = v7;
  v8 = v2;
  v41 = v8;
  v42 = *(id *)(a1 + 48);
  v43 = *(id *)(a1 + 56);
  v9 = objc_msgSend(v5, "performTransactionWithContext:error:block:inaccessibilityHandler:", v3, &v44, v39, 0);
  v10 = v44;

  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "analysisManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v10;
    objc_msgSend(v11, "analyzeWithError:", &v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v38;

    v10 = v13;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v12, "deviations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  v36[1] = 3221225472;
  v36[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_205;
  v36[3] = &unk_24DB227B0;
  v15 = v8;
  v37 = v15;
  objc_msgSend(v14, "hk_map:", v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2_209;
  v33[3] = &unk_24DB227D8;
  v17 = v15;
  v34 = v17;
  v35 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v16, "hk_filter:", v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v31 = v17;
    v20 = v12;
    v21 = v19;
    v22 = (void *)objc_opt_class();
    v23 = (void *)MEMORY[0x24BDD16E0];
    v30 = v22;
    objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v22;
    v12 = v20;
    v17 = v31;
    v47 = 2112;
    v48 = v24;
    v49 = 2112;
    v50 = v25;
    _os_log_impl(&dword_21961B000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving %@ deviations: %@", buf, 0x20u);

  }
  v26 = *(void **)(a1 + 32);
  v32 = v10;
  v27 = objc_msgSend(v26, "_queue_insertSamplesWithClientSource:error:", v18, &v32);
  v28 = v32;

  if (v27)
    v29 = v18;
  else
    v29 = 0;
  (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v29, v28);

}

uint64_t __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3)|| !objc_msgSend(*(id *)(a1 + 32), "_queue_saveIntermenstrualBleedingByDayIndex:calendarCache:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a3)|| !objc_msgSend(*(id *)(a1 + 32), "_queue_insertSamplesWithClientSource:error:", *(_QWORD *)(a1 + 64), a3))
  {
    return 0;
  }
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v13 = 138543362;
    v14 = (id)objc_opt_class();
    v7 = v14;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting deviation dismissal dayIndex", (uint8_t *)&v13, 0xCu);

  }
  v8 = (void *)MEMORY[0x24BE40AD0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(v8, "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "hdmc_setUnconfirmedDeviationDismissalDayIndex:error:", 0, a3);
  return v11;
}

id __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_205(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  v5 = objc_msgSend(v4, "days");
  objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_noonWithDayIndex:calendar:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = objc_msgSend(v4, "days");
  if (v10 <= 0)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v10 + v9 - 1;
  objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_noonWithDayIndex:calendar:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD3988];
  objc_msgSend(v4, "type");

  HKCategoryTypeFromDeviationType();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categorySampleWithType:value:startDate:endDate:", v15, 0, v7, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

BOOL __162__HDMCPluginServer_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2_209(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hk_dayIndexWithCalendar:", v4);

  return v5 >= *(_QWORD *)(a1 + 40);
}

- (void)remote_saveLastMenstrualPeriodWithDayIndexRange:(id)a3 completion:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD v16[5];
  id v17;
  int64_t v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  var1 = a3.var1;
  var0 = a3.var0;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKDayIndexRange();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_21961B000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save last menstrual period: %@", buf, 0x16u);

  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__HDMCPluginServer_remote_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke;
  v16[3] = &unk_24DB22828;
  v18 = var0;
  v19 = var1;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  dispatch_async(queue, v16);

}

void __79__HDMCPluginServer_remote_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v3 = (void *)a1[4];
  v5 = 0;
  objc_msgSend(v3, "_queue_saveLastMenstrualPeriodWithDayIndexRange:calendarCache:error:", a1[6], a1[7], v2, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)remote_savePeriodNotYetStartedWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD3968]);
  objc_msgSend(v5, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HKMCTodayIndex();

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showSensitiveLogItems");

  if (v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = v12;
      objc_msgSend(v13, "numberWithInteger:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period not started on day: %@", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__HDMCPluginServer_remote_savePeriodNotYetStartedWithCompletion___block_invoke;
  v19[3] = &unk_24DB22760;
  v19[4] = self;
  v20 = v5;
  v21 = v4;
  v22 = v7;
  v17 = v4;
  v18 = v5;
  dispatch_async(queue, v19);

}

void __65__HDMCPluginServer_remote_savePeriodNotYetStartedWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_mostRecentMenstrualFlowSampleWithError:requiringBeforeDay:calendarCache:", &v13, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_noonWithDayIndex:calendar:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", 1, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v3;
    objc_msgSend(v9, "_queue_insertSamplesWithClientSource:error:", v10, &v12);
    v11 = v12;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = v11;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)remote_savePeriodNotYetEndedWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD3968]);
  objc_msgSend(v5, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HKMCTodayIndex();

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showSensitiveLogItems");

  if (v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      v13 = (void *)MEMORY[0x24BDD16E0];
      v14 = v12;
      objc_msgSend(v13, "numberWithInteger:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period not ended on day: %@", buf, 0x16u);

    }
  }
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__HDMCPluginServer_remote_savePeriodNotYetEndedWithCompletion___block_invoke;
  v19[3] = &unk_24DB22760;
  v19[4] = self;
  v20 = v5;
  v21 = v4;
  v22 = v7;
  v17 = v4;
  v18 = v5;
  dispatch_async(queue, v19);

}

void __63__HDMCPluginServer_remote_savePeriodNotYetEndedWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_mostRecentMenstrualFlowSampleWithError:requiringBeforeDay:calendarCache:", &v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hk_dayIndexRangeWithCalendar:", v4);

    objc_msgSend(*(id *)(a1 + 32), "_queue_saveMenstrualFlow:forEachDayInRange:calendarCache:error:", 2, v3);
    v5 = v6;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = v5;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)remote_savePeriodStartedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *queue;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  int64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD3968]);
  objc_msgSend(v7, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HKMCTodayIndex();

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "showSensitiveLogItems");

  if (v11)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      v15 = (void *)MEMORY[0x24BDD16E0];
      v16 = v14;
      objc_msgSend(v15, "numberWithInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_21961B000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period started on day: %@, today: %@", buf, 0x20u);

    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_completion___block_invoke;
  block[3] = &unk_24DB22850;
  v25 = a3;
  v26 = v9;
  v23 = v7;
  v24 = v6;
  block[4] = self;
  v20 = v7;
  v21 = v6;
  dispatch_async(queue, block);

}

void __66__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 64) >= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_saveMenstrualFlow:forEachDayInRange:calendarCache:error:", 2);
    v4 = 0;
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hk_error:format:", 100, CFSTR("Start day cannot be after today: %@"), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)remote_savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *queue;
  id v19;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  int64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showSensitiveLogItems");

  if (v10)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = v13;
      objc_msgSend(v14, "numberWithInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_21961B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period started on day: %@, ended on day: %@", buf, 0x20u);

    }
  }
  queue = self->_queue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __82__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke;
  v20[3] = &unk_24DB22828;
  v22 = a3;
  v23 = a4;
  v20[4] = self;
  v21 = v8;
  v19 = v8;
  dispatch_async(queue, v20);

}

void __82__HDMCPluginServer_remote_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = a1[7];
  v7 = 0;
  objc_msgSend(v3, "_queue_savePeriodStartedOnDayIndex:endedOnDayIndex:calendarCache:error:", v4, v5, v2, &v7);
  v6 = v7;
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)remote_savePeriodEndedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *queue;
  id v16;
  _QWORD block[5];
  id v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showSensitiveLogItems");

  if (v8)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_opt_class();
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = v11;
      objc_msgSend(v12, "numberWithInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_21961B000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save period ended on day: %@", buf, 0x16u);

    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HDMCPluginServer_remote_savePeriodEndedOnDayIndex_completion___block_invoke;
  block[3] = &unk_24DB22878;
  v18 = v6;
  v19 = a3;
  block[4] = self;
  v16 = v6;
  dispatch_async(queue, block);

}

void __64__HDMCPluginServer_remote_savePeriodEndedOnDayIndex_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v2 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v3 = (void *)a1[4];
  v16 = 0;
  objc_msgSend(v3, "_queue_mostRecentMenstrualFlowSampleWithError:requiringBeforeDay:calendarCache:", &v16, a1[6], v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v4)
  {
    objc_msgSend(v2, "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "hk_dayIndexRangeWithCalendar:", v6);
    v9 = v8;
    v10 = v7 + v8;

    if (v9 <= 0)
      v11 = 0x8000000000000000;
    else
      v11 = v10;
    v12 = (void *)a1[4];
    v13 = a1[6];
    v15 = v5;
    objc_msgSend(v12, "_queue_savePeriodStartedOnDayIndex:endedOnDayIndex:calendarCache:error:", v11, v13, v2, &v15);
    v14 = v15;

    (*(void (**)(void))(a1[5] + 16))();
    v5 = v14;
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void)remote_triggerAnalysisForDebugReason:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, id);
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, BOOL, id))a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v6;
    v10 = v16;
    _os_log_impl(&dword_21961B000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Trigger analysis for %{public}@", buf, 0x16u);

  }
  -[HDMCProfileExtension analysisManager](self->_profileExtension, "analysisManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v11, "analyzeWithError:", &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;

  v7[2](v7, v12 != 0, v13);
}

- (BOOL)_queue_reconcileSamplesToDeriveDaySummary:(id)a3 analysis:(id)a4 canOverrideCreationDate:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  int v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *log;
  id v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v13 = objc_msgSend(v10, "dayIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDMCDaySummaryEnumerator daySummaryAtIndex:profile:calendarCache:error:](HDMCDaySummaryEnumerator, "daySummaryAtIndex:profile:calendarCache:error:", v13, WeakRetained, v12, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 || !*a6)
  {
    v16 = objc_msgSend(v10, "isEqual:", v15);
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD3030];
    v18 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = v17;
        *(_DWORD *)buf = 138543362;
        v39 = (id)objc_opt_class();
        v20 = v39;
        _os_log_impl(&dword_21961B000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical day summary", buf, 0xCu);

      }
      v21 = 1;
    }
    else
    {
      v31 = a5;
      if (v18)
      {
        log = v17;
        v22 = (void *)objc_opt_class();
        v30 = v22;
        HKSensitiveLogItem();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v22;
        v40 = 2112;
        v41 = v23;
        v42 = 2112;
        v43 = v24;
        _os_log_impl(&dword_21961B000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reconcile underlying samples to derive summary: %@, old summary: %@", buf, 0x20u);

      }
      v25 = objc_alloc_init(MEMORY[0x24BE40B20]);
      objc_msgSend(v25, "setCacheScope:", 1);
      objc_msgSend(v25, "setRequiresProtectedData:", 1);
      objc_msgSend(v25, "setRequiresWrite:", 1);
      v26 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v26, "database");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __101__HDMCPluginServer__queue_reconcileSamplesToDeriveDaySummary_analysis_canOverrideCreationDate_error___block_invoke;
      v32[3] = &unk_24DB228A0;
      v32[4] = self;
      v33 = v15;
      v34 = v10;
      v35 = v12;
      v37 = v31;
      v36 = v11;
      v21 = objc_msgSend(v27, "performTransactionWithContext:error:block:inaccessibilityHandler:", v25, a6, v32, 0);

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __101__HDMCPluginServer__queue_reconcileSamplesToDeriveDaySummary_analysis_canOverrideCreationDate_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_updateUnderlyingSamplesToReplaceDaySummary:withDaySummary:calendarCache:canOverrideCreationDate:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), a3);
  if ((_DWORD)result)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateStartOfCycleMetadataForModifiedDayIndex:calendarCache:canOverrideCreationDate:error:", objc_msgSend(*(id *)(a1 + 48), "dayIndex"), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), a3);
    objc_msgSend(*(id *)(a1 + 32), "_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:", objc_msgSend(*(id *)(a1 + 48), "dayIndex"), objc_msgSend(*(id *)(a1 + 40), "menstrualFlow"), objc_msgSend(*(id *)(a1 + 48), "menstrualFlow"), *(_QWORD *)(a1 + 64), 0);
    return v6;
  }
  return result;
}

- (BOOL)_queue_updateUnderlyingSamplesToReplaceDaySummary:(id)a3 withDaySummary:(id)a4 calendarCache:(id)a5 canOverrideCreationDate:(BOOL)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  os_log_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  os_log_t *v40;
  void *v41;
  id v42;
  void *v43;
  os_log_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  _BOOL4 v60;
  id v62;
  void *v63;
  void *v64;
  HDMCPluginServer *v65;
  id obj;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v60 = a6;
  v83 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v67 = objc_msgSend(v11, "dayIndex");
  v75 = 0;
  v62 = v10;
  v64 = v11;
  -[HDMCPluginServer _samplesToInsertForUpdateFromDaySummary:toDaySummary:typesToDelete:calendarCache:](self, "_samplesToInsertForUpdateFromDaySummary:toDaySummary:typesToDelete:calendarCache:", v10, v11, &v75, v12);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v75;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  v14 = (os_log_t *)MEMORY[0x24BDD3030];
  if (v13)
  {
    v15 = v13;
    v16 = 0;
    v17 = *(_QWORD *)v72;
    v65 = self;
    while (2)
    {
      v18 = 0;
      v19 = v16;
      do
      {
        if (*(_QWORD *)v72 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v18);
        v70 = v19;
        v21 = -[HDMCPluginServer _queue_deleteSamplesOfType:onDayIndex:calendarCache:error:](self, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v20, v67, v12, &v70);
        v16 = v70;

        if (!v21)
        {
          v32 = 0;
          v33 = obj;
          v34 = v62;
          v35 = v63;
          v36 = v64;
          goto LABEL_24;
        }
        _HKInitializeLogging();
        v22 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = v15;
          v25 = v16;
          v26 = v17;
          v27 = v12;
          v28 = (void *)objc_opt_class();
          v29 = v28;
          HKSensitiveLogItem();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v67);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v77 = v28;
          v12 = v27;
          v17 = v26;
          v16 = v25;
          v15 = v24;
          v78 = 2112;
          v79 = v30;
          v80 = 2114;
          v81 = v31;
          _os_log_impl(&dword_21961B000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted samples of type: %@ for day index: %{public}@", buf, 0x20u);

          self = v65;
          v14 = (os_log_t *)MEMORY[0x24BDD3030];

        }
        ++v18;
        v19 = v16;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }

  v35 = v63;
  v33 = (void *)objc_msgSend(v63, "mutableCopy");
  _HKInitializeLogging();
  v37 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v37;
    v39 = (void *)objc_opt_class();
    v40 = v14;
    v41 = (void *)MEMORY[0x24BDD16E0];
    v42 = v39;
    objc_msgSend(v41, "numberWithBool:", v60);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v39;
    v78 = 2114;
    v79 = v43;
    _os_log_impl(&dword_21961B000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] canOverrideCreationDate: %{public}@", buf, 0x16u);

    v14 = v40;
  }
  v36 = v64;
  if (v60 && objc_msgSend(v64, "menstrualFlowModificationDayIndex") >= 1)
  {
    _HKInitializeLogging();
    v44 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = (void *)objc_opt_class();
      v47 = (void *)MEMORY[0x24BDD16E0];
      v48 = v46;
      objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v64, "menstrualFlowModificationDayIndex"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v46;
      v78 = 2114;
      v79 = v49;
      _os_log_impl(&dword_21961B000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding creation date to day index: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v63, "hk_filter:", &__block_literal_global_5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeObjectsInArray:", v50);
    v51 = (void *)MEMORY[0x24BDBCE60];
    v52 = objc_msgSend(v64, "menstrualFlowModificationDayIndex");
    objc_msgSend(v12, "currentCalendar");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "hk_noonWithDayIndex:calendar:", v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v16;
    LODWORD(v53) = -[HDMCPluginServer _queue_insertSamplesWithClientSource:creationDate:error:](self, "_queue_insertSamplesWithClientSource:creationDate:error:", v50, v54, &v69);
    v55 = v69;

    if (!(_DWORD)v53)
    {
      v32 = 0;
      v16 = v55;
      goto LABEL_23;
    }
    v16 = v55;
  }
  v68 = v16;
  v32 = -[HDMCPluginServer _queue_insertSamplesWithClientSource:error:](self, "_queue_insertSamplesWithClientSource:error:", v33, &v68);
  v56 = v68;

  v16 = v56;
LABEL_23:
  v34 = v62;
LABEL_24:

  v57 = v16;
  v58 = v57;
  if (v57)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v57);
    else
      _HKLogDroppedError();
  }

  return v32;
}

uint64_t __129__HDMCPluginServer__queue_updateUnderlyingSamplesToReplaceDaySummary_withDaySummary_calendarCache_canOverrideCreationDate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2998]);

  return v4;
}

- (id)_samplesToInsertForUpdateFromDaySummary:(id)a3 toDaySummary:(id)a4 typesToDelete:(id *)a5 calendarCache:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t j;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v90;
  char v91;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = v10;
  v13 = v11;
  v14 = a6;
  v15 = objc_msgSend(v12, "dayIndex");
  v16 = objc_msgSend(v13, "dayIndex");
  if (v12 && v15 != v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMCPluginServer.m"), 500, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[oldDaySummary dayIndex] == [newDaySummary dayIndex] || oldDaySummary == nil"));

  }
  v17 = objc_msgSend(v13, "dayIndex");
  v18 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v14, "currentCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_noonWithDayIndex:calendar:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v13, "menstrualFlow");
  if (v23 != objc_msgSend(v12, "menstrualFlow")
    || (objc_msgSend(v13, "startOfCycleFromCycleTracking"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "startOfCycleFromCycleTracking"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v24 != v25))
  {
    v26 = (void *)MEMORY[0x24BDD3988];
    v27 = objc_msgSend(v13, "menstrualFlow");
    objc_msgSend(v13, "startOfCycleFromCycleTracking");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", v27, v20, objc_msgSend(v28, "BOOLValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v22, "addObject:", v29);
    if (objc_msgSend(v12, "menstrualFlow"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 95);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v30);

    }
  }
  v31 = objc_msgSend(v13, "bleedingInPregnancyFlow");
  if (v31 != objc_msgSend(v12, "bleedingInPregnancyFlow"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", objc_msgSend(v13, "bleedingInPregnancyFlow"), 1, v20, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(v22, "addObject:", v32);
    if (objc_msgSend(v12, "bleedingInPregnancyFlow"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 313);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v33);

    }
  }
  v34 = objc_msgSend(v13, "bleedingAfterPregnancyFlow");
  if (v34 != objc_msgSend(v12, "bleedingAfterPregnancyFlow"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", objc_msgSend(v13, "bleedingAfterPregnancyFlow"), 2, v20, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_msgSend(v22, "addObject:", v35);
    if (objc_msgSend(v12, "bleedingAfterPregnancyFlow"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 314);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v36);

    }
  }
  v37 = objc_msgSend(v13, "cervicalMucusQuality");
  if (v37 != objc_msgSend(v12, "cervicalMucusQuality"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithCervicalMucusQuality:date:", objc_msgSend(v13, "cervicalMucusQuality"), v20);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v22, "addObject:", v38);
    if (objc_msgSend(v12, "cervicalMucusQuality"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 91);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v39);

    }
  }
  v40 = objc_msgSend(v13, "ovulationTestResult");
  if (v40 != objc_msgSend(v12, "ovulationTestResult"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithOvulationTestResult:date:", objc_msgSend(v13, "ovulationTestResult"), v20);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v22, "addObject:", v41);
    if (objc_msgSend(v12, "ovulationTestResult"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 92);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v42);

    }
  }
  v43 = objc_msgSend(v13, "pregnancyTestResult");
  if (v43 != objc_msgSend(v12, "pregnancyTestResult"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithPregnancyTestResult:date:", objc_msgSend(v13, "pregnancyTestResult"), v20);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      objc_msgSend(v22, "addObject:", v44);
    if (objc_msgSend(v12, "pregnancyTestResult"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 243);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v45);

    }
  }
  v46 = objc_msgSend(v13, "progesteroneTestResult");
  if (v46 != objc_msgSend(v12, "progesteroneTestResult"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithProgesteroneTestResult:date:", objc_msgSend(v13, "progesteroneTestResult"), v20);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
      objc_msgSend(v22, "addObject:", v47);
    if (objc_msgSend(v12, "progesteroneTestResult"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 244);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v48);

    }
  }
  v49 = objc_msgSend(v13, "intermenstrualBleeding");
  if (v49 != objc_msgSend(v12, "intermenstrualBleeding"))
  {
    if (objc_msgSend(v13, "intermenstrualBleeding"))
    {
      objc_msgSend(MEMORY[0x24BDD3988], "hkmc_intermenstrualBleedingCategorySampleWithDate:", v20);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v22;
    }
    else
    {
      if (!objc_msgSend(v12, "intermenstrualBleeding"))
        goto LABEL_53;
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 96);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v21;
    }
    objc_msgSend(v51, "addObject:", v50);

  }
LABEL_53:
  v52 = objc_msgSend(v13, "sexualActivity");
  if (v52 != objc_msgSend(v12, "sexualActivity"))
  {
    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithSexualActivity:date:", objc_msgSend(v13, "sexualActivity"), v20);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      objc_msgSend(v22, "addObject:", v53);
    if (objc_msgSend(v12, "sexualActivity"))
    {
      objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 97);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v54);

    }
  }
  v55 = (void *)MEMORY[0x24BDBCF20];
  v96 = v13;
  objc_msgSend(v13, "symptoms");
  HKMCDaySummarySymptomArrayFromSymptoms();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setWithArray:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x24BDBCF20];
  v93 = v12;
  objc_msgSend(v12, "symptoms");
  HKMCDaySummarySymptomArrayFromSymptoms();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setWithArray:", v59);
  v60 = objc_claimAutoreleasedReturnValue();

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v94 = (void *)v60;
  v95 = v57;
  objc_msgSend(v57, "hk_minus:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v102 != v64)
          objc_enumerationMutation(v61);
        objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithMenstrualSymptom:date:", objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "integerValue"), v20);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
          objc_msgSend(v22, "addObject:", v66);

      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    }
    while (v63);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  objc_msgSend(v94, "hk_minus:", v95);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v98;
    v71 = (_QWORD *)MEMORY[0x24BE468B0];
    do
    {
      for (j = 0; j != v69; ++j)
      {
        if (*(_QWORD *)v98 != v70)
          objc_enumerationMutation(v67);
        objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * j), "integerValue");
        v73 = HKMCDataTypeCodeFromMenstrualSymptom();
        if (v73 != *v71)
        {
          objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v74);

        }
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v69);
  }

  objc_msgSend(v96, "basalBodyTemperature");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "basalBodyTemperature");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v75 == (void *)v76)
  {

LABEL_87:
    v82 = v96;
    goto LABEL_88;
  }
  v77 = (void *)v76;
  objc_msgSend(v93, "basalBodyTemperature");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    objc_msgSend(v96, "basalBodyTemperature");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "basalBodyTemperature");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v80, "isEqual:", v81);

    v82 = v96;
    if ((v91 & 1) != 0)
      goto LABEL_88;
  }
  else
  {

    v82 = v96;
  }
  objc_msgSend(v82, "basalBodyTemperature");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v84 = (void *)MEMORY[0x24BDD3E68];
    objc_msgSend(v82, "basalBodyTemperature");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "hkmc_quantitySampleWithBasalBodyTemperature:date:", v85, v20);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v86);
  }
  objc_msgSend(v93, "basalBodyTemperature");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "dataTypeWithCode:", 90);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v75);
    goto LABEL_87;
  }
LABEL_88:
  v88 = objc_retainAutorelease(v21);
  *a5 = v88;

  return v22;
}

- (BOOL)_queue_saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  BOOL v6;
  id v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v11 = a3;
  v12 = a5;
  switch(a4)
  {
    case 2:
      v14 = *MEMORY[0x24BDD2870];
      v15 = &__block_literal_global_231;
      v16 = &__block_literal_global_232;
LABEL_7:
      v13 = -[HDMCPluginServer _queue_saveCategorySampleByDayIndex:calendarCache:readValueFromDaySummary:categoryTypeIdentifier:makeCategorySample:error:](self, "_queue_saveCategorySampleByDayIndex:calendarCache:readValueFromDaySummary:categoryTypeIdentifier:makeCategorySample:error:", v11, v12, v15, v14, v16, a6);
      goto LABEL_8;
    case 1:
      v14 = *MEMORY[0x24BDD2878];
      v15 = &__block_literal_global_228;
      v16 = &__block_literal_global_230;
      goto LABEL_7;
    case 0:
      v13 = -[HDMCPluginServer _queue_saveMenstrualFlowByDayIndex:calendarCache:error:](self, "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", v11, v12, a6);
LABEL_8:
      v6 = v13;
      break;
  }

  return v6;
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bleedingInPregnancyFlow");
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", a2, 1, a3, 0);
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bleedingAfterPregnancyFlow");
}

uint64_t __90__HDMCPluginServer__queue_saveBleedingFlowByDayIndex_forBleedingType_calendarCache_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithBleedingFlow:forBleedingType:date:startOfCycle:", a2, 2, a3, 0);
}

- (BOOL)_queue_saveMenstrualFlowUpdatingAdjacentDays:(int64_t)a3 dayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v10;
  id WeakRetained;
  void *v12;
  _QWORD v14[7];

  v10 = objc_alloc_init(MEMORY[0x24BE40B20]);
  objc_msgSend(v10, "setCacheScope:", 1);
  objc_msgSend(v10, "setRequiresProtectedData:", 1);
  objc_msgSend(v10, "setRequiresWrite:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke;
  v14[3] = &unk_24DB229C8;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a3;
  LOBYTE(a6) = objc_msgSend(v12, "performTransactionWithContext:error:block:inaccessibilityHandler:", v10, a6, v14, 0);

  return (char)a6;
}

uint64_t __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  HDMCDaySummaryEnumerator *v7;
  id WeakRetained;
  HDMCDaySummaryEnumerator *v9;
  uint64_t v10;
  id v11;
  HDMCDaySummaryEnumerator *v12;
  id v13;
  HDMCDaySummaryEnumerator *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE46B30]), "initWithFlowDayIndex:", a1[5]);
  v6 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v7 = [HDMCDaySummaryEnumerator alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  LOBYTE(v21) = 0;
  v9 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v7, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", WeakRetained, v6, a1[5] + 1, 9, 1, 0, v21);

  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_2;
  v25[3] = &unk_24DB224D8;
  v11 = v5;
  v26 = v11;
  -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v9, "enumerateWithError:handler:", a3, v25);
  if ((objc_msgSend(v11, "isUnsuitableForRange") & 1) == 0)
  {
    v12 = [HDMCDaySummaryEnumerator alloc];
    v13 = objc_loadWeakRetained((id *)(a1[4] + 40));
    LOBYTE(v22) = 0;
    v14 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v12, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v13, v6, a1[5] - 10, 9, 0, 1, v22);

    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_3;
    v23[3] = &unk_24DB224D8;
    v24 = v11;
    -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v14, "enumerateWithError:handler:", a3, v23);

    v9 = v14;
  }
  v15 = (void *)a1[4];
  v16 = a1[6];
  v17 = objc_msgSend(v11, "flowDayIndexRange");
  v19 = objc_msgSend(v15, "_queue_saveMenstrualFlow:forEachDayInRange:calendarCache:error:", v16, v17, v18, v6, a3);

  return v19;
}

uint64_t __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addNextAscendingDay:shouldStop:", a2, a3);
}

uint64_t __94__HDMCPluginServer__queue_saveMenstrualFlowUpdatingAdjacentDays_dayIndex_calendarCache_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addNextDescendingDay:shouldStop:", a2, a3);
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:(int64_t)a3 oldMenstrualFlow:(int64_t)a4 newMenstrualFlow:(int64_t)a5 analysis:(id)a6 isLoggingMultipleDays:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  os_log_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  int v38;
  void *v39;
  uint64_t v40;
  char v41;
  void *v42;
  char v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  int64_t v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v7 = a7;
  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  _HKInitializeLogging();
  v13 = (os_log_t *)MEMORY[0x24BDD3030];
  v14 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    *(_DWORD *)buf = 138543362;
    v62 = (id)objc_opt_class();
    v16 = v62;
    _os_log_impl(&dword_21961B000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitting prediction accuracy analytic", buf, 0xCu);

  }
  if ((HKMCDaySummaryBleedingFlowHasFlow() & 1) == 0 && HKMCDaySummaryBleedingFlowHasFlow())
  {
    if (v12)
    {
      v54 = a3;
      v55 = v7;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "featureSettingsManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD2E28];
      v60 = 0;
      objc_msgSend(v18, "featureSettingsForFeatureIdentifier:error:", v19, &v60);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v60;

      v57 = (void *)v20;
      if (v20)
      {
        v22 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v22, "featureStatusProviderForIdentifier:", *MEMORY[0x24BDD2E38]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = v21;
        v56 = v23;
        objc_msgSend(v23, "featureStatusWithError:", &v59);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v59;

        v26 = (void *)v24;
        if (v24)
        {
          v27 = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(v27, "featureStatusProviderForIdentifier:", *MEMORY[0x24BDD2E40]);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = v25;
          v52 = v28;
          objc_msgSend(v28, "featureStatusWithError:", &v58);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v58;

          v53 = (void *)v29;
          if (v29)
          {
            v51 = v30;
            if (objc_msgSend(v57, "menstruationProjectionsEnabled"))
            {
              -[HDMCProfileExtension settingsManager](self->_profileExtension, "settingsManager");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "areAllMenstruationPredictionAlgorithmAttributesSupported");

            }
            else
            {
              v32 = 0;
            }
            if (objc_msgSend(v57, "fertileWindowProjectionsEnabled"))
            {
              -[HDMCProfileExtension settingsManager](self->_profileExtension, "settingsManager");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "areAllFertileWindowPredictionAlgorithmAttributesSupported");

            }
            else
            {
              v36 = 0;
            }
            v37 = v32;
            v38 = v32 | v36;
            -[HDMCProfileExtension settingsManager](self->_profileExtension, "settingsManager");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v39, "internalCycleFactorsOverrideEnabled");

            v49 = (void *)MEMORY[0x24BE46BE8];
            if (v38 == 1)
            {
              v40 = *MEMORY[0x24BDD2CA8];
              objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v48, "areAllRequirementsSatisfied");
              v42 = v53;
              objc_msgSend(v53, "objectForKeyedSubscript:", v40);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v47, "areAllRequirementsSatisfied");
            }
            else
            {
              v41 = 0;
              v43 = 0;
              v42 = v53;
            }
            v44 = objc_msgSend(v42, "isOnboardingRecordPresent");
            objc_msgSend(v12, "cycles");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            BYTE3(v46) = v50;
            BYTE2(v46) = v44;
            BYTE1(v46) = v43;
            LOBYTE(v46) = v41;
            objc_msgSend(v49, "submitMetricWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:periodPredictionEnabled:heartRateBasedPredictionEnabled:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:internalLiveOnCycleFactorOverrideEnabled:cycles:", v54, a4, a5, v12, v55, v37, v46, v45);

            v34 = v57;
            v30 = v51;
            if (v38)
            {

            }
          }
          else
          {
            _HKInitializeLogging();
            v34 = v57;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
              -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:].cold.4();
          }

        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
            -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:].cold.3();
          v30 = v25;
          v34 = v57;
        }

      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          v30 = v21;
          -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:].cold.2();
          v34 = 0;
        }
        else
        {
          v34 = 0;
          v30 = v21;
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v33 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
        -[HDMCPluginServer _submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:].cold.1(v33);
    }
  }

}

- (BOOL)_queue_saveMenstrualFlowByDayIndex:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  char v18;
  _QWORD v20[4];
  id v21;
  HDMCPluginServer *v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "count"))
  {
    -[HDMCProfileExtension analysisManager](self->_profileExtension, "analysisManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentAnalysis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x24BE40B20]);
    objc_msgSend(v13, "setCacheScope:", 1);
    objc_msgSend(v13, "setRequiresProtectedData:", 1);
    objc_msgSend(v13, "setRequiresWrite:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke;
    v20[3] = &unk_24DB22308;
    v21 = v8;
    v22 = self;
    v23 = v9;
    v24 = v12;
    v25 = v11;
    v16 = v11;
    v17 = v12;
    v18 = objc_msgSend(v15, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, a5, v20, 0);

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

uint64_t __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v29;
  uint64_t v30;
  id v31;
  id obj;
  uint64_t v33;
  _QWORD v34[6];
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v31 = a2;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v33)
  {
    v6 = *(_QWORD *)v40;
    *(_QWORD *)&v5 = 138543618;
    v29 = v5;
    v30 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "integerValue", v29);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
        +[HDMCDaySummaryEnumerator daySummaryAtIndex:profile:calendarCache:error:](HDMCDaySummaryEnumerator, "daySummaryAtIndex:profile:calendarCache:error:", v9, WeakRetained, *(_QWORD *)(a1 + 48), a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11 && *a3)
          goto LABEL_22;
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        if (objc_msgSend(v11, "menstrualFlow") == v13)
        {
          _HKInitializeLogging();
          v14 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = (void *)objc_opt_class();
            v17 = (void *)MEMORY[0x24BDD16E0];
            v18 = v16;
            objc_msgSend(v17, "numberWithInteger:", v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v44 = v16;
            v45 = 2112;
            v46 = v19;
            _os_log_impl(&dword_21961B000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical menstrual flow, day index: %@", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", v9, *(_QWORD *)(a1 + 56));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", v13, v20, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD3DC0], "menstrualFlowType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v23, objc_msgSend(v8, "integerValue"), *(_QWORD *)(a1 + 48), a3);

          if (v24 && v21)
          {
            v25 = *(void **)(a1 + 40);
            v47 = v21;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v25) = objc_msgSend(v25, "_queue_insertSamplesWithClientSource:error:", v26, a3);

            if ((v25 & 1) == 0)
              goto LABEL_21;
          }
          else if (!v24)
          {
            goto LABEL_21;
          }
          if ((objc_msgSend(*(id *)(a1 + 40), "_queue_updateStartOfCycleMetadataForModifiedDayIndex:calendarCache:canOverrideCreationDate:error:", objc_msgSend(v8, "integerValue"), *(_QWORD *)(a1 + 48), 0, a3) & 1) == 0)
          {
LABEL_21:

LABEL_22:
            v27 = 0;
            goto LABEL_23;
          }
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke_2;
          v34[3] = &unk_24DB229F0;
          v34[4] = *(_QWORD *)(a1 + 40);
          v34[5] = v8;
          v35 = v11;
          v38 = v13;
          v36 = *(id *)(a1 + 64);
          v37 = *(id *)(a1 + 32);
          objc_msgSend(v31, "onCommit:orRollback:", v34, 0);

          v6 = v30;
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v33)
        continue;
      break;
    }
  }
  v27 = 1;
LABEL_23:

  return v27;
}

uint64_t __75__HDMCPluginServer__queue_saveMenstrualFlowByDayIndex_calendarCache_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  v4 = objc_msgSend(*(id *)(a1 + 48), "menstrualFlow");
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:", v3, v4, v5, v6, (unint64_t)objc_msgSend(v7, "count") > 1);

  return objc_msgSend(*(id *)(a1 + 32), "_triggerImmediateSync");
}

- (BOOL)_queue_saveCategorySampleByDayIndex:(id)a3 calendarCache:(id)a4 readValueFromDaySummary:(id)a5 categoryTypeIdentifier:(id)a6 makeCategorySample:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id WeakRetained;
  void *v22;
  id v23;
  char v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  HDMCPluginServer *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v15, "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v16;
    v20 = objc_alloc_init(MEMORY[0x24BE40B20]);
    objc_msgSend(v20, "setCacheScope:", 1);
    objc_msgSend(v20, "setRequiresProtectedData:", 1);
    objc_msgSend(v20, "setRequiresWrite:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __142__HDMCPluginServer__queue_saveCategorySampleByDayIndex_calendarCache_readValueFromDaySummary_categoryTypeIdentifier_makeCategorySample_error___block_invoke;
    v27[3] = &unk_24DB22A18;
    v28 = v14;
    v29 = self;
    v30 = v15;
    v33 = v26;
    v31 = v17;
    v32 = v19;
    v34 = v18;
    v23 = v19;
    v24 = objc_msgSend(v22, "performTransactionWithContext:error:block:inaccessibilityHandler:", v20, a8, v27, 0);

    v16 = v26;
  }
  else
  {
    v24 = 1;
  }

  return v24;
}

uint64_t __142__HDMCPluginServer__queue_saveCategorySampleByDayIndex_calendarCache_readValueFromDaySummary_categoryTypeIdentifier_makeCategorySample_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v32;
  id v33;
  NSObject *log;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v35)
  {
    v7 = *(_QWORD *)v37;
    *(_QWORD *)&v6 = 138543874;
    v32 = v6;
    while (2)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "integerValue", v32);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
        +[HDMCDaySummaryEnumerator daySummaryAtIndex:profile:calendarCache:error:](HDMCDaySummaryEnumerator, "daySummaryAtIndex:profile:calendarCache:error:", v10, WeakRetained, *(_QWORD *)(a1 + 48), a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 && *a3)
        {
LABEL_19:

          v30 = 0;
          goto LABEL_20;
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))() == v14)
        {
          _HKInitializeLogging();
          v15 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
          {
            log = v15;
            v16 = (void *)objc_opt_class();
            v17 = v7;
            v18 = a3;
            v19 = v5;
            v20 = *(_QWORD *)(a1 + 56);
            v21 = (void *)MEMORY[0x24BDD16E0];
            v33 = v16;
            objc_msgSend(v21, "numberWithInteger:", v10);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v41 = v16;
            v42 = 2112;
            v43 = v20;
            v5 = v19;
            a3 = v18;
            v7 = v17;
            v44 = 2112;
            v45 = v22;
            _os_log_impl(&dword_21961B000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical value for type: %@, day index: %@", buf, 0x20u);

          }
        }
        else
        {
          v23 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *(_QWORD *)(a1 + 56));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v24, v10, *(_QWORD *)(a1 + 48), a3);

          if (v25 && v14)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", v10, *(_QWORD *)(a1 + 64));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = *(void **)(a1 + 40);
            v46 = v27;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v28) = objc_msgSend(v28, "_queue_insertSamplesWithClientSource:error:", v29, a3);

            if ((v28 & 1) == 0)
              goto LABEL_19;
          }
          else if ((v25 & 1) == 0)
          {
            goto LABEL_19;
          }
        }

      }
      v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v35)
        continue;
      break;
    }
  }
  v30 = 1;
LABEL_20:

  return v30;
}

- (BOOL)_queue_saveIntermenstrualBleedingByDayIndex:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[4];
  id v18;
  HDMCPluginServer *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BE40B20]);
    objc_msgSend(v11, "setCacheScope:", 1);
    objc_msgSend(v11, "setRequiresProtectedData:", 1);
    objc_msgSend(v11, "setRequiresWrite:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __84__HDMCPluginServer__queue_saveIntermenstrualBleedingByDayIndex_calendarCache_error___block_invoke;
    v17[3] = &unk_24DB22A40;
    v18 = v8;
    v19 = self;
    v20 = v9;
    v21 = v10;
    v14 = v10;
    v15 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, a5, v17, 0);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

uint64_t __84__HDMCPluginServer__queue_saveIntermenstrualBleedingByDayIndex_calendarCache_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  __int128 v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v35)
  {
    v7 = *(_QWORD *)v37;
    v34 = *MEMORY[0x24BDD2948];
    *(_QWORD *)&v6 = 138543618;
    v32 = v6;
    v33 = a3;
    while (2)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "integerValue", v32);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
        +[HDMCDaySummaryEnumerator daySummaryAtIndex:profile:calendarCache:error:](HDMCDaySummaryEnumerator, "daySummaryAtIndex:profile:calendarCache:error:", v10, WeakRetained, *(_QWORD *)(a1 + 48), a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 && *a3)
        {
LABEL_18:

          v30 = 0;
          goto LABEL_19;
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14 == objc_msgSend(v12, "intermenstrualBleeding"))
        {
          _HKInitializeLogging();
          v22 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            v24 = (void *)objc_opt_class();
            v25 = (void *)MEMORY[0x24BDD16E0];
            v26 = v7;
            v27 = v5;
            v28 = v24;
            objc_msgSend(v25, "numberWithInteger:", v10);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v41 = v24;
            v42 = 2112;
            v43 = v29;
            _os_log_impl(&dword_21961B000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping update of identical intermenstrual bleeding value, day index: %@", buf, 0x16u);

            v5 = v27;
            v7 = v26;
            a3 = v33;

          }
        }
        else
        {
          v15 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v16, v10, *(_QWORD *)(a1 + 48), a3);

          if ((v17 & v14) == 1)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", v10, *(_QWORD *)(a1 + 56));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD3988], "hkmc_intermenstrualBleedingCategorySampleWithDate:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = *(void **)(a1 + 40);
            v44 = v19;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v20) = objc_msgSend(v20, "_queue_insertSamplesWithClientSource:error:", v21, a3);

            if ((v20 & 1) == 0)
              goto LABEL_18;
          }
          else if ((v17 & 1) == 0)
          {
            goto LABEL_18;
          }
        }

      }
      v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v35)
        continue;
      break;
    }
  }
  v30 = 1;
LABEL_19:

  return v30;
}

- (BOOL)_queue_saveLastMenstrualPeriodWithDayIndexRange:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  HDMCPluginServer *v20;
  id v21;
  int64_t v22;
  int64_t v23;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  -[HDMCProfileExtension analysisManager](self->_profileExtension, "analysisManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentAnalysis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BE40B20]);
  objc_msgSend(v12, "setCacheScope:", 1);
  objc_msgSend(v12, "setRequiresProtectedData:", 1);
  objc_msgSend(v12, "setRequiresWrite:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke;
  v18[3] = &unk_24DB22A90;
  v22 = var0;
  v23 = var1;
  v19 = v9;
  v20 = self;
  v21 = v11;
  v15 = v11;
  v16 = v9;
  LOBYTE(a5) = objc_msgSend(v14, "performTransactionWithContext:error:block:inaccessibilityHandler:", v12, a5, v18, 0);

  return (char)a5;
}

uint64_t __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[4];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v32 = a2;
  v5 = *(_QWORD *)(a1 + 64);
  v6 = (uint64_t *)(a1 + 56);
  if (v5 <= 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = *(_QWORD *)(a1 + 56) + v5 - 1;
  objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HKMCTodayIndex();

  if (v7 >= v9)
    v7 = v9;
  v10 = *v6;
  if (*v6 > v7)
  {
    v11 = 1;
    goto LABEL_25;
  }
  while (1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    +[HDMCDaySummaryEnumerator daySummaryAtIndex:profile:calendarCache:error:](HDMCDaySummaryEnumerator, "daySummaryAtIndex:profile:calendarCache:error:", v10, WeakRetained, *(_QWORD *)(a1 + 32), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13 && *a3)
    {
      v11 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v13, "menstrualFlow"))
      break;
    v14 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_noonWithDayIndex:calendar:", v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3988], "hkmc_categorySampleWithMenstrualFlow:date:startOfCycle:", 2, v16, v10 == *(_QWORD *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD3DC0], "menstrualFlowType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v18, "_queue_deleteSamplesOfType:onDayIndex:calendarCache:error:", v19, v10, *(_QWORD *)(a1 + 32), a3);

    if ((_DWORD)v11 && v17)
    {
      v20 = *(void **)(a1 + 40);
      v44[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v20, "_queue_insertSamplesWithClientSource:error:", v21, a3);

      if ((v20 & 1) == 0)
      {
        v11 = 0;
        goto LABEL_17;
      }
    }
    else if (!(_DWORD)v11)
    {
      goto LABEL_17;
    }
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_2;
    v34[3] = &unk_24DB22A68;
    v34[4] = *(_QWORD *)(a1 + 40);
    v37 = v10;
    v35 = v13;
    v22 = *(id *)(a1 + 48);
    v38 = *(_OWORD *)v6;
    v36 = v22;
    v39 = v7;
    objc_msgSend(v32, "onCommit:orRollback:", v34, 0);

    v11 = 1;
LABEL_17:

    if ((_DWORD)v11)
    {
      if (v10++ < v7)
        continue;
    }
    goto LABEL_25;
  }
  _HKInitializeLogging();
  v24 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = (void *)objc_opt_class();
    v27 = (void *)MEMORY[0x24BDD16E0];
    v28 = v26;
    objc_msgSend(v27, "numberWithInteger:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v26;
    v42 = 2112;
    v43 = v30;
    _os_log_impl(&dword_21961B000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending first period log early due to no flow sample on day: %@", buf, 0x16u);

  }
  v11 = 1;
LABEL_24:

LABEL_25:
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_237;
  v33[3] = &unk_24DB21D60;
  v33[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v32, "onCommit:orRollback:", v33, 0);

  return v11;
}

uint64_t __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "menstrualFlow"), 2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64) > *(_QWORD *)(a1 + 80));
}

uint64_t __88__HDMCPluginServer__queue_saveLastMenstrualPeriodWithDayIndexRange_calendarCache_error___block_invoke_237(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggerImmediateSync");
}

- (BOOL)_queue_saveMenstrualFlow:(int64_t)a3 forEachDayInRange:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  int64_t var1;
  int64_t var0;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  BOOL v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = var0 + var1;
  do
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", var0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v14);

      ++var0;
    }
    while (var1 < 1);
  }
  while (v12 > var0);
  v15 = -[HDMCPluginServer _queue_saveMenstrualFlowByDayIndex:calendarCache:error:](self, "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", v11, v10, a6);

  return v15;
}

- (BOOL)_queue_savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;

  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a4 - a3 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= a3)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24DB30348, v12);

      ++a3;
    }
    while (a4 + 1 != a3);
  }
  objc_msgSend(v10, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HKMCTodayIndex();

  if (v14 - 1 == a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24DB30360, v15);

  }
  v16 = -[HDMCPluginServer _queue_saveMenstrualFlowByDayIndex:calendarCache:error:](self, "_queue_saveMenstrualFlowByDayIndex:calendarCache:error:", v11, v10, a6);

  return v16;
}

- (id)_queue_mostRecentMenstrualFlowSampleWithError:(id *)a3 requiringBeforeDay:(int64_t)a4 calendarCache:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2998]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v10, "entityEnumeratorWithType:profile:", v9, WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = *MEMORY[0x24BE40840];
  v35[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEncodingOptionsFromDictionary:", v13);

  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x24BE40940], objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOrderingTerms:", v15);

  objc_msgSend(v12, "setLimitCount:", 1);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __99__HDMCPluginServer__queue_mostRecentMenstrualFlowSampleWithError_requiringBeforeDay_calendarCache___block_invoke;
  v26[3] = &unk_24DB21BE8;
  v26[4] = &v27;
  objc_msgSend(v12, "enumerateWithError:handler:", a3, v26);
  v16 = (void *)v28[5];
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 100, CFSTR("Most recent menstrual flow is nil"));
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v8, "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "hk_dayIndexRangeWithCalendar:", v17);
  v21 = v19 > 0 && v18 + v19 <= a4;

  if (!v21)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_assignError:code:format:", a3, 100, CFSTR("Most recent menstrual flow is not before day %@"), v24);

    goto LABEL_12;
  }
  v22 = (id)v28[5];
LABEL_13:

  _Block_object_dispose(&v27, 8);
  return v22;
}

uint64_t __99__HDMCPluginServer__queue_mostRecentMenstrualFlowSampleWithError_requiringBeforeDay_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

- (BOOL)_queue_updateStartOfCycleMetadataForModifiedDayIndex:(int64_t)a3 calendarCache:(id)a4 canOverrideCreationDate:(BOOL)a5 error:(id *)a6
{
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  HDMCDaySummaryEnumerator *v18;
  void *v19;
  HDMCDaySummaryEnumerator *v20;
  id v21;
  id v22;
  _BOOL4 v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  BOOL v63;
  uint64_t v65;
  id v66;
  HDMCDaySummaryEnumerator *v67;
  void *v68;
  HDMCPluginServer *v69;
  _BOOL4 v70;
  id v71;
  id v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  id v76;
  id obja;
  id obj;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  int64_t v92;
  uint64_t v93;
  id v94;
  uint8_t v95[128];
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;

  v70 = a5;
  v107 = *MEMORY[0x24BDAC8D0];
  v72 = a4;
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x24BDD3030];
  v10 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_opt_class();
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v12;
    v98 = 2112;
    v99 = v15;
    _os_log_impl(&dword_21961B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating start of cycle metadata for modified day: %@", buf, 0x16u);

  }
  v16 = objc_alloc_init(MEMORY[0x24BE3F5C0]);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 41);
  v18 = [HDMCDaySummaryEnumerator alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v65) = 0;
  v20 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v18, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v19, v72, a3 - 20, 41, 1, 0, v65);

  v94 = 0;
  v89[0] = MEMORY[0x24BDAC760];
  v89[1] = 3221225472;
  v89[2] = __117__HDMCPluginServer__queue_updateStartOfCycleMetadataForModifiedDayIndex_calendarCache_canOverrideCreationDate_error___block_invoke;
  v89[3] = &unk_24DB22AB8;
  v21 = v17;
  v90 = v21;
  v92 = a3 - 20;
  v93 = 41;
  v22 = v16;
  v91 = v22;
  v23 = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v20, "enumerateWithError:handler:", &v94, v89);
  v24 = v94;
  v25 = v24;
  if (!v23)
    goto LABEL_40;
  v74 = v23;
  v88 = v24;
  objc_msgSend(v22, "analyzeWithError:", &v88);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v88;

  if (!v26)
  {
    v25 = v27;
    if (v25)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v25);
      else
        _HKLogDroppedError();
    }

LABEL_40:
    v63 = 0;
    goto LABEL_41;
  }
  v73 = v27;
  v66 = v22;
  v67 = v20;
  v68 = v21;
  v69 = self;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v30 = v26;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v106, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v85 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v36 = objc_msgSend(v35, "julianDayOfMenstruationStart");
        LODWORD(v35) = objc_msgSend(v35, "isDeterminant");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v35)
          v38 = v28;
        else
          v38 = v29;
        objc_msgSend(v38, "addObject:", v37);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v106, 16);
    }
    while (v32);
  }

  _HKInitializeLogging();
  v39 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v39;
    v41 = (void *)objc_opt_class();
    v42 = (void *)MEMORY[0x24BDD16E0];
    obja = v41;
    objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v97 = v41;
    v98 = 2112;
    v99 = v43;
    v100 = 2112;
    v101 = v44;
    v102 = 2112;
    v103 = v45;
    v104 = 2112;
    v105 = v46;
    _os_log_impl(&dword_21961B000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %@ cycles from analyzing %@ summaries, start days: %@, indeterminant start days: %@", buf, 0x34u);

  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v68;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  v48 = a3;
  if (v47)
  {
    v49 = v47;
    v50 = *(_QWORD *)v81;
    v76 = v30;
    while (2)
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v81 != v50)
          objc_enumerationMutation(obj);
        v52 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v52, "dayIndex"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "dayIndex") >= v48)
        {
          v54 = v49;
          objc_msgSend(v52, "startOfCycleFromCycleTracking");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55 && (objc_msgSend(v29, "containsObject:", v53) & 1) == 0)
          {
            objc_msgSend(v52, "startOfCycleFromCycleTracking");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "BOOLValue");

            v58 = objc_msgSend(v28, "containsObject:", v53);
            if (v57 == (_DWORD)v58)
            {
              v62 = v74;
            }
            else
            {
              v59 = v58;
              v75 = (void *)objc_msgSend(v52, "mutableCopy");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setStartOfCycleFromCycleTracking:", v60);

              v61 = (void *)objc_msgSend(v75, "copy");
              v79 = v73;
              v62 = -[HDMCPluginServer _queue_updateUnderlyingSamplesToReplaceDaySummary:withDaySummary:calendarCache:canOverrideCreationDate:error:](v69, "_queue_updateUnderlyingSamplesToReplaceDaySummary:withDaySummary:calendarCache:canOverrideCreationDate:error:", v52, v61, v72, v70, &v79);
              v71 = v79;

              v73 = v71;
            }
            v48 = a3;
            v74 = v62;
            if (!v62)
            {

              v30 = v76;
              goto LABEL_37;
            }
          }
          v49 = v54;
          v30 = v76;
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      if (v49)
        continue;
      break;
    }
  }
LABEL_37:

  v63 = v74;
  v25 = v73;
  v20 = v67;
  v21 = v68;
  v22 = v66;
LABEL_41:

  return v63;
}

void __117__HDMCPluginServer__queue_updateStartOfCycleMetadataForModifiedDayIndex_calendarCache_canOverrideCreationDate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "count") && objc_msgSend(v7, "dayIndex") > *(_QWORD *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BE3F588], "hkmc_emptyDayInputWithDayIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendDay:", v4);

  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BE3F588], "hkmc_dayInputWithDaySummary:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendDay:", v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

- (BOOL)_queue_insertSamplesWithClientSource:(id)a3 error:(id *)a4
{
  return -[HDMCPluginServer _queue_insertSamplesWithClientSource:creationDate:error:](self, "_queue_insertSamplesWithClientSource:creationDate:error:", a3, 0, a4);
}

- (BOOL)_queue_insertSamplesWithClientSource:(id)a3 creationDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double Current;
  char v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "sourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createOrUpdateSourceForClient:error:", self->_client, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v13, "dataProvenanceManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localDataProvenanceForSourceEntity:version:deviceEntity:", v12, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        MEMORY[0x219A30EDC](v9);
      else
        Current = CFAbsoluteTimeGetCurrent();
      v18 = Current;
      v19 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v19, "dataManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v20, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v8, v15, 1, a5, v18);

      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = (void *)objc_opt_class();
        v24 = (void *)MEMORY[0x24BDD16E0];
        v28 = v23;
        objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v30 = v23;
        v31 = 2112;
        v32 = v25;
        v33 = 2112;
        v34 = v26;
        v35 = 2114;
        v36 = v9;
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_21961B000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted %@ samples: %@ @ %{public}@, source: %@", buf, 0x34u);

      }
      -[HDMCPluginServer _queue_updateLastLoggedInExperienceDate](self, "_queue_updateLastLoggedInExperienceDate");

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void)_queue_updateLastLoggedInExperienceDate
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
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error saving last logged date: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (BOOL)_queue_deleteSamplesOfType:(id)a3 onDayIndex:(int64_t)a4 calendarCache:(id)a5 error:(id *)a6
{
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id *v30;
  char v31;
  id v32;
  void *v33;
  BOOL v34;
  id *location;
  id v38;
  void *v39;
  void *v40;
  HDMCPluginServer *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  void *v47;
  HDMCPluginServer *v48;
  uint64_t *v49;
  uint64_t *v50;
  int64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id obj;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  _BYTE v67[128];
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v43 = a5;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__9;
  v61 = __Block_byref_object_dispose__9;
  v62 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE40BC0];
  v41 = self;
  location = (id *)&self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v68 = *MEMORY[0x24BE40840];
  v69[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40E48], "hdmc_predicateForSamplesInDayIndexRange:", a4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v58 + 5);
  obj = (id)v58[5];
  objc_msgSend(v9, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v38, WeakRetained, v11, v12, 0, 0, &obj);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v13, obj);

  if (v39)
  {
    objc_msgSend(v43, "currentCalendar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v14 = v39;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v53;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v17);
        objc_msgSend(v18, "_timeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "calendarForTimeZone:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "hk_dayIndexRangeWithCalendar:", v20);
        v23 = v22;

        if (a4 >= v21 && a4 - v21 < v23)
        {
          if (v23 >= 2)
          {
            objc_msgSend(MEMORY[0x24BDD1698], "hk_indexSetWithDayIndexRange:", v21, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeIndex:", a4);
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = __78__HDMCPluginServer__queue_deleteSamplesOfType_onDayIndex_calendarCache_error___block_invoke;
            v45[3] = &unk_24DB22AE0;
            v46 = v40;
            v47 = v18;
            v49 = &v63;
            v48 = v41;
            v50 = &v57;
            v51 = a4;
            objc_msgSend(v25, "hk_enumerateDayIndexRangesUsingBlock:", v45);

          }
          objc_msgSend(v18, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v26);

          if (!*((_BYTE *)v64 + 24))
            break;
        }
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
          if (v15)
            goto LABEL_4;
          break;
        }
      }
    }

    if (*((_BYTE *)v64 + 24))
    {
      v27 = objc_alloc_init(MEMORY[0x24BE40A90]);
      v28 = objc_loadWeakRetained(location);
      objc_msgSend(v28, "dataManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id *)(v58 + 5);
      v44 = (id)v58[5];
      v31 = objc_msgSend(v29, "deleteObjectsWithUUIDCollection:configuration:error:", v42, v27, &v44);
      objc_storeStrong(v30, v44);
      *((_BYTE *)v64 + 24) = v31;

      -[HDMCPluginServer _queue_updateLastLoggedInExperienceDate](v41, "_queue_updateLastLoggedInExperienceDate");
    }

  }
  v32 = (id)v58[5];
  v33 = v32;
  if (v32)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v32);
    else
      _HKLogDroppedError();
  }

  v34 = *((_BYTE *)v64 + 24) != 0;
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v34;
}

void __78__HDMCPluginServer__queue_deleteSamplesOfType_onDayIndex_calendarCache_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id obj;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", a2, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = a3 + a2 - 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", v7, *(_QWORD *)(a1 + 32), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x24BDD3988];
    v13 = v9;
    objc_msgSend(v13, "categoryType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "value");
    objc_msgSend(v13, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "categorySampleWithType:value:startDate:endDate:metadata:", v14, v15, v10, v11, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)MEMORY[0x24BDD3E68];
    v19 = v9;
    objc_msgSend(v19, "quantityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "quantity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v14, v16, v10, v11, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v17 = 0;
LABEL_10:

  if (v17)
  {
    objc_msgSend(v17, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2 > *(_QWORD *)(a1 + 72))
    {
      v23 = *MEMORY[0x24BDD31E0];
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BDD31E0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v45 = v23;
        v46[0] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hk_dictionaryByAddingEntriesFromDictionary:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "_setMetadata:", v26);
        v22 = (void *)v26;
      }
    }
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v27 + 24))
    {
      v28 = *(void **)(a1 + 48);
      v44 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v30 + 40);
      LOBYTE(v28) = objc_msgSend(v28, "_queue_insertSamplesWithClientSource:error:", v29, &obj);
      objc_storeStrong((id *)(v30 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v28;

    }
    else
    {
      *(_BYTE *)(v27 + 24) = 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        v33 = (void *)objc_opt_class();
        v34 = v33;
        HKSensitiveLogItem();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromHKDayIndexRange();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v33;
        v40 = 2112;
        v41 = v35;
        v42 = 2112;
        v43 = v36;
        _os_log_impl(&dword_21961B000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted multi-day replacement sample: %@ (%@)", buf, 0x20u);

      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (void)_triggerImmediateSync
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[HDStandardTaskServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nanoSyncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__HDMCPluginServer__triggerImmediateSync__block_invoke;
  v15[3] = &unk_24DB21C90;
  v15[4] = self;
  objc_msgSend(v4, "syncHealthDataWithOptions:reason:completion:", 0, v6, v15);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3A00]), "initWithChangesSyncRequest:", v8);
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __41__HDMCPluginServer__triggerImmediateSync__block_invoke_258;
  v14[3] = &unk_24DB21C90;
  v14[4] = self;
  objc_msgSend(v11, "syncWithRequest:reason:completion:", v9, v13, v14);

}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forced HealthKit nanosync", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __41__HDMCPluginServer__triggerImmediateSync__block_invoke_cold_1(a1, v6);
  }

}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke_258(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forced HealthKit changes sync", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __41__HDMCPluginServer__triggerImmediateSync__block_invoke_258_cold_1(a1, v6);
  }

}

- (id)diagnosticDescription
{
  return &stru_24DB25F08;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:(void *)a1 oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;

  v1 = OUTLINED_FUNCTION_4(a1);
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_debug_impl(&dword_21961B000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@] Skipping metric submission due to nil analysis", (uint8_t *)&v3, 0xCu);

}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.2()
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
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature settings for menstrual cycles: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.3()
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
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature status for heart rate input: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_submitPredictionAccuracyAnalyticWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:.cold.4()
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
  OUTLINED_FUNCTION_1(&dword_21961B000, v4, v5, "[%{public}@] Error retrieving feature status for wrist temperature input: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke_cold_1(uint64_t a1, void *a2)
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

  OUTLINED_FUNCTION_4_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error forcing HealthKit nano sync: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __41__HDMCPluginServer__triggerImmediateSync__block_invoke_258_cold_1(uint64_t a1, void *a2)
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

  OUTLINED_FUNCTION_4_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error forcing HealthKit changes sync: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
