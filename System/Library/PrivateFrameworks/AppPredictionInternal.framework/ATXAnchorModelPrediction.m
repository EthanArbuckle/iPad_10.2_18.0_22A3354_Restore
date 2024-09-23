@implementation ATXAnchorModelPrediction

- (ATXAnchorModelPrediction)initWithAnchorType:(id)a3 anchorEvent:(id)a4 candidateType:(id)a5 candidateId:(id)a6 dateIntervalForPrediction:(id)a7 score:(double)a8 numUniqueOccurrencesAfterAnchor:(unint64_t)a9 posteriorProbability:(double)a10 classConditionalProbability:(double)a11 standardDeviationOfOffsetFromAnchor:(double)a12 anchorPopularity:(double)a13 globalPopularity:(double)a14 offsetFromAnchorToShowPrediction:(id)a15 candidateClassifier:(id)a16
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  ATXAnchorModelPrediction *v32;
  uint64_t v33;
  NSString *anchorType;
  uint64_t v35;
  NSString *candidateType;
  uint64_t v37;
  NSString *candidateId;
  id v41;
  id v42;
  objc_super v43;

  v27 = a3;
  v42 = a4;
  v28 = a5;
  v29 = a6;
  v41 = a7;
  v30 = a15;
  v31 = a16;
  v43.receiver = self;
  v43.super_class = (Class)ATXAnchorModelPrediction;
  v32 = -[ATXAnchorModelPrediction init](&v43, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v27, "copy");
    anchorType = v32->_anchorType;
    v32->_anchorType = (NSString *)v33;

    objc_storeStrong((id *)&v32->_anchorEvent, a4);
    v35 = objc_msgSend(v28, "copy");
    candidateType = v32->_candidateType;
    v32->_candidateType = (NSString *)v35;

    v37 = objc_msgSend(v29, "copy");
    candidateId = v32->_candidateId;
    v32->_candidateId = (NSString *)v37;

    objc_storeStrong((id *)&v32->_dateIntervalForPrediction, a7);
    v32->_score = a8;
    v32->_numUniqueOccurrencesAfterAnchor = a9;
    v32->_posteriorProbability = a10;
    v32->_classConditionalProbability = a11;
    v32->_standardDeviationOfOffsetFromAnchor = a12;
    v32->_anchorPopularity = a13;
    v32->_globalPopularity = a14;
    objc_storeStrong((id *)&v32->_offsetFromAnchorToShowPrediction, a15);
    objc_storeStrong((id *)&v32->_candidateClassifier, a16);
  }

  return v32;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Anchor type: %@\nCandidate type: %@\nCandidate id: %@\nDate interval: %@\nScore: %.2f\nOffset: %@"), self->_anchorType, self->_candidateType, self->_candidateId, self->_dateIntervalForPrediction, *(_QWORD *)&self->_score, self->_offsetFromAnchorToShowPrediction);
}

