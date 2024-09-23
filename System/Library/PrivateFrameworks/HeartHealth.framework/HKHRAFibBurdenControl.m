@implementation HKHRAFibBurdenControl

- (HKHRAFibBurdenControl)initWithHealthStore:(id)a3
{
  id v5;
  HKHRAFibBurdenControl *v6;
  HKHRAFibBurdenControl *v7;
  id v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRAFibBurdenControl;
  v6 = -[HKHRAFibBurdenControl init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, CFSTR("HKHRAFibBurdenControlServer"), v7, v9);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v12 = objc_alloc_init(MEMORY[0x1E0CB6CB8]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v7->_proxyProvider, "setTaskConfiguration:", v12);

  }
  return v7;
}

- (void)triggerAnalysis
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];

  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2;
  v3[3] = &unk_1E9C26160;
  v3[4] = self;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", &__block_literal_global_4, v3);
}

uint64_t __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAnalysis");
}

void __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2_cold_1();

}

- (id)determineIfAnalysisCanRunWithFeatureStatus:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke;
  v15[3] = &unk_1E9C26390;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_3;
  v14[3] = &unk_1E9C26070;
  v14[4] = &v19;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);
  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_2;
  v4[3] = &unk_1E9C26368;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_determineIfAnalysisCanRunWithFeatureStatus:completion:", v2, v4);
}

void __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __74__HKHRAFibBurdenControl_determineIfAnalysisCanRunWithFeatureStatus_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addTachogramClassificationForSampleUUID:(id)a3 hasAFib:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke;
  v17[3] = &unk_1E9C263B8;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2;
  v14[3] = &unk_1E9C263E0;
  v14[4] = self;
  v15 = v18;
  v16 = v19;
  v12 = v19;
  v13 = v18;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v14);

}

uint64_t __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_addTachogramClassificationForSampleUUID:hasAFib:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)queryAllTachogramClassificationsWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke;
  v10[3] = &unk_1E9C26408;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E9C26430;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryAllTachogramClassificationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)queryTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke;
  v15[3] = &unk_1E9C26458;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2;
  v12[3] = &unk_1E9C263E0;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryTachogramClassificationForSampleUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)deleteAllTachogramClassificationsWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke;
  v10[3] = &unk_1E9C26408;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E9C26430;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAllTachogramClassificationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke;
  v15[3] = &unk_1E9C26458;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2;
  v12[3] = &unk_1E9C263E0;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteTachogramClassificationForSampleUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)determineMajorityTimeZoneForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  int64_t v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  int64_t v19;

  v8 = a5;
  proxyProvider = self->_proxyProvider;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke;
  v16[3] = &unk_1E9C26480;
  v18 = a3;
  v19 = a4;
  v17 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2;
  v12[3] = &unk_1E9C264A8;
  v14 = a3;
  v15 = a4;
  v12[4] = self;
  v13 = v17;
  v11 = v17;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v12);

}

uint64_t __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_determineMajorityTimeZoneForStartDayIndex:endDayIndex:completion:", a1[5], a1[6], a1[4]);
}

void __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)queryEligibleTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  int64_t v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  int64_t v19;

  v8 = a5;
  proxyProvider = self->_proxyProvider;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke;
  v16[3] = &unk_1E9C26480;
  v18 = a3;
  v19 = a4;
  v17 = v8;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2;
  v12[3] = &unk_1E9C264A8;
  v14 = a3;
  v15 = a4;
  v12[4] = self;
  v13 = v17;
  v11 = v17;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v12);

}

uint64_t __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryEligibleTachogramsForStartDayIndex:endDayIndex:completion:", a1[5], a1[6], a1[4]);
}

void __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)queryEligibleTachogramsForPreviousSixWeeksForWeekday:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke;
  v13[3] = &unk_1E9C264D0;
  v15 = a3;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2;
  v10[3] = &unk_1E9C264F8;
  v11 = v14;
  v12 = a3;
  v10[4] = self;
  v9 = v14;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v10);

}

