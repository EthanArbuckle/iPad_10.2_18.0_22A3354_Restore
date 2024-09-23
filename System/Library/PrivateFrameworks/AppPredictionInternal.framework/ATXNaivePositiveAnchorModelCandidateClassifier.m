@implementation ATXNaivePositiveAnchorModelCandidateClassifier

- (ATXNaivePositiveAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXNaivePositiveAnchorModelCandidateClassifier *v11;
  ATXNaivePositiveAnchorModelCandidateClassifier *v12;
  uint64_t v13;
  NSString *candidateId;
  uint64_t v15;
  NSString *candidateType;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ATXNaivePositiveAnchorModelCandidateClassifier;
  v11 = -[ATXNaivePositiveAnchorModelCandidateClassifier init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_anchor, a5);
    v13 = objc_msgSend(v8, "copy");
    candidateId = v12->_candidateId;
    v12->_candidateId = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    candidateType = v12->_candidateType;
    v12->_candidateType = (NSString *)v15;

    v12->_isTrained = 0;
  }

  return v12;
}

- (void)train
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "Training %@ for candidate: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  NSObject *v4;

  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXNaivePositiveAnchorModelCandidateClassifier classifyCandidateForAnchorOccurrence:trainingResult:].cold.1();

  return -[ATXAnchorModelClassificationResult initWithShouldPredictCandidate:score:]([ATXAnchorModelClassificationResult alloc], "initWithShouldPredictCandidate:score:", 1, 1.0);
}

- (int64_t)classifierType
{
  return 1;
}

- (NSString)description
{
  return (NSString *)CFSTR("Simple Anchor Model Candidate Classifier that just returns YES, no matter what candidateId is passed in.");
}

- (BOOL)isEqual:(id)a3
{
  ATXNaivePositiveAnchorModelCandidateClassifier *v4;
  ATXNaivePositiveAnchorModelCandidateClassifier *v5;
  NSString *candidateId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  ATXAnchor *v12;
  ATXAnchor *v13;

  v4 = (ATXNaivePositiveAnchorModelCandidateClassifier *)a3;
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
      candidateId = self->_candidateId;
      v7 = v5->_candidateId;
      if (candidateId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = candidateId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_anchor;
      v13 = v12;
      if (v12 == v5->_anchor)
        v11 = 1;
      else
        v11 = -[ATXAnchor isEqual:](v12, "isEqual:");

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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

- (void)encodeWithCoder:(id)a3
{
  NSString *candidateId;
  id v5;
  objc_class *v6;
  id v7;

  candidateId = self->_candidateId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", candidateId, CFSTR("codingKeyForCandidateId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateType, CFSTR("codingKeyForCandidateType"));
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("codingKeyForAnchor"));

}

- (ATXNaivePositiveAnchorModelCandidateClassifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXNaivePositiveAnchorModelCandidateClassifier *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForCandidateId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ATXNaivePositiveAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("codingKeyForCandidateId"), v4, CFSTR("com.apple.proactive.NaivePositiveAnchorModelCandidateClassifier"), -1))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForCandidateType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXNaivePositiveAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v7, CFSTR("codingKeyForCandidateType"), v4, CFSTR("com.apple.proactive.NaivePositiveAnchorModelCandidateClassifier"), -1))
    {
      v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXNaivePositiveAnchorModelCandidateClassifier checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v8, CFSTR("codingKeyForAnchor"), v4, CFSTR("com.apple.proactive.NaivePositiveAnchorModelCandidateClassifier"), -1))
    {
      v6 = 0;
LABEL_20:

      goto LABEL_21;
    }
    +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enabledAnchors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v8);

    if ((v11 & 1) != 0)
    {
      if (NSClassFromString((NSString *)v8))
      {
        v12 = objc_opt_new();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self = -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCandidateId:candidateType:anchor:](self, "initWithCandidateId:candidateType:anchor:", v5, v7, v12);
          v6 = self;
LABEL_19:

          goto LABEL_20;
        }
        __atxlog_handle_anchor();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCoder:].cold.2();

      }
      else
      {
        __atxlog_handle_anchor();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCoder:].cold.1();
      }
    }
    else
    {
      __atxlog_handle_anchor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCoder:].cold.3((uint64_t)self, (uint64_t)v8, v12);
    }
    v6 = 0;
    goto LABEL_19;
  }
  v6 = 0;
LABEL_22:

  return v6;
}

- (ATXAnchor)anchor
{
  return self->_anchor;
}

- (NSString)candidateId
{
  return self->_candidateId;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (BOOL)isTrained
{
  return self->_isTrained;
}

- (void)setIsTrained:(BOOL)a3
{
  self->_isTrained = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_candidateId, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)classifyCandidateForAnchorOccurrence:trainingResult:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ making a prediction for candidate: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCoder:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "When decoding %@, encountered an unknown/non-existent Anchor Class String.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "When decoding %@, decoded an object that is not a known Anchor type.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "When decoding %@, attempted to deserialize object with a non-whitelisted anchor: %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
