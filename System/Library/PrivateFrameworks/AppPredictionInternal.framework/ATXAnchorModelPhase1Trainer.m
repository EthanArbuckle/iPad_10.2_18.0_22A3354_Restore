@implementation ATXAnchorModelPhase1Trainer

- (id)initForAnchor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXAnchorModelPhase1Trainer initForAnchor:anchorModelDataStoreWrapper:](self, "initForAnchor:anchorModelDataStoreWrapper:", v4, v5);

  return v6;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = -[ATXAnchorModelPhase1Trainer initForAnchor:anchorModelDataStoreWrapper:hyperParameters:tracker:](self, "initForAnchor:anchorModelDataStoreWrapper:hyperParameters:tracker:", v7, v6, v8, v9);

  return v10;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4 hyperParameters:(id)a5 tracker:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXAnchorModelPhase1Trainer *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelPhase1Trainer;
  v15 = -[ATXAnchorModelPhase1Trainer init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_anchor, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (id)selectedPredictionCandidates
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  ATXAnchorModelDataStoreWrapperProtocol *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  ATXAnchorModelDataStoreWrapperProtocol *v32;
  void *v33;
  void *v34;
  int v35;
  ATXAnchorModelDataStoreWrapperProtocol *v36;
  void *v37;
  NSObject *v38;
  ATXAnchorModelDataStoreWrapperProtocol *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id obj;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXAnchorModelPhase1Trainer uniqueCandidateIdsThatOccurredAfterAnchor](self, "uniqueCandidateIdsThatOccurredAfterAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Phase 1: Starting training...", buf, 2u);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v54;
    v47 = CFSTR("linkaction");
    v48 = *(_QWORD *)v54;
    v49 = v3;
    do
    {
      v9 = 0;
      v50 = v7;
      do
      {
        if (*(_QWORD *)v54 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v9);
        v52 = (void *)MEMORY[0x1CAA48B6C]();
        v11 = (void *)objc_opt_new();
        v12 = -[ATXAnchorModelPhase1Trainer candidateSatisfiesAllThresholds:trainingResult:](self, "candidateSatisfiesAllThresholds:trainingResult:", v10, v11);
        __atxlog_handle_anchor();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v10;
            _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate: %@ satisfies all thresholds.", buf, 0xCu);
          }

          -[ATXAnchorModelDataStoreWrapperProtocol candidateTypeForCandidateId:](self->_storeWrapper, "candidateTypeForCandidateId:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("app"));

          storeWrapper = self->_storeWrapper;
          if (v16)
          {
            v18 = (void *)objc_opt_new();
            -[ATXAnchorModelDataStoreWrapperProtocol appLaunchDuetEventFromCandidateId:date:](storeWrapper, "appLaunchDuetEventFromCandidateId:date:", v10, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = (void *)objc_opt_new();
            v57 = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_opt_new();
            objc_msgSend(v20, "historyForAppLaunchDuetEvents:anchorOccurrenceDate:", v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setLaunchHistory:", v24);

            goto LABEL_26;
          }
          -[ATXAnchorModelDataStoreWrapperProtocol candidateTypeForCandidateId:](self->_storeWrapper, "candidateTypeForCandidateId:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("action"));

          v27 = self->_storeWrapper;
          if (!v26)
          {
            -[ATXAnchorModelDataStoreWrapperProtocol candidateTypeForCandidateId:](self->_storeWrapper, "candidateTypeForCandidateId:", v10);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("mode"));

            v32 = self->_storeWrapper;
            if (v31)
            {
              v33 = (void *)objc_opt_new();
              -[ATXAnchorModelDataStoreWrapperProtocol modeBiomeEventFromCandidateId:date:](v32, "modeBiomeEventFromCandidateId:date:", v10, v33);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                __atxlog_handle_anchor();
                v43 = objc_claimAutoreleasedReturnValue();
                v3 = v49;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v10;
                  _os_log_impl(&dword_1C9A3B000, v43, OS_LOG_TYPE_DEFAULT, "Skipping candidate because we were unable to access the BMStoreEvent for the candidate. candidateId: %@", buf, 0xCu);
                }
LABEL_37:

                v7 = v50;
                goto LABEL_30;
              }
              v20 = (void *)objc_opt_new();
              v21 = (void *)objc_opt_new();
              objc_msgSend(v20, "historyForModeChangeEvent:anchorOccurrenceDate:", v19, v21);
              v29 = objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
            -[ATXAnchorModelDataStoreWrapperProtocol candidateTypeForCandidateId:](self->_storeWrapper, "candidateTypeForCandidateId:", v10);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqualToString:", v47);

            if (v35)
            {
              v36 = self->_storeWrapper;
              v37 = (void *)objc_opt_new();
              -[ATXAnchorModelDataStoreWrapperProtocol linkActionBiomeEventFromCandidateId:date:](v36, "linkActionBiomeEventFromCandidateId:date:", v10, v37);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                __atxlog_handle_anchor();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v10;
                  _os_log_impl(&dword_1C9A3B000, v43, OS_LOG_TYPE_DEFAULT, "Skipping candidate because we were unable to access the BMStoreEvent for the candidate. candidateId: %@", buf, 0xCu);
                }
                goto LABEL_37;
              }
              v20 = (void *)objc_opt_new();
              v21 = (void *)objc_opt_new();
              objc_msgSend(v20, "historyForLinkActionChangeEvent:anchorOccurrenceDate:", v19, v21);
              v29 = objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
LABEL_27:
            __atxlog_handle_anchor();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v10;
              _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "Phase 1: ✅ (YES) Candidate: %@ selected to pass Phase 1.", buf, 0xCu);
            }

            objc_msgSend(v11, "setCandidateId:", v10);
            v39 = self->_storeWrapper;
            -[ATXAnchor anchorTypeString](self->_anchor, "anchorTypeString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXAnchor anchorEventIdentifier](self->_anchor, "anchorEventIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXAnchorModelDataStoreWrapperProtocol assignMetricsForTrainingResult:anchorType:anchorEventIdentifier:candidateId:](v39, "assignMetricsForTrainingResult:anchorType:anchorEventIdentifier:candidateId:", v11, v40, v41, v10);

            objc_msgSend(v3, "addObject:", v11);
            goto LABEL_30;
          }
          v28 = (void *)objc_opt_new();
          -[ATXAnchorModelDataStoreWrapperProtocol appIntentDuetEventFromCandidateId:date:](v27, "appIntentDuetEventFromCandidateId:date:", v10, v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = (void *)objc_opt_new();
            v21 = (void *)objc_opt_new();
            objc_msgSend(v20, "historyForActionUUIDWithAppIntentDuetEvent:anchorOccurrenceDate:", v19, v21);
            v29 = objc_claimAutoreleasedReturnValue();
LABEL_25:
            v22 = (void *)v29;
            objc_msgSend(v11, "setLaunchHistory:", v29, v47);
LABEL_26:

            v8 = v48;
            v3 = v49;
            v7 = v50;
            goto LABEL_27;
          }
          __atxlog_handle_anchor();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v10;
            _os_log_impl(&dword_1C9A3B000, v42, OS_LOG_TYPE_DEFAULT, "Skipping candidate because we were unable to access the DuetEvent for the candidate. candidateId: %@", buf, 0xCu);
          }

          v3 = v49;
          v7 = v50;
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v10;
            _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Phase 1: ❌ (NO) Candidate: %@ rejected in Phase 1.", buf, 0xCu);
          }

        }
