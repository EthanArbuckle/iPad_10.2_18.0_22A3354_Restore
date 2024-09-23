@implementation ATXActionPredictions

+ (BOOL)isActionPredictionContainerEligibleForLimit:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CF9098];
  objc_msgSend(a3, "scoredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isActionEligibleForSettingsSuggestions:", v5);

  return v3 ^ 1;
}

+ (id)actionResultsForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 firstStageScoreLogger:(id)a6 secondStageScoreLogger:(id)a7 thirdStageScoreLogger:(id)a8 multiStageScoreLogger:(id)a9 predictionsPerAppActionLimit:(id)a10
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  void **v23;

  v12 = a5;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  memset(v22, 0, sizeof(v22));
  objc_msgSend(a1, "_actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:featureCache:remainingPredictionItems:", a3, a4, a6, a7, v17, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionPredictions _predictionsForConsumerSubType:thirdStageScoreLogger:multiStageScoreLogger:actionPredictionCandidates:remainingPredictionItems:predictionsPerAppActionLimit:](ATXActionPredictions, "_predictionsForConsumerSubType:thirdStageScoreLogger:multiStageScoreLogger:actionPredictionCandidates:remainingPredictionItems:predictionsPerAppActionLimit:", v12, v16, v17, v19, v22, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void **)v22;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v23);

  return v20;
}

+ (id)predictionsWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 firstStageScoreLogger:(id)a6 secondStageScoreLogger:(id)a7 thirdStageScoreLogger:(id)a8 multiStageScoreLogger:(id)a9
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v9 = a5;
  objc_msgSend(a1, "actionResultsForCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:firstStageScoreLogger:secondStageScoreLogger:thirdStageScoreLogger:multiStageScoreLogger:predictionsPerAppActionLimit:", a3, a4, a5, a6, a7, a8, a9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDisplayCacheIntermediateFormat fromActions:](ATXDisplayCacheIntermediateFormat, "fromActions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v9 == 22)
    {
      objc_msgSend(v12, "lockscreenPredictionIndices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectsAtIndexes:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
    objc_msgSend(v12, "predictionChunks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ATXCacheFileJoinChunks();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C48]), "initWithScoredActions:cacheFileData:consumerSubType:error:", v13, v17, v9, 0);
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ActionPredictions"), 1001, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C48]), "initWithScoredActions:cacheFileData:consumerSubType:error:", 0, 0, v9, v20);
    v19 = (void *)v20;
  }
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_actionPredictionCandidatesForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 firstStageScoreLogger:(id)a5 secondStageScoreLogger:(id)a6 multiStageScoreLogger:(id)a7 featureCache:(id)a8 remainingPredictionItems:(void *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appLaunchMonitor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predictionContextForCurrentContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXActionPredictions.mm"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictionContext"));

    }
    objc_msgSend(a1, "_actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:context:featureCache:remainingPredictionItems:", v15, v16, v17, v18, v19, v24, v20, a9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = (void *)objc_opt_new();
  }

  return v25;
}

