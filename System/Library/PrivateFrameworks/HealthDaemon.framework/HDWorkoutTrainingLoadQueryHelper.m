@implementation HDWorkoutTrainingLoadQueryHelper

- (HDWorkoutTrainingLoadQueryHelper)initWithFilter:(id)a3 options:(int64_t)a4 profile:(id)a5
{
  id v8;
  id v9;
  HDWorkoutTrainingLoadQueryHelper *v10;
  HDWorkoutTrainingLoadQueryHelper *v11;
  uint64_t v12;
  _HKFilter *filter;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutTrainingLoadQueryHelper;
  v10 = -[HDWorkoutTrainingLoadQueryHelper init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_profile, v9);
    v12 = objc_msgSend(v8, "copy");
    filter = v11->_filter;
    v11->_filter = (_HKFilter *)v12;

    v11->_options = a4;
  }

  return v11;
}

- (HDWorkoutTrainingLoadQueryHelper)initWithFilter:(id)a3 options:(int64_t)a4 anchorDate:(id)a5 intervalComponents:(id)a6 profile:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSDate *v15;
  NSDate *anchorDate;
  NSDateComponents *v17;
  NSDateComponents *intervalComponents;
  HDWorkoutTrainingLoadQueryHelper *v19;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = (NSDate *)objc_msgSend(a5, "copy");
  anchorDate = self->_anchorDate;
  self->_anchorDate = v15;

  v17 = (NSDateComponents *)objc_msgSend(v13, "copy");
  intervalComponents = self->_intervalComponents;
  self->_intervalComponents = v17;

  v19 = -[HDWorkoutTrainingLoadQueryHelper initWithFilter:options:profile:](self, "initWithFilter:options:profile:", v14, a4, v12);
  return v19;
}

- (void)fetchTrainingLoadWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;
  id v7;
  HDWorkoutTrainingLoadDataSource *dataSource;
  id v9;
  HDWorkoutTrainingLoadQueryHelper *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void (**v31)(id, void *, _QWORD);
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  HDWorkoutTrainingLoadQueryHelper *v40;
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  HDWorkoutTrainingLoadQueryHelper *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HDWorkoutTrainingLoadQueryHelper _calculatorWithIntervalCollection:](self, "_calculatorWithIntervalCollection:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  dataSource = self->_dataSource;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke;
  v38[3] = &unk_1E6CF3860;
  v9 = v5;
  v39 = v9;
  v40 = self;
  v10 = self;
  v32 = v7;
  v41 = v32;
  v11 = v6;
  v42 = v11;
  if (-[HDWorkoutTrainingLoadDataSource samplesForCalculatorWithHandler:](dataSource, "samplesForCalculatorWithHandler:", v38))
  {
    v30 = v9;
    v31 = v4;
    objc_msgSend(v9, "currentStatistics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v17, v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "currentStatistics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDWorkoutTrainingLoadQueryHelper _trainingLoadFromStatistics:count:](v10, "_trainingLoadFromStatistics:count:", v19, objc_msgSend(v20, "count"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "objectForKeyedSubscript:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v21, v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v28, "dataCount"))
    {
      v23 = objc_alloc(MEMORY[0x1E0CB6EB0]);
      -[HDWorkoutTrainingLoadQueryHelper _trainingLoadFromStatistics:count:](v10, "_trainingLoadFromStatistics:count:", v28, objc_msgSend(v28, "dataCount"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithTotalTrainingLoad:trainingloadByActivityType:", v24, v33);

      v4 = v31;
    }
    else
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E0CB5380];
      v4 = v31;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v10;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_INFO, "%{public}@: No training load to return", buf, 0xCu);
      }
      v25 = 0;
    }
    v11 = v29;
    v4[2](v4, v25, 0);

    v9 = v30;
  }
  else
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v45 = self;
      v46 = 2114;
      v47 = 0;
      _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed querying training load with error : %{public}@", buf, 0x16u);
    }
    v4[2](v4, 0, 0);
  }

}

uint64_t __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7, double a8)
{
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;

  v15 = a4;
  v16 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke_2;
  v23[3] = &unk_1E6CF3838;
  v17 = v16;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a2;
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  v24 = v17;
  v25 = v18;
  v33 = a3;
  v26 = v19;
  v27 = v15;
  v28 = *(id *)(a1 + 56);
  v20 = v15;
  v21 = objc_msgSend(v17, "performAddSampleTransaction:error:", v23, a5);

  return v21;
}

