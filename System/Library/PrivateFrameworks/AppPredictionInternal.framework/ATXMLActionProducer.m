@implementation ATXMLActionProducer

- (id)consumerSubTypesToInvalidateForTTL:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  ATXMLActionProducer *v15;
  double v16;
  BOOL v17;

  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "consumerSubTypesToUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __136__ATXMLActionProducer_consumerSubTypesToInvalidateForTTL_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke;
  v13[3] = &unk_1E82DD370;
  v16 = a3;
  v17 = a5;
  v10 = v8;
  v14 = v10;
  v15 = self;
  objc_msgSend(v9, "_pas_filteredArrayWithTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)consumerSubTypesToUpdate
{
  if (+[ATXMLActionProducer consumerSubTypesToUpdate]::onceToken != -1)
    dispatch_once(&+[ATXMLActionProducer consumerSubTypesToUpdate]::onceToken, &__block_literal_global_38);
  return (id)+[ATXMLActionProducer consumerSubTypesToUpdate]::consumerSubTypesToUpdate;
}

BOOL __136__ATXMLActionProducer_consumerSubTypesToInvalidateForTTL_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _BOOL8 v10;

  v3 = objc_msgSend(a2, "intValue");
  v4 = *(double *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cacheRefreshIntervalForDisabledActionConsumerSubType");
      v4 = v8;

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_cachePathForConsumerSubtype:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[ATXFileUtil shouldUpdateCache:withRefreshRate:](ATXFileUtil, "shouldUpdateCache:withRefreshRate:", v9, v4);

  return v10;
}

- (id)_cachePathForConsumerSubtype:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getFullCachePathWithBaseCachePath:consumerSubType:", self->_cacheBasePath, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ATXMLActionProducer)init
{
  ATXMLActionProducer *v2;
  void *v3;
  uint64_t v4;
  NSString *cacheBasePath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXMLActionProducer;
  v2 = -[ATXMLActionProducer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
    v4 = objc_claimAutoreleasedReturnValue();
    cacheBasePath = v2->_cacheBasePath;
    v2->_cacheBasePath = (NSString *)v4;

  }
  return v2;
}

- (id)produceActions
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D20]), "initWithCacheBasePath:", self->_cacheBasePath);
  v5 = -[ATXMLActionProducer writeCacheIfNotExistsForConsumerSubType:](self, "writeCacheIfNotExistsForConsumerSubType:", 21);
  -[ATXMLActionProducer _cachePathForConsumerSubtype:](self, "_cachePathForConsumerSubtype:", 21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readCacheFileForCachePath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 0;
  else
    v8 = v5;
  if (v8)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXMLActionProducer produceActions].cold.1(v9);

  }
  if (v5)
  {
    -[ATXMLActionProducer _getActionsFromCacheForConsumerSubType:cacheFileData:](self, "_getActionsFromCacheForConsumerSubType:cacheFileData:", 21, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }

  return v3;
}

- (BOOL)writeCacheIfNotExistsForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  _QWORD v11[3];
  void **v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMLActionProducer _cachePathForConsumerSubtype:](self, "_cachePathForConsumerSubtype:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
    return 1;
  memset(v11, 0, sizeof(v11));
  +[ATXActionPredictions _actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:featureCache:remainingPredictionItems:](ATXActionPredictions, "_actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:featureCache:remainingPredictionItems:", 0, 0, 0, 0, 0, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXMLActionProducer _writeIntermediateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:](self, "_writeIntermediateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:", v3, v9, v11);

  v12 = (void **)v11;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v8;
}

