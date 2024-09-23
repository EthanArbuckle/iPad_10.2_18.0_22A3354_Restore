@implementation ATXMagicalMomentsPredictionScorer

- (ATXMagicalMomentsPredictionScorer)initWithCorrelatedEvents:(id)a3 andGlobalAppLaunchCountedSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ATXMagicalMomentsPredictionScorer *v10;
  id *p_isa;
  ATXMagicalMomentsPredictionScorer *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8 && objc_msgSend(v7, "count") && objc_msgSend(v9, "count"))
  {
    v15.receiver = self;
    v15.super_class = (Class)ATXMagicalMomentsPredictionScorer;
    v10 = -[ATXMagicalMomentsPredictionScorer init](&v15, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_globalAppLaunches, a4);
      objc_storeStrong(p_isa + 1, a3);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_INFO, "Attempted to initialize a Magical Moments Prediction Scorer without passing global app launch counts or relevant correlated events. Nothing to predict for this sub-expert!", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)computeRelevanceScoresForAllRelevantBundleIds
{
  NSCountedSet *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  NSUInteger v23;
  __int16 v24;
  NSUInteger v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_relevantAppLaunches;
  v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138413058;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[ATXMagicalMomentsPredictionScorer relevanceScoreForBundleId:](self, "relevanceScoreForBundleId:", v9, v15, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relevanceWeightsByIdentifier, "setObject:forKeyedSubscript:", v10, v9);

        self->_totalRelevantLaunchesForAllBundleIds += -[NSCountedSet countForObject:](self->_relevantAppLaunches, "countForObject:", v9);
        __atxlog_handle_default();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = -[NSCountedSet countForObject:](self->_relevantAppLaunches, "countForObject:", v9);
          v13 = -[NSCountedSet countForObject:](self->_globalAppLaunches, "countForObject:", v9);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_relevanceWeightsByIdentifier, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v21 = v9;
          v22 = 2048;
          v23 = v12;
          v24 = 2048;
          v25 = v13;
          v26 = 2112;
          v27 = v14;
          _os_log_debug_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEBUG, "ATXMM: ==> bundleId: %@, relevant launches: %lu, global launches: %lu, relevance weight: %@", buf, 0x2Au);

        }
      }
      v6 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
    }
    while (v6);
  }

}

- (void)getRelevantAppLaunchCountsAndDateSetFromCorrelationData
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *dateSetForDecay;
  NSCountedSet *v5;
  NSCountedSet *relevantAppLaunches;
  NSMutableDictionary *v7;
  NSMutableDictionary *relevanceWeightsByIdentifier;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *numUniqueAnchorOccurrencesPerCandidate;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSCountedSet *v19;
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
  NSArray *obj;
  uint64_t v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableOrderedSet *)objc_opt_new();
  dateSetForDecay = self->_dateSetForDecay;
  self->_dateSetForDecay = v3;

  v5 = (NSCountedSet *)objc_opt_new();
  relevantAppLaunches = self->_relevantAppLaunches;
  self->_relevantAppLaunches = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  relevanceWeightsByIdentifier = self->_relevanceWeightsByIdentifier;
  self->_relevanceWeightsByIdentifier = v7;

  self->_totalRelevantLaunchesForAllBundleIds = 0;
  v9 = (void *)objc_opt_new();
  v10 = (NSMutableDictionary *)objc_opt_new();
  numUniqueAnchorOccurrencesPerCandidate = self->_numUniqueAnchorOccurrencesPerCandidate;
  self->_numUniqueAnchorOccurrencesPerCandidate = v10;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_correlatedEvents;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v34 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v15, "firstEvent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXMagicalMomentsPredictionScorer startOfDayForDate:](self, "startOfDayForDate:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableOrderedSet addObject:](self->_dateSetForDecay, "addObject:", v18);
        v19 = self->_relevantAppLaunches;
        objc_msgSend(v15, "secondEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCountedSet addObject:](v19, "addObject:", v21);

        objc_msgSend(v15, "secondEvent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v25 = (void *)objc_opt_new();
          objc_msgSend(v15, "secondEvent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, v27);

        }
        objc_msgSend(v15, "secondEvent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstEvent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "startDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v32);

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __92__ATXMagicalMomentsPredictionScorer_getRelevantAppLaunchCountsAndDateSetFromCorrelationData__block_invoke;
  v35[3] = &unk_1E82E0908;
  v35[4] = self;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v35);
  -[NSMutableOrderedSet sortUsingComparator:](self->_dateSetForDecay, "sortUsingComparator:", &__block_literal_global_78);
  -[ATXMagicalMomentsPredictionScorer computeRelevanceScoresForAllRelevantBundleIds](self, "computeRelevanceScoresForAllRelevantBundleIds");

}