LABEL_30:

        objc_autoreleasePoolPop(v52);
        ++v9;
      }
      while (v7 != v9);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      v7 = v44;
    }
    while (v44);
  }

  __atxlog_handle_anchor();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "Phase 1: Done training.", buf, 2u);
  }

  -[ATXAnchorModelPhase1Trainer _logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:selectedCandidates:](self, "_logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:selectedCandidates:", obj, v3);
  return v3;
}

- (BOOL)candidateSatisfiesAllThresholds:(id)a3 trainingResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  BOOL v29;
  int v31;
  id v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[ATXAnchorModelDataStoreWrapperProtocol numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForCandidate:anchor:](self->_storeWrapper, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForCandidate:anchor:", v6, self->_anchor);
  objc_msgSend(v7, "setNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence:", v8);
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated unique anchor occurrences", (uint8_t *)&v31, 2u);
  }

  if (!-[ATXAnchorModelPhase1Trainer candidateUniqueAnchorOccurrencesIsAtLeastMinimum:candidateId:trainingResult:](self, "candidateUniqueAnchorOccurrencesIsAtLeastMinimum:candidateId:trainingResult:", -[ATXAnchorModelHyperParameters minUniqueAnchorOccurrencesForAnchorForPhase1](self->_hyperParameters, "minUniqueAnchorOccurrencesForAnchorForPhase1"), v6, v7))goto LABEL_23;
  -[ATXAnchorModelPhase1Trainer classConditionalProbabilityOfAnchorForCandidate:](self, "classConditionalProbabilityOfAnchorForCandidate:", v6);
  v11 = v10;
  objc_msgSend(v7, "setClassConditionalProbability:");
  __atxlog_handle_anchor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated class conditional probability", (uint8_t *)&v31, 2u);
  }

  -[ATXAnchorModelPhase1Trainer posteriorProbabilityConditionedOnAnchorForCandidate:](self, "posteriorProbabilityConditionedOnAnchorForCandidate:", v6);
  v14 = v13;
  objc_msgSend(v7, "setPosteriorProbability:");
  __atxlog_handle_anchor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated posterior probability", (uint8_t *)&v31, 2u);
  }

  -[ATXAnchorModelHyperParameters minClassConditionalProbabilityForCandidateForPhase1](self->_hyperParameters, "minClassConditionalProbabilityForCandidateForPhase1");
  if (!-[ATXAnchorModelPhase1Trainer classConditionalProbabilityOfAnchorIsAtLeastMinimum:candidateId:trainingResult:](self, "classConditionalProbabilityOfAnchorIsAtLeastMinimum:candidateId:trainingResult:", v6, v7))
  {
    -[ATXAnchorModelHyperParameters minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1](self->_hyperParameters, "minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1");
    if (v14 <= v16)
    {
LABEL_23:
      v29 = 0;
      goto LABEL_24;
    }
    __atxlog_handle_anchor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXAnchorModelHyperParameters minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1](self->_hyperParameters, "minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1");
      v31 = 138412802;
      v32 = v6;
      v33 = 2048;
      v34 = v14;
      v35 = 2048;
      v36 = v18;
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ posterior probability (%.2f) is high enough to proceed even though the class conditional probability requirement is not met. High threshold: %.2f", (uint8_t *)&v31, 0x20u);
    }

  }
  -[ATXAnchorModelHyperParameters minPosteriorProbabilityForCandidateForPhase1](self->_hyperParameters, "minPosteriorProbabilityForCandidateForPhase1");
  if (!-[ATXAnchorModelPhase1Trainer posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:candidateId:trainingResult:](self, "posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:candidateId:trainingResult:", v6, v7))goto LABEL_23;
  -[ATXAnchorModelPhase1Trainer standardDeviationOfSecondsAfterAnchorForFirstOccurrenceOfCandidateId:](self, "standardDeviationOfSecondsAfterAnchorForFirstOccurrenceOfCandidateId:", v6);
  v20 = v19;
  objc_msgSend(v7, "setStandardDeviationOfOffsetFromAnchor:");
  __atxlog_handle_anchor();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated standard deviation of offset from anchor", (uint8_t *)&v31, 2u);
  }

  -[ATXAnchorModelPhase1Trainer anchorPopularityForCandidate:](self, "anchorPopularityForCandidate:", v6);
  v23 = v22;
  objc_msgSend(v7, "setAnchorPopularity:");
  __atxlog_handle_anchor();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated anchor popularity", (uint8_t *)&v31, 2u);
  }

  -[ATXAnchorModelPhase1Trainer globalPopularityForCandidate:](self, "globalPopularityForCandidate:", v6);
  v26 = v25;
  objc_msgSend(v7, "setGlobalPopularity:");
  __atxlog_handle_anchor();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated global popularity", (uint8_t *)&v31, 2u);
  }

  __atxlog_handle_anchor();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138413826;
    v32 = v6;
    v33 = 2048;
    v34 = *(double *)&v8;
    v35 = 2048;
    v36 = v11;
    v37 = 2048;
    v38 = v14;
    v39 = 2048;
    v40 = v20;
    v41 = 2048;
    v42 = v23;
    v43 = 2048;
    v44 = v26;
    _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ unique anchor occurrence count: %ld, class-conditional probability: %.2f, posterior probability: %.2f, standard deviation in offset from anchor: %.2f, anchorProbability: %.2f, globalPopularity: %.2f", (uint8_t *)&v31, 0x48u);
  }

  v29 = 1;
