@implementation ATXProactiveSuggestionClientModelEvaluator

- (ATXProactiveSuggestionClientModelEvaluator)init
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestionClientModelEvaluator *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -2592000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXProactiveSuggestionClientModelEvaluator initWithStartTime:endTime:](self, "initWithStartTime:endTime:", v7, v9);

  return v10;
}

- (ATXProactiveSuggestionClientModelEvaluator)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  ATXProactiveSuggestionClientModelEvaluatorPublishers *v8;
  ATXProactiveSuggestionClientModelEvaluator *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[ATXProactiveSuggestionClientModelEvaluatorPublishers initWithStartTime:endTime:]([ATXProactiveSuggestionClientModelEvaluatorPublishers alloc], "initWithStartTime:endTime:", v7, v6);

  v9 = -[ATXProactiveSuggestionClientModelEvaluator initWithPublishers:](self, "initWithPublishers:", v8);
  return v9;
}

- (ATXProactiveSuggestionClientModelEvaluator)initWithPublishers:(id)a3
{
  id v5;
  ATXProactiveSuggestionClientModelEvaluator *v6;
  ATXProactiveSuggestionClientModelEvaluator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXProactiveSuggestionClientModelEvaluator;
  v6 = -[ATXProactiveSuggestionClientModelEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_publishers, a3);

  return v7;
}

- (id)uiPublisherWithDeduplicatedEngagements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  -[ATXProactiveSuggestionClientModelEvaluatorPublishers uiPublisher](self->_publishers, "uiPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__ATXProactiveSuggestionClientModelEvaluator_uiPublisherWithDeduplicatedEngagements__block_invoke;
  v9[3] = &unk_1E82DF748;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "filterWithIsIncluded:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapWithTransform:", &__block_literal_global_167);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __84__ATXProactiveSuggestionClientModelEvaluator_uiPublisherWithDeduplicatedEngagements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "engagedSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "sessionStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "engagedSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

    v11 = v8 ^ 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __84__ATXProactiveSuggestionClientModelEvaluator_uiPublisherWithDeduplicatedEngagements__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "engagedSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConsumerSubType:", objc_msgSend(v6, "consumerSubType"));

  v7 = objc_alloc(MEMORY[0x1E0CF94A8]);
  objc_msgSend(v2, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sessionStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v10 = (void *)objc_msgSend(v7, "initWithEventBody:timestamp:", v5);

  return v10;
}

- (id)shadowResultForSuggestionExecutableType:(int64_t)a3 clientModelName:(id)a4 removeDockedApps:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXProactiveSuggestionClientModelEvaluationResult *v17;
  id v18;
  _QWORD v20[4];
  ATXProactiveSuggestionClientModelEvaluationResult *v21;
  _QWORD v22[4];
  id v23;

  v5 = a5;
  v8 = a4;
  -[ATXProactiveSuggestionClientModelEvaluatorPublishers clientModelCacheUpdatePublisher](self->_publishers, "clientModelCacheUpdatePublisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke;
  v22[3] = &unk_1E82DF748;
  v23 = v8;
  v11 = v8;
  objc_msgSend(v9, "filterWithIsIncluded:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXProactiveSuggestionClientModelEvaluatorPublishers shadowCandidatePublisher](self->_publishers, "shadowCandidatePublisher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedMergeWithOther:comparator:", v12, &__block_literal_global_170);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "eventAndRecentCacheUpdatePublisher:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filterWithIsIncluded:", &__block_literal_global_172);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5;
  v20[3] = &unk_1E82E0268;
  v17 = -[ATXProactiveSuggestionClientModelEvaluationResult initWithSessionType:executableType:removeDockedApps:]([ATXProactiveSuggestionClientModelEvaluationResult alloc], "initWithSessionType:executableType:removeDockedApps:", 0, a3, v5);
  v21 = v17;
  v18 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_176, v20);

  return v17;
}

uint64_t __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unsigned __int8 isKindOfClass;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v2, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return isKindOfClass & (v6 != 0);
}

void __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 0, 0.0);
  v8 = objc_alloc(MEMORY[0x1E0D81180]);
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:", v9, objc_msgSend(v5, "suggestionExecutableType"), v7, 0);

  objc_msgSend(v10, "setConsumerSubType:", 15);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "suggestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateCountsForSessionsWithShownSuggestions:engagedSuggestions:rejectedSuggestions:", v12, v13, MEMORY[0x1E0C9AA60]);

}

