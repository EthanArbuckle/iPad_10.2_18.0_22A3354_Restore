@implementation ATXWidgetPredictionTrainingDatasetBuilder

- (ATXWidgetPredictionTrainingDatasetBuilder)initWithDistinctScoreCounts:(id)a3
{
  id v5;
  ATXWidgetPredictionTrainingDatasetBuilder *v6;
  ATXWidgetPredictionTrainingDatasetBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetPredictionTrainingDatasetBuilder;
  v6 = -[ATXWidgetPredictionTrainingDatasetBuilder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_distinctScoreCounts, a3);

  return v7;
}

- (void)populateAdditionalFeaturesWithMultiArray:(id)a3 forWidgetEngagementRecord:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0D81638];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "widgetBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tupleWithFirst:second:", v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_distinctScoreCounts, "objectForKeyedSubscript:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v11, 0);

}

- (id)createMLArrayBatchProviderFromTrainingArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  ATXWidgetPredictionTrainingDatasetBuilder *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _BYTE *v30;
  void *context;
  uint8_t buf;
  _BYTE v33[7];
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v30 = v33;
    v9 = *(_QWORD *)v36;
    v10 = 0x1E0C9E000uLL;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        context = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXWidgetPredictionTrainingDatasetBuilder featureDictionaryWithWidgetEngagementRecord:](self, "featureDictionaryWithWidgetEngagementRecord:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type") == 1 || (v14 = objc_msgSend(v12, "type"), v15 = CFSTR("Not Engaged"), v14 == 2))
          v15 = CFSTR("Engaged");
        objc_msgSend(*(id *)(v10 + 2328), "featureValueWithString:", v15, v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("classLabel"));

        v17 = objc_alloc(MEMORY[0x1E0C9E8F8]);
        v34 = 0;
        v18 = objc_msgSend(v17, "initWithDictionary:error:", v13, &v34);
        v19 = (void *)v18;
        if (v34)
          v20 = 1;
        else
          v20 = v18 == 0;
        v21 = !v20;
        if (v20)
        {
          v22 = v8;
          v23 = v9;
          v24 = self;
          v25 = v6;
          v26 = v5;
          __atxlog_handle_timeline();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[ATXWidgetPredictionTrainingDatasetBuilder createMLArrayBatchProviderFromTrainingArray:].cold.1(&buf, v30, v27);

          v5 = v26;
          v6 = v25;
          self = v24;
          v9 = v23;
          v8 = v22;
          v10 = 0x1E0C9E000;
        }
        else
        {
          objc_msgSend(v5, "addObject:", v18);
        }

        objc_autoreleasePoolPop(context);
        if (!v21)
        {

          v28 = 0;
          goto LABEL_25;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v8)
        continue;
      break;
    }
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v5);
LABEL_25:

  return v28;
}

- (id)featureDictionaryWithWidgetEngagementRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[ATXWidgetPredictionTrainingDatasetBuilder mlFeatureKeyMapping](self, "mlFeatureKeyMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[ATXWidgetPredictionTrainingDatasetBuilder mlFeatureValueForFeatureName:withWidgetEngagementRecord:withFeatureMapping:](self, "mlFeatureValueForFeatureName:withWidgetEngagementRecord:withFeatureMapping:", v12, v4, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)mlFeatureValueForFeatureName:(id)a3 withWidgetEngagementRecord:(id)a4 withFeatureMapping:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E83CF878, 65568, &v20);
  v12 = v20;
  if (v12)
  {
    __atxlog_handle_timeline();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXWidgetPredictionTrainingDatasetBuilder mlFeatureValueForFeatureName:withWidgetEngagementRecord:withFeatureMapping:].cold.1((uint64_t)v8, v13);

    v14 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      -[ATXWidgetPredictionTrainingDatasetBuilder propertyNameForInputFeatureName:](self, "propertyNameForInputFeatureName:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v18, 0);

    }
    else
    {
      -[ATXWidgetPredictionTrainingDatasetBuilder populateAdditionalFeaturesWithMultiArray:forWidgetEngagementRecord:](self, "populateAdditionalFeaturesWithMultiArray:forWidgetEngagementRecord:", v11, v9);
    }
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)mlFeatureKeyMapping
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("input_widget_family");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("input_unique_score_count");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)propertyNameForInputFeatureName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = CFSTR("input_widget_family");
  v10[0] = CFSTR("widgetFamily");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXWidgetPredictionTrainingDatasetBuilder propertyNameForInputFeatureName:].cold.1((uint64_t)v3, v6);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distinctScoreCounts, 0);
}

- (void)createMLArrayBatchProviderFromTrainingArray:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXWidgetPredictionTrainingDatasetBuilder: Error initializing MLDictionaryFeatureProvider", buf, 2u);
}

- (void)mlFeatureValueForFeatureName:(uint64_t)a1 withWidgetEngagementRecord:(NSObject *)a2 withFeatureMapping:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetPredictionTrainingDatasetBuilder: Error initializing MLMultiArray for input feature: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)propertyNameForInputFeatureName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "ATXWidgetPredictionTrainingDatasetBuilder: unexpected input feature: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