uint64_t __68__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadWithCompletion___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "addSampleValue:startTime:endTime:sourceID:error:", *(_QWORD *)(a1 + 96), a2, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) == 1)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    }
    v11 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 56));

    v14 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "_calculatorWithIntervalCollection:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    }
    if ((objc_msgSend(v16, "addSampleValue:startTime:endTime:sourceID:error:", *(_QWORD *)(a1 + 96), a2, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88)) & 1) == 0)
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 80);
        v22 = *(_QWORD *)(a1 + 88);
        v23 = (void *)MEMORY[0x1E0CB37E8];
        v24 = *(_QWORD *)(a1 + 104);
        v25 = v19;
        objc_msgSend(v23, "numberWithUnsignedInteger:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *a2;
        v29 = 138544386;
        v30 = v20;
        v31 = 2048;
        v32 = v21;
        v33 = 2048;
        v34 = v22;
        v35 = 2114;
        v36 = v26;
        v37 = 2114;
        v38 = v27;
        _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_INFO, "%{public}@: Failed adding sample to load activity calculator with start date %f, end date %f and activityType %{public}@, error:%{public}@", (uint8_t *)&v29, 0x34u);

      }
    }

  }
  return v4;
}

- (void)fetchTrainingLoadCollectionWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  HDWorkoutTrainingLoadDataSource *dataSource;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, void *, uint64_t, double, double, double);
  void *v23;
  id v24;
  HDWorkoutTrainingLoadQueryHelper *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  HDWorkoutTrainingLoadQueryHelper *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F60]), "initWithAnchorDate:intervalComponents:", self->_anchorDate, self->_intervalComponents);
  -[HDWorkoutTrainingLoadQueryHelper _calculatorWithIntervalCollection:](self, "_calculatorWithIntervalCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__64;
  v35 = __Block_byref_object_dispose__64;
  v36 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke;
  v30[3] = &unk_1E6CF3888;
  v30[4] = self;
  v30[5] = &v31;
  objc_msgSend(v6, "setStatisticsHandler:", v30);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  dataSource = self->_dataSource;
  v20 = v8;
  v21 = 3221225472;
  v22 = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_2;
  v23 = &unk_1E6CF3900;
  v12 = v6;
  v24 = v12;
  v25 = self;
  v13 = v7;
  v26 = v13;
  v14 = v9;
  v27 = v14;
  v15 = v5;
  v28 = v15;
  v16 = v10;
  v29 = v16;
  if (!-[HDWorkoutTrainingLoadDataSource samplesForCalculatorWithHandler:](dataSource, "samplesForCalculatorWithHandler:", &v20))
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v38 = self;
      v39 = 2114;
      v40 = 0;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed querying training load with error : %{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if (!v32[5])
  {
LABEL_6:
    v18 = 0;
    goto LABEL_7;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB6EA0]);
  v18 = (void *)objc_msgSend(v17, "initWithTotalTrainingLoadCollection:collectionByActivityType:", v32[5], v16, v20, v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_7:
  v4[2](v4, v18, 0);

  _Block_object_dispose(&v31, 8);
}

void __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "sumQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_value");
  v6 = v5;

  if (v6 != 0.0)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6E90]), "_init");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    objc_msgSend(*(id *)(a1 + 32), "_trainingLoadFromStatistics:count:", v11, objc_msgSend(v11, "dataCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addTrainingLoad:", v10);

  }
}

uint64_t __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7, double a8)
{
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;

  v15 = a4;
  v16 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_3;
  v23[3] = &unk_1E6CF38D8;
  v17 = v16;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v34 = a2;
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  v24 = v17;
  v25 = v18;
  v35 = a3;
  v26 = v19;
  v27 = v15;
  v28 = *(id *)(a1 + 56);
  v29 = *(id *)(a1 + 64);
  v30 = *(id *)(a1 + 72);
  v20 = v15;
  v21 = objc_msgSend(v17, "performAddSampleTransaction:error:", v23, a5);

  return v21;
}

