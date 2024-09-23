@implementation ATXActionFeedbackWeights

- (float)confirmWeightForFeedbackStage:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  unsigned int v4;
  float result;
  void *v14;
  void *v15;

  v4 = a4;
  if (a3 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionFeedbackWeights.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feedbackStage < ATXActionFeedbackStageMax"));

  }
  if (v4 >= 0x30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionFeedbackWeights.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("consumerSubType < ATXConsumerSubTypeMax"));

  }
  _H0 = *(_WORD *)&self->_confirmWeights[96 * a3 + 2 * v4];
  __asm { FCVT            S0, H0 }
  return result;
}

- (float)rejectWeightForFeedbackStage:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  unsigned int v4;
  float result;
  void *v14;
  void *v15;

  v4 = a4;
  if (a3 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionFeedbackWeights.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feedbackStage < ATXActionFeedbackStageMax"));

  }
  if (v4 >= 0x30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionFeedbackWeights.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("consumerSubType < ATXConsumerSubTypeMax"));

  }
  _H0 = *(_WORD *)&self->_rejectWeights[96 * a3 + 2 * v4];
  __asm { FCVT            S0, H0 }
  return result;
}

- (ATXActionFeedbackWeights)initWithAssetClass:(Class)a3
{
  ATXActionFeedbackWeights *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXActionFeedbackWeights;
  v4 = -[ATXActionFeedbackWeights init](&v14, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v6 = (void *)MEMORY[0x1E0CF8CF0];
    if (!a3)
      a3 = (Class)objc_opt_class();
    objc_msgSend(v6, "dictionaryWithLegacyPathForClass:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Confirms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Rejects"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11)
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXActionFeedbackWeights initWithAssetClass:].cold.1((uint64_t)v7, v12);

    }
    else
    {
      loadArray((uint64_t)v4->_confirmWeights, v8);
      loadArray((uint64_t)v4->_rejectWeights, v10);
    }

    objc_autoreleasePoolPop(v5);
  }
  return v4;
}

- (ATXActionFeedbackWeights)init
{
  return -[ATXActionFeedbackWeights initWithAssetClass:](self, "initWithAssetClass:", 0);
}

+ (ATXActionFeedbackWeights)sharedInstance
{
  if (sharedInstance__pasOnceToken10[0] != -1)
    dispatch_once(sharedInstance__pasOnceToken10, &__block_literal_global_244);
  return (ATXActionFeedbackWeights *)(id)sharedInstance__pasExprOnceResult_53;
}

void __42__ATXActionFeedbackWeights_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_53;
  sharedInstance__pasExprOnceResult_53 = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)initWithAssetClass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Malformed weights asset %@", (uint8_t *)&v2, 0xCu);
}

@end