+ (id)_predictionsForConsumerSubType:(unsigned __int8)a3 thirdStageScoreLogger:(id)a4 multiStageScoreLogger:(id)a5 actionPredictionCandidates:(id)a6 remainingPredictionItems:(void *)a7 predictionsPerAppActionLimit:(id)a8
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v12 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predictionContextForCurrentContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXActionPredictions.mm"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictionContext"));

  }
  objc_msgSend(a1, "_predictionsForConsumerSubType:thirdStageScoreLogger:multiStageScoreLogger:context:actionPredictionCandidates:remainingPredictionItems:predictionsPerAppActionLimit:", v12, v15, v16, v20, v17, a7, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_actionPredictionCandidatesForCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 firstStageScoreLogger:(id)a5 secondStageScoreLogger:(id)a6 multiStageScoreLogger:(id)a7 context:(id)a8 featureCache:(id)a9 remainingPredictionItems:(void *)a10
{
  void *v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  uint64_t **v30;
  uint64_t v31;
  float v32;
  float v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  float v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  dispatch_semaphore_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  objc_class *v66;
  void *v67;
  uint64_t v68;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  void *context;
  void *v88;
  void *v89;
  void *v90;
  unint64_t v91;
  _QWORD v92[4];
  NSObject *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[5];
  _QWORD v99[4];
  NSObject *v100;
  _BYTE v101[128];
  _BYTE buf[12];
  __int16 v103;
  uint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  v74 = a4;
  v78 = a5;
  v83 = a6;
  v84 = a7;
  v86 = a8;
  v75 = a9;
  v80 = (void *)objc_opt_new();
  v72 = (void *)MEMORY[0x1CAA48B6C]();
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:featureCache:", (int)objc_msgSend(v82, "actionPredictionFirstStageBeamWidth"), 24, 0, v73, v74, v78, a10, 0, v86, v75);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = dispatch_semaphore_create(0);
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke;
      v99[3] = &unk_1E82E00B0;
      v17 = v16;
      v100 = v17;
      objc_msgSend(v78, "flushWithCompletion:", v99);
      objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v17, &__block_literal_global_129, &__block_literal_global_34_0, 5.0);

    }
  }
  if (v15 && (objc_msgSend(v15, "predictionSetChunk"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v71 = v15;
    objc_msgSend(v15, "feedbackStateChunk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
      v54 = v80;
    }
    else
    {
      __atxlog_handle_default();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[ATXActionPredictions _actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:context:featureCache:remainingPredictionItems:].cold.1();

      v22 = (void *)MEMORY[0x1E0CF9070];
      objc_msgSend(v71, "predictionSetChunk");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bundleIdReader:", v23);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v70, "readScoredPredictionsWithLimit:", 0x7FFFFFFFLL);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "feedbackStateChunk");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXActionCacheReader getActionKeyToPredictionItemMapFromChunk:](ATXActionCacheReader, "getActionKeyToPredictionItemMapFromChunk:", v24);

      v77 = (void *)objc_opt_new();
      v25 = (void *)objc_opt_new();
      __atxlog_handle_default();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v88, "count");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        v103 = 2050;
        v104 = v29;
        _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 1 Action Predictions returned num candidates: %{public}lu", buf, 0x16u);

      }
      +[ATXActionPredictionsHelpers applyLogSoftmaxToPredictions:](ATXActionPredictionsHelpers, "applyLogSoftmaxToPredictions:", v88);
      v85 = (void *)objc_opt_new();
      v81 = (void *)objc_opt_new();
      v91 = 0;
      v79 = arc4random_uniform(objc_msgSend(v88, "count"));
      while (objc_msgSend(v88, "count") > v91)
      {
        context = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v88, "objectAtIndexedSubscript:", v91);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "predictedItem");
        *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
        v30 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v98, (id *)buf);
        if (v30)
        {
          objc_msgSend(v85, "statisticsForActionKey:context:", *(_QWORD *)buf, v86);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(_QWORD *)buf;
          objc_msgSend(v90, "score");
          v33 = v32;
          objc_msgSend(v82, "predictionsForMultiStageLoggingLimit");
          v35 = v34;
          objc_msgSend(v86, "timeContext");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "date");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v91 == v79)
            objc_msgSend(v85, "actionPredictionsForActionKey:statistics:appActionPredictionItem:appActionLogProbability:scoreLogger:andLimit:forMagicalMoments:predictionItemsToKeep:currentDate:", v31, v89, v30 + 3, v83, (int)v35, 0, v33, a10, v37);
          else
            objc_msgSend(v85, "actionPredictionsForActionKey:statistics:appActionPredictionItem:appActionLogProbability:scoreLogger:andLimit:forMagicalMoments:currentDate:", v31, v89, v30 + 3, v83, (int)v35, 0, v33, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v81, "updateActionStatisticsForSlotResolutionStatistics:candidateActionPredictions:", v89, v38);
          if (v84)
          {
            v39 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v90, "score");
            objc_msgSend(v39, "numberWithFloat:");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)MEMORY[0x1E0CB3940];
            v42 = *(_QWORD *)buf;
            objc_msgSend(v90, "score");
            objc_msgSend(v41, "stringWithFormat:", CFSTR("%@:%f"), v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v40, v44);

            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            v45 = v38;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
            if (v46)
            {
              v47 = *(_QWORD *)v95;
              do
              {
                for (i = 0; i != v46; ++i)
                {
                  if (*(_QWORD *)v95 != v47)
                    objc_enumerationMutation(v45);
                  v49 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
                  objc_msgSend(v49, "scoredAction");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "description");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  v52 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v49, "score");
                  objc_msgSend(v52, "numberWithFloat:");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:forKeyedSubscript:", v53, v51);

                }
                v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
              }
              while (v46);
            }

          }
          if (objc_msgSend(v38, "count"))
            objc_msgSend(v80, "addObjectsFromArray:", v38);

        }
        objc_autoreleasePoolPop(context);
        ++v91;
      }
      __atxlog_handle_default();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v80, "count");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v57;
        v103 = 2050;
        v104 = v58;
        _os_log_impl(&dword_1C9A3B000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 2 Action Predictions returned num candidates from slot exploration: %{public}lu", buf, 0x16u);

      }
      +[ATXActionPredictionsProcessor removeAlarmActionsInconsistentWithAlarmAppState:](ATXActionPredictionsProcessor, "removeAlarmActionsInconsistentWithAlarmAppState:", v80);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v59, "mutableCopy");

      v60 = (void *)objc_opt_new();
      objc_msgSend(v60, "setFeatureValuesAndFilterPredictableActions:actionStatistics:", v54, v81);
      if (v83)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v61 = dispatch_semaphore_create(0);
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_44;
          v92[3] = &unk_1E82E00B0;
          v62 = v61;
          v93 = v62;
          objc_msgSend(v83, "flushWithCompletion:", v92);
          objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v62, &__block_literal_global_46_0, &__block_literal_global_48_1, 5.0);

        }
      }
      if (v84)
      {
        +[ATXActionPredictions sortStageScores:](ATXActionPredictions, "sortStageScores:", v77);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "logStageScores:forStageType:", v63, 0);

        +[ATXActionPredictions sortStageScores:](ATXActionPredictions, "sortStageScores:", v25);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "logStageScores:forStageType:", v64, 1);

      }
      __atxlog_handle_default();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v54, "count");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v67;
        v103 = 2050;
        v104 = v68;
        _os_log_impl(&dword_1C9A3B000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 2 Action Predictions retained num candidates after post-processing: %{public}lu", buf, 0x16u);

      }
      std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::~__hash_table((uint64_t)v98);

    }
    v15 = v71;
  }
  else
  {
    v54 = v80;
  }

  objc_autoreleasePoolPop(v72);
  return v54;
}