uint64_t __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
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
  void *v18;
  id v19;
  uint64_t v20;
  os_log_t *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  char v34;
  id v35;
  os_log_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "addSampleValue:startTime:endTime:sourceID:error:", *(_QWORD *)(a1 + 112), a2, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) == 1)
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v8 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 56));

    v13 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "_calculatorWithIntervalCollection:", *(_QWORD *)(a1 + 72));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_4;
    v46[3] = &unk_1E6CF38B0;
    v18 = *(void **)(a1 + 48);
    v46[4] = *(_QWORD *)(a1 + 40);
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 120);
    v47 = v19;
    v49 = v20;
    v48 = *(id *)(a1 + 80);
    objc_msgSend(v15, "setStatisticsHandler:", v46);
    _HKInitializeLogging();
    v21 = (os_log_t *)MEMORY[0x1E0CB5380];
    v22 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v23 = *(_QWORD *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 96);
      v24 = *(_QWORD *)(a1 + 104);
      v26 = (void *)MEMORY[0x1E0CB37E8];
      v27 = *(_QWORD *)(a1 + 120);
      v28 = v22;
      objc_msgSend(v26, "numberWithUnsignedInteger:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v51 = v23;
      v52 = 2048;
      v53 = v25;
      v54 = 2048;
      v55 = v24;
      v21 = (os_log_t *)MEMORY[0x1E0CB5380];
      v56 = 2114;
      v57 = v29;
      _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_INFO, "%{public}@: Adding sample to activity calculator with start %f, end date %f and activityType : %{public}@", buf, 0x2Au);

    }
    v30 = *(double *)(a1 + 88);
    v31 = *(double *)(a1 + 96);
    v32 = *(double *)(a1 + 104);
    v33 = *(_QWORD *)(a1 + 112);
    v45 = 0;
    v34 = objc_msgSend(v15, "addSampleValue:startTime:endTime:sourceID:error:", v33, &v45, v30, v31, v32);
    v35 = v45;
    if ((v34 & 1) == 0)
    {
      _HKInitializeLogging();
      v36 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
      {
        v38 = *(_QWORD *)(a1 + 40);
        v39 = *(_QWORD *)(a1 + 96);
        v40 = *(_QWORD *)(a1 + 104);
        v41 = (void *)MEMORY[0x1E0CB37E8];
        v42 = *(_QWORD *)(a1 + 120);
        v43 = v36;
        objc_msgSend(v41, "numberWithUnsignedInteger:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v51 = v38;
        v52 = 2048;
        v53 = v39;
        v54 = 2048;
        v55 = v40;
        v56 = 2114;
        v57 = v44;
        v58 = 2114;
        v59 = v35;
        _os_log_error_impl(&dword_1B7802000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed adding sample to activity calculator with start date %f, end date %f, activityType %{public}@ and error: %{public}@", buf, 0x34u);

      }
    }

  }
  return v3;
}

void __78__HDWorkoutTrainingLoadQueryHelper_fetchTrainingLoadCollectionWithCompletion___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a1[7];
  v8 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_trainingLoadFromStatistics:count:", v8, objc_msgSend(v10, "count"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6E90]), "_init");
  objc_msgSend(v13, "addTrainingLoad:", v16);
  v14 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

}

- (id)_trainingLoadFromStatistics:(id)a3 count:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v19;
  HDWorkoutTrainingLoadQueryHelper *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "sumQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_value");
  v9 = v8;

  if (v9 == 0.0)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v19 = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: No training load. Returning 0 value ", (uint8_t *)&v19, 0xCu);
    }
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

  v15 = objc_alloc(MEMORY[0x1E0CB6E88]);
  objc_msgSend(v6, "sumQuantity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithQuantity:dateInterval:count:", v16, v14, a4);
  return v17;
}

- (id)_calculatorWithIntervalCollection:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v13;
  id WeakRetained;
  HDStatisticsCollectionCalculatorSourceOrderProvider *v15;
  HDStatisticsCollectionCalculatorSourceOrderProvider *sourceOrderProvider;
  HDWorkoutTrainingLoadDataSource *v17;
  id v18;
  HDWorkoutTrainingLoadDataSource *v19;
  HDWorkoutTrainingLoadDataSource *dataSource;

  v4 = (void *)MEMORY[0x1E0CB6A70];
  v5 = *MEMORY[0x1E0CB5DD8];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "appleEffortScoreUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unitMultipliedByUnit:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:", v7, 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:", v11, v6, 16, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v15 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:](v13, "initWithProfile:quantityType:", WeakRetained, v11);
  sourceOrderProvider = self->_sourceOrderProvider;
  self->_sourceOrderProvider = v15;

  if (!self->_dataSource)
  {
    v17 = [HDWorkoutTrainingLoadDataSource alloc];
    v18 = objc_loadWeakRetained((id *)&self->_profile);
    v19 = -[HDWorkoutTrainingLoadDataSource initWithProfile:quantityType:filter:](v17, "initWithProfile:quantityType:filter:", v18, v11, self->_filter);
    dataSource = self->_dataSource;
    self->_dataSource = v19;

  }
  objc_msgSend(v12, "setSourceOrderProvider:", self->_sourceOrderProvider);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
