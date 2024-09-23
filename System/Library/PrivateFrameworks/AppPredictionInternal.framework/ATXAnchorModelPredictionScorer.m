@implementation ATXAnchorModelPredictionScorer

- (double)scoreForTrainingResult:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  int v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "phase1TrainingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classConditionalProbability");
  v6 = v5;

  objc_msgSend(v3, "phase1TrainingResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posteriorProbability");
  v9 = v8;

  objc_msgSend(v3, "offsetFromAnchorToShowPrediction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startSecondsAfterAnchor");
  v12 = v11 / 60.0;

  objc_msgSend(v3, "phase1TrainingResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "standardDeviationOfOffsetFromAnchor");
  v15 = v14;

  objc_msgSend(v3, "phase1TrainingResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (double)objc_msgSend(v16, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence");

  +[ATXAnchorModelPredictionScorer normalizeValue:parameterKey:](ATXAnchorModelPredictionScorer, "normalizeValue:parameterKey:", CFSTR("classConditionalProbability"), v6);
  v19 = v18;
  +[ATXAnchorModelPredictionScorer normalizeValue:parameterKey:](ATXAnchorModelPredictionScorer, "normalizeValue:parameterKey:", CFSTR("posteriorProbability"), v9);
  v21 = v20;
  +[ATXAnchorModelPredictionScorer normalizeValue:parameterKey:](ATXAnchorModelPredictionScorer, "normalizeValue:parameterKey:", CFSTR("minutesAfterAnchor"), v12);
  v23 = v22;
  +[ATXAnchorModelPredictionScorer normalizeValue:parameterKey:](ATXAnchorModelPredictionScorer, "normalizeValue:parameterKey:", CFSTR("standardDeviation"), v15);
  v25 = v24;
  +[ATXAnchorModelPredictionScorer normalizeValue:parameterKey:](ATXAnchorModelPredictionScorer, "normalizeValue:parameterKey:", CFSTR("uniqueOccurrences"), v17);
  +[ATXAnchorModelPredictionScorer predictedProbabilityFromNormalizedClassConditionalProbability:posteriorProbability:minutesAfterAnchor:standardDeviation:uniqueOccurrences:](ATXAnchorModelPredictionScorer, "predictedProbabilityFromNormalizedClassConditionalProbability:posteriorProbability:minutesAfterAnchor:standardDeviation:uniqueOccurrences:", v19, v21, v23, v25, v26);
  v28 = v27;
  __atxlog_handle_anchor();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 134218242;
    v41 = v28;
    v42 = 2112;
    v43 = *(double *)&v3;
    _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "Predicted probability for trainingResult was %.2f. Training result: %@", (uint8_t *)&v40, 0x16u);
  }

  objc_msgSend(v3, "phase1TrainingResult");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "numRejectedSuggestion");

  objc_msgSend(v3, "phase1TrainingResult");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "numShownSuggestions");

  objc_msgSend(v3, "phase1TrainingResult");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "numEngagedSuggestions");

  if (v31)
  {
    if (v28 + (double)v31 * -0.25 >= 0.0)
      v28 = v28 + (double)v31 * -0.25;
    else
      v28 = 0.0;
    __atxlog_handle_anchor();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 134218498;
      v41 = *(double *)&v31;
      v42 = 2048;
      v43 = v28;
      v44 = 2112;
      v45 = v3;
      _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "Predicted probability after taking into account %ld rejections was %.2f. Training result: %@", (uint8_t *)&v40, 0x20u);
    }

  }
  if (v33)
  {
    if (v28 + (double)v33 * -0.025 >= 0.1)
      v28 = v28 + (double)v33 * -0.025;
    else
      v28 = 0.1;
    __atxlog_handle_anchor();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 134218498;
      v41 = *(double *)&v33;
      v42 = 2048;
      v43 = v28;
      v44 = 2112;
      v45 = v3;
      _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "Predicted probability after taking into account %ld abandons was %.2f. Training result: %@", (uint8_t *)&v40, 0x20u);
    }

  }
  if (v35)
  {
    v28 = fmin(v28 + (double)v35 * 0.1, 1.0);
    __atxlog_handle_anchor();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 134218498;
      v41 = *(double *)&v35;
      v42 = 2048;
      v43 = v28;
      v44 = 2112;
      v45 = v3;
      _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "Predicted probability after taking into account %ld engagements was %.2f. Training result: %@", (uint8_t *)&v40, 0x20u);
    }

  }
  return v28;
}

+ (double)normalizeValue:(double)a3 parameterKey:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double result;

  v5 = a4;
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValueForParameterKey:", v5);
  v8 = v7;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maxValueForParameterKey:", v5);
  v11 = v10;

  v12 = (a3 - v8) / (v11 - v8);
  result = 1.0;
  if (v12 <= 1.0)
  {
    result = (a3 - v8) / (v11 - v8);
    if (v12 < 0.0)
      return 0.0;
  }
  return result;
}

+ (double)predictedProbabilityFromNormalizedClassConditionalProbability:(double)a3 posteriorProbability:(double)a4 minutesAfterAnchor:(double)a5 standardDeviation:(double)a6 uniqueOccurrences:(double)a7
{
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  float v30;
  float v31;
  double v32;
  NSObject *v33;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelWeightForParameterKey:", CFSTR("classConditionalProbability"));
  v14 = v13 * a3;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modelWeightForParameterKey:", CFSTR("posteriorProbability"));
  v17 = v16 * a4;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "modelWeightForParameterKey:", CFSTR("minutesAfterAnchor"));
  v20 = v19 * a5;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "modelWeightForParameterKey:", CFSTR("standardDeviation"));
  v23 = v22 * a6;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "modelWeightForParameterKey:", CFSTR("uniqueOccurrences"));
  v26 = v25 * a7;

  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "modelWeightForParameterKey:", CFSTR("bias"));
  v29 = v28;

  v30 = v14 + v17 + v20 + v23 + v26 + v29;
  v31 = 1.0 / (float)(expf(-v30) + 1.0);
  v32 = v31;
  if (v31 > 1.0)
  {
    __atxlog_handle_anchor();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      +[ATXAnchorModelPredictionScorer predictedProbabilityFromNormalizedClassConditionalProbability:posteriorProbability:minutesAfterAnchor:standardDeviation:uniqueOccurrences:].cold.1(v33, v32);

    return 1.0;
  }
  return v32;
}

+ (void)predictedProbabilityFromNormalizedClassConditionalProbability:(os_log_t)log posteriorProbability:(double)a2 minutesAfterAnchor:standardDeviation:uniqueOccurrences:.cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Predicted probability in anchor model scoring function was above 1.0. Predicted probability: %.2f", (uint8_t *)&v2, 0xCu);
}

@end
