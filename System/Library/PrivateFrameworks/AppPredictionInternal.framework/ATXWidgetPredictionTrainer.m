@implementation ATXWidgetPredictionTrainer

- (ATXWidgetPredictionTrainer)initWithInformationStore:(id)a3 distinctScoreCounts:(id)a4
{
  id v7;
  id v8;
  ATXWidgetPredictionTrainer *v9;
  ATXWidgetPredictionTrainer *v10;
  ATXWidgetPredictionTrainingDatasetBuilder *v11;
  ATXWidgetPredictionTrainingDatasetBuilder *datasetBuilder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXWidgetPredictionTrainer;
  v9 = -[ATXWidgetPredictionTrainer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_informationStore, a3);
    v11 = -[ATXWidgetPredictionTrainingDatasetBuilder initWithDistinctScoreCounts:]([ATXWidgetPredictionTrainingDatasetBuilder alloc], "initWithDistinctScoreCounts:", v8);
    datasetBuilder = v10->_datasetBuilder;
    v10->_datasetBuilder = v11;

  }
  return v10;
}

- (void)trainWidgetPredictionModelWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[ATXWidgetPredictionTrainer _timeOfLatestTraining](self, "_timeOfLatestTraining");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "shouldTrainModelOnDeviceWithTimeOfLatestTraining:", v6);

  if ((_DWORD)v5)
  {
    __atxlog_handle_timeline();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Preparing to train; it has been sufficiently long since the widget prediction model "
        "was trained on-device.",
        (uint8_t *)&v19,
        2u);
    }

    -[ATXInformationStore fetchWidgetEngagementRecords](self->_informationStore, "fetchWidgetEngagementRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXWidgetPredictionTrainingDatasetBuilder createMLArrayBatchProviderFromTrainingArray:](self->_datasetBuilder, "createMLArrayBatchProviderFromTrainingArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "compiledModelURLForModelName:", CFSTR("ATXWidgetPredictionMLModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "compiledModelURLForModelName:", CFSTR("ATXPersonalizedWidgetPredictionMLModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "moveOriginalModelToWriteablePath:", v10);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isReadableFileAtPath:", v13);

    if (v14)
    {
      __atxlog_handle_timeline();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v16;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "Using model from the previous round of on-device training at path: %@", (uint8_t *)&v19, 0xCu);

      }
      v17 = v11;

      v10 = v17;
    }
    if (objc_msgSend(v4, "didDefer"))
    {
      __atxlog_handle_timeline();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ATXWidgetPredictionTrainer: Deferring model training", (uint8_t *)&v19, 2u);
      }

    }
    else
    {
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:](self, "trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:", v9, v10, v11, v4);
    }

  }
}

+ (BOOL)shouldTrainModelOnDeviceWithTimeOfLatestTraining:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dateByAddingTimeInterval:", 604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3
    && (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "laterDate:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6 == v4))
  {
    __atxlog_handle_timeline();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v10);
      objc_msgSend(v9, "numberWithDouble:", v11 / 3600.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Next training date is in the future. Model will be retrained on-device in %@ hours", (uint8_t *)&v14, 0xCu);

    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(id)a3 modelURL:(id)a4 andSaveToURL:(id)a5 withActivity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint8_t buf[16];
  _QWORD v34[4];
  id v35;
  ATXWidgetPredictionTrainer *v36;
  uint64_t *v37;
  _QWORD *v38;
  _QWORD aBlock[4];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  dispatch_semaphore_t v46;
  _QWORD v47[5];
  id v48;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    __atxlog_handle_timeline();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_14;
  }
  if (!v12)
  {
    __atxlog_handle_timeline();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:].cold.2(v24);
LABEL_14:

    goto LABEL_15;
  }
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__73;
  v47[4] = __Block_byref_object_dispose__73;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__73;
  v45 = __Block_byref_object_dispose__73;
  v46 = dispatch_semaphore_create(0);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke;
  aBlock[3] = &unk_1E82E6CC8;
  v40 = v13;
  v17 = _Block_copy(aBlock);
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_17;
  v34[3] = &unk_1E82E6CF0;
  v37 = &v41;
  v38 = v47;
  v35 = v12;
  v36 = self;
  v18 = _Block_copy(v34);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E9C8]), "initForEvents:progressHandler:completionHandler:", 3, v17, v18);
  __atxlog_handle_timeline();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Starting MLUpdateTask", buf, 2u);
  }

  v32 = 0;
  objc_msgSend(MEMORY[0x1E0C9E9D0], "updateTaskForModelAtURL:trainingData:progressHandlers:error:", v11, v10, v19, &v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v32;
  if (v22)
  {
    __atxlog_handle_timeline();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:].cold.3();

  }
  objc_msgSend(v21, "resume");
  dispatch_semaphore_wait((dispatch_semaphore_t)v42[5], 0x384uLL);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v47, 8);