void __92__ATXMagicalMomentsPredictionScorer_getRelevantAppLaunchCountsAndDateSetFromCorrelationData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v7, v6);

}

uint64_t __92__ATXMagicalMomentsPredictionScorer_getRelevantAppLaunchCountsAndDateSetFromCorrelationData__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (BOOL)subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions
{
  NSCountedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_relevantAppLaunches;
  v4 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (-[NSCountedSet countForObject:](self->_relevantAppLaunches, "countForObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) >= 7)
        {
          __atxlog_handle_default();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions].cold.2();

          v8 = 1;
          goto LABEL_15;
        }
      }
      v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  __atxlog_handle_default();
  v3 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v3->super.super.super, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions].cold.1();
  v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions
{
  unint64_t *p_totalRelevantLaunchesForAllBundleIds;
  NSObject *v4;
  BOOL v5;

  p_totalRelevantLaunchesForAllBundleIds = &self->_totalRelevantLaunchesForAllBundleIds;
  if (self->_totalRelevantLaunchesForAllBundleIds < 0xF
    || (unint64_t)-[NSCountedSet count](self->_relevantAppLaunches, "count") < 3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions].cold.2((uint64_t)self, (uint64_t)p_totalRelevantLaunchesForAllBundleIds, v4);
    v5 = 0;
  }
  else
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions].cold.1((id *)&self->_relevantAppLaunches, (uint64_t)p_totalRelevantLaunchesForAllBundleIds, v4);
    v5 = 1;
  }

  return v5;
}

- (BOOL)subExpertHasWitnessedEnoughRelevantAppLaunches
{
  NSObject *v3;
  _BOOL4 v4;

  if (-[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions](self, "subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions"))
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertHasWitnessedEnoughRelevantAppLaunches].cold.1();
LABEL_7:

    LOBYTE(v4) = 1;
    return v4;
  }
  v4 = -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions](self, "subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions");
  if (v4)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertHasWitnessedEnoughRelevantAppLaunches].cold.2();
    goto LABEL_7;
  }
  return v4;
}

- (BOOL)subExpertCanMakeHighConfidencePredictions
{
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableOrderedSet count](self->_dateSetForDecay, "count");
  if (v3 >= -[ATXMagicalMomentsPredictionScorer minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions](self, "minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions"))
  {
    if (-[ATXMagicalMomentsPredictionScorer subExpertHasWitnessedEnoughRelevantAppLaunches](self, "subExpertHasWitnessedEnoughRelevantAppLaunches"))
    {
      return 1;
    }
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v6 = "ATXMM: Subexpert has not observed enough relevant app launches to confidently make predictions.";
      v7 = v4;
      v8 = 2;
      goto LABEL_8;
    }
  }
  else
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSMutableOrderedSet count](self->_dateSetForDecay, "count");
      v10 = 134218240;
      v11 = v5;
      v12 = 2048;
      v13 = -[ATXMagicalMomentsPredictionScorer minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions](self, "minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions");
      v6 = "ATXMM: Subexpert has only been observed on %lu unique days. Minimum days required is %lu.";
      v7 = v4;
      v8 = 22;
LABEL_8:
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }

  return 0;
}

- (BOOL)subExpertCanMakeHighConfidencePredictionsForBundleId:(id)a3
{
  NSCountedSet *relevantAppLaunches;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;

  relevantAppLaunches = self->_relevantAppLaunches;
  v5 = a3;
  v6 = -[NSCountedSet countForObject:](relevantAppLaunches, "countForObject:", v5);
  v7 = -[NSCountedSet countForObject:](self->_globalAppLaunches, "countForObject:", v5);
  -[NSMutableDictionary objectForKey:](self->_numUniqueAnchorOccurrencesPerCandidate, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v7 < -[ATXMagicalMomentsPredictionScorer minimumNumberOfGlobalObservationsOfBundleIdForMMScoring](self, "minimumNumberOfGlobalObservationsOfBundleIdForMMScoring"))
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:].cold.1();
LABEL_10:

    return 0;
  }
  if (v6 < -[ATXMagicalMomentsPredictionScorer minimumNumberOfRelevantObservationsOfBundleIdForMMScoring](self, "minimumNumberOfRelevantObservationsOfBundleIdForMMScoring"))
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:].cold.2();
    goto LABEL_10;
  }
  if (v9 < -[ATXMagicalMomentsPredictionScorer minimumNumberOfUniqueAnchorOccurrencesForBundleIdForMMScoring](self, "minimumNumberOfUniqueAnchorOccurrencesForBundleIdForMMScoring"))
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:].cold.3();
    goto LABEL_10;
  }
  return 1;
}

