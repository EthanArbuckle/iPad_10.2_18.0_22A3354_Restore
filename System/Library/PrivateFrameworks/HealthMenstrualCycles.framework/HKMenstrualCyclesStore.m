@implementation HKMenstrualCyclesStore

- (HKMenstrualCyclesStore)initWithHealthStore:(id)a3
{
  id v5;
  HKMenstrualCyclesStore *v6;
  HKMenstrualCyclesStore *v7;
  id v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMenstrualCyclesStore;
  v6 = -[HKMenstrualCyclesStore init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, CFSTR("HKMCPluginServer"), v7, v9);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (HKCloudSyncControl)cloudSyncControl
{
  HKMenstrualCyclesStore *v2;
  uint64_t v3;
  HKCloudSyncControl *cloudSyncControl;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cloudSyncControl)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD39E8]), "initWithHealthStore:", v2->_healthStore);
    cloudSyncControl = v2->_cloudSyncControl;
    v2->_cloudSyncControl = (HKCloudSyncControl *)v3;

  }
  objc_sync_exit(v2);

  return v2->_cloudSyncControl;
}

- (void)fetchScheduledNotificationsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke;
  v10[3] = &unk_24D99D6F0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke_2;
  v8[3] = &unk_24D99D658;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchScheduledNotificationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__HKMenstrualCyclesStore_fetchScheduledNotificationsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveDaySummary:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMenstrualCyclesStore saveDaySummaries:completion:](self, "saveDaySummaries:completion:", v9, v7, v10, v11);
}

- (void)saveDaySummaries:(id)a3 completion:(id)a4
{
  -[HKMenstrualCyclesStore saveDaySummaries:canOverrideCreationDate:completion:](self, "saveDaySummaries:canOverrideCreationDate:completion:", a3, 0, a4);
}

- (void)saveDaySummaries:(id)a3 canOverrideCreationDate:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke;
  v16[3] = &unk_24D99D718;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke_2;
  v14[3] = &unk_24D99D658;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveDaySummaries:canOverrideCreationDate:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HKMenstrualCyclesStore_saveDaySummaries_canOverrideCreationDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveMenstrualFlow:(int64_t)a3 dayIndex:(int64_t)a4 updateAdjacentDays:(BOOL)a5 completion:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_opt_class();
    v14 = v13;
    HKSensitiveLogItem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    v29 = 2112;
    v30 = v15;
    v31 = 2048;
    v32 = a3;
    _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving a %@ value of %ld", buf, 0x20u);

  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v18 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke;
  v22[3] = &unk_24D99D740;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v23 = v16;
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke_2;
  v20[3] = &unk_24D99D658;
  v21 = v23;
  v19 = v23;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveMenstrualFlow:dayIndex:updateAdjacentDays:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

uint64_t __83__HKMenstrualCyclesStore_saveMenstrualFlow_dayIndex_updateAdjacentDays_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveBleedingFlow:(int64_t)a3 forBleedingType:(int64_t)a4 dayIndex:(int64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v20;
  id v21;
  NSObject *log;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    v12 = (void *)objc_opt_class();
    v23 = v12;
    HKSensitiveLogItem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v15 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2048;
    v36 = a3;
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_218A9C000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving a %@ value of %ld for %@ %@", buf, 0x34u);

    a5 = v15;
  }
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v20 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke;
  v26[3] = &unk_24D99D768;
  v28 = a3;
  v29 = a4;
  v30 = a5;
  v27 = v18;
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke_2;
  v24[3] = &unk_24D99D658;
  v25 = v27;
  v21 = v27;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v26, v24);

}

uint64_t __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveBleedingFlow:forBleedingType:dayIndex:completion:", a1[5], a1[6], a1[7], a1[4]);
}

