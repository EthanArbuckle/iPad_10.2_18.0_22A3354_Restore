@implementation ATXAnchorModelPhase2Trainer

- (id)initForAnchor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXAnchorModelPhase2Trainer initForAnchor:anchorModelDataStoreWrapper:](self, "initForAnchor:anchorModelDataStoreWrapper:", v4, v5);

  return v6;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelPhase2Trainer *v9;
  ATXAnchorModelPhase2Trainer *v10;
  uint64_t v11;
  ATXAnchorModelHyperParameters *hyperParameters;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelPhase2Trainer;
  v9 = -[ATXAnchorModelPhase2Trainer init](&v14, sel_init);
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

- (int64_t)candidateClassifierType
{
  return -[ATXAnchorModelHyperParameters candidateClassifierTypeForPhase2](self->_hyperParameters, "candidateClassifierTypeForPhase2");
}

- (id)trainPhase2ForCandidate:(id)a3 candidateType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelPhase2Trainer trainPhase2ForCandidate:candidateType:].cold.2((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  -[ATXAnchorModelPhase2Trainer trainClassifierForCandidateId:candidateType:](self, "trainClassifierForCandidateId:candidateType:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelPhase2Trainer trainPhase2ForCandidate:candidateType:].cold.1((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);

  return v15;
}

- (id)trainClassifierForCandidateId:(id)a3 candidateType:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[ATXAnchorModelPhase2Trainer candidateClassifierType](self, "candidateClassifierType");
  if (v8 == 3)
  {
    -[ATXAnchorModelPhase2Trainer trainGamePlayKitDecisionTreeCandidateClassifierForCandidate:candidateType:](self, "trainGamePlayKitDecisionTreeCandidateClassifierForCandidate:candidateType:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 == 1)
      -[ATXAnchorModelPhase2Trainer trainNaivePositiveCandidateClassifierForCandidate:candidateType:](self, "trainNaivePositiveCandidateClassifierForCandidate:candidateType:", v6, v7);
    else
      -[ATXAnchorModelPhase2Trainer trainStrictContextMatchCandidateClassifierForCandidate:candidateType:](self, "trainStrictContextMatchCandidateClassifierForCandidate:candidateType:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)trainGamePlayKitDecisionTreeCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4
{
  id v6;
  id v7;
  ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:hyperParameters:]([ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier alloc], "initWithCandidateId:candidateType:anchor:hyperParameters:", v7, v6, self->_anchor, self->_hyperParameters);

  -[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier train](v8, "train");
  return v8;
}

- (id)trainNaivePositiveCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4
{
  id v6;
  id v7;
  ATXNaivePositiveAnchorModelCandidateClassifier *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:]([ATXNaivePositiveAnchorModelCandidateClassifier alloc], "initWithCandidateId:candidateType:anchor:", v7, v6, self->_anchor);

  -[ATXNaivePositiveAnchorModelCandidateClassifier train](v8, "train");
  return v8;
}

- (id)trainStrictContextMatchCandidateClassifierForCandidate:(id)a3 candidateType:(id)a4
{
  id v6;
  id v7;
  ATXStrictContextMatchAnchorModelCandidateClassifier *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:]([ATXStrictContextMatchAnchorModelCandidateClassifier alloc], "initWithCandidateId:candidateType:anchor:", v7, v6, self->_anchor);

  -[ATXNaivePositiveAnchorModelCandidateClassifier train](v8, "train");
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)trainPhase2ForCandidate:(uint64_t)a3 candidateType:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Done training Phase 2 Candidate Classifier for candidate: %@", a5, a6, a7, a8, 2u);
}

- (void)trainPhase2ForCandidate:(uint64_t)a3 candidateType:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Training Phase 2 Candidate Classifier for candidate: %@", a5, a6, a7, a8, 2u);
}

@end