- (id)relevanceScoreForBundleId:(id)a3
{
  NSCountedSet *relevantAppLaunches;
  id v5;
  unint64_t v6;
  double v7;
  BOOL v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;

  relevantAppLaunches = self->_relevantAppLaunches;
  v5 = a3;
  v6 = -[NSCountedSet countForObject:](relevantAppLaunches, "countForObject:", v5);
  v7 = (double)v6 / (double)-[NSCountedSet countForObject:](self->_globalAppLaunches, "countForObject:", v5);
  v8 = -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:](self, "subExpertCanMakeHighConfidencePredictionsForBundleId:", v5);

  if (!v8)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer relevanceScoreForBundleId:].cold.1();

    -[ATXMagicalMomentsPredictionScorer minimumRelevanceWeightForMMScoring](self, "minimumRelevanceWeightForMMScoring");
    v7 = v7 * v10;
  }
  -[ATXMagicalMomentsPredictionScorer maximumRelevanceWeightForMMScoring](self, "maximumRelevanceWeightForMMScoring");
  if (v7 > v11)
  {
    -[ATXMagicalMomentsPredictionScorer maximumRelevanceWeightForMMScoring](self, "maximumRelevanceWeightForMMScoring");
    v7 = v12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generatePredictions
{
  NSObject *v3;
  NSObject *v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];

  if (self->_finalPredictionConfidences)
  {
LABEL_16:
    -[ATXMagicalMomentsPredictionScorer getPredictionsFromFinalConfidences](self, "getPredictionsFromFinalConfidences");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.6();

  -[ATXMagicalMomentsPredictionScorer getRelevantAppLaunchCountsAndDateSetFromCorrelationData](self, "getRelevantAppLaunchCountsAndDateSetFromCorrelationData");
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.5();

  v5 = -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictions](self, "subExpertCanMakeHighConfidencePredictions");
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.4();

    -[ATXMagicalMomentsPredictionScorer computeTimeDecayedCumulativeScores](self, "computeTimeDecayedCumulativeScores");
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.3();

    -[ATXMagicalMomentsPredictionScorer scaleAllScoresWithTopScoringFactor](self, "scaleAllScoresWithTopScoringFactor");
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.2();

    -[ATXMagicalMomentsPredictionScorer computeModelConfidences](self, "computeModelConfidences");
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.1();

    goto LABEL_16;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "ATXMM: Failed to meet quality control criteria. Nothing to predict for this sub-expert!", v12, 2u);
  }

  return MEMORY[0x1E0C9AA60];
}