LABEL_24:

  return v29;
}

- (BOOL)candidateUniqueAnchorOccurrencesIsAtLeastMinimum:(int64_t)a3 candidateId:(id)a4 trainingResult:(id)a5
{
  id v7;
  id v8;
  int64_t v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence");
  if (v9 < a3)
  {
    __atxlog_handle_anchor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = v7;
      v14 = 2048;
      v15 = a3;
      v16 = 2048;
      v17 = objc_msgSend(v8, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence");
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ failed unique anchor occurrence count requirement. Req: %ld, Actual: %ld", (uint8_t *)&v12, 0x20u);
    }

  }
  return v9 >= a3;
}

- (BOOL)classConditionalProbabilityOfAnchorIsAtLeastMinimum:(double)a3 candidateId:(id)a4 trainingResult:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  id v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "classConditionalProbability");
  v10 = v9;
  if (v9 < a3)
  {
    __atxlog_handle_anchor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "classConditionalProbability");
      v14 = 138412802;
      v15 = v7;
      v16 = 2048;
      v17 = a3;
      v18 = 2048;
      v19 = v12;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ failed class conditional probability requirement. Req: %.2f, Actual: %.2f", (uint8_t *)&v14, 0x20u);
    }

  }
  return v10 >= a3;
}

- (double)classConditionalProbabilityOfAnchorForCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXAnchorModelDataStoreWrapperProtocol numCandidateOccurrencesInAnchorContextForCandidate:anchor:](self->_storeWrapper, "numCandidateOccurrencesInAnchorContextForCandidate:anchor:", v4, self->_anchor);
  v6 = -[ATXAnchorModelDataStoreWrapperProtocol numCandidateOccurrencesInAllContextsForCandidate:](self->_storeWrapper, "numCandidateOccurrencesInAllContextsForCandidate:", v4);
  v7 = v6;
  if (v6)
    v8 = (double)v5 / (double)v6;
  else
    v8 = 0.0;
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138413058;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. anchorContextCount = %ld, allContextCount = %ld ==> p(anchor | candidate) = %.3f", (uint8_t *)&v11, 0x2Au);
  }

  return v8;
}

