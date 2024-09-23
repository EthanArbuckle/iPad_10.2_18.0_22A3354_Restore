@implementation ATXCandidateRelevanceModelDataStore

- (ATXCandidateRelevanceModelDataStore)init
{
  void *v3;
  ATXCandidateRelevanceModelDataStore *v4;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXCandidateRelevanceModelDataStore initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (ATXCandidateRelevanceModelDataStore)initWithDataStore:(id)a3
{
  id v5;
  ATXCandidateRelevanceModelDataStore *v6;
  ATXCandidateRelevanceModelDataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelDataStore;
  v6 = -[ATXCandidateRelevanceModelDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataStore, a3);

  return v7;
}

- (void)writeTrainingResult:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _ATXDataStore *dataStore;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "featurizationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v6 = -[ATXCandidateRelevanceModelDataStore featurizationManagerIdForFeaturizationManager:error:](self, "featurizationManagerIdForFeaturizationManager:error:", v5, &v27);
  v7 = v27;

  if (v7)
  {
    __atxlog_handle_relevance_model();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXCandidateRelevanceModelDataStore writeTrainingResult:].cold.4();
  }
  else
  {
    objc_msgSend(v4, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v10 = -[ATXCandidateRelevanceModelDataStore candidateIdForCandidate:error:](self, "candidateIdForCandidate:error:", v9, &v26);
    v7 = v26;

    if (v7)
    {
      __atxlog_handle_relevance_model();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXCandidateRelevanceModelDataStore writeTrainingResult:].cold.3();
    }
    else
    {
      objc_msgSend(v4, "datasetMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v12 = -[ATXCandidateRelevanceModelDataStore datasetMetadataIdForDatasetMetadata:error:](self, "datasetMetadataIdForDatasetMetadata:error:", v11, &v25);
      v7 = v25;

      if (v7)
      {
        __atxlog_handle_relevance_model();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[ATXCandidateRelevanceModelDataStore writeTrainingResult:].cold.2();
      }
      else
      {
        v13 = (void *)MEMORY[0x1CAA48B6C]();
        v14 = (void *)MEMORY[0x1E0CB36F8];
        objc_msgSend(v4, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v24);
        v8 = objc_claimAutoreleasedReturnValue();
        v7 = v24;

        objc_autoreleasePoolPop(v13);
        if (v7)
        {
          __atxlog_handle_relevance_model();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[ATXCandidateRelevanceModelDataStore writeTrainingResult:].cold.1();

        }
        else
        {
          dataStore = self->_dataStore;
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke;
          v18[3] = &unk_1E82DF1A8;
          v18[4] = self;
          v19 = v4;
          v21 = v10;
          v8 = v8;
          v20 = v8;
          v22 = v6;
          v23 = v12;
          -[_ATXDataStore _doSync:](dataStore, "_doSync:", v18);

        }
      }
    }
  }

}

void __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_2;
  v7[3] = &unk_1E82DF1A8;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v6 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v10 = v5;
  v9 = v6;
  v11 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v2, "writeTransaction:", v7);

}

void __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_3;
  v6[3] = &unk_1E82DF180;
  v3 = *(id *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v9 = v4;
  v8 = v5;
  v10 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO relevanceCandidateModels (modelUUID, clientModelName, candidateId, candidateModelData, featurizationManagerId, trainDate, datasetMetadataId, isVerified) VALUES (:modelUUID, :clientModelName, :candidateId, :candidateModelData, :featurizationManagerId, :trainDate, :datasetMetadataId, :isVerified)"), v6, 0, 0);

}

void __59__ATXCandidateRelevanceModelDataStore_writeTrainingResult___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "modelUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":modelUUID", v5);

  objc_msgSend(*(id *)(a1 + 32), "clientModelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":clientModelName", v6);

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":candidateId", *(_QWORD *)(a1 + 48));
  objc_msgSend(v9, "bindNamedParam:toNSData:", ":candidateModelData", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":featurizationManagerId", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "trainDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":trainDate", (uint64_t)v8);

  objc_msgSend(v9, "bindNamedParam:toInt64:", ":datasetMetadataId", *(_QWORD *)(a1 + 64));
  objc_msgSend(v9, "bindNamedParam:toInteger:", ":isVerified", objc_msgSend(*(id *)(a1 + 32), "isVerified"));

}

- (int64_t)featurizationManagerIdForFeaturizationManager:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  _ATXDataStore *dataStore;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;
  objc_autoreleasePoolPop(v7);
  if (v9)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2938];
      v35[0] = CFSTR("Failed to serialize featurizationManager");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ATXCandidateRelevanceModelDataStore"), 1, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = v29[3];
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    dataStore = self->_dataStore;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke;
    v19[3] = &unk_1E82DF1F8;
    v19[4] = self;
    v20 = v8;
    v21 = &v28;
    v22 = &v23;
    -[_ATXDataStore _doSync:](dataStore, "_doSync:", v19);
    if (!*((_BYTE *)v24 + 24))
    {
      __atxlog_handle_relevance_model();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelDataStore featurizationManagerIdForFeaturizationManager:error:].cold.1();
      }

      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0CB2938];
        v33 = CFSTR("Failed to find corresponding featurizationManagerId for featurization manager");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ATXCandidateRelevanceModelDataStore"), 1, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v12 = v29[3];

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v28, 8);
  return v12;
}