- (id)uiResultForSuggestionExecutableType:(int64_t)a3 clientModelName:(id)a4 removeDockedApps:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXProactiveSuggestionClientModelEvaluationResult *v17;
  id v18;
  _QWORD v20[4];
  ATXProactiveSuggestionClientModelEvaluationResult *v21;
  _QWORD v22[4];
  id v23;

  v5 = a5;
  v8 = a4;
  -[ATXProactiveSuggestionClientModelEvaluatorPublishers clientModelCacheUpdatePublisher](self->_publishers, "clientModelCacheUpdatePublisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke;
  v22[3] = &unk_1E82DF748;
  v23 = v8;
  v11 = v8;
  objc_msgSend(v9, "filterWithIsIncluded:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXProactiveSuggestionClientModelEvaluator uiPublisherWithDeduplicatedEngagements](self, "uiPublisherWithDeduplicatedEngagements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedMergeWithOther:comparator:", v12, &__block_literal_global_181);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "eventAndRecentCacheUpdatePublisher:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filterWithIsIncluded:", &__block_literal_global_182);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5;
  v20[3] = &unk_1E82E0268;
  v17 = -[ATXProactiveSuggestionClientModelEvaluationResult initWithSessionType:executableType:removeDockedApps:]([ATXProactiveSuggestionClientModelEvaluationResult alloc], "initWithSessionType:executableType:removeDockedApps:", 1, a3, v5);
  v21 = v17;
  v18 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_183, v20);

  return v17;
}

uint64_t __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unsigned __int8 isKindOfClass;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v2, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return isKindOfClass & (v6 != 0);
}

void __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "suggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateCountsForSessionsWithShownSuggestions:engagedSuggestions:rejectedSuggestions:", v8, v9, MEMORY[0x1E0C9AA60]);

}

- (id)resultForClientModelName:(id)a3 suggestionExecutableType:(int64_t)a4 sessionType:(unint64_t)a5 removeDockedApps:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;

  v6 = a6;
  v10 = a3;
  if (!a5)
  {
    -[ATXProactiveSuggestionClientModelEvaluator shadowResultForSuggestionExecutableType:clientModelName:removeDockedApps:](self, "shadowResultForSuggestionExecutableType:clientModelName:removeDockedApps:", a4, v10, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    -[ATXProactiveSuggestionClientModelEvaluator uiResultForSuggestionExecutableType:clientModelName:removeDockedApps:](self, "uiResultForSuggestionExecutableType:clientModelName:removeDockedApps:", a4, v10, v6);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v11;
    goto LABEL_9;
  }
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:].cold.1(a4, v13, v14);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("resultForClientModelName called with invalid suggestionExecutableType value of %lu"), a4);
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)evaluationResultsForClientModelName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = objc_msgSend(&unk_1E83CF968, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(&unk_1E83CF968);
        v20 = v6;
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v6);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v8 = objc_msgSend(&unk_1E83CF980, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(&unk_1E83CF980);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
              v13 = objc_msgSend(v7, "integerValue");
              v14 = objc_msgSend(v12, "integerValue");
              -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](self, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v4, v14, v13, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "numberOfSessionsWithPredictions"))
                objc_msgSend(v5, "addObject:", v15);
              if (v14 == 1)
              {
                -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](self, "resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:", v4, 1, v13, 1);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v16, "numberOfSessionsWithPredictions"))
                  objc_msgSend(v5, "addObject:", v16);
              }
              else
              {
                v16 = v15;
              }

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(&unk_1E83CF980, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }
        v6 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(&unk_1E83CF968, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

  return v5;
}

+ (id)eventAndRecentCacheUpdatePublisher:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0D81638];
  v5 = a3;
  objc_msgSend(v4, "tupleWithFirst:second:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke;
  v9[3] = &__block_descriptor_40_e70____PASTuple2_24__0___PASTuple2_8__NSObject_ATXBMStoreEventProtocol__16l;
  v9[4] = a1;
  objc_msgSend(v5, "scanWithInitial:nextPartialResult:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;

      v9 = v10;
    }
    objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v6, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke_cold_1(a1, v12);

    v11 = v5;
  }

  objc_autoreleasePoolPop(v7);
  return v11;
}

+ (id)resultFromResults:(id)a3 withSessionType:(unint64_t)a4 executableType:(int64_t)a5 removeDockedApps:(BOOL)a6
{
  int v6;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = a3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "sessionType", (_QWORD)v17) == a4
          && objc_msgSend(v14, "executableType") == a5
          && objc_msgSend(v14, "removeDockedApps") == v6)
        {
          v15 = v14;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (ATXProactiveSuggestionClientModelEvaluatorPublishers)publishers
{
  return self->_publishers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishers, 0);
}

- (void)resultForClientModelName:(uint64_t)a3 suggestionExecutableType:sessionType:removeDockedApps:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "resultForClientModelName called with invalid suggestionExecutableType value of %lu", (uint8_t *)&v3);
}

void __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v5, "%@ - Event can't be deserialized in eventAndRecentCacheUpdatePublisher", (uint8_t *)&v6);

}

@end