- (BOOL)posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:(double)a3 candidateId:(id)a4 trainingResult:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  id v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "posteriorProbability");
  v10 = v9;
  if (v9 < a3)
  {
    __atxlog_handle_anchor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "posteriorProbability");
      v14 = 138412802;
      v15 = v7;
      v16 = 2048;
      v17 = a3;
      v18 = 2048;
      v19 = v12;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ failed posterior probability requirement. Req: %.2f, Actual: %.2f", (uint8_t *)&v14, 0x20u);
    }

  }
  return v10 >= a3;
}

- (double)posteriorProbabilityConditionedOnAnchorForCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXAnchorModelDataStoreWrapperProtocol numUniqueAnchorOccurrencesForCandidate:anchor:](self->_storeWrapper, "numUniqueAnchorOccurrencesForCandidate:anchor:", v4, self->_anchor);
  v6 = -[ATXAnchorModelDataStoreWrapperProtocol numUniqueAnchorOccurrencesForAnchor:candidateId:](self->_storeWrapper, "numUniqueAnchorOccurrencesForAnchor:candidateId:", self->_anchor, v4);
  v7 = v6;
  if (v6)
    v8 = (double)v5 / (double)v6;
  else
    v8 = 0.0;
  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138413058;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. uniqueOccurrencesInAnchorContext = %ld, uniqueAnchorOccurrences = %ld ==> p(candidate | anchor) = %.3f", (uint8_t *)&v11, 0x2Au);
  }

  return v8;
}

- (double)standardDeviationOfSecondsAfterAnchorForFirstOccurrenceOfCandidateId:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[ATXAnchorModelDataStoreWrapperProtocol secondsAfterAnchorWhenCandidateOccurredForAnchor:candidateId:onlyConsiderFirstOccurrencePerAnchor:](self->_storeWrapper, "secondsAfterAnchorWhenCandidateOccurredForAnchor:candidateId:onlyConsiderFirstOccurrencePerAnchor:", self->_anchor, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPhase1Trainer standardDeviationOfNumbers:](self, "standardDeviationOfNumbers:", v4);
  v6 = v5;

  return v6;
}