void __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_2;
  v4[3] = &unk_1E82DF1F8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_3;
  v9[3] = &unk_1E82DCBD8;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO relevanceFeaturizationManagers (featurizationManagerData) VALUES (:featurizationManagerData)"), v9, 0, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_4;
  v7[3] = &unk_1E82DCBD8;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_5;
  v5[3] = &unk_1E82DF1D0;
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM relevanceFeaturizationManagers WHERE featurizationManagerData=:featurizationManagerData"), v7, v5, 0);

}

uint64_t __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSData:", ":featurizationManagerData", *(_QWORD *)(a1 + 32));
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSData:", ":featurizationManagerData", *(_QWORD *)(a1 + 32));
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_featurizationManagerIdForFeaturizationManager_error___block_invoke_5(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (int64_t)datasetMetadataIdForDatasetMetadata:(id)a3 error:(id *)a4
{
  id v6;
  _ATXDataStore *dataStore;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ATXCandidateRelevanceModelDataStore *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  dataStore = self->_dataStore;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke;
  v18 = &unk_1E82DF1F8;
  v19 = self;
  v8 = v6;
  v20 = v8;
  v21 = &v27;
  v22 = &v23;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", &v15);
  if (!*((_BYTE *)v24 + 24))
  {
    __atxlog_handle_relevance_model();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelDataStore datasetMetadataIdForDatasetMetadata:error:].cold.1();
    }

    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("Failed to find corresponding datasetMetadataId for datasetMetadata");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1, v15, v16, v17, v18, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ATXCandidateRelevanceModelDataStore"), 1, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v13 = v28[3];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_2;
  v4[3] = &unk_1E82DF1F8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_3;
  v9[3] = &unk_1E82DCBD8;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO relevanceDatasetMetadata (numberOfPositiveSamples, numberOfSamples, numberOfDaysWithPositiveSamples, numberOfDaysWithSamples, startDate, endDate) VALUES (:numberOfPositiveSamples, :numberOfSamples, :numberOfDaysWithPositiveSamples, :numberOfDaysWithSamples, :startDate, :endDate)"), v9, 0, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_4;
  v7[3] = &unk_1E82DCBD8;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_5;
  v5[3] = &unk_1E82DF1D0;
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM relevanceDatasetMetadata WHERE numberOfPositiveSamples=:numberOfPositiveSamples AND numberOfSamples=:numberOfSamples AND numberOfDaysWithPositiveSamples=:numberOfDaysWithPositiveSamples AND numberOfDaysWithSamples=:numberOfDaysWithSamples AND startDate=:startDate AND endDate=:endDate"), v7, v5, 0);

}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfPositiveSamples", objc_msgSend(v3, "numberOfPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithPositiveSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithSamples"));
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":startDate", (uint64_t)v6);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":endDate", (uint64_t)v7);

}

void __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfPositiveSamples", objc_msgSend(v3, "numberOfPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithPositiveSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithPositiveSamples"));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":numberOfDaysWithSamples", objc_msgSend(*(id *)(a1 + 32), "numberOfDaysWithSamples"));
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":startDate", (uint64_t)v6);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":endDate", (uint64_t)v7);

}

uint64_t __81__ATXCandidateRelevanceModelDataStore_datasetMetadataIdForDatasetMetadata_error___block_invoke_5(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (void)cacheSelectedCandidates:(id)a3 featurizationManager:(id)a4 modelId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _ATXDataStore *dataStore;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  v13 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v13);
  dataStore = self->_dataStore;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke;
  v19[3] = &unk_1E82DBAB0;
  v19[4] = self;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  v16 = v14;
  v17 = v12;
  v18 = v10;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v19);

}

void __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_2;
  v4[3] = &unk_1E82DBAB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_3;
  v3[3] = &unk_1E82DF220;
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO relevanceCandidateCache (modelId, date, candidateList, featurizationManager) VALUES (:modelId, :date, :candidateList, :featurizationManager)"), v3, 0, 0);

}

void __92__ATXCandidateRelevanceModelDataStore_cacheSelectedCandidates_featurizationManager_modelId___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  id v6;

  v3 = a1[4];
  v6 = a2;
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":modelId", v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":date", (uint64_t)v5);

  objc_msgSend(v6, "bindNamedParam:toNSData:", ":candidateList", a1[5]);
  objc_msgSend(v6, "bindNamedParam:toNSData:", ":featurizationManager", a1[6]);

}

- (void)deleteCachedCandidatesForModelId:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v7);

}

