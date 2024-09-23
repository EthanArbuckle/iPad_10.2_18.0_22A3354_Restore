@implementation ATXStrictContextMatchAnchorModelCandidateClassifier

- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  ATXAnchorModelClassificationResult *v19;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = (uint64_t)v9;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ making a prediction for candidate: %@", (uint8_t *)&v21, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featurizeAnchorEvent:anchor:", v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "numCandidateIdOccurrencesInJointAnchorContext:anchor:anchorMetadata:", v14, v15, v12);

  __atxlog_handle_anchor();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v18;
    v23 = 2048;
    v24 = v16;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_INFO, "Candidate %@ has %ld occurrences in the joint context of the anchor.", (uint8_t *)&v21, 0x16u);

  }
  v19 = -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:]([ATXAnchorModelClassificationResult alloc], "initWithShouldPredictCandidate:score:", v16 > 0, (double)v16);

  return v19;
}

- (int64_t)classifierType
{
  return 2;
}

- (id)description
{
  return CFSTR("Strict Anchor Model candidate classifier. YES if candidate has been performed at the hour, DoW, and LOI of the anchor occurrence, and the candidate has occurred in the last 7 days.");
}

- (BOOL)isEqual:(id)a3
{
  ATXStrictContextMatchAnchorModelCandidateClassifier *v4;
  ATXStrictContextMatchAnchorModelCandidateClassifier *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (ATXStrictContextMatchAnchorModelCandidateClassifier *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](self, "candidateId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXNaivePositiveAnchorModelCandidateClassifier candidateId](v5, "candidateId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](self, "anchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXNaivePositiveAnchorModelCandidateClassifier anchor](v5, "anchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

@end