- (id)_getActionsFromCacheForConsumerSubType:(unsigned __int8)a3 cacheFileData:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  ATXActionCacheReader *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  if (v5)
  {
    v7 = (void *)MEMORY[0x1CAA48B6C]();
    v8 = -[ATXActionCacheReader initWithData:]([ATXActionCacheReader alloc], "initWithData:", v5);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke;
    v14[3] = &unk_1E82DD320;
    v10 = v6;
    v15 = v10;
    -[ATXActionCacheReader enumerateActionsAndPredictionItemsForConsumerSubtype:limit:block:](v8, "enumerateActionsAndPredictionItemsForConsumerSubtype:limit:block:", v4, 0x7FFFFFFFLL, v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke_2;
    v12[3] = &unk_1E82DD348;
    v13 = v10;
    -[ATXActionCacheReader enumerateExtraPredictionItemsWithBlock:](v8, "enumerateExtraPredictionItemsWithBlock:", v12);

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

void __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  ATXActionResult *v5;
  void *v6;
  void *v7;
  ATXActionResult *v8;
  id v9;

  v9 = a2;
  v5 = [ATXActionResult alloc];
  objc_msgSend(v9, "predictedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXActionResult initWithScoredAction:predictionItem:actionKey:](v5, "initWithScoredAction:predictionItem:actionKey:", v9, a3, v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

void __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke_2(uint64_t a1, uint64_t a2)
{
  ATXActionResult *v3;

  v3 = -[ATXActionResult initWithScoredAction:predictionItem:actionKey:]([ATXActionResult alloc], "initWithScoredAction:predictionItem:actionKey:", 0, a2, CFSTR("predictionItem"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:");

}

void __47__ATXMLActionProducer_consumerSubTypesToUpdate__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *context;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA48B6C]();
  v0 = (void *)objc_opt_new();
  v1 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = objc_msgSend(&unk_1E83CF890, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v12;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(&unk_1E83CF890);
        v5 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "getAssetFileAndSubscoreForConsumerSubType:", objc_msgSend(v5, "intValue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v0, "containsObject:", v7) & 1) == 0)
        {
          objc_msgSend(v1, "addObject:", v5);
          objc_msgSend(v0, "addObject:", v7);
        }

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(&unk_1E83CF890, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v2);
  }
  v8 = objc_msgSend(v1, "copy");
  v9 = (void *)+[ATXMLActionProducer consumerSubTypesToUpdate]::consumerSubTypesToUpdate;
  +[ATXMLActionProducer consumerSubTypesToUpdate]::consumerSubTypesToUpdate = v8;

  objc_autoreleasePoolPop(context);
}

- (void)invalidateCacheForConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  _QWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id *v18;
  id *v19;
  uint64_t v20;
  id **v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  +[ATXActionPredictions _actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:featureCache:remainingPredictionItems:](ATXActionPredictions, "_actionPredictionCandidatesForCandidateBundleIdentifiers:candidateActiontypes:firstStageScoreLogger:secondStageScoreLogger:multiStageScoreLogger:featureCache:remainingPredictionItems:", 0, 0, 0, 0, 0, a4, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "unsignedIntegerValue");
        memset(v13, 0, sizeof(v13));
        std::vector<ATXPredictionItem>::__init_with_size[abi:ne180100]<ATXPredictionItem*,ATXPredictionItem*>(v13, v18, v19, 0xDAB7EC1DD3431B57 * (((char *)v19 - (char *)v18) >> 5));
        -[ATXMLActionProducer invalidateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:](self, "invalidateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:", v12, v7, v13);
        v21 = (id **)v13;
        std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

  v21 = &v18;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);

}

- (void)invalidateCacheForConsumerSubType:(unsigned __int8)a3 actionPredictionCandidates:(id)a4 remainingPredictionItems:()vector<ATXPredictionItem
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v6 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v10;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating intermediate ML cache for %@ and attempting to replace it with new one", (uint8_t *)&v15, 0xCu);

  }
  v11 = -[ATXMLActionProducer _writeIntermediateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:](self, "_writeIntermediateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:", v6, v8, a5);
  objc_msgSend(MEMORY[0x1E0CF9080], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearRecentMLEngagementsExceptForActions:", 0);

  if (v11)
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Intermediate ML cache for %@ successfully replaced", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (BOOL)_writeIntermediateCacheForConsumerSubType:(unsigned __int8)a3 actionPredictionCandidates:(id)a4 remainingPredictionItems:(void *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint8_t v19[24];
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionsPerAppActionLimit");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionPredictions _predictionsForConsumerSubType:thirdStageScoreLogger:multiStageScoreLogger:actionPredictionCandidates:remainingPredictionItems:predictionsPerAppActionLimit:](ATXActionPredictions, "_predictionsForConsumerSubType:thirdStageScoreLogger:multiStageScoreLogger:actionPredictionCandidates:remainingPredictionItems:predictionsPerAppActionLimit:", v6, 0, 0, v8, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "predictionChunksForActionResults:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMLActionProducer _cachePathForConsumerSubtype:](self, "_cachePathForConsumerSubtype:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = ATXWriteActionPredictionChunks(v14, v13);

  if ((v15 & 1) == 0)
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXMLActionProducer _writeIntermediateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:].cold.1(v17, v19, v16);
    }

  }
  return v15;
}