void __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_2;
  v4[3] = &unk_1E82DACB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_3;
  v3[3] = &unk_1E82DCBD8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM relevanceCandidateCache WHERE modelId = :modelId"), v3, 0, 0);

}

uint64_t __72__ATXCandidateRelevanceModelDataStore_deleteCachedCandidatesForModelId___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":modelId", *(_QWORD *)(a1 + 32));
}

- (id)cachedCandidatesForModelId:(id)a3 earliestDate:(id)a4
{
  id v6;
  NSObject *v7;
  _ATXDataStore *dataStore;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  ATXCandidateRelevanceModelCandidateCacheResult *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  NSObject *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__30;
  v58 = __Block_byref_object_dispose__30;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__30;
  v52 = __Block_byref_object_dispose__30;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  dataStore = self->_dataStore;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke;
  v38[3] = &unk_1E82DF270;
  v38[4] = self;
  v9 = v6;
  v39 = v9;
  v40 = &v60;
  v41 = &v54;
  v42 = &v48;
  v43 = &v44;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v38);
  if (*((_BYTE *)v45 + 24))
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v11 = (void *)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", (double)v61[3]);
    objc_msgSend(v11, "laterDate:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12 == v7;

    if (v13)
    {
      __atxlog_handle_relevance_model();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v65 = v27;
        v66 = 2112;
        v67 = v7;
        v68 = 2112;
        v69 = v11;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "%@ - Cached candidates are older than earliest date (%@), returning nil instead: %@", buf, 0x20u);

      }
      v25 = 0;
      goto LABEL_16;
    }
    v14 = (void *)MEMORY[0x1CAA48B6C]();
    v15 = (void *)MEMORY[0x1E0CB3710];
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    v19 = v55[5];
    v37 = 0;
    objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v18, v19, &v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v37;

    objc_autoreleasePoolPop(v14);
    if (v21)
    {
      __atxlog_handle_relevance_model();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v24;
        v66 = 2112;
        v67 = v21;
        _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "%@ - Unable to decode cached candidates due to: %@", buf, 0x16u);

      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1CAA48B6C]();
      v29 = (void *)MEMORY[0x1E0CB3710];
      v30 = objc_opt_class();
      v31 = v49[5];
      v36 = 0;
      objc_msgSend(v29, "unarchivedObjectOfClass:fromData:error:", v30, v31, &v36);
      v22 = objc_claimAutoreleasedReturnValue();
      v21 = v36;
      objc_autoreleasePoolPop(v28);
      if (!v21)
      {
        v25 = -[ATXCandidateRelevanceModelCandidateCacheResult initWithCandidates:featurizationManager:]([ATXCandidateRelevanceModelCandidateCacheResult alloc], "initWithCandidates:featurizationManager:", v20, v22);
        goto LABEL_15;
      }
      __atxlog_handle_relevance_model();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v34;
        v66 = 2112;
        v67 = v21;
        _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "%@ - Unable to decode cached featurization manager due to: %@", buf, 0x16u);

      }
    }
    v25 = 0;
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  v25 = 0;
LABEL_17:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v25;
}

void __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_2;
  v5[3] = &unk_1E82DF270;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v4;
  objc_msgSend(v2, "readTransaction:", v5);

}

void __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_3;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_4;
  v5[3] = &unk_1E82DF248;
  v4 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT date, candidateList, featurizationManager FROM relevanceCandidateCache WHERE modelId=:modelId LIMIT 1"), v8, v5, 0);

}

uint64_t __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":modelId", *(_QWORD *)(a1 + 32));
}

uint64_t __79__ATXCandidateRelevanceModelDataStore_cachedCandidatesForModelId_earliestDate___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v3, "getInt64ForColumn:", 0);
  objc_msgSend(v3, "getNSDataForColumn:", 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "getNSDataForColumn:", 2);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (int64_t)candidateIdForCandidate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  _ATXDataStore *dataStore;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  ATXCandidateRelevanceModelDataStore *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  if (v8)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2938];
      v39[0] = CFSTR("Failed to serialize candidate when writing to database");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("ATXCandidateRelevanceModelDataStore"), 1, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = v33[3];
  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    dataStore = self->_dataStore;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke;
    v21 = &unk_1E82DF298;
    v22 = self;
    v23 = v6;
    v24 = v7;
    v25 = &v32;
    v26 = &v27;
    -[_ATXDataStore _doSync:](dataStore, "_doSync:", &v18);
    if (!*((_BYTE *)v28 + 24))
    {
      __atxlog_handle_relevance_model();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelDataStore candidateIdForCandidate:error:].cold.1();
      }

      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2938];
        v37 = CFSTR("Failed to find corresponding candidateId for candidate");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v18, v19, v20, v21, v22, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ATXCandidateRelevanceModelDataStore"), 1, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v11 = v33[3];

    _Block_object_dispose(&v27, 8);
  }

  _Block_object_dispose(&v32, 8);
  return v11;
}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  __int128 v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_2;
  v4[3] = &unk_1E82DF298;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_3;
  v9[3] = &unk_1E82DCB88;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO relevanceCandidates (candidateType, candidateIdentifier, candidateData) VALUES (:candidateType, :candidateIdentifier, :candidateData)"), v9, 0, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_4;
  v7[3] = &unk_1E82DCBD8;
  v8 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_5;
  v5[3] = &unk_1E82DF1D0;
  v6 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM relevanceCandidates WHERE candidateType=:candidateType AND candidateIdentifier=:candidateIdentifier"), v7, v5, 0);

}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":candidateType", v4);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":candidateIdentifier", v5);

  objc_msgSend(v6, "bindNamedParam:toNSData:", ":candidateData", *(_QWORD *)(a1 + 40));
}

