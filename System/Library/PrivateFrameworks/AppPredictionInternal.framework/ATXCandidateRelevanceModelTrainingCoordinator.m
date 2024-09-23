@implementation ATXCandidateRelevanceModelTrainingCoordinator

- (ATXCandidateRelevanceModelTrainingCoordinator)init
{
  void *v3;
  ATXCandidateRelevanceModelTrainingCoordinator *v4;

  allRelevanceModelConfigs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXCandidateRelevanceModelTrainingCoordinator initWithConfigs:](self, "initWithConfigs:", v3);

  return v4;
}

- (ATXCandidateRelevanceModelTrainingCoordinator)initWithConfigs:(id)a3
{
  id v5;
  ATXCandidateRelevanceModelTrainingCoordinator *v6;
  ATXCandidateRelevanceModelTrainingCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelTrainingCoordinator;
  v6 = -[ATXCandidateRelevanceModelTrainingCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configs, a3);

  return v7;
}

- (void)trainWithXPCActivity:(id)a3 disregardDatasetMetadataRequirements:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_relevance_model();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model training for all configs.", buf, 0xCu);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_configs;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[ATXCandidateRelevanceModelTrainingCoordinator trainUsingConfig:xpcActivity:disregardDatasetMetadataRequirements:](self, "trainUsingConfig:xpcActivity:disregardDatasetMetadataRequirements:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v6, v4, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)trainUsingConfig:(id)a3 xpcActivity:(id)a4 disregardDatasetMetadataRequirements:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  ATXCandidateRelevanceModelTrainer *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[ATXCandidateRelevanceModelTrainer initWithConfig:]([ATXCandidateRelevanceModelTrainer alloc], "initWithConfig:", v8);

  -[ATXCandidateRelevanceModelTrainer trainWithXPCActivity:disregardDatasetMetadataRequirements:](v9, "trainWithXPCActivity:disregardDatasetMetadataRequirements:", v7, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configs, 0);
}

@end
