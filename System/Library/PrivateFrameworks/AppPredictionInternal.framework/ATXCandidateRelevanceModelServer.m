@implementation ATXCandidateRelevanceModelServer

- (ATXCandidateRelevanceModelServer)initWithConfig:(id)a3
{
  id v5;
  ATXCandidateRelevanceModelServer *v6;
  ATXCandidateRelevanceModelServer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelServer;
  v6 = -[ATXCandidateRelevanceModelServer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_config, a3);

  return v7;
}

- (void)sendSuggestionsToBlending
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[ATXCandidateRelevanceModelConfig isEnabled](self->_config, "isEnabled")
    && (+[ATXCandidateRelevanceModelGlobals sharedInstance](ATXCandidateRelevanceModelGlobals, "sharedInstance"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "isPipelineEnabled"), v3, (v4 & 1) != 0))
  {
    -[ATXCandidateRelevanceModelConfig datastore](self->_config, "datastore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientModelId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mostRecentVerifiedTrainDateForClientModelName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 && (objc_msgSend(v9, "timeIntervalSinceDate:", v8), v11 <= 604800.0))
    {
      objc_msgSend((id)objc_opt_class(), "currentContextForConfig:contextOverride:", self->_config, MEMORY[0x1E0C9AA70]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelServer sendSuggestionsToBlendingForContext:](self, "sendSuggestionsToBlendingForContext:", v23);

    }
    else
    {
      __atxlog_handle_relevance_model();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "clientModelId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%@ - There doesn't exist a trained model in the last week to use for config with client model %@. Sending empty suggestions to blending.", (uint8_t *)&v24, 0x16u);

      }
      -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateSuggestions:", MEMORY[0x1E0C9AA60]);

    }
  }
  else
  {
    __atxlog_handle_relevance_model();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "clientModelId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v20;
      v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "%@ - Config for client model %@ is not enabled or the pipeline is not enabled. Sending empty suggestions to blending.", (uint8_t *)&v24, 0x16u);

    }
    -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateSuggestions:", MEMORY[0x1E0C9AA60]);
  }

}

+ (id)currentContextForConfig:(id)a3 contextOverride:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidatePublisherFromStartTime:", -259200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predictionContextForCurrentContextAndCandidatePublisher:contextOverride:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)sendSuggestionsToBlendingForContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[ATXCandidateRelevanceModelServer sortedProactiveSuggestionsForContext:](self, "sortedProactiveSuggestionsForContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke;
  v7[3] = &unk_1E82DAD48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSuggestions:completionHandler:", v6, v7);

}

void __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_relevance_model();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientModelId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Successfully sent %lu predictions to blending layer for client model: %@", (uint8_t *)&v13, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke_cold_1();
  }

}

- (id)sortedProactiveSuggestionsForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __int128 v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, int);
  void *v38;
  ATXCandidateRelevanceModelServer *v39;
  id v40;
  _BYTE *v41;
  uint64_t *v42;
  _QWORD v43[5];
  id v44;
  _BYTE *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t v53[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXCandidateRelevanceModelConfig clientModel](self->_config, "clientModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientModelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_relevance_model();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model serving for config with client model: %@.", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  v60 = (id)objc_opt_new();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = (id)objc_opt_new();
  -[ATXCandidateRelevanceModelConfig datastore](self->_config, "datastore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke;
  v43[3] = &unk_1E82DAD70;
  v43[4] = self;
  v45 = buf;
  v12 = v4;
  v44 = v12;
  v46 = &v47;
  v35 = v11;
  v36 = 3221225472;
  v37 = __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_18;
  v38 = &unk_1E82DAD98;
  v39 = self;
  v13 = v6;
  v40 = v13;
  v41 = buf;
  v42 = &v47;
  objc_msgSend(v10, "receiveMostRecentVerifiedTrainedModelTrainingResults:clientModelName:completion:", v43, v13, &v35);

  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = 0;
  *(_QWORD *)&v17 = 138412546;
  v34 = v17;
  while (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count", v34, v35, v36, v37, v38, v39) > v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectAtIndexedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v48[5], "objectAtIndexedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    LODWORD(v22) = v21;
    -[ATXCandidateRelevanceModelConfig proactiveSuggestionForCandidate:prediction:](self->_config, "proactiveSuggestionForCandidate:prediction:", v18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "executableSpecification");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "executableIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v26);

      objc_msgSend(v14, "addObject:", v24);
    }
    else
    {
      __atxlog_handle_relevance_model();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v53 = v34;
        v54 = v29;
        v55 = 2112;
        v56 = v18;
        _os_log_error_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_ERROR, "%@ - Could not create suggestion for candidate: %@.", v53, 0x16u);

      }
    }

    ++v16;
  }
  -[ATXCandidateRelevanceModelConfig heuristicSuggestionsForContext:currentSuggestionExecutableIds:](self->_config, "heuristicSuggestionsForContext:currentSuggestionExecutableIds:", v12, v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mergeHeuristicSuggestions:withSuggestions:", v30, v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sortedArrayUsingComparator:", &__block_literal_global_5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(buf, 8);

  return v32;
}

void __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1[4] + 8), "candidateIsStillValidToSuggest:", v4))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v4);
    objc_msgSend(v3, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    objc_msgSend(v3, "featurizationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predictForContext:candidate:featurizationManager:", v6, v4, v7);
    v9 = v8;

    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "modelUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v15 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v30 = 138413058;
      v31 = v12;
      v32 = 2112;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      v36 = 2048;
      v37 = v9;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - Model %@ scored candidate with identifier %@ and score %f.", (uint8_t *)&v30, 0x2Au);

    }
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      objc_msgSend(v3, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a1[5];
      objc_msgSend(v3, "featurizationManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "featureContributionsDuringInferenceDescriptionForContext:candidate:featurizationManager:", v18, v4, v19);
      v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      __atxlog_handle_relevance_model();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138413058;
        v31 = v23;
        v32 = 2112;
        v33 = v24;
        v34 = 2048;
        v35 = v9;
        v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "%@ - Features contributing to scored candidate with identifier %@ and score %f:\n%@\n", (uint8_t *)&v30, 0x2Au);

      }
    }
    v25 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    *(float *)&v16 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);
  }
  else
  {
    __atxlog_handle_relevance_model();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412546;
      v31 = v28;
      v32 = 2112;
      v33 = v29;
      _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "%@ - Skipping candidate because it should not be predicted: %@", (uint8_t *)&v30, 0x16u);

    }
  }

}

void __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_18(_QWORD *a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[5];
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Successfully generated predictions for client model: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_18_cold_1((uint64_t)a1, v5);

    v9 = objc_opt_new();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = objc_opt_new();
    v13 = *(_QWORD *)(a1[7] + 8);
    v5 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

}

uint64_t __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "scoreSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawScore");
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "scoreSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rawScore");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

+ (id)mergeHeuristicSuggestions:(id)a3 withSuggestions:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (id)objc_msgSend(v5, "mutableCopy");
    v20 = v5;
    objc_msgSend((id)objc_opt_class(), "suggestionExecutableIdsFromSuggestions:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "executableSpecification", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "executableIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v8, "containsObject:", v16);

          if ((v17 & 1) == 0)
            objc_msgSend(v7, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v6 = v19;
    v5 = v20;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

+ (id)suggestionExecutableIdsFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "executableSpecification", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "executableIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

void __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_4_0();
  v3 = v2;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 8), "clientModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = v1;
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "%@ - Failed to send predictions to blending layer for client model: %@. Error: %@", (uint8_t *)&v8, 0x20u);

}

void __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@ - Could not complete generating predictions for client model: %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