void __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":candidateType", v5);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":candidateIdentifier", v6);

}

uint64_t __69__ATXCandidateRelevanceModelDataStore_candidateIdForCandidate_error___block_invoke_5(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

- (void)receiveMostRecentVerifiedTrainedModelTrainingResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _ATXDataStore *dataStore;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__30;
  v25 = __Block_byref_object_dispose__30;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__30;
  v19 = __Block_byref_object_dispose__30;
  v20 = 0;
  dataStore = self->_dataStore;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke;
  v14[3] = &unk_1E82DF2C0;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v14);
  if (v22[5] && v16[5])
  {
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_4;
    v12[3] = &unk_1E82DF2E8;
    v13 = v6;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_5;
    v10[3] = &unk_1E82DF310;
    v11 = v7;
    -[ATXCandidateRelevanceModelDataStore receiveTrainingResult:completion:modelUUID:clientModelName:](self, "receiveTrainingResult:completion:modelUUID:clientModelName:", v12, v10, v16[5], v22[5]);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_2;
  v3[3] = &unk_1E82DF2C0;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "readTransaction:", v3);

}

void __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_3;
  v3[3] = &unk_1E82DF1D0;
  v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT clientModelName, modelUUID FROM relevanceCandidateModels WHERE isVerified=1 ORDER BY trainDate DESC LIMIT 1"), 0, v3, 0);

}

uint64_t __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "initWithUUIDString:", v8);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return *MEMORY[0x1E0D81788];
}

uint64_t __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)receiveMostRecentVerifiedTrainedModelTrainingResults:(id)a3 clientModelName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  _ATXDataStore *dataStore;
  id v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__30;
    v26 = __Block_byref_object_dispose__30;
    v27 = 0;
    v12 = MEMORY[0x1E0C809B0];
    dataStore = self->_dataStore;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke;
    v19[3] = &unk_1E82DCC50;
    v19[4] = self;
    v14 = v9;
    v20 = v14;
    v21 = &v22;
    -[_ATXDataStore _doSync:](dataStore, "_doSync:", v19);
    if (v23[5])
    {
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_5;
      v17[3] = &unk_1E82DF2E8;
      v18 = v8;
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_6;
      v15[3] = &unk_1E82DF310;
      v16 = v11;
      -[ATXCandidateRelevanceModelDataStore receiveTrainingResult:completion:modelUUID:clientModelName:](self, "receiveTrainingResult:completion:modelUUID:clientModelName:", v17, v15, v23[5], v14);

    }
    else
    {
      v11[2](v11, 1);
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

void __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_2;
  v6[3] = &unk_1E82DCC50;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "readTransaction:", v6);

}

void __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_3;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_4;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT modelUUID FROM relevanceCandidateModels WHERE clientModelName=:clientModelName AND isVerified=1 ORDER BY trainDate DESC LIMIT 1"), v5, v4, 0);

}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":clientModelName", *(_QWORD *)(a1 + 32));
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "getNSStringForColumn:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "initWithUUIDString:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *MEMORY[0x1E0D81788];
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __119__ATXCandidateRelevanceModelDataStore_receiveMostRecentVerifiedTrainedModelTrainingResults_clientModelName_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)receiveTrainingResult:(id)a3 completion:(id)a4 modelUUID:(id)a5 clientModelName:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  id v13;
  void *v14;
  _ATXDataStore *dataStore;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v10 = a3;
  v11 = (void (**)(id, _QWORD))a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  dataStore = self->_dataStore;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke;
  v20[3] = &unk_1E82DF360;
  v20[4] = self;
  v16 = v12;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  v25 = &v26;
  v18 = v14;
  v23 = v18;
  v19 = v10;
  v24 = v19;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v20);
  v11[2](v11, *((unsigned __int8 *)v27 + 24));

  _Block_object_dispose(&v26, 8);
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_2;
  v6[3] = &unk_1E82DF360;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v8 = v4;
  v11 = v5;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "readTransaction:", v6);

}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_3;
  v12[3] = &unk_1E82DCB88;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4;
  v6[3] = &unk_1E82DF338;
  v7 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v8 = v4;
  v11 = v5;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT candidateModelData, candidateData, featurizationManagerData, featurizationManagerId, trainDate, numberOfPositiveSamples, numberOfSamples, numberOfDaysWithPositiveSamples, numberOfDaysWithSamples, startDate, endDate, isVerified FROM relevanceCandidateModels INNER JOIN relevanceCandidates ON relevanceCandidates.id = relevanceCandidateModels.candidateId INNER JOIN relevanceFeaturizationManagers ON relevanceFeaturizationManagers.id = relevanceCandidateModels.featurizationManagerId INNER JOIN relevanceDatasetMetadata ON relevanceDatasetMetadata.id = relevanceCandidateModels.datasetMetadataId WHERE modelUUID=:modelUUID AND clientModelName=:clientModelName"), v12, v6, 0);

}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":modelUUID", v4);

  objc_msgSend(v5, "bindNamedParam:toNSString:", ":clientModelName", *(_QWORD *)(a1 + 40));
}

