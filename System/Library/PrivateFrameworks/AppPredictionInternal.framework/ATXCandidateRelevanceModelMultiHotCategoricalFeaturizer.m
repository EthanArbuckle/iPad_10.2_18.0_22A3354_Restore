@implementation ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer

- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)init
{
  void *v3;
  ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer initWithObservedFeatureValueCounts:](self, "initWithObservedFeatureValueCounts:", v3);

  return v4;
}

- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)initWithObservedFeatureValueCounts:(id)a3
{
  id v4;
  void *v5;
  ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *v6;

  v4 = a3;
  +[ATXCandidateRelevanceModelGlobals sharedInstance](ATXCandidateRelevanceModelGlobals, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer initWithObservedFeatureValueCounts:maxCategoricalFeaturesCount:](self, "initWithObservedFeatureValueCounts:maxCategoricalFeaturesCount:", v4, (int)objc_msgSend(v5, "maxCategoricalFeaturesCount"));

  return v6;
}

- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)initWithObservedFeatureValueCounts:(id)a3 maxCategoricalFeaturesCount:(unint64_t)a4
{
  id v7;
  ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *v8;
  ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer;
  v8 = -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_observedFeatureValueCounts, a3);
    v9->_maxCategoricalFeaturesCount = a4;
  }

  return v9;
}

- (id)featureVectorForContext:(id)a3 candidate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer categoricalFeatureValuesForContext:candidate:](self, "categoricalFeatureValuesForContext:candidate:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ATXImmutableCandidateRelevanceModelFeaturizer featureValueNames](self, "featureValueNames", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "containsObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14)));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v8;
}

- (void)observeContext:(id)a3 candidate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  NSMutableDictionary *observedFeatureValueCounts;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer categoricalFeatureValuesForContext:candidate:](self, "categoricalFeatureValuesForContext:candidate:", a3, a4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_observedFeatureValueCounts, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        observedFeatureValueCounts = self->_observedFeatureValueCounts;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 + 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](observedFeatureValueCounts, "setObject:forKey:", v13, v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

- (id)immutableCopy
{
  ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *v2;
  void *v3;
  ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *v4;

  v2 = self;
  -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer computeFeatureValueNames](v2, "computeFeatureValueNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](v2, "initWithFeatureValueNames:", v3);

  return v4;
}

- (id)computeFeatureValueNames
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  unint64_t maxCategoricalFeaturesCount;
  uint64_t v10;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_observedFeatureValueCounts, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer_computeFeatureValueNames__block_invoke;
  v12[3] = &unk_1E82DC570;
  v12[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") > self->_maxCategoricalFeaturesCount)
  {
    __atxlog_handle_relevance_model();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "count");
      maxCategoricalFeaturesCount = self->_maxCategoricalFeaturesCount;
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = maxCategoricalFeaturesCount;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Pruning feature value names because there were %lu values observed which is more than the max of %lu values.", buf, 0x20u);

    }
    objc_msgSend(v4, "subarrayWithRange:", 0, self->_maxCategoricalFeaturesCount);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  return v4;
}

uint64_t __83__ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer_computeFeatureValueNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!v9)
    v9 = objc_msgSend(v5, "compare:", v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedFeatureValueCounts, 0);
}

@end
