@implementation ATXInferredModesAccumulator

- (ATXInferredModesAccumulator)init
{
  ATXInferredModesAccumulator *v2;
  uint64_t v3;
  NSMutableArray *inferredModeStartingEvents;
  uint64_t v5;
  NSMutableArray *usageInsightsInferredModeEvents;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXInferredModesAccumulator;
  v2 = -[ATXInferredModesAccumulator init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    inferredModeStartingEvents = v2->_inferredModeStartingEvents;
    v2->_inferredModeStartingEvents = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    usageInsightsInferredModeEvents = v2->_usageInsightsInferredModeEvents;
    v2->_usageInsightsInferredModeEvents = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)usageInsightsInferredATXModeEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSMutableArray *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UserFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "InferredMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atx_publisherFromStartDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15[0] = &v14;
  v15[1] = 0x3032000000;
  v15[2] = __Block_byref_object_copy__83;
  v15[3] = __Block_byref_object_dispose__83;
  v16 = 0;
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke;
  v13[3] = &unk_1E82DB658;
  v13[4] = &v14;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke_2;
  v12[3] = &unk_1E82DB0C8;
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", v13, v12);
  if (*(_QWORD *)(v15[0] + 40))
  {
    __atxlog_handle_usage_insights();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXInferredModesAccumulator usageInsightsInferredATXModeEvents].cold.1((uint64_t)v15, v9);

  }
  v10 = self->_usageInsightsInferredModeEvents;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "eventBody");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStart"))
  {
    objc_msgSend(*(id *)(a1 + 32), "recordInferredModeStartEvent:", v3);
  }
  else if ((objc_msgSend(v3, "isStart") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordInferredModeEndEvent:", v3);
  }

}

- (void)recordInferredModeStartEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_inferredModeStartingEvents, "addObject:", a3);
}

- (void)recordInferredModeEndEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  ATXInferredModesAccumulator *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_inferredModeStartingEvents, "copy");
  v6 = (void *)MEMORY[0x1E0C99E60];
  allModesForTraining();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v5;
  v10 = (void *)v8;
  v11 = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    v34 = *(_QWORD *)v37;
    do
    {
      v15 = 0;
      v35 = v13;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
        v17 = objc_msgSend(v4, "modeType", v34);
        if (v17 == objc_msgSend(v16, "modeType"))
        {
          objc_msgSend(v16, "absoluteTimestamp");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceReferenceDate");
          v20 = v19;
          objc_msgSend(v4, "absoluteTimestamp");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v23 = v22;

          if (v20 < v23)
          {
            objc_msgSend(v4, "modeType");
            BMUserFocusInferredModeTypeToActivity();
            v24 = ATXModeFromActivityType();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v10, "containsObject:", v25);

            if (v26)
            {
              v27 = objc_alloc(MEMORY[0x1E0CF9180]);
              objc_msgSend(v16, "absoluteTimestamp");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "absoluteTimestamp");
              v29 = v11;
              v30 = v10;
              v31 = self;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(v27, "initWithATXMode:startTime:endTime:", v24, v28, v32);

              self = v31;
              v10 = v30;
              v11 = v29;
              v14 = v34;

              -[NSMutableArray addObject:](self->_usageInsightsInferredModeEvents, "addObject:", v33);
            }
            -[NSMutableArray removeObject:](self->_inferredModeStartingEvents, "removeObject:", v16);
            v13 = v35;
          }
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageInsightsInferredModeEvents, 0);
  objc_storeStrong((id *)&self->_inferredModeStartingEvents, 0);
}

- (void)usageInsightsInferredATXModeEvents
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315394;
  v4 = "-[ATXInferredModesAccumulator usageInsightsInferredATXModeEvents]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading inferred mode stream: %@", (uint8_t *)&v3, 0x16u);
}

@end