uint64_t __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v23;
  ATXCandidateRelevanceModelDataStoreTrainingResult *v24;
  void *v25;
  NSObject *v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v39;
  objc_autoreleasePoolPop(v5);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(v3, "getNSDataForColumn:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1CAA48B6C]();
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v38;
    objc_autoreleasePoolPop(v12);
    if (!v13 || v7)
    {
      __atxlog_handle_relevance_model();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_2();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v10 = *MEMORY[0x1E0D81788];
      goto LABEL_19;
    }
    objc_msgSend(v3, "getNSDataForColumn:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "getInt64ForColumn:", 3);
    objc_msgSend(*(id *)(a1 + 48), "featurizationManagerForFeaturizationManagerId:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = (void *)MEMORY[0x1CAA48B6C]();
      v37 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v34, &v37);
      v35 = objc_claimAutoreleasedReturnValue();
      v7 = v37;
      objc_autoreleasePoolPop(v16);
      if (!v34 || v7)
      {
        __atxlog_handle_relevance_model();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_3();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        v10 = *MEMORY[0x1E0D81788];
        v25 = (void *)v35;
        goto LABEL_15;
      }
      v15 = v35;
      objc_msgSend(*(id *)(a1 + 48), "setFeaturizationManager:forFeaturizationManagerId:", v35, v14);
    }
    v36 = (void *)v15;
    v32 = v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 4));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v3, "getIntegerForColumn:", 5);
    v30 = objc_msgSend(v3, "getIntegerForColumn:", 6);
    v18 = objc_msgSend(v3, "getIntegerForColumn:", 7);
    v19 = objc_msgSend(v3, "getIntegerForColumn:", 8);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 9));
    v33 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 10));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "getIntegerForColumn:", 11) != 0;
    v23 = -[ATXCandidateRelevanceModelDataStoreDatasetMetadata initWithNumberOfPositiveSamples:numberOfSamples:numberOfDaysWithPositiveSamples:numberOfDaysWithSamples:startDate:endDate:]([ATXCandidateRelevanceModelDataStoreDatasetMetadata alloc], "initWithNumberOfPositiveSamples:numberOfSamples:numberOfDaysWithPositiveSamples:numberOfDaysWithSamples:startDate:endDate:", v31, v30, v18, v19, v20, v21);
    LOBYTE(v29) = v22;
    v13 = v32;
    v24 = -[ATXCandidateRelevanceModelDataStoreTrainingResult initWithModel:candidate:featurizationManager:modelUUID:datasetMetadata:clientModelName:trainDate:isVerified:]([ATXCandidateRelevanceModelDataStoreTrainingResult alloc], "initWithModel:candidate:featurizationManager:modelUUID:datasetMetadata:clientModelName:trainDate:isVerified:", v6, v32, v36, *(_QWORD *)(a1 + 32), v23, *(_QWORD *)(a1 + 40), v17, v29);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v10 = *MEMORY[0x1E0D81780];

    v25 = v36;
    v11 = v33;

    v7 = 0;
LABEL_15:

LABEL_19:
    goto LABEL_20;
  }
  __atxlog_handle_relevance_model();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  v10 = *MEMORY[0x1E0D81788];
LABEL_20:

  return v10;
}

- (unint64_t)numberOfTrainedModels
{
  _ATXDataStore *dataStore;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_2;
  v3[3] = &unk_1E82DACD8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "readTransaction:", v3);

}

void __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_3;
  v3[3] = &unk_1E82DCC00;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM (SELECT DISTINCT modelUUID from relevanceCandidateModels)"), 0, v3, 0);

}

uint64_t __60__ATXCandidateRelevanceModelDataStore_numberOfTrainedModels__block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

- (id)clientModelNamesWithTrainedRelevanceModels
{
  _ATXDataStore *dataStore;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__30;
  v11 = __Block_byref_object_dispose__30;
  v12 = (id)objc_opt_new();
  dataStore = self->_dataStore;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke;
  v6[3] = &unk_1E82DACD8;
  v6[4] = self;
  v6[5] = &v7;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_2;
  v3[3] = &unk_1E82DACD8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "readTransaction:", v3);

}

