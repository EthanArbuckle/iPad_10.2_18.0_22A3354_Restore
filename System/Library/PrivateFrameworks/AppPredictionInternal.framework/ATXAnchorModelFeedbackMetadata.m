@implementation ATXAnchorModelFeedbackMetadata

+ (id)archivedDataForAnchorFeedbackMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  objc_autoreleasePoolPop(v4);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ATXAnchorModelFeedbackMetadata archivedDataForAnchorFeedbackMetadata:].cold.1();

  }
  return v5;
}

+ (id)anchorFeedbackMetadataFromArchivedData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  objc_autoreleasePoolPop(v4);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ATXAnchorModelFeedbackMetadata anchorFeedbackMetadataFromArchivedData:].cold.1();

  }
  return v5;
}

- (ATXAnchorModelFeedbackMetadata)initWithAnchorSuggestionTuples:(id)a3
{
  id v4;
  void *v5;
  id v6;
  ATXAnchorModelFeedbackMetadata *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ATXAnchorModelFeedbackMetadata_initWithAnchorSuggestionTuples___block_invoke;
  v9[3] = &unk_1E82E7430;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = -[ATXAnchorModelFeedbackMetadata initWithSuggestionUUIDToAnchorPredictionMapping:](self, "initWithSuggestionUUIDToAnchorPredictionMapping:", v6);
  return v7;
}

void __65__ATXAnchorModelFeedbackMetadata_initWithAnchorSuggestionTuples___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "first");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
}

- (ATXAnchorModelFeedbackMetadata)initWithSuggestionUUIDToAnchorPredictionMapping:(id)a3
{
  id v5;
  ATXAnchorModelFeedbackMetadata *v6;
  ATXAnchorModelFeedbackMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAnchorModelFeedbackMetadata;
  v6 = -[ATXAnchorModelFeedbackMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggestionUUIDToAnchorPredictionMapping, a3);

  return v7;
}

- (id)anchorModelPredictionForProactiveSuggestion:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_suggestionUUIDToAnchorPredictionMapping, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)numberOfAnchorModelPredictions
{
  return -[NSMutableDictionary count](self->_suggestionUUIDToAnchorPredictionMapping, "count");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_suggestionUUIDToAnchorPredictionMapping, CFSTR("mapping"));
}

- (ATXAnchorModelFeedbackMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ATXAnchorModelFeedbackMetadata *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  v10 = (void *)MEMORY[0x1E0D81610];
  __atxlog_handle_anchor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("mapping"), v4, 1, CFSTR("com.apple.duetexpertd.ATXAnchorModelFeedbackMetadata"), -1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ATXAnchorModelFeedbackMetadata initWithSuggestionUUIDToAnchorPredictionMapping:](self, "initWithSuggestionUUIDToAnchorPredictionMapping:", v12);
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ATXAnchorModelFeedbackMetadata *v4;
  ATXAnchorModelFeedbackMetadata *v5;
  BOOL v6;

  v4 = (ATXAnchorModelFeedbackMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXAnchorModelFeedbackMetadata isEqualToATXAnchorModelFeedbackMetadata:](self, "isEqualToATXAnchorModelFeedbackMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXAnchorModelFeedbackMetadata:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  char v6;

  v4 = self->_suggestionUUIDToAnchorPredictionMapping;
  v5 = v4;
  if (v4 == *((NSMutableDictionary **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableDictionary isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_suggestionUUIDToAnchorPredictionMapping, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash") - v5 + 32 * v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUIDToAnchorPredictionMapping, 0);
}

+ (void)archivedDataForAnchorFeedbackMetadata:.cold.1()
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - could not archive metadata, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

+ (void)anchorFeedbackMetadataFromArchivedData:.cold.1()
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - could not unarchive metadata, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