- (double)standardDeviationOfNumbers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expressionForFunction:arguments:", CFSTR("stddev:"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "expressionValueWithObject:context:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor
{
  uint64_t *p_anchor;
  void *v3;
  NSObject *v4;

  p_anchor = (uint64_t *)&self->_anchor;
  -[ATXAnchorModelDataStoreWrapperProtocol uniqueCandidateIdsThatOccurredAfterAnchor:](self->_storeWrapper, "uniqueCandidateIdsThatOccurredAfterAnchor:", self->_anchor);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelPhase1Trainer uniqueCandidateIdsThatOccurredAfterAnchor].cold.1(p_anchor, (uint64_t)v3, v4);

  return v3;
}

- (double)anchorPopularityForCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXAnchorModelDataStoreWrapperProtocol numCandidateOccurrencesInAnchorContextForCandidate:anchor:](self->_storeWrapper, "numCandidateOccurrencesInAnchorContextForCandidate:anchor:", v4, self->_anchor);
  storeWrapper = self->_storeWrapper;
  -[ATXAnchorModelDataStoreWrapperProtocol candidateTypeForCandidateId:](storeWrapper, "candidateTypeForCandidateId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXAnchorModelDataStoreWrapperProtocol numCandidateOccurrencesInAnchorContextForCandidateType:anchor:](storeWrapper, "numCandidateOccurrencesInAnchorContextForCandidateType:anchor:", v7, self->_anchor);

  if (v8)
    v9 = (double)v5 / (double)v8;
  else
    v9 = 0.0;
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138413058;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    v16 = 2048;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. occurencesInAnchorContextForCandidate = %ld, occurencesInAnchorContextForAllCandidatesOfSameType = %ld ==> anchorProbability = %.3f", (uint8_t *)&v12, 0x2Au);
  }

  return v9;
}

- (double)globalPopularityForCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  ATXAnchorModelDataStoreWrapperProtocol *storeWrapper;
  void *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXAnchorModelDataStoreWrapperProtocol numCandidateOccurrencesInAllContextsForCandidate:](self->_storeWrapper, "numCandidateOccurrencesInAllContextsForCandidate:", v4);
  storeWrapper = self->_storeWrapper;
  -[ATXAnchorModelDataStoreWrapperProtocol candidateTypeForCandidateId:](storeWrapper, "candidateTypeForCandidateId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXAnchorModelDataStoreWrapperProtocol numCandidateOccurrencesInAllContextsForCandidateType:](storeWrapper, "numCandidateOccurrencesInAllContextsForCandidateType:", v7);

  if (v8)
    v9 = (double)v5 / (double)v8;
  else
    v9 = 0.0;
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138413058;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    v16 = 2048;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. occurencesInAllContextsForCandidate = %ld, occurencesInAllContextsForCandidatesOfSameType = %ld ==> globalPopularity = %.3f", (uint8_t *)&v12, 0x2Au);
  }

  return v9;
}

- (void)_logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:(id)a3 selectedCandidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPhaseDescription:", 1);
  objc_msgSend(v8, "setPhaseType:", 0);
  v9 = objc_msgSend(v7, "count");

  objc_msgSend(v8, "setNumStartingCandidates:", v9);
  v10 = objc_msgSend(v6, "count");

  objc_msgSend(v8, "setNumEndingCandidates:", v10);
  -[ATXAnchor anchorTypeString](self->_anchor, "anchorTypeString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnchorType:", v11);

  -[ATXAnchorModelHyperParameters abGroup](self->_hyperParameters, "abGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAbGroup:", v12);

  -[ATXPETEventTracker2Protocol logMessage:](self->_tracker, "logMessage:", v8);
  __atxlog_handle_metrics();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelPhase1Trainer _logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:selectedCandidates:].cold.1((uint64_t)self, v8, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)uniqueCandidateIdsThatOccurredAfterAnchor
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Phase 1: Unique candidates found after anchor (%@): %@", (uint8_t *)&v4, 0x16u);
}

- (void)_logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:(NSObject *)a3 selectedCandidates:.cold.1(uint64_t a1, void *a2, NSObject *a3)
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
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelPhaseFilterTracker for phase 1 with starting candidates: %u ending candidates: %u, anchorType: %@ abGroup: %@", (uint8_t *)&v11, 0x2Cu);

}

@end