intptr_t __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_cold_1();

}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_33()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_33_cold_1();

}

intptr_t __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_44(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_45()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_45_cold_1();

}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_47()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_47_cold_1();

}

+ (id)_predictionsForConsumerSubType:(unsigned __int8)a3 thirdStageScoreLogger:(id)a4 multiStageScoreLogger:(id)a5 context:(id)a6 actionPredictionCandidates:(id)a7 remainingPredictionItems:(void *)a8 predictionsPerAppActionLimit:(id)a9
{
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  dispatch_semaphore_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  ATXActionResult *v40;
  void *v41;
  void *v42;
  ATXActionResult *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  uint64_t v50;
  void *context;
  id v53;
  void *v54;
  id v56;
  id v57;
  id v58;
  id obj;
  id obja;
  id objc;
  id objb;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  NSObject *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE buf[12];
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v12 = a3;
  v78 = *MEMORY[0x1E0C80C00];
  v58 = a4;
  v57 = a5;
  v53 = a6;
  obj = a7;
  v56 = a9;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v13 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  objc_msgSend(v54, "scoreActions:scoreLogger:consumerSubType:", obj, v58, v12);
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v16;
    v74 = 2050;
    v75 = objc_msgSend(obj, "count");
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 3 Action Predictions scored num candidates: %{public}lu", buf, 0x16u);

  }
  ATXSortAndLimitPredictionsWhileKeepingPredictionItems(obj, v56, (int64x2_t *)a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  obja = v17;
  if (v57)
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v70 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v22, "scoredAction");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "description");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v22, "score");
          objc_msgSend(v25, "numberWithFloat:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v24);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      }
      while (v19);
    }

  }
  if (v58)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = dispatch_semaphore_create(0);
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke;
      v67[3] = &unk_1E82E00B0;
      v28 = v27;
      v68 = v28;
      objc_msgSend(v58, "flushWithCompletion:", v67);
      objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v28, &__block_literal_global_49, &__block_literal_global_51, 5.0);

    }
  }
  if (v57)
  {
    +[ATXActionPredictions sortStageScores:](ATXActionPredictions, "sortStageScores:", v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "logStageScores:forStageType:", v29, 2);

  }
  +[ATXActionPredictionsHelpers sortPredictions:](ATXActionPredictionsHelpers, "sortPredictions:", obja);
  +[ATXActionPredictions penalizeMultipleActionsPerAppAndKeepSorted:](ATXActionPredictions, "penalizeMultipleActionsPerAppAndKeepSorted:", obja);
  +[ATXActionPredictions fetchDataAndUpdateContentAttributeSetForActions:](ATXActionPredictions, "fetchDataAndUpdateContentAttributeSetForActions:", obja);
  +[ATXActionPredictionsProcessor removeDuplicateActionPredictions:](ATXActionPredictionsProcessor, "removeDuplicateActionPredictions:", obja);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  +[ATXActionPredictionsProcessor removeMissingOrBlockedRecipientPredictions:](ATXActionPredictionsProcessor, "removeMissingOrBlockedRecipientPredictions:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc = (id)objc_msgSend(v32, "mutableCopy");

  +[ATXActionPredictionsProcessor removeDuplicateTVActionPredictions:](ATXActionPredictionsProcessor, "removeDuplicateTVActionPredictions:", objc);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "mutableCopy");

  if ((_DWORD)v12 != 22)
    objc_msgSend((id)objc_opt_class(), "setTVActionPredictionsConfidenceToLow:", v34);
  v35 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objb = v34;
  v36 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v64 != v37)
          objc_enumerationMutation(objb);
        v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        if (v39)
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "predictionItem");
        else
          bzero(buf, 0xCE0uLL);
        v40 = [ATXActionResult alloc];
        objc_msgSend(v39, "scoredAction");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "actionKey");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[ATXActionResult initWithScoredAction:predictionItem:actionKey:](v40, "initWithScoredAction:predictionItem:actionKey:", v41, buf, v42);

        objc_msgSend(v35, "addObject:", v43);
      }
      v36 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v36);
  }

  v45 = *(_QWORD *)a8;
  v44 = *((_QWORD *)a8 + 1);
  if (*(_QWORD *)a8 != v44)
  {
    do
    {
      v46 = -[ATXActionResult initForLoggingWithPredictionItem:]([ATXActionResult alloc], "initForLoggingWithPredictionItem:", v45);
      objc_msgSend(v35, "addObject:", v46);

      v45 += 3296;
    }
    while (v45 != v44);
  }
  __atxlog_handle_default();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v35, "count");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v49;
    v74 = 2050;
    v75 = v50;
    _os_log_impl(&dword_1C9A3B000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ - Stage 3 Action Predictions returned num predictions: %{public}lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(context);

  return v35;
}