+ (id)predictionChunksForActionResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "scoredAction", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
        {
          objc_msgSend(v9, "scoredAction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:](ATXDisplayCacheLockscreenFilter, "indicesOfLockScreenActionsForActionPredictions:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionCacheBuilder serializedChunksFromActionPredictionResults:lockscreenPredictionIndices:](ATXActionCacheBuilder, "serializedChunksFromActionPredictionResults:lockscreenPredictionIndices:", v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)updateBlendingLayerForAllConsumerSubTypes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = objc_msgSend(&unk_1E83CF8A8, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(&unk_1E83CF8A8);
        -[ATXMLActionProducer updateBlendingLayerForConsumerSubType:](self, "updateBlendingLayerForConsumerSubType:", objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "intValue"));
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E83CF8A8, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }
}

- (void)updateBlendingLayerForConsumerSubType:(unsigned __int8)a3
{
  if ((int)a3 > 37)
  {
    if (a3 == 46)
    {
      -[ATXMLActionProducer updateBlendingLayerForSettings](self, "updateBlendingLayerForSettings");
    }
    else if (a3 == 38)
    {
      -[ATXMLActionProducer updateBlendingLayerForHomeScreen](self, "updateBlendingLayerForHomeScreen");
    }
  }
  else if (a3 == 21)
  {
    -[ATXMLActionProducer updateBlendingLayerForSpotlight](self, "updateBlendingLayerForSpotlight");
  }
  else if (a3 == 22)
  {
    -[ATXMLActionProducer updateBlendingLayerForLockscreen](self, "updateBlendingLayerForLockscreen");
  }
}

- (void)updateBlendingLayerForLockscreen
{
  -[ATXMLActionProducer readCacheAndSendFilteredResultsToBlendingForConsumerSubType:](self, "readCacheAndSendFilteredResultsToBlendingForConsumerSubType:", 22);
}

- (void)updateBlendingLayerForHomeScreen
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (objc_msgSend(MEMORY[0x1E0CF8C50], "shouldDisplayRecentActionsOnHomeScreen"))
  {
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 11);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8C50], "actionResponseForDeveloperModeWithClientId:shouldShowRecentDonations:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "proactiveSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXActionBlendingUpdater updateBlendingLayerWithRecentShortcuts:](ATXActionBlendingUpdater, "updateBlendingLayerWithRecentShortcuts:", v4);

  }
  else
  {
    v6 = (id)objc_opt_new();
    +[ATXActionBlendingUpdater updateBlendingLayerWithRecentShortcuts:](ATXActionBlendingUpdater, "updateBlendingLayerWithRecentShortcuts:");

    +[ATXActionBlendingUpdater updateBlendingLayerWithFallbackActions](ATXActionBlendingUpdater, "updateBlendingLayerWithFallbackActions");
    -[ATXMLActionProducer readCacheAndSendFilteredResultsToBlendingForConsumerSubType:](self, "readCacheAndSendFilteredResultsToBlendingForConsumerSubType:", 38);
  }
}

- (void)updateBlendingLayerForSpotlight
{
  -[ATXMLActionProducer readCacheAndSendFilteredResultsToBlendingForConsumerSubType:](self, "readCacheAndSendFilteredResultsToBlendingForConsumerSubType:", 21);
}

- (void)updateBlendingLayerForSettings
{
  -[ATXMLActionProducer readCacheAndSendFilteredResultsToBlendingForConsumerSubType:](self, "readCacheAndSendFilteredResultsToBlendingForConsumerSubType:", 46);
}