uint64_t __79__HKMenstrualCyclesStore_saveBleedingFlow_forBleedingType_dayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveBleedingFlowByDayIndex:(id)a3 forBleedingType:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke;
  v16[3] = &unk_24D99D790;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke_2;
  v14[3] = &unk_24D99D658;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveBleedingFlowByDayIndex:forBleedingType:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __80__HKMenstrualCyclesStore_saveBleedingFlowByDayIndex_forBleedingType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveMenstrualFlowByDayIndex:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke;
  v14[3] = &unk_24D99D7B8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke_2;
  v12[3] = &unk_24D99D658;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveBleedingFlowByDayIndex:forBleedingType:completion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __65__HKMenstrualCyclesStore_saveMenstrualFlowByDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)confirmAndSaveDeviationWithMenstrualFlowByDayIndex:(id)a3 intermenstrualBleedingByDayIndex:(id)a4 addedCycleFactors:(id)a5 initialAnalysisWindow:(id)a6 completion:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  id v15;
  void *v16;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;

  var1 = a6.var1;
  var0 = a6.var0;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v18 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke;
  v25[3] = &unk_24D99D7E0;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v30 = var0;
  v31 = var1;
  v29 = v16;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2;
  v23[3] = &unk_24D99D658;
  v24 = v29;
  v19 = v29;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v25, v23);

}

uint64_t __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex:intermenstrualBleedingByDayIndex:addedCycleFactors:initialAnalysisWindow:completion:", a1[4], a1[5], a1[6], a1[8], a1[9], a1[7]);
}

uint64_t __161__HKMenstrualCyclesStore_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveLastMenstrualPeriodWithDayIndexRange:(id)a3 completion:(id)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  int64_t v16;

  var1 = a3.var1;
  var0 = a3.var0;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke;
  v13[3] = &unk_24D99D808;
  v15 = var0;
  v16 = var1;
  v14 = v7;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke_2;
  v11[3] = &unk_24D99D658;
  v12 = v14;
  v10 = v14;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveLastMenstrualPeriodWithDayIndexRange:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __78__HKMenstrualCyclesStore_saveLastMenstrualPeriodWithDayIndexRange_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)savePeriodNotYetStartedWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke;
  v10[3] = &unk_24D99D6F0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke_2;
  v8[3] = &unk_24D99D658;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodNotYetStartedWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__HKMenstrualCyclesStore_savePeriodNotYetStartedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)savePeriodNotYetEndedWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke;
  v10[3] = &unk_24D99D6F0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke_2;
  v8[3] = &unk_24D99D658;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodNotYetEndedWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HKMenstrualCyclesStore_savePeriodNotYetEndedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)savePeriodStartedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke;
  v12[3] = &unk_24D99D830;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke_2;
  v10[3] = &unk_24D99D658;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodStartedOnDayIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)savePeriodStartedOnDayIndex:(int64_t)a3 endedOnDayIndex:(int64_t)a4 completion:(id)a5
{
  void *v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  int64_t v16;
  int64_t v17;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke;
  v14[3] = &unk_24D99D808;
  v16 = a3;
  v17 = a4;
  v15 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke_2;
  v12[3] = &unk_24D99D658;
  v13 = v15;
  v11 = v15;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodStartedOnDayIndex:endedOnDayIndex:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __81__HKMenstrualCyclesStore_savePeriodStartedOnDayIndex_endedOnDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)savePeriodEndedOnDayIndex:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke;
  v12[3] = &unk_24D99D830;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke_2;
  v10[3] = &unk_24D99D658;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_savePeriodEndedOnDayIndex:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __63__HKMenstrualCyclesStore_savePeriodEndedOnDayIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerAnalysisForDebugReason:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke;
  v14[3] = &unk_24D99D7B8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke_2;
  v12[3] = &unk_24D99D658;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAnalysisForDebugReason:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKMenstrualCyclesStore_triggerAnalysisForDebugReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSDate)cycleFactorsLastReviewedDate
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKMenstrualCyclesStore _appProtectedSyncedKeyValueDomain](self, "_appProtectedSyncedKeyValueDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "dateForKey:error:", CFSTR("CycleFactorsLastReviewedDate"), &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  if (v3)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = CFSTR("CycleFactorsLastReviewedDate");
      v16 = 2114;
      v17 = v4;
      v10 = v9;
      _os_log_error_impl(&dword_218A9C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);

    }
  }

  return (NSDate *)v3;
}

- (void)setCycleFactorsLastReviewedDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HKMenstrualCyclesStore _appProtectedSyncedKeyValueDomain](self, "_appProtectedSyncedKeyValueDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "setDate:forKey:error:", v4, CFSTR("CycleFactorsLastReviewedDate"), &v15);
  v6 = v15;

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  v8 = *MEMORY[0x24BDD3030];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = CFSTR("CycleFactorsLastReviewedDate");
      v20 = 2114;
      v21 = v6;
      v11 = v10;
      _os_log_error_impl(&dword_218A9C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2114;
      v19 = CFSTR("CycleFactorsLastReviewedDate");
      v20 = 2112;
      v21 = v4;
      v14 = v13;
      _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);

    }
    -[HKMenstrualCyclesStore _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("setCycleFactorsLastReviewedDate"));
  }

}

- (void)setIsEligibleForCycleFactorsReminder:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[HKMenstrualCyclesStore _appProtectedSyncedKeyValueDomain](self, "_appProtectedSyncedKeyValueDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "setNumber:forKey:error:", v5, CFSTR("HKMCCycleFactorsEligibilityState"), &v17);
  v6 = v17;

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  v8 = *MEMORY[0x24BDD3030];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v19 = v10;
      v20 = 2114;
      v21 = CFSTR("HKMCCycleFactorsEligibilityState");
      v22 = 2114;
      v23 = v6;
      v11 = v10;
      _os_log_error_impl(&dword_218A9C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v7;
    v13 = (void *)objc_opt_class();
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = v13;
    objc_msgSend(v14, "numberWithBool:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v13;
    v20 = 2114;
    v21 = CFSTR("HKMCCycleFactorsEligibilityState");
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);

  }
}

- (NSNumber)lastMenstrualPeriodDismissalDay
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKMenstrualCyclesStore _syncedProtectedKeyValueDomain](self, "_syncedProtectedKeyValueDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "numberForKey:error:", CFSTR("LastMenstrualPeriodDismissalDefaultsKey"), &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  if (v3)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = CFSTR("LastMenstrualPeriodDismissalDefaultsKey");
      v16 = 2114;
      v17 = v4;
      v10 = v9;
      _os_log_error_impl(&dword_218A9C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);

    }
  }

  return (NSNumber *)v3;
}

- (void)setLastMenstrualPeriodDismissalDay:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HKMenstrualCyclesStore _syncedProtectedKeyValueDomain](self, "_syncedProtectedKeyValueDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "setNumber:forKey:error:", v4, CFSTR("LastMenstrualPeriodDismissalDefaultsKey"), &v15);
  v6 = v15;

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  v8 = *MEMORY[0x24BDD3030];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = CFSTR("LastMenstrualPeriodDismissalDefaultsKey");
      v20 = 2114;
      v21 = v6;
      v11 = v10;
      _os_log_error_impl(&dword_218A9C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2114;
      v19 = CFSTR("LastMenstrualPeriodDismissalDefaultsKey");
      v20 = 2112;
      v21 = v4;
      v14 = v13;
      _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);

    }
    -[HKMenstrualCyclesStore _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("setLastMenstrualPeriodDismissalDay"));
  }

}