intptr_t __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_2()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_2_cold_1();

}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_50()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_50_cold_1();

}

+ (id)actionsFromActions:(id)a3 byMovingActionsWithBundleIdentifiers:(id)a4 toRemainingPredictionItems:(void *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__ATXActionPredictions_actionsFromActions_byMovingActionsWithBundleIdentifiers_toRemainingPredictionItems___block_invoke;
  v16[3] = &unk_1E82E5068;
  v10 = v8;
  v17 = v10;
  v19 = a5;
  v11 = v9;
  v18 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
  v12 = objc_msgSend(v11, "count");
  if (v12 == objc_msgSend(v7, "count"))
  {
    v13 = v7;
  }
  else
  {
    objc_msgSend(v7, "objectsAtIndexes:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

void __107__ATXActionPredictions_actionsFromActions_byMovingActionsWithBundleIdentifiers_toRemainingPredictionItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  char **v15;
  unint64_t v16;
  char *v17;
  id v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  id v37;
  _BYTE v38[3282];
  _QWORD v39[5];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "scoredAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v9);

  if ((_DWORD)v6)
  {
    v10 = *(uint64_t **)(a1 + 48);
    if (v10)
    {
      v12 = *v10;
      v11 = v10[1];
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfActionsToKeepForLogging");

      if (0xDAB7EC1DD3431B57 * ((v11 - v12) >> 5) < v14)
      {
        v15 = *(char ***)(a1 + 48);
        if (v5)
          objc_msgSend(v5, "predictionItem");
        else
          bzero(&v37, 0xCE0uLL);
        v16 = (unint64_t)v15[2];
        v17 = v15[1];
        if ((unint64_t)v17 >= v16)
        {
          v20 = 0xDAB7EC1DD3431B57 * ((v17 - *v15) >> 5);
          if (v20 + 1 > 0x13E22CBCE4A902)
            std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
          v21 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v16 - (_QWORD)*v15) >> 5);
          v22 = 2 * v21;
          if (2 * v21 <= v20 + 1)
            v22 = v20 + 1;
          if (v21 >= 0x9F1165E725481)
            v23 = 0x13E22CBCE4A902;
          else
            v23 = v22;
          v39[4] = v15 + 2;
          if (v23)
          {
            v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)(v15 + 2), v23);
            v26 = v25;
          }
          else
          {
            v24 = 0;
            v26 = 0;
          }
          v27 = &v24[3296 * v20];
          v28 = v37;
          v37 = 0;
          *(_QWORD *)v27 = v28;
          memcpy(v27 + 8, v38, 0xCD2uLL);
          v30 = *v15;
          v29 = v15[1];
          if (v29 == *v15)
          {
            v35 = v15[1];
            v31 = v27;
          }
          else
          {
            v31 = v27;
            do
            {
              v32 = v29 - 3296;
              v33 = *((_QWORD *)v29 - 412);
              v34 = v31 - 3288;
              v31 -= 3296;
              *((_QWORD *)v29 - 412) = 0;
              *(_QWORD *)v31 = v33;
              memcpy(v34, v29 - 3288, 0xCD2uLL);
              v29 = v32;
            }
            while (v32 != v30);
            v35 = *v15;
            v29 = v15[1];
          }
          v19 = v27 + 3296;
          *v15 = v31;
          v39[0] = v35;
          v39[1] = v35;
          v15[1] = v19;
          v39[2] = v29;
          v36 = v15[2];
          v15[2] = &v24[3296 * v26];
          v39[3] = v36;
          std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v39);
        }
        else
        {
          v18 = v37;
          v37 = 0;
          *(_QWORD *)v17 = v18;
          memcpy(v17 + 8, v38, 0xCD2uLL);
          v19 = v17 + 3296;
        }
        v15[1] = v19;

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

+ (void)fetchDataAndUpdateContentAttributeSetForActions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "scoredAction", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "predictedItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ATXActionUtils fetchDataAndUpdateContentAttributeSetForAction:](_ATXActionUtils, "fetchDataAndUpdateContentAttributeSetForAction:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

+ (void)setTVActionPredictionsConfidenceToLow:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _BYTE v19[3268];
  int v20;
  __int16 v21;
  id v22[2];
  _BYTE v23[3268];
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[3268];
  _BYTE v30[128];
  uint64_t v31;

  MEMORY[0x1E0C80A78](a1, a2);
  v31 = *MEMORY[0x1E0C80C00];
  v17 = v3;
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.tv"), CFSTR("INPlayMediaIntent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v5 = v17;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "actionKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          if (v9)
          {
            objc_msgSend(v9, "predictionItem");
            v12 = v22[0];
            v13 = v22[1];
            v14 = v24;
          }
          else
          {
            bzero(v22, 0xCE0uLL);
            v13 = 0;
            v12 = 0;
            v14 = 0;
          }
          v15 = v12;
          memcpy(v29, v23, sizeof(v29));
          v16 = v15;
          v18[0] = v16;
          v18[1] = v13;
          memcpy(v19, v29, sizeof(v19));
          v20 = v14;
          v21 = 0;
          if (v9)
            objc_msgSend(v9, "setPredictionItem:", v18);
          else

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

}

