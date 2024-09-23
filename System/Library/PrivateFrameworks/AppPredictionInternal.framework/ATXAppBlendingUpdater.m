@implementation ATXAppBlendingUpdater

+ (id)clientModelIdForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v5 = 0;
  if (a3 <= 0x25u)
  {
    if (((1 << a3) & 0x39E) != 0)
    {
      v6 = 15;
    }
    else if (a3 == 35)
    {
      v6 = 17;
    }
    else
    {
      if (a3 != 37)
        return v5;
      v6 = 16;
    }
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", v6, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)clientModelSpecForAppPredictionsForClientModelId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appPredictionBlendingModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v3, v5, 0);
  return v6;
}

+ (id)clientModelForAppPredictionsForClientModelId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blendingLayerServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithClientModelId:blendingLayerServer:", v3, v6);

  return v7;
}

+ (void)updateBlendingLayerForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  char v18;
  id v19;
  uint8_t *v20;
  uint8_t buf[24];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8CD0], "assetMappingWithCachedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getFullCachePathWithBaseCachePath:consumerSubType:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, &v19);
  v9 = v19;
  if (v8)
  {
    +[ATXAppBlendingUpdater clientModelIdForConsumerSubType:](ATXAppBlendingUpdater, "clientModelIdForConsumerSubType:", v3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[ATXAppPredictionFeedbackItem predictionItemsInFeedbackChunkFromCacheFileData:](ATXAppPredictionFeedbackItem, "predictionItemsInFeedbackChunkFromCacheFileData:", v8);
      objc_msgSend((id)objc_opt_class(), "clientModelSpecForAppPredictionsForClientModelId:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromAppPredictionItems:clientModelSpec:maxSuggestionsToSendToBlendingLayer:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsFromAppPredictionItems:clientModelSpec:maxSuggestionsToSendToBlendingLayer:", buf, v11, 75);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "clientModelForAppPredictionsForClientModelId:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke;
      v17[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
      v18 = v3;
      objc_msgSend(v13, "updateSuggestions:feedbackMetadata:completionHandler:", v12, v8, v17);

      v20 = buf;
      std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
    }
    else
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXAppBlendingUpdater updateBlendingLayerForConsumerSubType:].cold.2(v16, buf, v15);
      }

    }
  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXAppBlendingUpdater updateBlendingLayerForConsumerSubType:].cold.1(v14, (uint64_t)v9, (uint64_t)buf);
    }
  }

}

void __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated blending for %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke_cold_1(v8, (uint64_t)v5, (uint64_t)&v9);
    }
  }

}

+ (void)updateBlendingLayerForConsumerSubType:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5_2((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_13(&dword_1C9A3B000, "Nil cacheFileData found when trying to update blending for %@. Error: %@", v4, v5);

  OUTLINED_FUNCTION_11_0();
}

+ (void)updateBlendingLayerForConsumerSubType:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Nil clientModelId found when trying to update blending for %@.", buf, 0xCu);

  OUTLINED_FUNCTION_11_0();
}

void __63__ATXAppBlendingUpdater_updateBlendingLayerForConsumerSubType___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5_2((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_13(&dword_1C9A3B000, "Error updating blending for %@ with error: %@", v4, v5);

  OUTLINED_FUNCTION_11_0();
}

@end
