@implementation ATXCandidateRelevanceModelOfflineDataHarvester

- (ATXCandidateRelevanceModelOfflineDataHarvester)init
{
  void *v3;
  ATXCandidateRelevanceModelOfflineDataHarvester *v4;

  allRelevanceModelConfigs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXCandidateRelevanceModelOfflineDataHarvester initWithConfigs:](self, "initWithConfigs:", v3);

  return v4;
}

- (ATXCandidateRelevanceModelOfflineDataHarvester)initWithConfigs:(id)a3
{
  id v5;
  ATXCandidateRelevanceModelOfflineDataHarvester *v6;
  ATXCandidateRelevanceModelOfflineDataHarvester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelOfflineDataHarvester;
  v6 = -[ATXCandidateRelevanceModelOfflineDataHarvester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configs, a3);

  return v7;
}

- (void)harvestData
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_relevance_model();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Beginning data harvesting for all configs.", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_configs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_opt_class(), "harvestDataUsingConfig:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (void)harvestDataUsingConfig:(id)a3
{
  id v3;
  float v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  float v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "dataHarvestingSamplingRate");
  v5 = +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", v4);
  __atxlog_handle_relevance_model();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientModelId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Harvesting data for config with client model id %@.", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "metricsForConfig:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:", v6);
    goto LABEL_7;
  }
  if (v7)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientModelId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataHarvestingSamplingRate");
    v17 = 138412802;
    v18 = v12;
    v19 = 2112;
    v20 = v15;
    v21 = 2048;
    v22 = v16;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Not harvesting data for config with client model id %@. We failed to sample a value between 0 and 1 that is less than %f.", (uint8_t *)&v17, 0x20u);

LABEL_7:
  }

}