uint64_t __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke;
  v13[3] = &unk_1E9C264D0;
  v15 = a3;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2;
  v10[3] = &unk_1E9C264F8;
  v11 = v14;
  v12 = a3;
  v10[4] = self;
  v9 = v14;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v10);

}

uint64_t __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(id)a5 chanceOfWrite:(id)a6 minutesBetweenSamples:(id)a7 startingHour:(id)a8 endingHour:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  HKTaskServerProxyProvider *proxyProvider;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int64_t v39;
  int64_t v40;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke;
  v32[3] = &unk_1E9C26520;
  v39 = a3;
  v40 = a4;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v37 = v20;
  v38 = v21;
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2;
  v30[3] = &unk_1E9C26430;
  v30[4] = self;
  v31 = v38;
  v24 = v38;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v32, v30);

}

uint64_t __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addTachogramsForStartDayIndex:endDayIndex:chanceOfAFib:chanceOfWrite:minutesBetweenSamples:startingHour:endingHour:completion:", a1[10], a1[11], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

void __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)performAnalysisForWeekContainingDayIndex:(int64_t)a3 error:(id *)a4
{
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke;
  v11[3] = &unk_1E9C26570;
  v11[5] = &v12;
  v11[6] = a3;
  v11[4] = &v18;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_3;
  v10[3] = &unk_1E9C26070;
  v10[4] = &v12;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v11, v10);
  v6 = (id)v13[5];
  v7 = v6;
  if (v6)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }

  v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_2;
  v4[3] = &unk_1E9C26548;
  v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_performAnalysisForWeekContainingDayIndex:completion:", v2, v4);
}

void __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __72__HKHRAFibBurdenControl_performAnalysisForWeekContainingDayIndex_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)sendNotificationWithMode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke;
  v14[3] = &unk_1E9C26598;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2;
  v12[3] = &unk_1E9C26430;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_sendNotificationWithMode:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)sendNotificationForCurrentValue:(id)a3 previousValue:(id)a4 shouldForwardToWatch:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  HKHRAFibBurdenNotificationMode *v28;
  void *v29;
  HKHRAFibBurdenNotificationMode *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HKHRAFibBurdenControl *v36;
  void *v37;
  id v38;

  v7 = a5;
  v38 = a3;
  v10 = a4;
  v11 = (objc_class *)MEMORY[0x1E0C99D48];
  v12 = a6;
  v13 = [v11 alloc];
  v14 = (void *)objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HKHRAFibBurdenPreviousWeekDayIndexRange(v15, v14);
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v16, 0, v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_dateOnDayIndex:atHour:calendar:", v16 + v18, 0, v14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  v37 = v10;
  v35 = v12;
  if (!v38)
  {
    v21 = 0;
    v22 = 0;
    v20 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 3;
LABEL_11:
    v31 = v26;
    goto LABEL_12;
  }
  objc_msgSend(v38, "doubleValue");
  if (v19 <= 2.0)
  {
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 2.0);
    v21 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v20 = v38;
    v21 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v22 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v10, "doubleValue");
  if (v27 <= 2.0)
  {
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 2.0);
    v25 = MEMORY[0x1E0C9AAA0];
    v22 = MEMORY[0x1E0C9AAB0];
    v26 = 2;
    goto LABEL_11;
  }
  v24 = v10;
  v22 = MEMORY[0x1E0C9AAA0];
  v31 = 2;
  v25 = MEMORY[0x1E0C9AAA0];
LABEL_12:
  v28 = [HKHRAFibBurdenNotificationMode alloc];
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v34, v33);
  v30 = -[HKHRAFibBurdenNotificationMode initWithType:shouldForwardToWatch:currentPercentage:currentValueClamped:currentValueDateInterval:currentValueUUID:previousPercentage:previousValueClamped:previousTimeZoneDiffersFromCurrent:](v28, "initWithType:shouldForwardToWatch:currentPercentage:currentValueClamped:currentValueDateInterval:currentValueUUID:previousPercentage:previousValueClamped:previousTimeZoneDiffersFromCurrent:", v31, v7, v20, v21, v29, v23, v24, v22, v25);

  -[HKHRAFibBurdenControl sendNotificationWithMode:completion:](v36, "sendNotificationWithMode:completion:", v30, v35);
}

