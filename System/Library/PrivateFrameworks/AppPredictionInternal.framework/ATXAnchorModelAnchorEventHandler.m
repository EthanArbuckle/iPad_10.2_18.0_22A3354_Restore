@implementation ATXAnchorModelAnchorEventHandler

- (ATXAnchorModelAnchorEventHandler)initWithAnchor:(id)a3 anchorEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ATXAnchorModelAnchorEventHandler *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = -[ATXAnchorModelAnchorEventHandler initWithAnchor:anchorEvent:dataStoreWrapper:hyperParameters:tracker:](self, "initWithAnchor:anchorEvent:dataStoreWrapper:hyperParameters:tracker:", v7, v6, v8, v9, v10);

  return v11;
}

- (ATXAnchorModelAnchorEventHandler)initWithAnchor:(id)a3 anchorEvent:(id)a4 dataStoreWrapper:(id)a5 hyperParameters:(id)a6 tracker:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ATXAnchorModelAnchorEventHandler *v17;
  uint64_t v18;
  ATXAnchor *anchor;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSDate *baseDate;
  id obj;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ATXAnchorModelAnchorEventHandler;
  v17 = -[ATXAnchorModelAnchorEventHandler init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    anchor = v17->_anchor;
    v17->_anchor = (ATXAnchor *)v18;

    objc_msgSend(v13, "identifier");
    obj = a6;
    v20 = v16;
    v21 = v15;
    v22 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchor setAnchorEventIdentifier:](v17->_anchor, "setAnchorEventIdentifier:", v23);

    v14 = v22;
    v15 = v21;
    v16 = v20;
    objc_storeStrong((id *)&v17->_anchorEvent, a4);
    objc_storeStrong((id *)&v17->_dataStoreWrapper, a5);
    objc_storeStrong((id *)&v17->_tracker, a7);
    objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v13);
    v24 = objc_claimAutoreleasedReturnValue();
    baseDate = v17->_baseDate;
    v17->_baseDate = (NSDate *)v24;

    objc_storeStrong((id *)&v17->_hyperParameters, obj);
  }

  return v17;
}

- (id)predictionsForAnchorEvent
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXAnchorModelDataStoreWrapperProtocol trainingResultsForAnchor:](self->_dataStoreWrapper, "trainingResultsForAnchor:", self->_anchor);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXAnchorModelAnchorEventHandler predictionForCandidateFromTrainingResult:](self, "predictionForCandidateFromTrainingResult:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "shouldPredictCandidate"))
        {
          -[ATXAnchorModelAnchorEventHandler anchorModelPredictionFromTrainingResult:classificationResult:](self, "anchorModelPredictionFromTrainingResult:classificationResult:", v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);
          __atxlog_handle_anchor();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v12;
            _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Inference: Will predict candidate: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }

  -[ATXAnchorModelAnchorEventHandler _logPhaseFilteredMetricFromTrainingResults:anchorModelPredictions:](self, "_logPhaseFilteredMetricFromTrainingResults:anchorModelPredictions:", v4, v3);
  return v3;
}

- (id)predictionForCandidateFromTrainingResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "candidateClassifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classifyCandidateForAnchorOccurrence:trainingResult:", self->_anchorEvent, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)anchorModelPredictionFromTrainingResult:(id)a3 classificationResult:(id)a4
{
  id v5;
  double v6;
  double v7;
  ATXAnchorModelPrediction *v8;
  void *v9;
  ATXDuetEvent *anchorEvent;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  ATXAnchorModelPrediction *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = a3;
  -[ATXAnchorModelAnchorEventHandler predictionScoreFromTrainingResult:](self, "predictionScoreFromTrainingResult:", v5);
  v7 = v6;
  v8 = [ATXAnchorModelPrediction alloc];
  -[ATXAnchor anchorTypeString](self->_anchor, "anchorTypeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  anchorEvent = self->_anchorEvent;
  objc_msgSend(v5, "candidateType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelAnchorEventHandler dateIntervalFromTrainingResult:](self, "dateIntervalFromTrainingResult:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phase1TrainingResult");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v34, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence");
  objc_msgSend(v5, "phase1TrainingResult");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "posteriorProbability");
  v13 = v12;
  objc_msgSend(v5, "phase1TrainingResult");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "classConditionalProbability");
  v15 = v14;
  objc_msgSend(v5, "phase1TrainingResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "standardDeviationOfOffsetFromAnchor");
  v18 = v17;
  objc_msgSend(v5, "phase1TrainingResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "anchorPopularity");
  v21 = v20;
  objc_msgSend(v5, "phase1TrainingResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "globalPopularity");
  v24 = v23;
  objc_msgSend(v5, "offsetFromAnchorToShowPrediction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateClassifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[ATXAnchorModelPrediction initWithAnchorType:anchorEvent:candidateType:candidateId:dateIntervalForPrediction:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:standardDeviationOfOffsetFromAnchor:anchorPopularity:globalPopularity:offsetFromAnchorToShowPrediction:candidateClassifier:](v8, "initWithAnchorType:anchorEvent:candidateType:candidateId:dateIntervalForPrediction:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:standardDeviationOfOffsetFromAnchor:anchorPopularity:globalPopularity:offsetFromAnchorToShowPrediction:candidateClassifier:", v9, anchorEvent, v11, v32, v31, v29, v7, v13, v15, v18, v21, v24, v25, v26);
  return v27;
}

- (double)predictionScoreFromTrainingResult:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  int v9;
  double v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "scoreForTrainingResult:", v3);
  v6 = v5;
  __atxlog_handle_anchor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Score for training result: %.2f, training result: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (BOOL)predictionIsHighConfidence:(id)a3
{
  id v4;
  ATXAnchorModelHyperParameters *hyperParameters;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  ATXAnchorModelHyperParameters *v11;
  void *v12;
  double v13;
  double v14;
  ATXAnchorModelHyperParameters *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  v4 = a3;
  hyperParameters = self->_hyperParameters;
  objc_msgSend(v4, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAnchorModelHyperParameters minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForHighConfidencePredictionForAnchor:](hyperParameters, "minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForHighConfidencePredictionForAnchor:", v6);

  objc_msgSend(v4, "phase1TrainingResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence");

  if (v9 >= v7)
  {
    v11 = self->_hyperParameters;
    objc_msgSend(v4, "anchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelHyperParameters minClassConditionalProbabilityForHighConfidencePredictionForAnchor:](v11, "minClassConditionalProbabilityForHighConfidencePredictionForAnchor:", v12);
    v14 = v13;

    v15 = self->_hyperParameters;
    objc_msgSend(v4, "anchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelHyperParameters minPosteriorProbabilityForHighConfidencePredictionForAnchor:](v15, "minPosteriorProbabilityForHighConfidencePredictionForAnchor:", v16);
    v18 = v17;

    objc_msgSend(v4, "phase1TrainingResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "classConditionalProbability");
    v21 = v20;
    if (v20 >= v14
      && (objc_msgSend(v4, "phase1TrainingResult"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "classConditionalProbability"),
          v22 <= 1.0))
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "phase1TrainingResult");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "posteriorProbability");
      v10 = v24 >= v18;

      if (v21 < v14)
        goto LABEL_9;
    }

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)predictionIsMediumConfidence:(id)a3
{
  id v4;
  ATXAnchorModelHyperParameters *hyperParameters;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  ATXAnchorModelHyperParameters *v11;
  void *v12;
  double v13;
  double v14;
  ATXAnchorModelHyperParameters *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  v4 = a3;
  hyperParameters = self->_hyperParameters;
  objc_msgSend(v4, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAnchorModelHyperParameters minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForMediumConfidencePredictionForAnchor:](hyperParameters, "minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForMediumConfidencePredictionForAnchor:", v6);

  objc_msgSend(v4, "phase1TrainingResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence");

  if (v9 >= v7)
  {
    v11 = self->_hyperParameters;
    objc_msgSend(v4, "anchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelHyperParameters minClassConditionalProbabilityForMediumConfidencePredictionForAnchor:](v11, "minClassConditionalProbabilityForMediumConfidencePredictionForAnchor:", v12);
    v14 = v13;

    v15 = self->_hyperParameters;
    objc_msgSend(v4, "anchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelHyperParameters minPosteriorProbabilityForMediumConfidencePredictionForAnchor:](v15, "minPosteriorProbabilityForMediumConfidencePredictionForAnchor:", v16);
    v18 = v17;

    objc_msgSend(v4, "phase1TrainingResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "classConditionalProbability");
    v21 = v20;
    if (v20 >= v14
      && (objc_msgSend(v4, "phase1TrainingResult"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "classConditionalProbability"),
          v22 <= 1.0))
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "phase1TrainingResult");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "posteriorProbability");
      v10 = v24 >= v18;

      if (v21 < v14)
        goto LABEL_9;
    }

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)dateIntervalFromTrainingResult:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "offsetFromAnchorToShowPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startSecondsAfterAnchor");
  v6 = v5;
  -[ATXAnchorModelHyperParameters secondsBeforeHistoricalStartDateToPredictCandidate](self->_hyperParameters, "secondsBeforeHistoricalStartDateToPredictCandidate");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", self->_baseDate, v6 - v7);
  v9 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "endSecondsAfterAnchor");
  v10 = (void *)objc_msgSend(v9, "initWithTimeInterval:sinceDate:", self->_baseDate);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v10);

  return v11;
}

- (void)_logPhaseFilteredMetricFromTrainingResults:(id)a3 anchorModelPredictions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "candidateClassifierType");

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setPhaseDescription:", 2);
    if ((unint64_t)(v9 - 1) > 2)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E82DC748[v9 - 1];
    objc_msgSend(v10, "setPhaseType:", v11);
    objc_msgSend(v10, "setNumStartingCandidates:", objc_msgSend(v6, "count"));
    objc_msgSend(v10, "setNumEndingCandidates:", objc_msgSend(v7, "count"));
    -[ATXAnchor anchorTypeString](self->_anchor, "anchorTypeString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnchorType:", v12);

    -[ATXAnchorModelHyperParameters abGroup](self->_hyperParameters, "abGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAbGroup:", v13);

    -[ATXPETEventTracker2Protocol logMessage:](self->_tracker, "logMessage:", v10);
    __atxlog_handle_metrics();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelAnchorEventHandler _logPhaseFilteredMetricFromTrainingResults:anchorModelPredictions:].cold.1((uint64_t)self, v10, v14);

  }
}

- (ATXAnchor)anchor
{
  return self->_anchor;
}

- (ATXDuetEvent)anchorEvent
{
  return self->_anchorEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorEvent, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_baseDate, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
}

- (void)_logPhaseFilteredMetricFromTrainingResults:(NSObject *)a3 anchorModelPredictions:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "numStartingCandidates");
  v8 = objc_msgSend(a2, "numEndingCandidates");
  objc_msgSend(a2, "anchorType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "abGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138413314;
  v12 = v6;
  v13 = 1024;
  v14 = v7;
  v15 = 1024;
  v16 = v8;
  v17 = 2112;
  v18 = v9;
  v19 = 2112;
  v20 = v10;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelPhaseFilterTracker for phase 2 with starting candidates: %u ending candidates: %u, anchorType: %@ abGroup: %@", (uint8_t *)&v11, 0x2Cu);

}

@end
