@implementation LighthouseCoreMLModelTraining

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global);
}

void __43__LighthouseCoreMLModelTraining_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LighthouseCoreMLModelAnalysis.Training", "general");
  v1 = (void *)trainingLog;
  trainingLog = (uint64_t)v0;

}

+ (BOOL)validateModelFeatureName:(id)a3 modelConfiguration:(id)a4 dataBatch:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "featuresAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v46 = 0;
      v11 = (id *)&v46;
      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v7, v8, &v46);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
      v11 = (id *)&v47;
      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v7, &v47);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v12;
    v23 = *v11;
    v24 = v23;
    if (v22)
    {
      v41 = v23;
      objc_msgSend(v22, "modelDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v10, "featureNames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v27)
      {
        v28 = v27;
        v37 = v22;
        v38 = v10;
        v39 = v8;
        v40 = v7;
        v29 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v43 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v25, "inputFeatureNames");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "containsObject:", v31))
            {

            }
            else
            {
              objc_msgSend(v25, "outputFeatureNames");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "containsObject:", v31);

              if ((v34 & 1) == 0)
              {
                v35 = (void *)trainingLog;
                if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
                  +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:].cold.3(v31, v35, v25);
                v21 = 0;
                goto LABEL_26;
              }
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
          if (v28)
            continue;
          break;
        }
        v21 = 1;
LABEL_26:
        v8 = v39;
        v7 = v40;
        v22 = v37;
        v10 = v38;
      }
      else
      {
        v21 = 1;
      }

      v24 = v41;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
        +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:].cold.2();
      v21 = 0;
    }

  }
  else
  {
    v13 = trainingLog;
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
      +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    v21 = 0;
  }

  return v21;
}

+ (id)getLabelFeatureName:(id)a3 modelConfiguration:(id)a4
{
  id v5;
  id v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v15 = 0;
    v7 = (id *)&v15;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v5, v6, &v15);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v7 = (id *)&v16;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v5, &v16);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = *v7;
  if (v9)
  {
    objc_msgSend(v9, "modelDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputFeatureNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
      +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:].cold.2();
    v13 = 0;
  }

  return v13;
}

+ (BOOL)trainModel:(id)a3 destModelUrl:(id)a4 modelConfiguration:(id)a5 dataBatch:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[LighthouseCoreMLModelTraining getLabelFeatureName:modelConfiguration:](LighthouseCoreMLModelTraining, "getLabelFeatureName:modelConfiguration:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[LighthouseCoreMLModelTraining trainModel:destModelUrl:modelConfiguration:dataBatch:labelFeatureName:](LighthouseCoreMLModelTraining, "trainModel:destModelUrl:modelConfiguration:dataBatch:labelFeatureName:", v12, v11, v10, v9, v13);

  return v14;
}

+ (BOOL)trainModel:(id)a3 destModelUrl:(id)a4 modelConfiguration:(id)a5 dataBatch:(id)a6 labelFeatureName:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  _BYTE *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  dispatch_semaphore_t v58;
  uint8_t v59[4];
  void *v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v41 = a4;
  v12 = a5;
  v13 = a6;
  v40 = a7;
  v14 = (void *)trainingLog;
  if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    objc_msgSend(v11, "absoluteURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v13, "count");
    _os_log_impl(&dword_24033D000, v15, OS_LOG_TYPE_INFO, "Begin trainModel with model URL %@ and number of samples: %ld", buf, 0x16u);

  }
  if (+[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:](LighthouseCoreMLModelTraining, "validateModelFeatureName:modelConfiguration:dataBatch:", v11, v12, v13))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    v63 = __Block_byref_object_dispose_;
    v64 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy_;
    v57 = __Block_byref_object_dispose_;
    v58 = dispatch_semaphore_create(0);
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v17 = v13;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_49;
    v43[3] = &unk_2510A2748;
    v44 = v41;
    v18 = v11;
    v45 = v18;
    v46 = &v49;
    v47 = buf;
    v48 = &v53;
    v39 = (void *)MEMORY[0x242682F68](v43);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC0028]), "initForEvents:progressHandler:completionHandler:", 3, &__block_literal_global_48, v39);
    if (v17 && objc_msgSend(v17, "count"))
    {
      v19 = (id)trainingLog;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v59 = 138412290;
        v60 = v20;
        _os_log_impl(&dword_24033D000, v19, OS_LOG_TYPE_INFO, "Update task will be initiated with %@ number of samples", v59, 0xCu);

      }
      v21 = (id)trainingLog;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "parameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v59 = 138412290;
        v60 = v22;
        _os_log_impl(&dword_24033D000, v21, OS_LOG_TYPE_INFO, "Config: %@", v59, 0xCu);

      }
      v23 = *(_QWORD *)&buf[8];
      obj = *(id *)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(MEMORY[0x24BDC0030], "updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:", v18, v17, v12, v38, &obj);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v23 + 40), obj);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v25 = trainingLog;
        if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
        {
          v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v59 = 138412290;
          v60 = v26;
          _os_log_impl(&dword_24033D000, v25, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL caused error: %@", v59, 0xCu);
        }
        goto LABEL_18;
      }
      objc_msgSend(v24, "resume");
      v37 = trainingLog;
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_24033D000, v37, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL initiated", v59, 2u);
      }

    }
    else
    {
      v28 = trainingLog;
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_24033D000, v28, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL is not initiated due to lack of training data", v59, 2u);
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)v54[5]);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)v54[5], 0xFFFFFFFFFFFFFFFFLL);
    v29 = objc_alloc(MEMORY[0x24BE5F758]);
    objc_msgSend(v18, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc(MEMORY[0x24BE5F730]);
    objc_msgSend(MEMORY[0x24BE5F718], "fromMLProvider:", v17);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "init:labelFeatureName:", v32, v40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v50 + 24));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v29, "init:batchProviderInfo:succeeded:trainingError:", v30, v33, v34, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    objc_msgSend(MEMORY[0x24BE5F738], "emitModelTrainingEvent:", v24);