- (BOOL)isEqual:(id)a3
{
  ATXAnchorModelPrediction *v4;
  ATXAnchorModelPrediction *v5;
  NSString *anchorType;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *candidateType;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSString *candidateId;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSDateInterval *dateIntervalForPrediction;
  NSDateInterval *v23;
  NSDateInterval *v24;
  NSDateInterval *v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *offsetFromAnchorToShowPrediction;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v34;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v35;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v36;
  BOOL v37;
  ATXAnchorModelCandidateClassifierProtocol *v39;
  ATXAnchorModelCandidateClassifierProtocol *v40;

  v4 = (ATXAnchorModelPrediction *)a3;
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
      anchorType = self->_anchorType;
      v7 = v5->_anchorType;
      if (anchorType == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = anchorType;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_30;
      }
      candidateType = self->_candidateType;
      v13 = v5->_candidateType;
      if (candidateType == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = candidateType;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_30;
      }
      candidateId = self->_candidateId;
      v18 = v5->_candidateId;
      if (candidateId == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = candidateId;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_30;
      }
      dateIntervalForPrediction = self->_dateIntervalForPrediction;
      v23 = v5->_dateIntervalForPrediction;
      if (dateIntervalForPrediction == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = dateIntervalForPrediction;
        v26 = -[NSDateInterval isEqual:](v25, "isEqual:", v24);

        if ((v26 & 1) == 0)
          goto LABEL_30;
      }
      -[ATXAnchorModelPrediction score](v5, "score");
      if (v27 != self->_score)
        goto LABEL_30;
      if (-[ATXAnchorModelPrediction numUniqueOccurrencesAfterAnchor](v5, "numUniqueOccurrencesAfterAnchor") != self->_numUniqueOccurrencesAfterAnchor)
        goto LABEL_30;
      -[ATXAnchorModelPrediction posteriorProbability](v5, "posteriorProbability");
      if (vabdd_f64(v28, self->_posteriorProbability) > 0.001)
        goto LABEL_30;
      -[ATXAnchorModelPrediction classConditionalProbability](v5, "classConditionalProbability");
      if (vabdd_f64(v29, self->_classConditionalProbability) > 0.001)
        goto LABEL_30;
      -[ATXAnchorModelPrediction standardDeviationOfOffsetFromAnchor](v5, "standardDeviationOfOffsetFromAnchor");
      if (vabdd_f64(v30, self->_standardDeviationOfOffsetFromAnchor) > 0.001)
        goto LABEL_30;
      -[ATXAnchorModelPrediction anchorPopularity](v5, "anchorPopularity");
      if (vabdd_f64(v31, self->_anchorPopularity) > 0.001)
        goto LABEL_30;
      -[ATXAnchorModelPrediction globalPopularity](v5, "globalPopularity");
      if (vabdd_f64(v32, self->_globalPopularity) > 0.001)
        goto LABEL_30;
      offsetFromAnchorToShowPrediction = self->_offsetFromAnchorToShowPrediction;
      v34 = v5->_offsetFromAnchorToShowPrediction;
      if (offsetFromAnchorToShowPrediction == v34)
      {

      }
      else
      {
        v35 = v34;
        v36 = offsetFromAnchorToShowPrediction;
        v37 = -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence isEqual:](v36, "isEqual:", v35);

        if (!v37)
        {
LABEL_30:
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      v39 = self->_candidateClassifier;
      v40 = v39;
      if (v39 == v5->_candidateClassifier)
        v11 = 1;
      else
        v11 = -[ATXAnchorModelCandidateClassifierProtocol isEqual:](v39, "isEqual:");

      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_anchorType, "hash");
  v4 = -[NSString hash](self->_candidateType, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_candidateId, "hash") - v4 + 32 * v4;
  v6 = -[NSDateInterval hash](self->_dateIntervalForPrediction, "hash");
  v7 = (unint64_t)self->_score - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  return -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence hash](self->_offsetFromAnchorToShowPrediction, "hash")
       - v7
       + 32 * v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *anchorType;
  id v5;

  anchorType = self->_anchorType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", anchorType, CFSTR("codingKeyForAnchorType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchorEvent, CFSTR("codingKeyForAnchorEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateType, CFSTR("codingKeyForCandidateType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateId, CFSTR("codingKeyForCandidateId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateIntervalForPrediction, CFSTR("codingKeyForPredictionDateInterval"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForScore"), self->_score);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numUniqueOccurrencesAfterAnchor, CFSTR("codingKeyForNumUniqueOccurrencesAfterAnchor"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForPosteriorProbability"), self->_posteriorProbability);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForClassConditionalProbability"), self->_classConditionalProbability);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForStandardDeviationOfOffsetFromAnchor"), self->_standardDeviationOfOffsetFromAnchor);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForAnchorPopularity"), self->_anchorPopularity);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForGlobalPopularity"), self->_globalPopularity);
  objc_msgSend(v5, "encodeObject:forKey:", self->_offsetFromAnchorToShowPrediction, CFSTR("codingKeyForAnchorOffset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateClassifier, CFSTR("codingKeyForCandidateClassifier"));

}

- (ATXAnchorModelPrediction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  ATXAnchorModelPrediction *v38;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *context;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForAnchorType"), v4, 1, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_anchor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("codingKeyForAnchorEvent"), v4, 1, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D81610];
      v14 = objc_opt_class();
      __atxlog_handle_anchor();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("codingKeyForCandidateType"), v4, 1, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0D81610];
        v18 = objc_opt_class();
        __atxlog_handle_anchor();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("codingKeyForCandidateId"), v4, 1, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = (void *)MEMORY[0x1E0D81610];
          v22 = objc_opt_class();
          __atxlog_handle_anchor();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForPredictionDateInterval"), v4, 1, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_13;
          objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForScore"));
          v26 = v25;
          if (-[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForScore"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1))
          {
            goto LABEL_13;
          }
          v27 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForNumUniqueOccurrencesAfterAnchor"));
          if (-[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", (uint64_t)v26, CFSTR("codingKeyForNumUniqueOccurrencesAfterAnchor"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1))
          {
            goto LABEL_13;
          }
          objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForPosteriorProbability"));
          v29 = v28;
          if (-[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForPosteriorProbability"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v26))
          {
            goto LABEL_13;
          }
          objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForClassConditionalProbability"));
          v31 = v30;
          if (-[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForClassConditionalProbability"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v26)|| (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForStandardDeviationOfOffsetFromAnchor")), v33 = v32, -[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForStandardDeviationOfOffsetFromAnchor"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v26))|| (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForAnchorPopularity")), v35 = v34,
                -[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForAnchorPopularity"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v26))|| (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForGlobalPopularity")), v37 = v36, -[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForGlobalPopularity"), v4, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v26)))
          {
LABEL_13:
            v38 = 0;
          }
          else
          {
            v40 = (void *)MEMORY[0x1E0D81610];
            v50 = objc_opt_class();
            __atxlog_handle_anchor();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v50, CFSTR("codingKeyForAnchorOffset"), v4, 1, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v52);
            v41 = objc_claimAutoreleasedReturnValue();

            v53 = (void *)v41;
            if (v41)
            {
              v51 = (void *)MEMORY[0x1E0D81610];
              context = (void *)MEMORY[0x1CAA48B6C]();
              v47 = objc_alloc(MEMORY[0x1E0C99E60]);
              v42 = objc_opt_class();
              v43 = objc_opt_class();
              v48 = (void *)objc_msgSend(v47, "initWithObjects:", v42, v43, objc_opt_class(), 0);
              objc_autoreleasePoolPop(context);
              __atxlog_handle_anchor();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v48, CFSTR("codingKeyForCandidateClassifier"), v4, 0, CFSTR("com.apple.proactive.AnchorModelPrediction"), -1, v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              self = -[ATXAnchorModelPrediction initWithAnchorType:anchorEvent:candidateType:candidateId:dateIntervalForPrediction:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:standardDeviationOfOffsetFromAnchor:anchorPopularity:globalPopularity:offsetFromAnchorToShowPrediction:candidateClassifier:](self, "initWithAnchorType:anchorEvent:candidateType:candidateId:dateIntervalForPrediction:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:standardDeviationOfOffsetFromAnchor:anchorPopularity:globalPopularity:offsetFromAnchorToShowPrediction:candidateClassifier:", v8, v12, v16, v20, v24, v27, v26, v29, v31, v33, v35, v37, v53, v45);
              v38 = self;
              v46 = v53;
            }
            else
            {
              v38 = 0;
              v46 = 0;
            }

          }
        }
        else
        {
          v38 = 0;
        }

      }
      else
      {
        v38 = 0;
      }

    }
    else
    {
      v38 = 0;
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (ATXDuetEvent)anchorEvent
{
  return self->_anchorEvent;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (NSString)candidateId
{
  return self->_candidateId;
}

- (NSDateInterval)dateIntervalForPrediction
{
  return self->_dateIntervalForPrediction;
}

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)offsetFromAnchorToShowPrediction
{
  return self->_offsetFromAnchorToShowPrediction;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)numUniqueOccurrencesAfterAnchor
{
  return self->_numUniqueOccurrencesAfterAnchor;
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (double)standardDeviationOfOffsetFromAnchor
{
  return self->_standardDeviationOfOffsetFromAnchor;
}

- (double)anchorPopularity
{
  return self->_anchorPopularity;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (ATXAnchorModelCandidateClassifierProtocol)candidateClassifier
{
  return self->_candidateClassifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateClassifier, 0);
  objc_storeStrong((id *)&self->_offsetFromAnchorToShowPrediction, 0);
  objc_storeStrong((id *)&self->_dateIntervalForPrediction, 0);
  objc_storeStrong((id *)&self->_candidateId, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_anchorEvent, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
}

@end
