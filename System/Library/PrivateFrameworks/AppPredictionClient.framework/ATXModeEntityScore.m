@implementation ATXModeEntityScore

- (ATXModeEntityScore)initWithScore:(double)a3 featureVector:(id)a4 uuid:(id)a5
{
  id v9;
  id v10;
  ATXModeEntityScore *v11;
  ATXModeEntityScore *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXModeEntityScore;
  v11 = -[ATXModeEntityScore init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a5);
    v12->_score = a3;
    objc_storeStrong((id *)&v12->_featureVector, a4);
  }

  return v12;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("uuid");
  -[ATXModeEntityScore uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("score");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXModeEntityScore score](self, "score");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("features");
  -[ATXModeEntityScore featureVector](self, "featureVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  return v9;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[ATXModeEntityScore jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("uuid: %@, score: %.3f"), self->_uuid, *(_QWORD *)&self->_score);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  -[ATXModeEntityScore uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForUUID"));

  -[ATXModeEntityScore score](self, "score");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("codingKeyForScore"));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  allowedFeatureVectorClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__ATXModeEntityScore_encodeWithCoder___block_invoke;
  v16[3] = &unk_1E4D589E8;
  v8 = v6;
  v17 = v8;
  v9 = (void *)MEMORY[0x1A85A511C](v16);
  -[ATXModeEntityScore featureVector](self, "featureVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2;
  v13[3] = &unk_1E4D58A10;
  v11 = v9;
  v14 = v11;
  v15 = &v18;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  if (*((_BYTE *)v19 + 24))
  {
    -[ATXModeEntityScore featureVector](self, "featureVector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("codingKeyForFeatures"));

  }
  _Block_object_dispose(&v18, 8);

}

uint64_t __38__ATXModeEntityScore_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a2;
  v8 = a3;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    __atxlog_handle_modes();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_2();
    goto LABEL_7;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    __atxlog_handle_modes();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_1();
LABEL_7:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (ATXModeEntityScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  ATXModeEntityScore *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForUUID"), v4, 0, CFSTR("com.apple.proactive.decode.modeEntityScore"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (!v8)
    v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForScore"));
  v11 = v10;
  if (-[ATXModeEntityScore checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("codingKeyForScore"), v4, CFSTR("com.apple.proactive.decode.modeEntityScore"), -1))
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXModeEntityScore initWithCoder:].cold.1(v12);

    goto LABEL_8;
  }
  v15 = (void *)MEMORY[0x1E0D81610];
  allowedFeatureVectorClasses();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, CFSTR("codingKeyForFeatures"), v4, 0, CFSTR("com.apple.proactive.decode.modeEntityScore"), -1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v13 = 0;
  }
  else
  {
    self = -[ATXModeEntityScore initWithScore:featureVector:uuid:](self, "initWithScore:featureVector:uuid:", v18, v8, v11);
    v13 = self;
  }

LABEL_9:
  return v13;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSDictionary)featureVector
{
  return self->_featureVector;
}

- (void)setFeatureVector:(id)a3
{
  objc_storeStrong((id *)&self->_featureVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_7(v0);
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "ATXModeEntityScore: unexpected value class: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_7(v0);
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "ATXModeEntityScore: unexpected key class: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "Failed to decode score from ATXModeEntityScore.", v1, 2u);
}

@end
