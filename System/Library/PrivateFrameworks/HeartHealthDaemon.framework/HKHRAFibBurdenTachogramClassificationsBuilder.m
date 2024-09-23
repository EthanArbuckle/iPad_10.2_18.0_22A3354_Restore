@implementation HKHRAFibBurdenTachogramClassificationsBuilder

- (HKHRAFibBurdenTachogramClassificationsBuilder)initWithProfile:(id)a3 classifier:(id)a4
{
  id v6;
  id v7;
  HKHRAFibBurdenTachogramClassificationsBuilder *v8;
  HKHRAFibBurdenTachogramClassificationsBuilder *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *julianDayToClassifications;
  dispatch_group_t v12;
  OS_dispatch_group *group;
  uint64_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKHRAFibBurdenTachogramClassificationsBuilder;
  v8 = -[HKHRAFibBurdenTachogramClassificationsBuilder init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_classifier, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    julianDayToClassifications = v9->_julianDayToClassifications;
    v9->_julianDayToClassifications = v10;

    v12 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v12;

    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

  }
  return v9;
}

- (void)addSampleToClassify:(id)a3 dayIndex:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *julianDayToClassifications;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  -[HKHRAFibBurdenTachogramClassificationsBuilder classificationForSample:](self, "classificationForSample:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15 = v6;
    julianDayToClassifications = self->_julianDayToClassifications;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](julianDayToClassifications, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = v11;

    objc_msgSend(v12, "addObject:", v15);
    v13 = self->_julianDayToClassifications;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12, v14);

    v6 = v15;
  }

}

- (id)buildClassifications
{
  return -[HKHRAFibBurdenTachogramClassificationsBuilder buildClassificationsAndWaitForNewClassificationSaves:](self, "buildClassificationsAndWaitForNewClassificationSaves:", 0);
}

- (id)buildClassificationsAndWaitForNewClassificationSaves:(BOOL)a3
{
  NSObject *group;
  dispatch_time_t v5;
  NSObject *v6;

  if (a3)
  {
    group = self->_group;
    v5 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(group, v5))
    {
      _HKInitializeLogging();
      HKHRAFibBurdenLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[HKHRAFibBurdenTachogramClassificationsBuilder buildClassificationsAndWaitForNewClassificationSaves:].cold.1((uint64_t)self, v6);

    }
  }
  -[NSMutableDictionary hk_allValuesBySortedKeys](self->_julianDayToClassifications, "hk_allValuesBySortedKeys");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)classificationForSample:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _BOOL4 v8;
  id v9;
  char v10;
  NSObject *v11;
  HKHRAFibBurdenTachogramClassificationProvider *v12;
  HKHRAFibBurdenTachogramClassificationProvider *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  HKHRAFibBurdenTachogramClassificationsBuilder *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__HKHRAFibBurdenTachogramClassificationsBuilder_classificationForSample___block_invoke;
  v21[3] = &unk_1E87F0428;
  v23 = &v25;
  v7 = v4;
  v22 = v7;
  v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, &v24, v21);
  v9 = v24;

  if (v9)
    v10 = v8;
  else
    v10 = 1;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v9;
      _os_log_error_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_ERROR, "[%@] Error when retrieving cached tachogram classification for sample UUID %@: %@", buf, 0x20u);

    }
  }
  if (v8 && v26[5])
  {
    v12 = [HKHRAFibBurdenTachogramClassificationProvider alloc];
    v13 = -[HKHRAFibBurdenTachogramClassificationProvider initWithSampleClassification:](v12, "initWithSampleClassification:", v26[5]);
  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      HKHRAFibBurdenLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = self;
        v33 = 2112;
        v34 = v17;
        _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_INFO, "[%@] Classifying tachogram sample with UUID %@", buf, 0x16u);

      }
    }
    -[HKHRAFibBurdenTachogramClassifier classifyHeartbeatSeries:](self->_classifier, "classifyHeartbeatSeries:", v7);
    v13 = (HKHRAFibBurdenTachogramClassificationProvider *)objc_claimAutoreleasedReturnValue();
    -[HKHRAFibBurdenTachogramClassificationProvider sampleClassification](v13, "sampleClassification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHRAFibBurdenTachogramClassificationsBuilder _saveNewClassification:](self, "_saveNewClassification:", v18);

  }
  _Block_object_dispose(&v25, 8);

  return v13;
}

uint64_t __73__HKHRAFibBurdenTachogramClassificationsBuilder_classificationForSample___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHRSampleClassificationEntity sampleClassificationWithSampleUUID:transaction:error:](HDHRSampleClassificationEntity, "sampleClassificationWithSampleUUID:transaction:error:", v7, v6, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 1;
}

- (void)_saveNewClassification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke;
  v7[3] = &unk_1E87EFB30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke_2;
  v10[3] = &unk_1E87F0450;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v5 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDHRSampleClassificationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v3, &v12, v10);
  v6 = v12;

  if (!v5)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "sampleUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_ERROR, "[%@] Error while saving tachogram classification for sample with UUID %@: %@", buf, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));

}

BOOL __72__HKHRAFibBurdenTachogramClassificationsBuilder__saveNewClassification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

  if (v7)
  {
    HKHRAFibBurdenLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "sampleUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_INFO, "[%@] Caching classification with UUID %@", (uint8_t *)&v14, 0x16u);

    }
  }
  +[HDHRSampleClassificationEntity insertSampleClassification:transaction:error:](HDHRSampleClassificationEntity, "insertSampleClassification:transaction:error:", *(_QWORD *)(a1 + 40), v5, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_julianDayToClassifications, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)buildClassificationsAndWaitForNewClassificationSaves:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CC29C000, a2, OS_LOG_TYPE_FAULT, "[%@] Took longer than 1 minute to save all tachogram classifications, no longer waiting.", (uint8_t *)&v2, 0xCu);
}

@end