+ (id)filterHighQualityActionResults:(id)a3 consumerSubType:(unsigned __int8)a4
{
  int v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD aBlock[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a4;
  v5 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__58;
  v32 = __Block_byref_object_dispose__58;
  v33 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke;
  aBlock[3] = &unk_1E82E50D0;
  aBlock[4] = &v28;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v4 == 46)
  {
    objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_64_0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v29[5];
    v29[5] = v16;

    v18 = (void *)v29[5];
    v19 = objc_msgSend(v18, "count");
    v20 = objc_msgSend(v6, "maxSettingsZKWSuggestionsToBlend");
    if (v19 >= v20)
      v21 = v20;
    else
      v21 = v19;
    objc_msgSend(v18, "subarrayWithRange:", 0, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v29[5];
    v29[5] = v22;
  }
  else
  {
    if (v4 != 38)
    {
      objc_msgSend(v6, "actionExperienceMediumConfidenceThreshold");
      +[ATXActionPredictions removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:](ATXActionPredictions, "removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:", v5, 0, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v29[5];
      v29[5] = v23;

      v7[2](v7);
      goto LABEL_10;
    }
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "whitelistedActionKeysForHomeScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "whitelistedActionTypesForHomeScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "behavioralHomeScreenActionMinimumConfidenceThreshold");
    +[ATXActionPredictions removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:](ATXActionPredictions, "removeActionsBelowThresholdForActionPredictions:withThreshold:actionKeyWhitelist:actionTypeWhitelist:", v5, v10, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v14;

    v7[2](v7);
  }

LABEL_10:
  v25 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v25;
}

void __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_pas_filteredArrayWithTest:", &__block_literal_global_62_1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CF9098];
  objc_msgSend(a2, "scoredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isActionEligibleForSettingsSuggestions:", v4) ^ 1;

  return v5;
}

uint64_t __71__ATXActionPredictions_filterHighQualityActionResults_consumerSubType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CF9098];
  objc_msgSend(a2, "scoredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isActionEligibleForSettingsSuggestions:", v4);

  return v5;
}

