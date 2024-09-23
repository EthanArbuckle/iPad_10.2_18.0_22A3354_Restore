@implementation ATXActionResolution

- (ATXActionResolution)init
{
  void *v3;
  void *v4;
  ATXActionResolution *v5;

  v3 = (void *)objc_opt_new();
  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXActionResolution initWithSlotResolver:predictionContextBuilder:](self, "initWithSlotResolver:predictionContextBuilder:", v3, v4);

  return v5;
}

- (ATXActionResolution)initWithSlotResolver:(id)a3 predictionContextBuilder:(id)a4
{
  id v7;
  id v8;
  ATXActionResolution *v9;
  ATXActionResolution *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXActionResolution;
  v9 = -[ATXActionResolution init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotResolver, a3);
    objc_storeStrong((id *)&v10->_predictionContextBuilder, a4);
  }

  return v10;
}

- (id)statisticsForActionKey:(id)a3
{
  id v4;
  ATXSlotResolution *slotResolver;
  void *v6;
  void *v7;

  v4 = a3;
  slotResolver = self->_slotResolver;
  -[ATXPredictionContextBuilderProtocol predictionContextForCurrentContext](self->_predictionContextBuilder, "predictionContextForCurrentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSlotResolution statisticsForActionKey:context:](slotResolver, "statisticsForActionKey:context:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)statisticsForActionKey:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[ATXSlotResolution statisticsForActionKey:context:](self->_slotResolver, "statisticsForActionKey:context:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXActionResolution statisticsForActionKey:context:].cold.1(v9);

    v8 = 0;
  }

  return v8;
}

- (id)actionPredictionsForActionKey:(id)a3 statistics:(id)a4 appActionPredictionItem:(const ATXPredictionItem *)a5 appActionLogProbability:(double)a6 scoreLogger:(id)a7 andLimit:(int)a8 forMagicalMoments:(BOOL)a9 currentDate:(id)a10
{
  -[ATXActionResolution actionPredictionsForActionKey:statistics:appActionPredictionItem:appActionLogProbability:scoreLogger:andLimit:forMagicalMoments:predictionItemsToKeep:currentDate:](self, "actionPredictionsForActionKey:statistics:appActionPredictionItem:appActionLogProbability:scoreLogger:andLimit:forMagicalMoments:predictionItemsToKeep:currentDate:", a3, a4, a5, a7, *(_QWORD *)&a8, a9, a6, 0, a10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionPredictionsForActionKey:(id)a3 statistics:(id)a4 appActionPredictionItem:(const ATXPredictionItem *)a5 appActionLogProbability:(double)a6 scoreLogger:(id)a7 andLimit:(int)a8 forMagicalMoments:(BOOL)a9 predictionItemsToKeep:(void *)a10 currentDate:(id)a11
{
  uint64_t v11;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  int v34;
  id v35;
  uint64_t v36;

  v11 = *(_QWORD *)&a8;
  v36 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  -[ATXSlotResolution actionPredictionsForStatistics:appActionPredictionItem:appActionLogProbability:scoreLogger:currentDate:](self->_slotResolver, "actionPredictionsForStatistics:appActionPredictionItem:appActionLogProbability:scoreLogger:currentDate:", v18, a5, a7, a11, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionPredictionsHelpers processCandidateActionPredictions:limit:predictionItemsToKeep:](ATXActionPredictionsHelpers, "processCandidateActionPredictions:limit:predictionItemsToKeep:", v19, v11, a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "first");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "second");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v22 && v23)
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "isEqualToString:", v26);

    if (v27)
    {
      v28 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isSystemAppForBundleId:", v22);
      objc_msgSend(MEMORY[0x1E0CF9170], "getUpcomingMediaForBundle:isInternalApplication:", v22, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXMediaActionPrediction updatePlayMediaActionPredictions:withUpcomingMedia:forActionKey:appActionPredictionItem:appActionLogProbability:statistics:](ATXMediaActionPrediction, "updatePlayMediaActionPredictions:withUpcomingMedia:forActionKey:appActionPredictionItem:appActionLogProbability:statistics:", v20, v29, v17, a5, v18, a6);
      v30 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v30;
    }
    +[_ATXActionUtils filterContainersWithNilAction:](_ATXActionUtils, "filterContainersWithNilAction:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_default();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 138412290;
      v35 = v17;
      _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "Error parsing '%@'", (uint8_t *)&v34, 0xCu);
    }

    v31 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_slotResolver, 0);
}

- (void)statisticsForActionKey:(os_log_t)log context:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Can't generate statistics for action key since ATXPredictionContext is nil", v1, 2u);
}

@end
