@implementation ATXAnchorModelPhase3Trainer

- (id)initForAnchor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXAnchorModelPhase3Trainer initForAnchor:anchorModelDataStoreWrapper:](self, "initForAnchor:anchorModelDataStoreWrapper:", v4, v5);

  return v6;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelPhase3Trainer *v9;
  ATXAnchorModelPhase3Trainer *v10;
  uint64_t v11;
  ATXAnchorModelHyperParameters *hyperParameters;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelPhase3Trainer;
  v9 = -[ATXAnchorModelPhase3Trainer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchor, a3);
    objc_storeStrong((id *)&v10->_storeWrapper, a4);
    +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    hyperParameters = v10->_hyperParameters;
    v10->_hyperParameters = (ATXAnchorModelHyperParameters *)v11;

  }
  return v10;
}

- (id)trainPhase3ForCandidate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelPhase3Trainer trainPhase3ForCandidate:].cold.2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  -[ATXAnchorModelDataStoreWrapperProtocol secondsAfterAnchorWhenCandidateOccurredForAnchor:candidateId:onlyConsiderFirstOccurrencePerAnchor:](self->_storeWrapper, "secondsAfterAnchorWhenCandidateOccurredForAnchor:candidateId:onlyConsiderFirstOccurrencePerAnchor:", self->_anchor, v4, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapperProtocol secondsAfterAnchorWhenCandidateOccurredForAnchor:candidateId:onlyConsiderFirstOccurrencePerAnchor:](self->_storeWrapper, "secondsAfterAnchorWhenCandidateOccurredForAnchor:candidateId:onlyConsiderFirstOccurrencePerAnchor:", self->_anchor, v4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && objc_msgSend(v13, "count"))
  {
    -[ATXAnchorModelPhase3Trainer startSecondsAfterAnchorGivenHistoricalOffsets:](self, "startSecondsAfterAnchorGivenHistoricalOffsets:", v13);
    v16 = v15;
    -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:](self, "endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:", v14);
    v18 = v17;
    __atxlog_handle_anchor();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelPhase3Trainer trainPhase3ForCandidate:].cold.1((uint64_t)v4, v19, v20, v21, v22, v23, v24, v25);

    v26 = -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:]([ATXAnchorModelPredictionOffsetFromAnchorOccurrence alloc], "initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:", v16, v18);
  }
  else
  {
    v26 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v26;
}

- (double)startSecondsAfterAnchorGivenHistoricalOffsets:(id)a3
{
  ATXAnchorModelHyperParameters *hyperParameters;
  id v5;
  void *v6;
  double v7;
  double v8;

  hyperParameters = self->_hyperParameters;
  v5 = a3;
  -[ATXAnchorModelHyperParameters percentileForStartOffsetFromAnchorForPhase3](hyperParameters, "percentileForStartOffsetFromAnchorForPhase3");
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[ATXAnchorModelPhase3Trainer indexOfPercentile:array:](self, "indexOfPercentile:array:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)endSecondsAfterAnchorGivenHistoricalOffsets:(id)a3 startSecondsAfterAnchor:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:](self, "endSecondsAfterAnchorGivenHistoricalOffsets:", a3);
  v7 = v6;
  v8 = v6 - a4;
  -[ATXAnchorModelHyperParameters maxDurationForAnchorModelPredictionInSecondsForPhase3](self->_hyperParameters, "maxDurationForAnchorModelPredictionInSecondsForPhase3");
  if (v8 > v9)
  {
    __atxlog_handle_anchor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    -[ATXAnchorModelHyperParameters maxDurationForAnchorModelPredictionInSecondsForPhase3](self->_hyperParameters, "maxDurationForAnchorModelPredictionInSecondsForPhase3");
    return v18 + a4;
  }
  -[ATXAnchorModelHyperParameters minDurationForAnchorModelPredictionInSecondsForPhase3](self->_hyperParameters, "minDurationForAnchorModelPredictionInSecondsForPhase3");
  if (v8 < v19)
  {
    __atxlog_handle_anchor();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

    -[ATXAnchorModelHyperParameters minDurationForAnchorModelPredictionInSecondsForPhase3](self->_hyperParameters, "minDurationForAnchorModelPredictionInSecondsForPhase3");
    return v18 + a4;
  }
  return v7;
}

- (double)endSecondsAfterAnchorGivenHistoricalOffsets:(id)a3
{
  ATXAnchorModelHyperParameters *hyperParameters;
  id v5;
  void *v6;
  double v7;
  double v8;

  hyperParameters = self->_hyperParameters;
  v5 = a3;
  -[ATXAnchorModelHyperParameters percentileForEndOffsetFromAnchorForPhase3](hyperParameters, "percentileForEndOffsetFromAnchorForPhase3");
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[ATXAnchorModelPhase3Trainer indexOfPercentile:array:](self, "indexOfPercentile:array:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (unint64_t)indexOfPercentile:(double)a3 array:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;

  v5 = a4;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = (unint64_t)(ceil((double)(unint64_t)objc_msgSend(v6, "count") * a3) + -1.0);
  }
  else
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelPhase3Trainer indexOfPercentile:array:].cold.1(v8, a3);

    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)trainPhase3ForCandidate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Done with Training Phase 3 (Time) for candidate: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)trainPhase3ForCandidate:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Training Phase 3 (Time) for candidate: %@...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)endSecondsAfterAnchorGivenHistoricalOffsets:(uint64_t)a3 startSecondsAfterAnchor:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a1, a3, "Computed duration for candidate prediction is too long %.2f. Replacing with globally specified max duaration.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)endSecondsAfterAnchorGivenHistoricalOffsets:(uint64_t)a3 startSecondsAfterAnchor:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a1, a3, "Computed duration for candidate prediction is too short %.2f. Replacing with globally specified min duaration.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)indexOfPercentile:(os_log_t)log array:(double)a2 .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Tried to compute the %.2f percentile from an empty array.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