- (void)computeTimeDecayedCumulativeScores
{
  NSMutableDictionary *v3;
  NSMutableDictionary *cumulativeScoresWithDecayedWeightsByIdentifier;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  long double v13;
  NSMutableDictionary *relevanceWeightsByIdentifier;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  NSString *v42;
  NSString *topScoringIdentifier;
  NSMutableDictionary *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  NSObject *v50;
  NSUInteger v51;
  void *v52;
  void *v53;
  NSArray *obj;
  id obja;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  __int16 v68;
  NSUInteger v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (!self->_cumulativeScoresWithDecayedWeightsByIdentifier)
  {
    v3 = (NSMutableDictionary *)objc_opt_new();
    cumulativeScoresWithDecayedWeightsByIdentifier = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
    self->_cumulativeScoresWithDecayedWeightsByIdentifier = v3;

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = self->_correlatedEvents;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v61 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v9, "firstEvent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXMagicalMomentsPredictionScorer startOfDayForDate:](self, "startOfDayForDate:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (double)(unint64_t)-[NSMutableOrderedSet indexOfObject:](self->_dateSetForDecay, "indexOfObject:", v12);
          relevanceWeightsByIdentifier = self->_relevanceWeightsByIdentifier;
          objc_msgSend(v9, "secondEvent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](relevanceWeightsByIdentifier, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;
          v20 = pow(0.99, v13);

          v21 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
          objc_msgSend(v9, "secondEvent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            v25 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
            objc_msgSend(v9, "secondEvent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", &unk_1E83CC820, v27);

          }
          v28 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
          objc_msgSend(v9, "secondEvent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v20 * v19 + v32;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
          objc_msgSend(v9, "secondEvent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v34, v37);

          if (!self->_topScoringIdentifier
            || (-[NSMutableDictionary objectForKeyedSubscript:](self->_cumulativeScoresWithDecayedWeightsByIdentifier, "objectForKeyedSubscript:"), v38 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v38, "doubleValue"), v40 = v39, v38, v33 > v40))
          {
            objc_msgSend(v9, "secondEvent");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "identifier");
            v42 = (NSString *)objc_claimAutoreleasedReturnValue();
            topScoringIdentifier = self->_topScoringIdentifier;
            self->_topScoringIdentifier = v42;

          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      }
      while (v6);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v44 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
    v45 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v57 != v47)
            objc_enumerationMutation(v44);
          v49 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
          __atxlog_handle_default();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            obja = -[NSCountedSet countForObject:](self->_relevantAppLaunches, "countForObject:", v49);
            v51 = -[NSCountedSet countForObject:](self->_globalAppLaunches, "countForObject:", v49);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_relevanceWeightsByIdentifier, "objectForKeyedSubscript:", v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](self->_cumulativeScoresWithDecayedWeightsByIdentifier, "objectForKeyedSubscript:", v49);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v65 = v49;
            v66 = 2048;
            v67 = obja;
            v68 = 2048;
            v69 = v51;
            v70 = 2112;
            v71 = v52;
            v72 = 2112;
            v73 = v53;
            _os_log_debug_impl(&dword_1C9A3B000, v50, OS_LOG_TYPE_DEBUG, "ATXMM: ==> bundleId: %@, relevant launches: %lu, global launches: %lu, relevance weight: %@, decayed cumulative score: %@", buf, 0x34u);

          }
        }
        v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
      }
      while (v46);
    }

  }
}

- (double)scalingFactorFromTopPrediction
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cumulativeScoresWithDecayedWeightsByIdentifier, "objectForKeyedSubscript:", self->_topScoringIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return (double)-[NSCountedSet countForObject:](self->_relevantAppLaunches, "countForObject:", self->_topScoringIdentifier)/ v5;
}

- (void)scaleAllScoresWithTopScoringFactor
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "ATXMM: Scaling Factor: %f", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)computeModelConfidences
{
  NSMutableDictionary *v3;
  NSMutableDictionary *finalPredictionConfidences;
  NSMutableDictionary *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  double totalScaledCumulativeScoresForAllBundleIds;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)objc_opt_new();
  finalPredictionConfidences = self->_finalPredictionConfidences;
  self->_finalPredictionConfidences = v3;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 134218498;
    v23 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(double *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cumulativeScoresWithDecayedWeightsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)&v11, v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        v15 = v14 + 1.0;
        v16 = self->_totalScaledCumulativeScoresForAllBundleIds + 1.0 - v14;
        if (v14 + 1.0 < 1.0 && fabs(v15 + -1.0) >= 0.00001 || v16 < 1.0 && fabs(v16 + -1.0) >= 0.00001)
        {
          __atxlog_handle_default();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            totalScaledCumulativeScoresForAllBundleIds = self->_totalScaledCumulativeScoresForAllBundleIds;
            *(_DWORD *)buf = v23;
            v29 = totalScaledCumulativeScoresForAllBundleIds;
            v30 = 2048;
            v31 = v14;
            v32 = 2112;
            v33 = v11;
            _os_log_error_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_ERROR, "ERROR: Wrong weight in the model: {totalWeight=%f, appWeight=%f, app=%@}", buf, 0x20u);
          }

          v18 = 0.0;
        }
        else
        {
          +[ATXMagicalMomentsStatistics calculateModelConfidenceWithCorrectPredictions:incorrectPredictions:](ATXMagicalMomentsStatistics, "calculateModelConfidenceWithCorrectPredictions:incorrectPredictions:", v14 + 1.0, self->_totalScaledCumulativeScoresForAllBundleIds + 1.0 - v14);
          v18 = v17;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_finalPredictionConfidences, "setObject:forKeyedSubscript:", v20, *(_QWORD *)&v11);

        __atxlog_handle_default();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v29 = v11;
          v30 = 2048;
          v31 = v15;
          v32 = 2048;
          v33 = v16;
          v34 = 2048;
          v35 = v18;
          _os_log_debug_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEBUG, "ATXMM: ==> bundleId: %@, alpha: %f, beta: %f, confidence: %f", buf, 0x2Au);
        }

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v8);
  }

}