- (id)deviationDetectedIndicesForDeviationType:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  HKMCDeviationDetectionAnalyticsKeyFromDeviationType(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMenstrualCyclesStore _deviationDetectionAnalyticsDomain](self, "_deviationDetectionAnalyticsDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyListValueForKey:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 || v8)
  {
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCE30]);

      v8 = v10;
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v12 = v9;
      v13 = (void *)objc_opt_class();
      v14 = *a4;
      v16 = 138543874;
      v17 = v13;
      v18 = 2114;
      v19 = v6;
      v20 = 2114;
      v21 = v14;
      v15 = v13;
      _os_log_error_impl(&dword_218A9C000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)setDeviationDetectedIfNeededForDeviations:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  HKMenstrualCyclesStore *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  id obj;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_28;
  }
  v6 = v4;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v45;
  *(_QWORD *)&v5 = 138543874;
  v38 = v5;
  while (2)
  {
    v10 = 0;
    v40 = v6;
    do
    {
      if (*(_QWORD *)v45 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = objc_msgSend(v11, "days", v38);
      if (v14 <= 0)
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v15 = v14 + v13 - 1;
      objc_msgSend(v12, "numberWithInteger:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKMCDeviationDetectionAnalyticsKeyFromDeviationType(objc_msgSend(v11, "type"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "type");
      v43 = v8;
      -[HKMenstrualCyclesStore deviationDetectedIndicesForDeviationType:error:](self, "deviationDetectedIndicesForDeviationType:error:", v18, &v43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v43;

      if (v20)
      {
        _HKInitializeLogging();
        v30 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        {
          v32 = v30;
          v33 = (void *)objc_opt_class();
          *(_DWORD *)buf = v38;
          v49 = v33;
          v50 = 2114;
          v51 = v17;
          v52 = 2114;
          v53 = v20;
          v34 = v33;
          _os_log_error_impl(&dword_218A9C000, v32, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);

        }
        v8 = v20;
        goto LABEL_26;
      }
      if ((objc_msgSend(v19, "containsObject:", v16) & 1) != 0)
      {
        v8 = 0;
        goto LABEL_16;
      }
      v39 = v7;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v19);
      objc_msgSend(v21, "addObject:", v16);
      v22 = self;
      -[HKMenstrualCyclesStore _deviationDetectionAnalyticsDomain](self, "_deviationDetectionAnalyticsDomain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v24 = objc_msgSend(v23, "setPropertyListValue:forKey:error:", v21, v17, &v42);
      v8 = v42;

      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x24BDD3030];
      v26 = *MEMORY[0x24BDD3030];
      if (!v24)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v35 = v25;
          v36 = (void *)objc_opt_class();
          *(_DWORD *)buf = v38;
          v49 = v36;
          v50 = 2114;
          v51 = v17;
          v52 = 2114;
          v53 = v8;
          v37 = v36;
          _os_log_error_impl(&dword_218A9C000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);

        }
        v7 = v39;
LABEL_26:

        goto LABEL_27;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v25;
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = v38;
        v49 = v28;
        v50 = 2114;
        v51 = v17;
        v52 = 2112;
        v53 = v21;
        v29 = v28;
        _os_log_impl(&dword_218A9C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);

      }
      v7 = 1;
      self = v22;
      v6 = v40;
LABEL_16:

      ++v10;
    }
    while (v6 != v10);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v6)
      continue;
    break;
  }
LABEL_27:

LABEL_28:
  return v7 & 1;
}

- (NSNumber)unconfirmedDeviationDismissalDay
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKMenstrualCyclesStore _syncedProtectedKeyValueDomain](self, "_syncedProtectedKeyValueDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "numberForKey:error:", CFSTR("UnconfirmedDeviationDismissalDayIndex"), &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  if (v3)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = CFSTR("UnconfirmedDeviationDismissalDayIndex");
      v16 = 2114;
      v17 = v4;
      v10 = v9;
      _os_log_error_impl(&dword_218A9C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);

    }
  }

  return (NSNumber *)v3;
}

