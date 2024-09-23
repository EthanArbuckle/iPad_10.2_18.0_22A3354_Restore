@implementation ATXProactiveSuggestionShadowLoggingContext

- (ATXProactiveSuggestionShadowLoggingContext)init
{
  void *v3;
  ATXProactiveSuggestionShadowLoggingContext *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXProactiveSuggestionShadowLoggingContext initWithClientModelCacheUpdates:context:](self, "initWithClientModelCacheUpdates:context:", v3, 0);

  return v4;
}

- (ATXProactiveSuggestionShadowLoggingContext)initWithClientModelCacheUpdates:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  ATXProactiveSuggestionShadowLoggingContext *v8;
  uint64_t v9;
  NSMutableDictionary *clientModelCacheUpdates;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXProactiveSuggestionShadowLoggingContext;
  v8 = -[ATXProactiveSuggestionShadowLoggingContext init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    clientModelCacheUpdates = v8->_clientModelCacheUpdates;
    v8->_clientModelCacheUpdates = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (NSDictionary)clientModelCacheUpdates
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_clientModelCacheUpdates, "copy");
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  id v4;
  NSMutableDictionary *clientModelCacheUpdates;
  void *v6;
  NSObject *v7;

  v4 = a3;
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  objc_msgSend(v4, "clientModelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](clientModelCacheUpdates, "setObject:forKey:", v4, v6);

  __atxlog_handle_blending_ecosystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ATXProactiveSuggestionShadowLoggingContext updateWithClientModelCacheUpdate:].cold.1();

}

- (void)updateWithContext:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  __atxlog_handle_blending_ecosystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXProactiveSuggestionShadowLoggingContext updateWithContext:].cold.1();

}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionShadowLoggingContext *v4;
  ATXProactiveSuggestionShadowLoggingContext *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionShadowLoggingContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionShadowLoggingContext isEqualToATXProactiveSuggestionShadowLoggingContext:](self, "isEqualToATXProactiveSuggestionShadowLoggingContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingContext:(id)a3
{
  id *v4;
  NSMutableDictionary *clientModelCacheUpdates;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  char v9;
  char v10;
  ATXPredictionContext *v11;
  ATXPredictionContext *v12;

  v4 = (id *)a3;
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  v6 = (NSMutableDictionary *)v4[1];
  if (clientModelCacheUpdates == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = clientModelCacheUpdates;
    v9 = -[NSMutableDictionary isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_context;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[ATXPredictionContext isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableDictionary hash](self->_clientModelCacheUpdates, "hash");
  return -[ATXPredictionContext hash](self->_context, "hash") - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *clientModelCacheUpdates;
  id v5;

  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientModelCacheUpdates, CFSTR("clientCaches"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("predictionContext"));

}

- (ATXProactiveSuggestionShadowLoggingContext)initWithCoder:(id)a3
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ATXProactiveSuggestionShadowLoggingContext *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  v10 = (void *)MEMORY[0x1E0D81610];
  __atxlog_handle_blending_ecosystem();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("clientCaches"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContext"), -1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0D81610];
    v14 = objc_opt_class();
    __atxlog_handle_blending_ecosystem();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("predictionContext"), v4, 0, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContext"), -1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[ATXProactiveSuggestionShadowLoggingContext initWithClientModelCacheUpdates:context:](self, "initWithClientModelCacheUpdates:context:", v12, v16);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (ATXPredictionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, 0);
}

- (void)updateWithClientModelCacheUpdate:.cold.1()
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
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - updated with new client model cache: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithContext:.cold.1()
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
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - updated with new context: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
