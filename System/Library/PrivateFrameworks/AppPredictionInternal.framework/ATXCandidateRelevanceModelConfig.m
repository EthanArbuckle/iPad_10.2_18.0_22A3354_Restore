@implementation ATXCandidateRelevanceModelConfig

- (ATXCandidateRelevanceModelConfig)init
{
  void *v3;
  ATXCandidateRelevanceModelConfig *v4;

  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXCandidateRelevanceModelConfig initWithAppIconState:](self, "initWithAppIconState:", v3);

  return v4;
}

- (ATXCandidateRelevanceModelConfig)initWithAppIconState:(id)a3
{
  id v4;
  ATXCandidateRelevanceModelConfig *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *parameters;
  uint64_t v13;
  NSString *abGroupIdentifier;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *installedAppsKnownToSpringBoard;
  uint64_t v19;
  NSArray *featurizers;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ATXCandidateRelevanceModelConfig;
  v5 = -[ATXCandidateRelevanceModelConfig init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF8CF8]);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupOverride");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithAssetsForResource:ofType:specifiedABGroup:", v8, CFSTR("plist"), v9);

    objc_msgSend(v10, "abGroupContents");
    v11 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v11;

    objc_msgSend(v10, "groupIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    abGroupIdentifier = v5->_abGroupIdentifier;
    v5->_abGroupIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "allInstalledAppsKnownToSpringBoard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    installedAppsKnownToSpringBoard = v5->_installedAppsKnownToSpringBoard;
    v5->_installedAppsKnownToSpringBoard = (NSSet *)v17;

    -[ATXCandidateRelevanceModelConfig featurizersFromConfigPlist](v5, "featurizersFromConfigPlist");
    v19 = objc_claimAutoreleasedReturnValue();
    featurizers = v5->_featurizers;
    v5->_featurizers = (NSArray *)v19;

  }
  return v5;
}

- (BOOL)shouldTrainModelWithPositiveCandidateDatasetMetadata:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "numberOfPositiveSamples");
  if (v5 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfPositiveSamplesForCandidate](self, "minimumNumberOfPositiveSamplesForCandidate"))
  {
    v7 = objc_msgSend(v4, "numberOfDaysWithPositiveSamples");
    v6 = v7 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfDaysWithPositiveSamplesForCandidate](self, "minimumNumberOfDaysWithPositiveSamplesForCandidate");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldTrainModelWithCandidateDatasetMetadata:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "numberOfPositiveSamples");
  if (v5 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfPositiveSamplesForCandidate](self, "minimumNumberOfPositiveSamplesForCandidate")&& (v6 = objc_msgSend(v4, "numberOfSamples"), v6 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfSamplesForCandidate](self, "minimumNumberOfSamplesForCandidate"))&& (v7 = objc_msgSend(v4, "numberOfDaysWithPositiveSamples"), v7 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfDaysWithPositiveSamplesForCandidate](self, "minimumNumberOfDaysWithPositiveSamplesForCandidate")))
  {
    v10 = objc_msgSend(v4, "numberOfDaysWithSamples");
    v8 = v10 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfDaysWithSamplesForCandidate](self, "minimumNumberOfDaysWithSamplesForCandidate");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldTrainModelWithOverallDatasetMetadata:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "numberOfPositiveSamples");
  if (v5 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfPositiveSamplesOverall](self, "minimumNumberOfPositiveSamplesOverall"))
  {
    v7 = objc_msgSend(v4, "numberOfDaysWithPositiveSamples");
    v6 = v7 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfDaysWithPositiveSamplesOverall](self, "minimumNumberOfDaysWithPositiveSamplesOverall");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
  return (char)v3;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("IsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (float)dataHarvestingSamplingRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("DataHarvestingSamplingRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (int)maximumNumberOfTrainedCandidates
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MaximumNumberOfTrainedCandidates"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)minimumNumberOfPositiveSamplesForCandidate
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MinimumNumberOfPositiveSamplesForCandidate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFF;

  return v4;
}

- (int)minimumNumberOfSamplesForCandidate
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MinimumNumberOfSamplesForCandidate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFF;

  return v4;
}

- (int)minimumNumberOfDaysWithPositiveSamplesForCandidate
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MinimumNumberOfDaysWithPositiveSamplesForCandidate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFF;

  return v4;
}

- (int)minimumNumberOfDaysWithSamplesForCandidate
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MinimumNumberOfDaysWithSamplesForCandidate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFF;

  return v4;
}

- (int)minimumNumberOfPositiveSamplesOverall
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MinimumNumberOfPositiveSamplesOverall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFF;

  return v4;
}

- (int)minimumNumberOfDaysWithPositiveSamplesOverall
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("MinimumNumberOfDaysWithPositiveSamplesOverall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0x7FFFFFFF;

  return v4;
}

- (id)modelTrainingPlanParameters
{
  void *v2;
  void *v3;
  id v4;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("ModelTrainingPlanParameters"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (id)featurizersFromConfigPlist
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("Featurizers"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke;
  v10[3] = &unk_1E82DBB20;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke(uint64_t a1, void *a2)
{
  NSString *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = a2;
  if (NSClassFromString(v3))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      v17 = (void *)objc_opt_new();
      goto LABEL_9;
    }
    __atxlog_handle_relevance_model();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    __atxlog_handle_relevance_model();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_1((uint64_t)v3, v4, v11, v12, v13, v14, v15, v16);
  }

  v17 = 0;
LABEL_9:

  return v17;
}

- (ATXCandidateRelevanceModelTrainingPlanProtocol)modelTrainingPlan
{
  return self->_modelTrainingPlan;
}

- (void)setModelTrainingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_modelTrainingPlan, a3);
}

- (ATXCandidateRelevanceModelDataStoreProtocol)datastore
{
  return self->_datastore;
}

- (void)setDatastore:(id)a3
{
  objc_storeStrong((id *)&self->_datastore, a3);
}

- (ATXProactiveSuggestionClientModel)clientModel
{
  return self->_clientModel;
}

- (void)setClientModel:(id)a3
{
  objc_storeStrong((id *)&self->_clientModel, a3);
}

- (NSArray)featurizers
{
  return self->_featurizers;
}

- (NSString)abGroupIdentifier
{
  return self->_abGroupIdentifier;
}

- (NSSet)installedAppsKnownToSpringBoard
{
  return self->_installedAppsKnownToSpringBoard;
}

- (void)setInstalledAppsKnownToSpringBoard:(id)a3
{
  objc_storeStrong((id *)&self->_installedAppsKnownToSpringBoard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedAppsKnownToSpringBoard, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_featurizers, 0);
  objc_storeStrong((id *)&self->_clientModel, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
  objc_storeStrong((id *)&self->_modelTrainingPlan, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

void __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Error converting %@ to a class.", a5, a6, a7, a8, 2u);
}

void __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Duplicate featurizer defined: %@", a5, a6, a7, a8, 2u);
}

@end
