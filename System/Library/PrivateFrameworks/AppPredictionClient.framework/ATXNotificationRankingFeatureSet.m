@implementation ATXNotificationRankingFeatureSet

- (ATXNotificationRankingFeatureSet)initWithFeatures:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  ATXNotificationRankingFeatureSet *v9;
  ATXNotificationRankingFeatureSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationRankingFeatureSet;
  v9 = -[ATXNotificationRankingFeatureSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_features, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (double)score
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSDictionary allValues](self->_features, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "score");
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXNotificationRankingFeatureSet *v4;
  void *v5;
  ATXNotificationRankingFeatureSet *v6;

  v4 = [ATXNotificationRankingFeatureSet alloc];
  v5 = (void *)-[NSDictionary copy](self->_features, "copy");
  v6 = -[ATXNotificationRankingFeatureSet initWithFeatures:metadata:](v4, "initWithFeatures:metadata:", v5, self->_metadata);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *features;
  id v5;

  features = self->_features;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", features, CFSTR("features"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

- (ATXNotificationRankingFeatureSet)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ATXNotificationRankingFeatureSet *v16;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, objc_opt_class(), CFSTR("features"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v4, "error"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    v18 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v18, objc_opt_class(), CFSTR("metadata"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        self = -[ATXNotificationRankingFeatureSet initWithFeatures:metadata:](self, "initWithFeatures:metadata:", v6, v8);
        v16 = self;
        goto LABEL_6;
      }
    }
    __atxlog_handle_notification_categorization();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ATXNotificationRankingFeatureSet initWithCoder:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXNotificationRankingFeatureSet initWithCoder:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (NSDictionary)features
{
  return self->_features;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Failed to decode features", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Failed to decode metadata", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