+ (id)metricsForConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "candidateMetricsFromConfig:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCandidateMetrics:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluationMetricsFromConfig:startTime:endTime:", v3, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvaluationMetricsOneWeekAgo:", v13);

  v14 = (void *)objc_opt_class();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1209600.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604800.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v18, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "evaluationMetricsFromConfig:startTime:endTime:", v3, v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvaluationMetricsTwoWeeksAgo:", v21);

  v22 = (void *)objc_opt_class();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1814400.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  objc_msgSend(v23, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1209600.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceReferenceDate");
  objc_msgSend(v26, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "evaluationMetricsFromConfig:startTime:endTime:", v3, v25, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvaluationMetricsThreeWeeksAgo:", v29);

  v30 = (void *)objc_opt_class();
  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419200.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  objc_msgSend(v31, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1814400.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeIntervalSinceReferenceDate");
  objc_msgSend(v34, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "evaluationMetricsFromConfig:startTime:endTime:", v3, v33, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvaluationMetricsFourWeeksAgo:", v37);

  v38 = (void *)objc_opt_class();
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419200.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "timeIntervalSinceReferenceDate");
  objc_msgSend(v39, "numberWithDouble:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v42, "numberWithDouble:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "evaluationMetricsFromConfig:startTime:endTime:", v3, v41, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEvaluationMetricsLastFourWeeks:", v44);

  objc_msgSend((id)objc_opt_class(), "modelMetricsForConfig:", v3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setModelMetrics:", v45);
  return v4;
}

+ (id)candidateMetricsFromConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, char);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "clientModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientModelId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v8, 1, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clientModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientModelId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v11, 1, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "datastore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke;
  v32[3] = &unk_1E82E9F10;
  v33 = v9;
  v34 = v12;
  v35 = v6;
  v36 = a1;
  v15 = v6;
  v16 = v12;
  v17 = v9;
  objc_msgSend(v4, "clientModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientModelId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v14;
  v27 = 3221225472;
  v28 = __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2;
  v29 = &unk_1E82E9F38;
  v30 = v4;
  v31 = a1;
  v20 = v4;
  objc_msgSend(v13, "receiveMostRecentVerifiedTrainedModelTrainingResults:clientModelName:completion:", v32, v19, &v26);

  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_225, v26, v27, v28, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  if (v22 >= 0x19)
    v23 = 25;
  else
    v23 = v22;
  objc_msgSend(v21, "subarrayWithRange:", 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  void *v28;
  float v29;
  double v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  int v44;
  int v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  float v50;
  double v51;
  void *v52;
  void *v53;
  float v54;
  double v55;
  void *v56;
  void *v57;
  float v58;
  double v59;
  void *v60;
  void *v61;
  float v62;
  double v63;
  void *v64;
  void *v65;
  float v66;
  double v67;
  void *v68;
  void *v69;
  float v70;
  double v71;
  void *v72;
  int v73;
  int v74;
  double v75;
  double v76;
  id v77;

  v77 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v77, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "datasetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfPositiveSamples");
  if (v7 >= 0x65)
    v8 = 10 * (v7 / 0xA);
  else
    v8 = v7;
  objc_msgSend(v3, "setCandidateNumberOfPositiveSamples:", v8);

  objc_msgSend(v77, "datasetMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfSamples");
  if (v10 >= 0x65)
    v11 = 10 * (v10 / 0xA);
  else
    v11 = v10;
  objc_msgSend(v3, "setCandidateNumberOfSamples:", v11);

  objc_msgSend(v77, "datasetMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCandidateNumberOfDaysWithPositiveSamples:", objc_msgSend(v12, "numberOfDaysWithPositiveSamples"));

  objc_msgSend(v77, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfModelWeights");
  if (v14 >= 0x65)
    v15 = 10 * (v14 / 0xA);
  else
    v15 = v14;
  objc_msgSend(v3, "setCandidateNumberOfModelWeights:", v15);

  objc_msgSend(v77, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfNonZeroModelWeights");
  if (v17 >= 0x65)
    v18 = 10 * (v17 / 0xA);
  else
    v18 = v17;
  objc_msgSend(v3, "setCandidateNumberOfNonZeroModelWeights:", v18);

  objc_msgSend(*(id *)(a1 + 32), "engagedPerCandidate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21 / ((double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfSessions") + 0.000001);
  *(float *)&v22 = v22;
  *(float *)&v22 = roundf(*(float *)&v22 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateShadowLaunchPercentage:", v22);

  objc_msgSend(*(id *)(a1 + 32), "shownInTop8PerCandidate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v26 = v25 / ((double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfSessions") + 0.000001);
  *(float *)&v26 = v26;
  *(float *)&v26 = roundf(*(float *)&v26 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateShadowShownPercentage:", v26);

  objc_msgSend(*(id *)(a1 + 32), "engagedInTop8PerCandidate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v30 = v29;
  objc_msgSend(*(id *)(a1 + 32), "shownInTop8PerCandidate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  v34 = v30 / (v33 + 0.000001);
  *(float *)&v34 = v34;
  *(float *)&v34 = roundf(*(float *)&v34 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateShadowPrecision:", v34);

  objc_msgSend(*(id *)(a1 + 32), "engagedInTop8PerCandidate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v38 = v37;
  objc_msgSend(*(id *)(a1 + 32), "engagedPerCandidate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "floatValue");
  v42 = v38 / (v41 + 0.000001);
  *(float *)&v42 = v42;
  *(float *)&v42 = roundf(*(float *)&v42 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateShadowRecall:", v42);

  v43 = *(void **)(a1 + 56);
  objc_msgSend(v3, "candidateShadowPrecision");
  LODWORD(v38) = v44;
  objc_msgSend(v3, "candidateShadowRecall");
  LODWORD(v46) = v45;
  LODWORD(v47) = LODWORD(v38);
  objc_msgSend(v43, "calculateF1ScoreWithPrecision:recall:", v47, v46);
  objc_msgSend(v3, "setCandidateShadowF1:");
  objc_msgSend(*(id *)(a1 + 40), "engagedPerCandidate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", v5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "floatValue");
  v51 = v50 / ((double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "numberOfSessions") + 0.000001);
  *(float *)&v51 = v51;
  *(float *)&v51 = roundf(*(float *)&v51 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateUILaunchPercentage:", v51);

  objc_msgSend(*(id *)(a1 + 40), "shownInTop8PerCandidate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "floatValue");
  v55 = v54 / ((double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "numberOfSessions") + 0.000001);
  *(float *)&v55 = v55;
  *(float *)&v55 = roundf(*(float *)&v55 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateUIShownPercentage:", v55);

  objc_msgSend(*(id *)(a1 + 40), "engagedInTop8PerCandidate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", v5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "floatValue");
  v59 = v58;
  objc_msgSend(*(id *)(a1 + 40), "shownInTop8PerCandidate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKeyedSubscript:", v5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "floatValue");
  v63 = v59 / (v62 + 0.000001);
  *(float *)&v63 = v63;
  *(float *)&v63 = roundf(*(float *)&v63 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateUIPrecision:", v63);

  objc_msgSend(*(id *)(a1 + 40), "engagedInTop8PerCandidate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKeyedSubscript:", v5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "floatValue");
  v67 = v66;
  objc_msgSend(*(id *)(a1 + 40), "engagedPerCandidate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKeyedSubscript:", v5);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "floatValue");
  v71 = v67 / (v70 + 0.000001);
  *(float *)&v71 = v71;
  *(float *)&v71 = roundf(*(float *)&v71 * 100.0) / 100.0;
  objc_msgSend(v3, "setCandidateUIRecall:", v71);

  v72 = *(void **)(a1 + 56);
  objc_msgSend(v3, "candidateUIPrecision");
  LODWORD(v67) = v73;
  objc_msgSend(v3, "candidateUIRecall");
  LODWORD(v75) = v74;
  LODWORD(v76) = LODWORD(v67);
  objc_msgSend(v72, "calculateF1ScoreWithPrecision:recall:", v76, v75);
  objc_msgSend(v3, "setCandidateUIF1:");
  objc_msgSend(v3, "setCandidateIdentifier:", v5);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

void __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;

  if ((a2 & 1) == 0)
  {
    __atxlog_handle_relevance_model();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2_cold_1(a1);

  }
}

uint64_t __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "candidateNumberOfPositiveSamples"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "candidateNumberOfPositiveSamples"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "candidateNumberOfPositiveSamples"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "candidateNumberOfPositiveSamples"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

+ (id)evaluationMetricsFromConfig:(id)a3 startTime:(id)a4 endTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  ATXProactiveSuggestionClientModelEvaluator *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  float v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[ATXProactiveSuggestionClientModelEvaluator initWithStartTime:endTime:]([ATXProactiveSuggestionClientModelEvaluator alloc], "initWithStartTime:endTime:", v9, v8);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v7, "clientModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientModelId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](v10, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v13, 1, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (float)(unint64_t)objc_msgSend(v14, "engagedInTop1");
  v16 = v15 / ((double)(unint64_t)objc_msgSend(v14, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v16 = v16;
  *(float *)&v16 = roundf(*(float *)&v16 * 100.0) / 100.0;
  objc_msgSend(v11, "setShadowEvaluationSuccessAt1:", v16);
  v17 = (float)(unint64_t)objc_msgSend(v14, "engagedInTop2");
  v18 = v17 / ((double)(unint64_t)objc_msgSend(v14, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v18 = v18;
  *(float *)&v18 = roundf(*(float *)&v18 * 100.0) / 100.0;
  objc_msgSend(v11, "setShadowEvaluationSuccessAt2:", v18);
  v19 = (float)(unint64_t)objc_msgSend(v14, "engagedInTop4");
  v20 = v19 / ((double)(unint64_t)objc_msgSend(v14, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v20 = v20;
  *(float *)&v20 = roundf(*(float *)&v20 * 100.0) / 100.0;
  objc_msgSend(v11, "setShadowEvaluationSuccessAt4:", v20);
  v21 = (float)(unint64_t)objc_msgSend(v14, "engagedInTop8");
  v22 = v21 / ((double)(unint64_t)objc_msgSend(v14, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v22 = v22;
  *(float *)&v22 = roundf(*(float *)&v22 * 100.0) / 100.0;
  objc_msgSend(v11, "setShadowEvaluationSuccessAt8:", v22);
  objc_msgSend(v14, "reciprocalRank");
  v24 = v23 / ((double)(unint64_t)objc_msgSend(v14, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v24 = v24;
  *(float *)&v24 = roundf(*(float *)&v24 * 100.0) / 100.0;
  objc_msgSend(v11, "setShadowEvaluationMRR:", v24);
  v25 = objc_msgSend(v14, "numberOfSessionsWithPredictions");
  v26 = v25;
  if (v25 >= 0x65)
    v26 = 10 * (v25 / 0xA);
  objc_msgSend(v11, "setShadowEvaluationNumberOfSessionsWithPredictions:", v26);
  v27 = objc_msgSend(v14, "numberOfSessions");
  v28 = v27;
  if (v27 >= 0x65)
    v28 = 10 * (v27 / 0xA);
  objc_msgSend(v11, "setShadowEvaluationNumberOfSessions:", v28);
  objc_msgSend(v7, "clientModel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "clientModelId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](v10, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v30, 1, 1, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (float)(unint64_t)objc_msgSend(v31, "engagedInTop1");
  v33 = v32 / ((double)(unint64_t)objc_msgSend(v31, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v33 = v33;
  *(float *)&v33 = roundf(*(float *)&v33 * 100.0) / 100.0;
  objc_msgSend(v11, "setUiEvaluationSuccessAt1:", v33);
  v34 = (float)(unint64_t)objc_msgSend(v31, "engagedInTop2");
  v35 = v34 / ((double)(unint64_t)objc_msgSend(v31, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v35 = v35;
  *(float *)&v35 = roundf(*(float *)&v35 * 100.0) / 100.0;
  objc_msgSend(v11, "setUiEvaluationSuccessAt2:", v35);
  v36 = (float)(unint64_t)objc_msgSend(v31, "engagedInTop4");
  v37 = v36 / ((double)(unint64_t)objc_msgSend(v31, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v37 = v37;
  *(float *)&v37 = roundf(*(float *)&v37 * 100.0) / 100.0;
  objc_msgSend(v11, "setUiEvaluationSuccessAt4:", v37);
  v38 = (float)(unint64_t)objc_msgSend(v31, "engagedInTop8");
  v39 = v38 / ((double)(unint64_t)objc_msgSend(v31, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v39 = v39;
  *(float *)&v39 = roundf(*(float *)&v39 * 100.0) / 100.0;
  objc_msgSend(v11, "setUiEvaluationSuccessAt8:", v39);
  objc_msgSend(v31, "reciprocalRank");
  v41 = v40 / ((double)(unint64_t)objc_msgSend(v31, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v41 = v41;
  *(float *)&v41 = roundf(*(float *)&v41 * 100.0) / 100.0;
  objc_msgSend(v11, "setUiEvaluationMRR:", v41);
  v42 = objc_msgSend(v31, "numberOfSessionsWithPredictions");
  v43 = v42;
  if (v42 >= 0x65)
    v43 = 10 * (v42 / 0xA);
  objc_msgSend(v11, "setUiEvaluationNumberOfSessionsWithPredictions:", v43);
  v44 = objc_msgSend(v31, "numberOfSessions");
  v45 = v44;
  if (v44 >= 0x65)
    v45 = 10 * (v44 / 0xA);
  objc_msgSend(v11, "setUiEvaluationNumberOfSessions:", v45);
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 15);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](v10, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v46, 1, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (float)(unint64_t)objc_msgSend(v47, "engagedInTop1");
  v49 = v48 / ((double)(unint64_t)objc_msgSend(v47, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v49 = v49;
  *(float *)&v49 = roundf(*(float *)&v49 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdShadowEvaluationSuccessAt1:", v49);
  v50 = (float)(unint64_t)objc_msgSend(v47, "engagedInTop2");
  v51 = v50 / ((double)(unint64_t)objc_msgSend(v47, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v51 = v51;
  *(float *)&v51 = roundf(*(float *)&v51 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdShadowEvaluationSuccessAt2:", v51);
  v52 = (float)(unint64_t)objc_msgSend(v47, "engagedInTop4");
  v53 = v52 / ((double)(unint64_t)objc_msgSend(v47, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v53 = v53;
  *(float *)&v53 = roundf(*(float *)&v53 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdShadowEvaluationSuccessAt4:", v53);
  v54 = (float)(unint64_t)objc_msgSend(v47, "engagedInTop8");
  v55 = v54 / ((double)(unint64_t)objc_msgSend(v47, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v55 = v55;
  *(float *)&v55 = roundf(*(float *)&v55 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdShadowEvaluationSuccessAt8:", v55);
  objc_msgSend(v47, "reciprocalRank");
  v57 = v56 / ((double)(unint64_t)objc_msgSend(v47, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v57 = v57;
  *(float *)&v57 = roundf(*(float *)&v57 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdShadowEvaluationMRR:", v57);
  v58 = objc_msgSend(v47, "numberOfSessionsWithPredictions");
  v59 = v58;
  if (v58 >= 0x65)
    v59 = 10 * (v58 / 0xA);
  objc_msgSend(v11, "setProdShadowEvaluationNumberOfSessionsWithPredictions:", v59);
  v60 = objc_msgSend(v47, "numberOfSessions");
  v61 = v60;
  if (v60 >= 0x65)
    v61 = 10 * (v60 / 0xA);
  objc_msgSend(v11, "setProdShadowEvaluationNumberOfSessions:", v61);
  -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](v10, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v46, 1, 1, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (float)(unint64_t)objc_msgSend(v62, "engagedInTop1");
  v64 = v63 / ((double)(unint64_t)objc_msgSend(v62, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v64 = v64;
  *(float *)&v64 = roundf(*(float *)&v64 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdUIEvaluationSuccessAt1:", v64);
  v65 = (float)(unint64_t)objc_msgSend(v62, "engagedInTop2");
  v66 = v65 / ((double)(unint64_t)objc_msgSend(v62, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v66 = v66;
  *(float *)&v66 = roundf(*(float *)&v66 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdUIEvaluationSuccessAt2:", v66);
  v67 = (float)(unint64_t)objc_msgSend(v62, "engagedInTop4");
  v68 = v67 / ((double)(unint64_t)objc_msgSend(v62, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v68 = v68;
  *(float *)&v68 = roundf(*(float *)&v68 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdUIEvaluationSuccessAt4:", v68);
  v69 = (float)(unint64_t)objc_msgSend(v62, "engagedInTop8");
  v70 = v69 / ((double)(unint64_t)objc_msgSend(v62, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v70 = v70;
  *(float *)&v70 = roundf(*(float *)&v70 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdUIEvaluationSuccessAt8:", v70);
  objc_msgSend(v62, "reciprocalRank");
  v72 = v71 / ((double)(unint64_t)objc_msgSend(v62, "numberOfSessionsWithPredictions") + 0.000001);
  *(float *)&v72 = v72;
  *(float *)&v72 = roundf(*(float *)&v72 * 100.0) / 100.0;
  objc_msgSend(v11, "setProdUIEvaluationMRR:", v72);
  v73 = objc_msgSend(v62, "numberOfSessionsWithPredictions");
  v74 = v73;
  if (v73 >= 0x65)
    v74 = 10 * (v73 / 0xA);
  objc_msgSend(v11, "setProdUIEvaluationNumberOfSessionsWithPredictions:", v74);
  v75 = objc_msgSend(v62, "numberOfSessions");
  v76 = v75;
  if (v75 >= 0x65)
    v76 = 10 * (v75 / 0xA);
  objc_msgSend(v11, "setProdUIEvaluationNumberOfSessions:", v76);

  return v11;
}

+ (id)modelMetricsForConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __CFString *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[14];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  unsigned int *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  int v90;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "abGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlendingABGroup:", v6);

  objc_msgSend(v3, "abGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAbGroup:", v7);

  objc_msgSend(v3, "clientModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientModelId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientModelId:", v9);

  objc_msgSend(v4, "setPipelineEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_msgSend(v4, "setHasDefaultHyperParams:", 1);
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__98;
  v73 = __Block_byref_object_dispose__98;
  v74 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = (unsigned int *)&v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = (unsigned int *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  objc_msgSend(v3, "datastore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke;
  v48[3] = &unk_1E82E9FA0;
  v48[4] = &v87;
  v48[5] = &v83;
  v48[6] = &v79;
  v48[7] = &v75;
  v48[8] = &v69;
  v48[9] = &v65;
  v48[10] = &v61;
  v48[11] = &v57;
  v48[12] = &v53;
  v48[13] = &v49;
  objc_msgSend(v3, "clientModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientModelId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v11;
  v45[1] = 3221225472;
  v45[2] = __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke_2;
  v45[3] = &unk_1E82E9F38;
  v47 = a1;
  v14 = v3;
  v46 = v14;
  objc_msgSend(v10, "receiveMostRecentVerifiedTrainedModelTrainingResults:clientModelName:completion:", v48, v13, v45);

  objc_msgSend(v4, "setHasTrainedModel:", *((unsigned __int8 *)v66 + 24));
  v15 = v76[3];
  if (v15)
  {
    if (v15 == 1)
    {
      v16 = CFSTR("LogisticRegression");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), v76[3]);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = CFSTR("Unknown");
  }
  objc_msgSend(v4, "setModelType:", v16);

  LODWORD(v17) = *((_DWORD *)v62 + 6);
  v18 = ((float)v54[6] / ((double)v17 + 0.0001));
  if (v18 >= 0x65)
    v18 = 10 * (v18 / 0xA);
  objc_msgSend(v4, "setAvgNumberOfModelWeights:", v18);
  LODWORD(v19) = *((_DWORD *)v62 + 6);
  v20 = ((float)v58[6] / ((double)v19 + 0.0001));
  if (v20 >= 0x65)
    v20 = 10 * (v20 / 0xA);
  objc_msgSend(v4, "setAvgNumberOfNonZeroModelWeights:", v20);
  v21 = *((unsigned int *)v62 + 6);
  if (v21 >= 0x65)
    v21 = 10 * (v21 / 0xA);
  objc_msgSend(v4, "setNumberOfCandidateModels:", v21);
  v22 = (void *)objc_opt_class();
  v23 = v70[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModelAgeInDays:", objc_msgSend(v22, "daysBetweenStartDate:endDate:", v23, v24));

  v25 = *((unsigned int *)v84 + 6);
  if (v25 >= 0x65)
    v25 = 10 * (v25 / 0xA);
  objc_msgSend(v4, "setTrainDataNumberOfPositiveSamples:", v25);
  v26 = *((unsigned int *)v88 + 6);
  if (v26 >= 0x65)
    v26 = 10 * (v26 / 0xA);
  objc_msgSend(v4, "setTrainDataNumberOfSamples:", v26);
  v27 = *((unsigned int *)v80 + 6);
  if (v27 >= 0x65)
    v27 = 10 * (v27 / 0xA);
  objc_msgSend(v4, "setTrainDataNumberOfDaysWithPositiveSamples:", v27);
  v28 = *((unsigned int *)v62 + 6);
  if (v28 >= 0x65)
    v28 = 10 * (v28 / 0xA);
  objc_msgSend(v4, "setTrainDataNumberOfCandidates:", v28);
  v29 = v50[3];
  if (v29 >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), v50[3]);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E82E9FC0[v29];
  }
  objc_msgSend(v4, "setExecutableType:", v30);

  objc_msgSend(v14, "modelTrainingPlan");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "modelTrainingPlan");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan stringForPMLRegularizationStrategy:](ATXCandidateRelevanceLogisticRegressionModelTrainingPlan, "stringForPMLRegularizationStrategy:", objc_msgSend(v33, "regularizationStrategy"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLogisticRegressionRegularizationStrategy:", v34);

    objc_msgSend(v33, "regularizationRate");
    *(float *)&v36 = roundf(v35 * 100.0) / 100.0;
    objc_msgSend(v4, "setLogisticRegressionRegularizationRate:", v36);
    objc_msgSend(v33, "regularizationL1Ratio");
    *(float *)&v38 = roundf(v37 * 100.0) / 100.0;
    objc_msgSend(v4, "setLogisticRegressionRegularizationL1Ratio:", v38);
    objc_msgSend(v33, "learningRate");
    *(float *)&v40 = roundf(v39 * 100.0) / 100.0;
    objc_msgSend(v4, "setLearningRate:", v40);
    v41 = objc_msgSend(v33, "minIterations");
    v42 = v41;
    if (v41 >= 0x65)
      v42 = 10 * (v41 / 0xA);
    objc_msgSend(v4, "setMinIterations:", v42);
    objc_msgSend(v33, "stoppingThreshold");
    objc_msgSend(v4, "setStoppingThreshold:");

  }
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

  return v4;
}

void __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "datasetMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += objc_msgSend(v4, "numberOfSamples");

  objc_msgSend(v3, "datasetMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v5, "numberOfPositiveSamples");

  objc_msgSend(v3, "datasetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "numberOfDaysWithSamples");

  objc_msgSend(v3, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v7, "modelType");

  objc_msgSend(v3, "trainDate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  ++*(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
  objc_msgSend(v3, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[11] + 8) + 24) += objc_msgSend(v11, "numberOfNonZeroModelWeights");

  objc_msgSend(v3, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[12] + 8) + 24) += objc_msgSend(v12, "numberOfModelWeights");

  objc_msgSend(v3, "candidate");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = objc_msgSend(v13, "suggestionExecutableType");
}

void __72__ATXCandidateRelevanceModelOfflineDataHarvester_modelMetricsForConfig___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;

  if ((a2 & 1) == 0)
  {
    __atxlog_handle_relevance_model();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2_cold_1(a1);

  }
}

+ (unsigned)daysBetweenStartDate:(id)a3 endDate:(id)a4
{
  unsigned int v4;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v4 = -1;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E0C99D48];
    v7 = a4;
    v8 = a3;
    objc_msgSend(v6, "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v8, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v10, "day");
  }
  return v4;
}

+ (float)calculateF1ScoreWithPrecision:(float)a3 recall:(float)a4
{
  float v4;

  v4 = (float)((float)(a3 * a4) + (float)(a3 * a4)) / ((float)(a3 + a4) + 0.000001);
  return roundf(v4 * 100.0) / 100.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configs, 0);
}

void __77__ATXCandidateRelevanceModelOfflineDataHarvester_candidateMetricsFromConfig___block_invoke_2_cold_1(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v2 = (objc_class *)OUTLINED_FUNCTION_3_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientModelId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v6, v7, "%@ - Error retrieving most recent verified trained model for %@.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

@end