void __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_3;
  v3[3] = &unk_1E82DCC00;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT clientModelName FROM relevanceCandidateModels"), 0, v3, 0);

}

uint64_t __81__ATXCandidateRelevanceModelDataStore_clientModelNamesWithTrainedRelevanceModels__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (id)modelUUIDToTrainDateForClientModelName:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30;
  v16 = __Block_byref_object_dispose__30;
  v17 = (id)objc_opt_new();
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_2;
  v6[3] = &unk_1E82DCC50;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "readTransaction:", v6);

}

void __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_3;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_4;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT modelUUID, trainDate FROM relevanceCandidateModels WHERE clientModelName=:clientModelName"), v5, v4, 0);

}

uint64_t __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":clientModelName", *(_QWORD *)(a1 + 32));
}

uint64_t __78__ATXCandidateRelevanceModelDataStore_modelUUIDToTrainDateForClientModelName___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "getNSStringForColumn:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = objc_msgSend(v4, "getInt64ForColumn:", 1);

  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:", (double)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v10, v7);
  v11 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v11;
}

- (id)mostRecentVerifiedTrainDateForClientModelName:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30;
  v16 = __Block_byref_object_dispose__30;
  v17 = 0;
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_2;
  v6[3] = &unk_1E82DCC50;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "readTransaction:", v6);

}

void __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_3;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_4;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT trainDate FROM relevanceCandidateModels WHERE clientModelName=:clientModelName AND isVerified=1 ORDER BY trainDate DESC LIMIT 1"), v5, v4, 0);

}

uint64_t __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":clientModelName", *(_QWORD *)(a1 + 32));
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainDateForClientModelName___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a2, "getInt64ForColumn:", 0));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81788];
}

- (unint64_t)numberOfFeaturizationManagerIds
{
  _ATXDataStore *dataStore;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_2;
  v3[3] = &unk_1E82DACD8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "readTransaction:", v3);

}

void __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_3;
  v3[3] = &unk_1E82DCC00;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM relevanceFeaturizationManagers"), 0, v3, 0);

}

uint64_t __70__ATXCandidateRelevanceModelDataStore_numberOfFeaturizationManagerIds__block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

- (unint64_t)numberOfDatasetMetadataIds
{
  _ATXDataStore *dataStore;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_2;
  v3[3] = &unk_1E82DACD8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "readTransaction:", v3);

}

void __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_3;
  v3[3] = &unk_1E82DCC00;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM relevanceDatasetMetadata"), 0, v3, 0);

}

uint64_t __65__ATXCandidateRelevanceModelDataStore_numberOfDatasetMetadataIds__block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

- (unint64_t)numberOfCandidateIds
{
  _ATXDataStore *dataStore;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataStore = self->_dataStore;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_2;
  v3[3] = &unk_1E82DACD8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "readTransaction:", v3);

}

void __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_3;
  v3[3] = &unk_1E82DCC00;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM relevanceCandidates"), 0, v3, 0);

}

uint64_t __59__ATXCandidateRelevanceModelDataStore_numberOfCandidateIds__block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

- (id)trainingResultsForClientModelName:(id)a3 modelUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ATXCandidateRelevanceModelDataStore_trainingResultsForClientModelName_modelUUID___block_invoke;
  v12[3] = &unk_1E82DF388;
  v13 = v8;
  v9 = v8;
  -[ATXCandidateRelevanceModelDataStore receiveTrainingResult:completion:modelUUID:clientModelName:](self, "receiveTrainingResult:completion:modelUUID:clientModelName:", v12, &__block_literal_global_65, v6, v7);

  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_258);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __83__ATXCandidateRelevanceModelDataStore_trainingResultsForClientModelName_modelUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __83__ATXCandidateRelevanceModelDataStore_trainingResultsForClientModelName_modelUUID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "datasetMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datasetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)mostRecentVerifiedTrainingResultsForClientModelName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainingResultsForClientModelName___block_invoke;
  v9[3] = &unk_1E82DF388;
  v10 = v5;
  v6 = v5;
  -[ATXCandidateRelevanceModelDataStore receiveMostRecentVerifiedTrainedModelTrainingResults:clientModelName:completion:](self, "receiveMostRecentVerifiedTrainedModelTrainingResults:clientModelName:completion:", v9, v4, &__block_literal_global_259);

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_260);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainingResultsForClientModelName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __91__ATXCandidateRelevanceModelDataStore_mostRecentVerifiedTrainingResultsForClientModelName___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "datasetMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datasetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)idsInTableWithName:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30;
  v16 = __Block_byref_object_dispose__30;
  v17 = (id)objc_opt_new();
  dataStore = self->_dataStore;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_2;
  v6[3] = &unk_1E82DCC50;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "readTransaction:", v6);

}

