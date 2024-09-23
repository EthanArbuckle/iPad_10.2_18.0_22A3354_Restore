@implementation ATXAnchorModelHyperParameters

+ (ATXAnchorModelHyperParameters)sharedInstance
{
  if (sharedInstance__pasOnceToken6_12 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_12, &__block_literal_global_89);
  return (ATXAnchorModelHyperParameters *)(id)sharedInstance__pasExprOnceResult_16;
}

void __47__ATXAnchorModelHyperParameters_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_16;
  sharedInstance__pasExprOnceResult_16 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXAnchorModelHyperParameters)init
{
  ATXAnchorModelHyperParameters *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *parameters;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXAnchorModelHyperParameters;
  v2 = -[ATXAnchorModelHyperParameters init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CF8CF0];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rawDictionaryForResource:ofType:", v5, CFSTR("plplist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CF8]), "initWithAssetContents:", v6);
    objc_msgSend(v7, "abGroupContents");
    v8 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v8;

  }
  return v2;
}

- (id)abGroup
{
  return -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("abGroup"));
}

- (double)maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MaxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (int64_t)minUniqueAnchorOccurrencesForAnchorForPhase1
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MinUniqueAnchorOccurrencesForAnchorForPhase1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (double)minClassConditionalProbabilityForCandidateForPhase1
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MinClassConditionalProbabilityForCandidateForPhase1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)minPosteriorProbabilityForCandidateForPhase1
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MinPosteriorProbabilityForCandidateForPhase1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MinPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (int64_t)candidateClassifierTypeForPhase2
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("CandidateClassifierTypeForPhase2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (double)idleTimeEndAnchorMinimumSecondsForBeingIdle
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("IdleTimeEndAnchorMinimumSecondsForBeingIdle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)percentileForStartOffsetFromAnchorForPhase3
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("PercentileForStartOffsetFromAnchorForPhase3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)percentileForEndOffsetFromAnchorForPhase3
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("PercentileForEndOffsetFromAnchorForPhase3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)minDurationForAnchorModelPredictionInSecondsForPhase3
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MinDurationOfAnchorModelPredictionInSecondsForPhase3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)maxDurationForAnchorModelPredictionInSecondsForPhase3
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MaxDurationOfAnchorModelPredictionInSecondsForPhase3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)secondsBeforeHistoricalStartDateToPredictCandidate
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("SecondsBeforeHistoricalStartDateToPredictCandidate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)mediumBlendingConfidenceScoreThreshold
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MediumBlendingConfidenceScoreThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)highBlendingConfidenceScoreThreshold
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("HighBlendingConfidenceScoreThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)maxTrainingAgeInSecondsToConsiderForRetraining
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("MaxTrainingAgeInSecondsToConsiderForRetraining"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)ratioForLeafNodeDecision
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("RatioForLeafNodeDecision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)knownAnchorClasses
{
  void *v2;
  uint64_t i;
  void *v4;

  v2 = (void *)objc_opt_new();
  for (i = 0; i != 23; ++i)
  {
    +[ATXAnchor anchorTypeToAnchorClassName:](ATXAnchor, "anchorTypeToAnchorClassName:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

- (id)enabledAnchors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[ATXAnchorModelHyperParameters knownAnchorClasses](self, "knownAnchorClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("EnabledAnchors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke;
  v8[3] = &unk_1E82E1B00;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if ((v4 & 1) == 0)
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
  return v4;
}

- (id)anchorsDisabledForHomescreen
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[ATXAnchorModelHyperParameters knownAnchorClasses](self, "knownAnchorClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("AnchorsDisabledForHomescreen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke;
  v9[3] = &unk_1E82E1B00;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  return v7;
}

uint64_t __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if ((v4 & 1) == 0)
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
  return v4;
}

- (int64_t)minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForHighConfidencePredictionForAnchor:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("AnchorPredictionScoringParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("High_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("High_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "integerValue");

  }
  return v10;
}

- (int64_t)minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForMediumConfidencePredictionForAnchor:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("AnchorPredictionScoringParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Med_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Med_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "integerValue");

  }
  return v10;
}

- (double)minPosteriorProbabilityForHighConfidencePredictionForAnchor:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("AnchorPredictionScoringParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("High_PosteriorProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("High_PosteriorProbability"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

  }
  return v11;
}

- (double)minPosteriorProbabilityForMediumConfidencePredictionForAnchor:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("AnchorPredictionScoringParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Med_PosteriorProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Med_PosteriorProbability"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

  }
  return v11;
}

- (double)minClassConditionalProbabilityForHighConfidencePredictionForAnchor:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("AnchorPredictionScoringParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("High_ClassConditionalProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("High_ClassConditionalProbability"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

  }
  return v11;
}

- (double)minClassConditionalProbabilityForMediumConfidencePredictionForAnchor:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("AnchorPredictionScoringParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Med_ClassConditionalProbability"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Med_ClassConditionalProbability"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

  }
  return v11;
}

- (double)minValueForParameterKey:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("ScoringModelParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ScalingParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("min"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (double)maxValueForParameterKey:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("ScoringModelParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ScalingParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("max"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (double)modelWeightForParameterKey:(id)a3
{
  NSDictionary *parameters;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  parameters = self->_parameters;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", CFSTR("ScoringModelParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ModelWeights"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

void __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "EnabledAnchors in AnchorModelHyperParameters contained an unknown anchor: %@", a5, a6, a7, a8, 2u);
}

void __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "AnchorsDisabledForHomescreen in AnchorModelHyperParameters contained an unknown anchor: %@", a5, a6, a7, a8, 2u);
}

@end