LABEL_15:
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(v3, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_cold_1(v3, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_timeline();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXWidgetPredictionTrainer: Deferring model training", v8, 2u);
    }

  }
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_17(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 == 5)
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_17_cold_1(v3, v6);
  }
  else
  {
    objc_msgSend(v3, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 4)
    {
      __atxlog_handle_timeline();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = a1[4];
        *(_DWORD *)buf = 138543362;
        v22 = v10;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "Success! Completed on-device training of widget prediction model; Saving the personalized model to path: %{public}@",
          buf,
          0xCu);
      }

    }
    objc_msgSend(v3, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[4];
    v13 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v13 + 40);
    v14 = objc_msgSend(v11, "writeToURL:error:", v12, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);

    v15 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    __atxlog_handle_timeline();
    v16 = objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v15 || (v14 & 1) == 0)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_17_cold_2((uint64_t)(a1 + 7), v6, v19);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = a1[4];
        *(_DWORD *)buf = 138543362;
        v22 = v17;
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Successfully saved the personalized model at path: %{public}@", buf, 0xCu);
      }

      v18 = (void *)a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_updateTimeOfLatestTrainingTo:", v6);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

+ (id)compiledModelURLForModelName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CF94D8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.mlmodelc"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widgetPredictionModelFileWithFilename:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_timeline();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXWidgetPredictionTrainer compiledModelURLForModelName:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v6 = 0;
  }
  return v6;
}

+ (void)moveOriginalModelToWriteablePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(CFSTR("ATXWidgetPredictionMLModel"), "stringByAppendingPathExtension:", CFSTR("mlmodelc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CF8CF0], "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filesystemPathForAssetDataRelativePath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_timeline();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "Moving original model from %{public}@ to %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isReadableFileAtPath:", v13))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isReadableFileAtPath:", v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v18 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v8, v3, &v21);
    v12 = v21;

    if ((v18 & 1) != 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    __atxlog_handle_timeline();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2114;
      v25 = v20;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_ERROR, "Failed to move file from %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);

    }
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:

}

- (id)_timeOfLatestTraining
{
  id v3;
  NSUserDefaults *v4;
  NSUserDefaults *defaults;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (NSUserDefaults *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9518]);
  defaults = self->_defaults;
  self->_defaults = v4;

  return -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("timestampOfLastTraining"));
}

- (void)_updateTimeOfLatestTrainingTo:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", a3, CFSTR("timestampOfLastTraining"));
}

- (void)modelPredictionWithSampleDictionaryFeatureProvider:(id)a3 withMLModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setComputeUnits:", 0);
    +[ATXWidgetPredictionTrainer compiledModelURLForModelName:](ATXWidgetPredictionTrainer, "compiledModelURLForModelName:", CFSTR("ATXPersonalizedWidgetPredictionMLModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v7, &v19);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    if (v9)
    {
      __atxlog_handle_timeline();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXWidgetPredictionTrainer modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:].cold.2();

    }
  }
  v18 = 0;
  objc_msgSend(v6, "predictionFromFeatures:error:", v5, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  __atxlog_handle_timeline();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXWidgetPredictionTrainer modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:].cold.1();
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "featureValueForName:", CFSTR("engaged"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureValueForName:", CFSTR("input_widget_family"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureValueForName:", CFSTR("input_widget_family"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Output from model: %{public}@ for unique score count: %{public}@ widget family: %{public}@", buf, 0x20u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_datasetBuilder, 0);
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(uint64_t)a3 modelURL:(uint64_t)a4 andSaveToURL:(uint64_t)a5 withActivity:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXWidgetPredictionTrainer: At least one feature provider is required for model training.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(os_log_t)log modelURL:andSaveToURL:withActivity:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXWidgetPredictionTrainer: Missing required parameter: personalizedModelURL", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "Error during ML Update task: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v5, "ATXWidgetPredictionTrainer: Error encountered before MLUpdate task could complete; context.task.error: %{public}@",
    v6);

  OUTLINED_FUNCTION_1_1();
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_17_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v5, "ML Update task failed with error%@", v6);

  OUTLINED_FUNCTION_1_1();
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_17_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "Failed to save the personalized model with error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

+ (void)compiledModelURLForModelName:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXWidgetPredictionTrainer: Missing model name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXWidgetPredictionTrainer: Error encountered while making predictions: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXWidgetPredictionTrainer - modelPredictionWithSampleDictionaryFeatureProvider: Error encountered while creating model: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