void __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT id FROM %@"), a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_3;
  v4[3] = &unk_1E82DCC00;
  v4[4] = a1[6];
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v2, 0, v4, 0);

}

uint64_t __58__ATXCandidateRelevanceModelDataStore_idsInTableWithName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "getInt64ForColumn:", 0);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return *MEMORY[0x1E0D81780];
}

- (void)deleteRowsWithIds:(id)a3 fromTableWithName:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke;
  v8[3] = &unk_1E82DF470;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_2;
  v8[3] = &unk_1E82DB9D8;
  v8[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "_doSync:", v8);

}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_3;
  v4[3] = &unk_1E82DB9D8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE id = :id"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_4;
  v4[3] = &unk_1E82DCBD8;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, v4, 0, 0);

}

void __75__ATXCandidateRelevanceModelDataStore_deleteRowsWithIds_fromTableWithName___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":id", objc_msgSend(v2, "longLongValue"));

}

- (void)deleteTrainedModelsWithTrainDateOlderThanDate:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _ATXDataStore *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  dataStore = self->_dataStore;
  v6 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke;
  v32[3] = &unk_1E82DCCA0;
  v32[6] = v7;
  v32[4] = self;
  v32[5] = &v33;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v32);
  __atxlog_handle_relevance_model();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34[3];
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v38 = (uint64_t (*)(uint64_t, uint64_t))v4;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - Deleted %lu models that were older than %@.", buf, 0x20u);

  }
  -[ATXCandidateRelevanceModelDataStore idsInTableWithName:](self, "idsInTableWithName:", CFSTR("relevanceCandidates"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelDataStore idsInTableWithName:](self, "idsInTableWithName:", CFSTR("relevanceFeaturizationManagers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelDataStore idsInTableWithName:](self, "idsInTableWithName:", CFSTR("relevanceDatasetMetadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__30;
  v39 = __Block_byref_object_dispose__30;
  v40 = (id)objc_opt_new();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__30;
  v30 = __Block_byref_object_dispose__30;
  v31 = (id)objc_opt_new();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__30;
  v24 = __Block_byref_object_dispose__30;
  v25 = (id)objc_opt_new();
  v15 = self->_dataStore;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_277;
  v19[3] = &unk_1E82DF4C0;
  v19[4] = self;
  v19[5] = buf;
  v19[6] = &v26;
  v19[7] = &v20;
  -[_ATXDataStore _doSync:](v15, "_doSync:", v19);
  v16 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v16, "minusSet:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v17 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v17, "minusSet:", v27[5]);
  v18 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v18, "minusSet:", v21[5]);
  -[ATXCandidateRelevanceModelDataStore deleteRowsWithIds:fromTableWithName:](self, "deleteRowsWithIds:fromTableWithName:", v16, CFSTR("relevanceCandidates"));
  -[ATXCandidateRelevanceModelDataStore deleteRowsWithIds:fromTableWithName:](self, "deleteRowsWithIds:fromTableWithName:", v17, CFSTR("relevanceFeaturizationManagers"));
  -[ATXCandidateRelevanceModelDataStore deleteRowsWithIds:fromTableWithName:](self, "deleteRowsWithIds:fromTableWithName:", v18, CFSTR("relevanceDatasetMetadata"));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v33, 8);

}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2;
  v3[3] = &unk_1E82DCCA0;
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "writeTransaction:", v3);

}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2(_QWORD *a1)
{
  id v2;
  _QWORD v3[5];
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3;
  v4[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4[4] = a1[6];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_4;
  v3[3] = &unk_1E82DCC00;
  v3[4] = a1[5];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM relevanceCandidateModels WHERE trainDate < :trainDate"), v4, v3, 0);

}

uint64_t __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":trainDate", (uint64_t)*(double *)(a1 + 32));
}

uint64_t __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_4(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return *MEMORY[0x1E0D81780];
}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_277(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2_278;
  v4[3] = &unk_1E82DF4C0;
  v3 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v2, "readTransaction:", v4);

}

void __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_2_278(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3_281;
  v3[3] = &unk_1E82DF498;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT candidateId, featurizationManagerId, datasetMetadataId FROM relevanceCandidateModels"), 0, v3, 0);

}

uint64_t __85__ATXCandidateRelevanceModelDataStore_deleteTrainedModelsWithTrainDateOlderThanDate___block_invoke_3_281(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumn:", 0);
  v5 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = objc_msgSend(v3, "getInt64ForColumn:", 1);
  v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  v10 = objc_msgSend(v3, "getInt64ForColumn:", 2);
  v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  return *MEMORY[0x1E0D81780];
}