- (void)setUnconfirmedDeviationDismissalDay:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HKMenstrualCyclesStore _syncedProtectedKeyValueDomain](self, "_syncedProtectedKeyValueDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "setNumber:forKey:error:", v4, CFSTR("UnconfirmedDeviationDismissalDayIndex"), &v15);
  v6 = v15;

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  v8 = *MEMORY[0x24BDD3030];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = CFSTR("UnconfirmedDeviationDismissalDayIndex");
      v20 = 2114;
      v21 = v6;
      v11 = v10;
      _os_log_error_impl(&dword_218A9C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2114;
      v19 = CFSTR("UnconfirmedDeviationDismissalDayIndex");
      v20 = 2112;
      v21 = v4;
      v14 = v13;
      _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);

    }
    -[HKMenstrualCyclesStore triggerAnalysisForDebugReason:completion:](self, "triggerAnalysisForDebugReason:completion:", CFSTR("deviation dismissal"), &__block_literal_global);
    -[HKMenstrualCyclesStore _triggerImmediateSyncWithReason:](self, "_triggerImmediateSyncWithReason:", CFSTR("setUnconfirmedDeviationDismissalDay"));
  }

}

- (NSNumber)unconfirmedDeviationSubmissionDay
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKMenstrualCyclesStore _deviationDetectionAnalyticsDomain](self, "_deviationDetectionAnalyticsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "numberForKey:error:", CFSTR("UnconfirmedDeviationSubmissionDayIndex"), &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  if (v3)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = CFSTR("UnconfirmedDeviationSubmissionDayIndex");
      v16 = 2114;
      v17 = v4;
      v10 = v9;
      _os_log_error_impl(&dword_218A9C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);

    }
  }

  return (NSNumber *)v3;
}

- (void)setUnconfirmedDeviationSubmissionDay:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HKMenstrualCyclesStore _deviationDetectionAnalyticsDomain](self, "_deviationDetectionAnalyticsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "setNumber:forKey:error:", v4, CFSTR("UnconfirmedDeviationSubmissionDayIndex"), &v13);
  v6 = v13;

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3030];
  v8 = *MEMORY[0x24BDD3030];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = CFSTR("UnconfirmedDeviationSubmissionDayIndex");
      v18 = 2114;
      v19 = v6;
      v11 = v10;
      _os_log_error_impl(&dword_218A9C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting %{public}@: %{public}@", buf, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v7;
    v12 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v15 = v12;
    v16 = 2114;
    v17 = CFSTR("UnconfirmedDeviationSubmissionDayIndex");
    v18 = 2112;
    v19 = v4;
    v11 = v12;
    _os_log_impl(&dword_218A9C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %{public}@: %@", buf, 0x20u);
    goto LABEL_6;
  }

}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
  -[HKMenstrualCyclesStore cloudSyncControl](self, "cloudSyncControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3A00]), "initWithChangesSyncRequest:", v5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke;
  v9[3] = &unk_24D99D898;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "syncWithRequest:reason:completion:", v7, v8, v9);

}

void __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v11 = v9;
      _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully requested sync after %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (id)_syncedProtectedKeyValueDomain
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD3C98]);
  -[HKMenstrualCyclesStore healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCategory:domainName:healthStore:", 0, CFSTR("com.apple.private.health.menstrual-cycles"), v4);

  return v5;
}

- (id)_appProtectedSyncedKeyValueDomain
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD3C98]);
  -[HKMenstrualCyclesStore healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCategory:domainName:healthStore:", 2, CFSTR("com.apple.private.health.menstrual-cycles"), v4);

  return v5;
}

- (id)_deviationDetectionAnalyticsDomain
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD3C98]);
  -[HKMenstrualCyclesStore healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCategory:domainName:healthStore:", 1, CFSTR("com.apple.private.health.menstrual-cycles.deviation-detection-analytics"), v4);

  return v5;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_cloudSyncControl, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __58__HKMenstrualCyclesStore__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = a3;
  v8 = v6;
  _os_log_error_impl(&dword_218A9C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Unsuccessfully requested sync after %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