- (void)fetchLastAnalysisDateWithCompletion:(id)a3
{
  void *v3;
  HKHealthStore *healthStore;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB67F0];
  healthStore = self->_healthStore;
  v5 = a3;
  objc_msgSend(v3, "hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:", healthStore);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateForKey:completion:", CFSTR("LastAnalysisCompletedDate"), v5);

}

- (void)setLastAnalysisDate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKHealthStore *healthStore;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB67F0];
  healthStore = self->_healthStore;
  v9 = a3;
  objc_msgSend(v7, "hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:", healthStore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HKHRAFibBurdenControl_setLastAnalysisDate_completion___block_invoke;
  v12[3] = &unk_1E9C265C0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "setDate:forKey:completion:", v9, CFSTR("LastAnalysisCompletedDate"), v12);

}

void __56__HKHRAFibBurdenControl_setLastAnalysisDate_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    notify_post("com.apple.private.health.afib-burden.analysis-date.did-change");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)injectBurdenValues:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke;
  v14[3] = &unk_1E9C26598;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2;
  v12[3] = &unk_1E9C26430;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_injectBurdenValues:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)fetchSevenDayAnalysisBreadcrumbsWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke;
  v10[3] = &unk_1E9C26610;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_3;
  v9[3] = &unk_1E9C26070;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_2;
  v3[3] = &unk_1E9C265E8;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:", v3);
}

void __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __67__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)fetchSevenDayAnalysisBreadcrumbsWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke;
  v10[3] = &unk_1E9C26638;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E9C26430;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __40__HKHRAFibBurdenControl_triggerAnalysis__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when triggering analysis: %@");
  OUTLINED_FUNCTION_1();
}

void __84__HKHRAFibBurdenControl_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D7781000, v0, v1, "[%@] Error when inserting tachogram classification with UUID %@: %@");
  OUTLINED_FUNCTION_9();
}

void __72__HKHRAFibBurdenControl_queryAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when querying all tachogram classifications: %@");
  OUTLINED_FUNCTION_1();
}

void __78__HKHRAFibBurdenControl_queryTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D7781000, v0, v1, "[%@] Error when querying tachogram classification with UUID %@: %@");
  OUTLINED_FUNCTION_9();
}

void __73__HKHRAFibBurdenControl_deleteAllTachogramClassificationsWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when deleting all tachogram classifications: %@");
  OUTLINED_FUNCTION_1();
}

void __79__HKHRAFibBurdenControl_deleteTachogramClassificationForSampleUUID_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D7781000, v0, v1, "[%@] Error when deleting tachogram classifications for UUID %@: %@");
  OUTLINED_FUNCTION_9();
}

void __90__HKHRAFibBurdenControl_determineMajorityTimeZoneForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_1D7781000, v0, v1, "[%@] Error when determining majority time zones for day indexes %ld-%ld: %@");
}

void __88__HKHRAFibBurdenControl_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_1D7781000, v0, v1, "[%@] Error when querying eligible tachograms for day indexes %ld-%ld: %@");
}

void __89__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1D7781000, v0, v1, "[%@] Error when querying eligible tachograms for weekday %ld: %@");
  OUTLINED_FUNCTION_9();
}

void __97__HKHRAFibBurdenControl_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_1D7781000, v0, v1, "[%@] Error when querying eligible tachograms for time of day bucket %ld: %@");
  OUTLINED_FUNCTION_9();
}

void __151__HKHRAFibBurdenControl_addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when adding tachograms: %@");
  OUTLINED_FUNCTION_1();
}

void __61__HKHRAFibBurdenControl_sendNotificationWithMode_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when sending notification: %@");
  OUTLINED_FUNCTION_1();
}

void __55__HKHRAFibBurdenControl_injectBurdenValues_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when injecting burden values: %@");
  OUTLINED_FUNCTION_1();
}

void __72__HKHRAFibBurdenControl_fetchSevenDayAnalysisBreadcrumbsWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D7781000, v0, v1, "[%@] Error when fetching seven day analysis breadcrumbs: %@");
  OUTLINED_FUNCTION_1();
}

@end