+ (id)removeActionsBelowThresholdForActionPredictions:(id)a3 withThreshold:(double)a4 actionKeyWhitelist:(id)a5 actionTypeWhitelist:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v9 = a5;
  v10 = a6;
  v25 = (id)objc_opt_new();
  v11 = objc_msgSend((id)objc_opt_class(), "numActionResultsWithOnlyPredictionItemForLogging:", v23);
  if (objc_msgSend(v23, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v23;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (+[ATXActionPredictions actionScoreAboveThresholdOrWhitelistedAction:confidenceThreshold:actionKeyWhitelist:actionTypeWhitelist:](ATXActionPredictions, "actionScoreAboveThresholdOrWhitelistedAction:confidenceThreshold:actionKeyWhitelist:actionTypeWhitelist:", v15, v9, v10, a4))
          {
            objc_msgSend(v25, "addObject:", v15);
          }
          else
          {
            +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v11 < (int)objc_msgSend(v16, "numberOfActionsToKeepForLogging");

            if (v17)
            {
              v18 = -[ATXActionResult initForLoggingWithPredictionItem:]([ATXActionResult alloc], "initForLoggingWithPredictionItem:", objc_msgSend(v15, "predictionItem"));
              objc_msgSend(v25, "addObject:", v18);

              ++v11;
            }
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v12);
    }

  }
  __atxlog_handle_default();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v25, "count");
    v21 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 134218496;
    v31 = v20;
    v32 = 2048;
    v33 = a4;
    v34 = 2048;
    v35 = v21;
    _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "Filtered %tu predictions with score above %0.2f threshold, out of %tu.", buf, 0x20u);
  }

  return v25;
}