LABEL_18:
    v35 = *((unsigned __int8 *)v50 + 24);

    v27 = v35 != 0;
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }
  v27 = 0;
LABEL_19:

  return v27;
}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)trainingLog;
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
      __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_cold_1(v5, v2);
  }

}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_49(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = trainingLog;
  if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    if (!v5)
      v5 = a1[5];
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_24033D000, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }
  objc_msgSend(v3, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = a1[4];
  if (!v8)
    v8 = a1[5];
  v9 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v6, "writeToURL:error:", v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v10;

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) || !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v11 = trainingLog;
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
      __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_49_cold_1((uint64_t)(a1 + 7), v11, v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BE5F788];
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLastTrainedDate:", v14);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[8] + 8) + 40));

}

+ (id)evaluateModel:(id)a3 modelConfiguration:(id)a4 dataBatch:(id)a5
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  float v32;
  float v33;
  double v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v55 = 0;
    v10 = (id *)&v55;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v7, v8, &v55);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
    v10 = (id *)&v56;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v7, &v56);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v13 = *v10;
  v14 = (void *)trainingLog;
  if (v13)
    v15 = 1;
  else
    v15 = v12 == 0;
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
    {
      v19 = v14;
      objc_msgSend(v7, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = (uint64_t)v20;
      _os_log_impl(&dword_24033D000, v19, OS_LOG_TYPE_INFO, "Loaded ML Model at path %@", buf, 0xCu);

    }
    v54 = 0;
    objc_msgSend(v12, "predictionsFromBatch:error:", v9, &v54);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v54;
    v22 = (void *)trainingLog;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
        +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:].cold.3();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        v24 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 134217984;
        v58 = v24;
        _os_log_impl(&dword_24033D000, v23, OS_LOG_TYPE_INFO, "Predicted on %ld number of batches", buf, 0xCu);

      }
      if (objc_msgSend(v21, "count") < 1)
      {
        v32 = 0.0;
        v33 = 0.0;
LABEL_28:
        v17 = (void *)objc_opt_new();
        *(float *)&v34 = v32 / v33;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAccuracy:", v35);

        goto LABEL_36;
      }
      v53 = v8;
      v25 = 0;
      v26 = 0;
      while (1)
      {
        objc_msgSend(v21, "featuresAtIndex:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("WasShareRecipient"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "featuresAtIndex:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "featureValueForName:", CFSTR("WasShareRecipient"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          break;
        if (!v30)
        {
          v44 = trainingLog;
          v8 = v53;
          if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
            +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:].cold.2(v44, v45, v46, v47, v48, v49, v50, v51);
          goto LABEL_34;
        }
        v31 = objc_msgSend(v28, "int64Value");
        if (v31 == objc_msgSend(v30, "int64Value"))
          ++v26;
        ++v25;

        if (v25 >= objc_msgSend(v21, "count"))
        {
          v32 = (float)v26;
          v33 = (float)(int)v25;
          v8 = v53;
          goto LABEL_28;
        }
      }
      v36 = trainingLog;
      v8 = v53;
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
        +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);

LABEL_34:
    }
    v17 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v16 = v13;
  if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR))
    +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:].cold.4(v14, v7);
  v17 = 0;
LABEL_37:

  return v17;
}

+ (void)validateModelFeatureName:(uint64_t)a3 modelConfiguration:(uint64_t)a4 dataBatch:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_24033D000, a1, a3, "dataBatch is empty", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)validateModelFeatureName:modelConfiguration:dataBatch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24033D000, v0, v1, "could not load a model %@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)validateModelFeatureName:(uint64_t)a1 modelConfiguration:(void *)a2 dataBatch:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "inputFeatureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "outputFeatureNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_24033D000, v5, OS_LOG_TYPE_ERROR, "featureName %@ is not in modelDescription %@ %@", (uint8_t *)&v8, 0x20u);

}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24033D000, v3, v6, "context.task.error: %@", v7);

}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_49_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_24033D000, a2, a3, "Saving the adapted model failed with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

+ (void)evaluateModel:(uint64_t)a3 modelConfiguration:(uint64_t)a4 dataBatch:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_24033D000, a1, a3, "Failed to fetch predictedOutputObject", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)evaluateModel:(uint64_t)a3 modelConfiguration:(uint64_t)a4 dataBatch:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_24033D000, a1, a3, "Failed to fetch trueOutputObject", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)evaluateModel:modelConfiguration:dataBatch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24033D000, v0, v1, "ML model failed to predict with error：%@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)evaluateModel:(void *)a1 modelConfiguration:(void *)a2 dataBatch:.cold.4(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24033D000, v3, v5, "Failed to load ML Model at path：%@", v6);

}

@end