- (void)writeVerificationStatusForModelUUID:(id)a3 clientModelName:(id)a4 expectedNumberOfModels:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__ATXCandidateRelevanceModelDataStore_writeVerificationStatusForModelUUID_clientModelName_expectedNumberOfModels___block_invoke;
  v14[3] = &unk_1E82DF4E8;
  v14[4] = &v15;
  -[ATXCandidateRelevanceModelDataStore receiveTrainingResult:completion:modelUUID:clientModelName:](self, "receiveTrainingResult:completion:modelUUID:clientModelName:", v14, &__block_literal_global_282, v8, v9);
  if (v16[3] == a5)
  {
    -[ATXCandidateRelevanceModelDataStore writeSuccessfulVerificationForModelUUID:](self, "writeSuccessfulVerificationForModelUUID:", v8);
  }
  else
  {
    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16[3];
      *(_DWORD *)buf = 138413314;
      v20 = v12;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2048;
      v26 = a5;
      v27 = 2048;
      v28 = v13;
      _os_log_error_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_ERROR, "%@ - Unable to verify modelUUID %@ for %@ because we expected %lu models, but only see %lu in the database.", buf, 0x34u);

    }
  }
  _Block_object_dispose(&v15, 8);

}

uint64_t __114__ATXCandidateRelevanceModelDataStore_writeVerificationStatusForModelUUID_clientModelName_expectedNumberOfModels___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)writeSuccessfulVerificationForModelUUID:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dataStore = self->_dataStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v7);

}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_2;
  v4[3] = &unk_1E82DACB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_3;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4;
  v4[3] = &unk_1E82DCC28;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE relevanceCandidateModels SET isVerified = 1 WHERE modelUUID = :modelUUID "), v5, 0, v4);

}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":modelUUID", v4);

}

uint64_t __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_relevance_model();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4_cold_1(a1, v2);

  return *MEMORY[0x1E0D81788];
}

- (BOOL)isModelUUIDVerified:(id)a3
{
  id v4;
  _ATXDataStore *dataStore;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dataStore = self->_dataStore;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_ATXDataStore _doSync:](dataStore, "_doSync:", v8);
  LOBYTE(dataStore) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dataStore;
}

void __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_2;
  v6[3] = &unk_1E82DCC50;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "readTransaction:", v6);

}

void __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_3;
  v5[3] = &unk_1E82DCBD8;
  v6 = *(id *)(a1 + 40);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_4;
  v4[3] = &unk_1E82DCC00;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT isVerified FROM relevanceCandidateModels WHERE modelUUID = :modelUUID LIMIT 1"), v5, v4, 0);

}

void __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":modelUUID", v4);

}

uint64_t __59__ATXCandidateRelevanceModelDataStore_isModelUUIDVerified___block_invoke_4(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0) != 0;
  return *MEMORY[0x1E0D81788];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

- (void)writeTrainingResult:.cold.1()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "%@ - Skipping the training results write because there was an error when serializing modelData: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)writeTrainingResult:.cold.2()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "%@ - Skipping the training results write because there was an error when creating or retrieving datasetMetadataId: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)writeTrainingResult:.cold.3()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "%@ - Skipping the training results write because there was an error when creating or retrieving candidateId: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)writeTrainingResult:.cold.4()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v3, v4, "%@ - Skipping the training results write because there was an error when creating or retrieving featurizationManagerId: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)featurizationManagerIdForFeaturizationManager:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_5_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_6_3(&dword_1C9A3B000, "%@ - Could not find featurizationManagerId for featurizationManager that was just written to the datastore for featurizationManager: %@", v4, v5);

  OUTLINED_FUNCTION_11_0();
}

- (void)datasetMetadataIdForDatasetMetadata:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_5_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_6_3(&dword_1C9A3B000, "%@ - Could not find datasetMetadataId for datasetMetadata that was just written to the datastore for datasetMetadata: %@", v4, v5);

  OUTLINED_FUNCTION_11_0();
}

- (void)candidateIdForCandidate:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_5_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_6_3(&dword_1C9A3B000, "%@ - Could not find candidateId for candidate that was just written to the datastore for candidate: %@", v4, v5);

  OUTLINED_FUNCTION_11_0();
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_14(&dword_1C9A3B000, v0, v1, "Failed to unarchive candidateModel trained classifier with error: %{public}@. modelId: %@, clientModelName: %@");
  OUTLINED_FUNCTION_4_4();
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_14(&dword_1C9A3B000, v0, v1, "Failed to unarchive candidateData with error: %{public}@. modelId: %@, clientModelName: %@");
  OUTLINED_FUNCTION_4_4();
}

void __98__ATXCandidateRelevanceModelDataStore_receiveTrainingResult_completion_modelUUID_clientModelName___block_invoke_4_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_14(&dword_1C9A3B000, v0, v1, "Failed to unarchive featurizationManagerData with error: %{public}@. modelId: %@, clientModelName: %@");
  OUTLINED_FUNCTION_4_4();
}

void __79__ATXCandidateRelevanceModelDataStore_writeSuccessfulVerificationForModelUUID___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@ - Error while verifying and activating models", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_4_4();
}

@end