- (void)readCacheAndSendFilteredResultsToBlendingForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint8_t buf[24];
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D20]), "initWithCacheBasePath:", self->_cacheBasePath);
  v6 = -[ATXMLActionProducer writeCacheIfNotExistsForConsumerSubType:](self, "writeCacheIfNotExistsForConsumerSubType:", v3);
  -[ATXMLActionProducer _cachePathForConsumerSubtype:](self, "_cachePathForConsumerSubtype:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readCacheFileForCachePath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 0;
  else
    v9 = v6;
  if (v9)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXMLActionProducer readCacheAndSendFilteredResultsToBlendingForConsumerSubType:].cold.1(v11, buf, v10);
    }

  }
  v12 = (void *)objc_opt_new();
  if (v6)
  {
    -[ATXMLActionProducer _getActionsFromCacheForConsumerSubType:cacheFileData:](self, "_getActionsFromCacheForConsumerSubType:cacheFileData:", v3, v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "count");
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412802;
    v29 = v16;
    v30 = 2048;
    v31 = v17;
    v32 = 2112;
    v33 = v18;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "%@ - readCacheAndSendFilteredResultsToBlendingForConsumerSubType read %lu predictions for consumerSubType: %@", (uint8_t *)&v28, 0x20u);

  }
  +[ATXActionPredictions filterHighQualityActionResults:consumerSubType:](ATXActionPredictions, "filterHighQualityActionResults:consumerSubType:", v12, v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "count");
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412802;
    v29 = v22;
    v30 = 2048;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%@ - readCacheAndSendFilteredResultsToBlendingForConsumerSubType has %lu predictions after filtering for consumerSubType: %@", (uint8_t *)&v28, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "predictionChunksForActionResults:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ATXCacheFileJoinChunks();
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v3 == 22)
  {
    -[ATXMLActionProducer lockscreenActionsFromPredictions:](self, "lockscreenActionsFromPredictions:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXActionBlendingUpdater updateBlendingLayerWithLockscreenActions:feedbackMetadata:](ATXActionBlendingUpdater, "updateBlendingLayerWithLockscreenActions:feedbackMetadata:", v27, v26);

  }
  else
  {
    +[ATXActionBlendingUpdater updateBlendingLayerWithBehavioralPredictions:feedbackMetadata:consumerSubType:](ATXActionBlendingUpdater, "updateBlendingLayerWithBehavioralPredictions:feedbackMetadata:consumerSubType:", v19, v26, v3);
  }

}

- (id)lockscreenActionsFromPredictions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[6];
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__17;
  v27 = __Block_byref_object_dispose__17;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__17;
  v21[4] = __Block_byref_object_dispose__17;
  v22 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke;
  aBlock[3] = &unk_1E82DD3B8;
  aBlock[4] = v21;
  aBlock[5] = &v23;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "atx_actionsFromActionResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:criteria:](ATXDisplayCacheLockscreenFilter, "indicesOfLockScreenActionsForActionPredictions:criteria:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject predictedItem](v8, "predictedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isTVWhiteListedLongFormMedia"))
    {
      objc_msgSend((id)v24[5], "predictedRouteInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (v11)
      {
LABEL_6:
        __atxlog_handle_blending();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject predictedItem](v8, "predictedItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v17;
          _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "lockscreen: Sending prediction to lockscreen: %@", buf, 0xCu);

        }
        v29 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      -[NSObject predictedItem](v8, "predictedItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v24[5], "predictedRouteInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionWithRouteInfo:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc(MEMORY[0x1E0CF9090]);
      -[NSObject score](v8, "score");
      v15 = objc_msgSend(v14, "initWithPredictedItem:score:", v9);

      v8 = v15;
    }

    goto LABEL_6;
  }
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "lockscreen: clearing suggestions because no suggestions received", buf, 2u);
  }
  v18 = (void *)MEMORY[0x1E0C9AA60];
LABEL_12:

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v18;
}

uint64_t __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  objc_msgSend(a2, "predictedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isTVWhiteListedLongFormMedia"))
  {
    if (!objc_msgSend(v3, "isTVAction"))
    {
      v16 = 1;
      goto LABEL_16;
    }
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke_cold_1(v17);

    goto LABEL_12;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isTVExperienceAppNowPlaying") & 1) != 0)
    {
LABEL_12:
      v16 = 0;
      goto LABEL_16;
    }
  }
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CF8C18]);
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predictedRouteAcceptThreshold");
    *(float *)&v10 = v10;
    v11 = objc_msgSend(v8, "initWithAcceptThreshold:avRoutingSessionManager:", 0, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v7, "predictedRouteInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "predictedRouteInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isExternalRoute");

  }
  else
  {
    v16 = 0;
  }

LABEL_16:
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
}

- (void)produceActions
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "While producing actions in the display cache, failed to read cache file data for Spotlight, although the cache is supposed to exist.", v1, 2u);
}

- (void)_writeIntermediateCacheForConsumerSubType:(void *)a1 actionPredictionCandidates:(uint8_t *)buf remainingPredictionItems:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Failed to write intermediate cache for consumerSubType: %@", buf, 0xCu);

}

- (void)readCacheAndSendFilteredResultsToBlendingForConsumerSubType:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "While updating predictions for blending, failed to read cache file data for %@, although the cache is supposed to exist.", buf, 0xCu);

}

void __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Prevented showing a TV intent which is not a TVWhiteListedLongFormMedia", v1, 2u);
}

@end