+ (unint64_t)numActionResultsWithOnlyPredictionItemForLogging:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "scoredAction", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(v8, "actionKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("predictionItem"));

          v4 += v11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v4;
}

+ (BOOL)actionScoreAboveThresholdOrWhitelistedAction:(id)a3 confidenceThreshold:(double)a4 actionKeyWhitelist:(id)a5 actionTypeWhitelist:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "scoredAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v9, "scoredAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "score");
    v15 = v14;

    if (v15 >= a4)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      objc_msgSend(v9, "scoredAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predictedItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_7;
      objc_msgSend(v9, "scoredAction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "predictedItem");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v21, "intent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "_nonNilParameters");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = objc_msgSend(v23, "containsObject:", CFSTR("content"));

      if ((v21 & 1) != 0)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
LABEL_7:
        objc_msgSend(v9, "actionKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsObject:", v24) & 1) != 0)
          LOBYTE(v12) = 1;
        else
          LOBYTE(v12) = objc_msgSend(v11, "containsObject:", v25);

      }
    }
  }

  return (char)v12;
}

+ (id)scoredActionsWithoutLog:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "scoredAction", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v9, "score");
        objc_msgSend(v11, "setScore:");
        objc_msgSend(v4, "addObject:", v11);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

+ (void)penalizeMultipleActionsPerAppAndKeepSorted:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v22;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CF9098];
        objc_msgSend(v8, "scoredAction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "predictedItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v9, "isActionEligibleForSettingsSuggestions:", v11);

        if ((v9 & 1) == 0)
        {
          objc_msgSend(v8, "scoredAction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "predictedItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16 + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v14);

          if (v16 >= 1)
          {
            objc_msgSend(v23, "penaltyForMultipleActionsPerApp");
            v19 = v18;
            objc_msgSend(v8, "score");
            v21 = v19 + v20;
            *(float *)&v21 = v21;
            objc_msgSend(v8, "setScore:", v21);
          }

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  +[ATXActionPredictionsHelpers sortPredictions:](ATXActionPredictionsHelpers, "sortPredictions:", v4);
}

+ (id)sortStageScores:(id)a3
{
  objc_msgSend(a3, "keysSortedByValueUsingComparator:", &__block_literal_global_71_0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __40__ATXActionPredictions_sortStageScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 < v8)
    v10 = 1;
  else
    v10 = v9;

  return v10;
}

+ (void)_actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:context:featureCache:remainingPredictionItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Querying for action predictions.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Slot  Resolution Score Logging - Stage One Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_33_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Slot Resolution Score Logging - Stage One Timed Out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_2_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Slot Resolution Score Logging - Stage Two Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __215__ATXActionPredictions__actionPredictionCandidatesForCandidateBundleIdentifiers_candidateActiontypes_firstStageScoreLogger_secondStageScoreLogger_multiStageScoreLogger_context_featureCache_remainingPredictionItems___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Slot Resolution Score Logging - Stage Two Timed Out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Slot Resolution Score Logging - Stage Three Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __188__ATXActionPredictions__predictionsForConsumerSubType_thirdStageScoreLogger_multiStageScoreLogger_context_actionPredictionCandidates_remainingPredictionItems_predictionsPerAppActionLimit___block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Slot Resolution Score Logging - Stage Three Timed Out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