- (id)getPredictionsFromFinalConfidences
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  ATXMagicalMomentsPrediction *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_finalPredictionConfidences;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412802;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_relevanceWeightsByIdentifier, "objectForKeyedSubscript:", v10, v18, (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        if (v13 >= 0.0)
        {
          v15 = [ATXMagicalMomentsPrediction alloc];
          -[NSMutableDictionary objectForKeyedSubscript:](self->_finalPredictionConfidences, "objectForKeyedSubscript:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v14 = -[ATXMagicalMomentsPrediction initWithConfidence:predictionIdentifier:](v15, "initWithConfidence:predictionIdentifier:", v10);

          objc_msgSend(v3, "addObject:", v14);
        }
        else
        {
          __atxlog_handle_default();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            v24 = v10;
            v25 = 2048;
            v26 = v13;
            v27 = 2048;
            v28 = 0;
            _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "FILTER: A globally used app would not be suggested. (%@: %f < %f)", buf, 0x20u);
          }
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)startOfDayForDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D48];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v6, "startOfDayForDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions
{
  return 3;
}

- (unint64_t)minimumNumberOfRelevantObservationsOfBundleIdForMMScoring
{
  return 3;
}

- (unint64_t)minimumNumberOfUniqueAnchorOccurrencesForBundleIdForMMScoring
{
  return 3;
}

- (unint64_t)minimumNumberOfGlobalObservationsOfBundleIdForMMScoring
{
  return 5;
}

- (double)minimumRelevanceWeightForMMScoring
{
  return 0.01;
}

- (double)maximumRelevanceWeightForMMScoring
{
  return 0.6;
}

- (id)dateSetForDecay
{
  return self->_dateSetForDecay;
}

- (id)relevantAppLaunches
{
  return self->_relevantAppLaunches;
}

- (unint64_t)totalRelevantLaunchesForAllBundleIds
{
  return self->_totalRelevantLaunchesForAllBundleIds;
}

- (id)relevanceWeightsByIdentifier
{
  return self->_relevanceWeightsByIdentifier;
}

- (id)cumulativeScoresWithDecayedWeightsByIdentifier
{
  return self->_cumulativeScoresWithDecayedWeightsByIdentifier;
}

- (id)topScoringIdentifier
{
  return self->_topScoringIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPredictionConfidences, 0);
  objc_storeStrong((id *)&self->_cumulativeScoresWithDecayedWeightsByIdentifier, 0);
  objc_storeStrong((id *)&self->_dateSetForDecay, 0);
  objc_storeStrong((id *)&self->_topScoringIdentifier, 0);
  objc_storeStrong((id *)&self->_relevanceWeightsByIdentifier, 0);
  objc_storeStrong((id *)&self->_numUniqueAnchorOccurrencesPerCandidate, 0);
  objc_storeStrong((id *)&self->_globalAppLaunches, 0);
  objc_storeStrong((id *)&self->_relevantAppLaunches, 0);
  objc_storeStrong((id *)&self->_correlatedEvents, 0);
}

- (void)subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, v0, (uint64_t)v0, "ATXMM: bundleId: %@ has %lu relevantLaunchesForBundleId launches, and makes the expert eligible for training/prediction.", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 16), "count");
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, a3, v4, "ATXMM: %lu bundleIds observed for this subexpert with %lu total relevant launches, making the expert ineligible for training/prediction.", v5);
  OUTLINED_FUNCTION_1();
}

- (void)subExpertHasWitnessedEnoughRelevantAppLaunches
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXMM: Subexpert has observed enough events for multiple apps to proceed with making predictions.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)subExpertCanMakeHighConfidencePredictionsForBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXMM: Can't make a confident prediction for this bundleId because subexpert hasn't seen enough global launches.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)subExpertCanMakeHighConfidencePredictionsForBundleId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXMM: Can't make a confident prediction for this bundleId because subexpert hasn't seen enough relevant launches.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)subExpertCanMakeHighConfidencePredictionsForBundleId:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXMM: Can't make a confident prediction for this bundleId because it wasn't seen across enough unique anchor occurrences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)relevanceScoreForBundleId:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_9(&dword_1C9A3B000, v0, (uint64_t)v0, "ATXMM: Can't make a confident prediction for the bundleId with relevantLaunchCount: %lu globalLaunchCount: %lu", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)generatePredictions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "ATXMM: generatePredictions - 1. Compute the relevance score for all apps.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
