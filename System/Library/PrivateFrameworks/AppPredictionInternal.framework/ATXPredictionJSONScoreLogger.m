@implementation ATXPredictionJSONScoreLogger

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_8 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_8, &__block_literal_global_71);
  return (id)sharedInstance__pasExprOnceResult_10;
}

void __46__ATXPredictionJSONScoreLogger_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10;
  sharedInstance__pasExprOnceResult_10 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXPredictionJSONScoreLogger)init
{
  ATXPredictionJSONScoreLogger *v2;
  uint64_t v3;
  NSMutableDictionary *history;
  void *v5;
  uint64_t v6;
  NSMutableArray *subscoreHistories;
  objc_class *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *fastQueue;
  objc_class *v16;
  void *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *slowQueue;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ATXPredictionJSONScoreLogger;
  v2 = -[ATXPredictionJSONScoreLogger init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    history = v2->_history;
    v2->_history = (NSMutableDictionary *)v3;

    v5 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_history, "setObject:forKeyedSubscript:", v5, CFSTR("predictionSubScores"));

    v6 = objc_opt_new();
    subscoreHistories = v2->_subscoreHistories;
    v2->_subscoreHistories = (NSMutableArray *)v6;

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("-fast"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v11, v13);
    fastQueue = v2->_fastQueue;
    v2->_fastQueue = (OS_dispatch_queue *)v14;

    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("-slow"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_BACKGROUND, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(v19, v21);
    slowQueue = v2->_slowQueue;
    v2->_slowQueue = (OS_dispatch_queue *)v22;

  }
  return v2;
}

- (void)logInputs:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "shouldIncludePredictionLogs"))
  {
    +[ATXScoreDict scoreDictFromDictionary:](ATXScoreDict, "scoreDictFromDictionary:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXScoreDict scoreDictFromDictionary:](ATXScoreDict, "scoreDictFromDictionary:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:](self, "logInputDict:subscores:forBundleId:", v10, v11, v9);

  }
}

- (void)logInputDict:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *fastQueue;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "shouldIncludePredictionLogs"))
  {
    if (v8)
    {
      if (v9)
      {
        if (v10)
        {
          fastQueue = self->_fastQueue;
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __67__ATXPredictionJSONScoreLogger_logInputDict_subscores_forBundleId___block_invoke;
          v34[3] = &unk_1E82DBAB0;
          v34[4] = self;
          v35 = v10;
          v36 = v8;
          v37 = v9;
          dispatch_async(fastQueue, v34);

          goto LABEL_13;
        }
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:].cold.3(v12, v27, v28, v29, v30, v31, v32, v33);
      }
      else
      {
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:].cold.2(v12, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    else
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }

  }
LABEL_13:

}

void __67__ATXPredictionJSONScoreLogger_logInputDict_subscores_forBundleId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  __int128 *v9;
  _QWORD *v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[3];
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  __int128 v27;
  uint64_t v28;
  _QWORD v29[3];
  __int128 v30;
  uint64_t v31;
  _QWORD v32[3];
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v4, CFSTR("secondsSince1970"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16)) != 8
    || v6 > 0x63)
  {
    if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16)) == 9)
    {
      if (v6 >= 0xFA)
      {
        objc_msgSend(*(id *)(a1 + 56), "scoreForKey:found:", CFSTR("TotalScore"), 0);
        goto LABEL_11;
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16)) != 10|| v6 >= 0xFA)
    {
      objc_msgSend(*(id *)(a1 + 56), "scoreForKey:found:", CFSTR("TotalScore"), 0);
      if (!v6)
      {
LABEL_15:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_OWORD *)(a1 + 40);
        v23[0] = CFSTR("bundleId");
        v23[1] = CFSTR("inputs");
        v23[2] = CFSTR("subscores");
        v25 = *(_QWORD *)(a1 + 56);
        v8 = (void *)MEMORY[0x1E0C99D80];
        v9 = &v24;
        v10 = v23;
        goto LABEL_16;
      }
LABEL_11:
      v12 = v11;
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("subscores"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scoreForKey:found:", CFSTR("TotalScore"), 0);
        v18 = v17;

        if (v18 < v12)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21 == 100)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeLastObject");

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *(_OWORD *)(a1 + 40);
          v26[0] = CFSTR("bundleId");
          v26[1] = CFSTR("inputs");
          v26[2] = CFSTR("subscores");
          v28 = *(_QWORD *)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, v26, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "insertObject:atIndex:", v19, i);
          goto LABEL_17;
        }
      }
      if (v6 > 0x63)
        return;
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_OWORD *)(a1 + 40);
    v29[0] = CFSTR("action");
    v29[1] = CFSTR("inputs");
    v29[2] = CFSTR("subscores");
    v31 = *(_QWORD *)(a1 + 56);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v30;
    v10 = v29;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("predictionSubScores"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(_OWORD *)(a1 + 40);
  v32[0] = CFSTR("actionKey");
  v32[1] = CFSTR("inputs");
  v32[2] = CFSTR("subscores");
  v34 = *(_QWORD *)(a1 + 56);
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = &v33;
  v10 = v32;
LABEL_16:
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v19);
LABEL_17:

}

- (void)setConsumerSubType:(unsigned __int8)a3
{
  NSObject *fastQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  fastQueue = self->_fastQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ATXPredictionJSONScoreLogger_setConsumerSubType___block_invoke;
  v4[3] = &unk_1E82DFBB8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(fastQueue, v4);
}

uint64_t __51__ATXPredictionJSONScoreLogger_setConsumerSubType___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setPredictionClass:(id)a3
{
  id v4;
  NSObject *fastQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fastQueue = self->_fastQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ATXPredictionJSONScoreLogger_setPredictionClass___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(fastQueue, v7);

}

uint64_t __51__ATXPredictionJSONScoreLogger_setPredictionClass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("predictionClass"));
}

- (void)setAssetVersion:(unint64_t)a3
{
  NSObject *fastQueue;
  _QWORD v4[6];

  fastQueue = self->_fastQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ATXPredictionJSONScoreLogger_setAssetVersion___block_invoke;
  v4[3] = &unk_1E82DC688;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fastQueue, v4);
}

void __48__ATXPredictionJSONScoreLogger_setAssetVersion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v2, CFSTR("assetVersion"));

}

- (void)setCacheAge:(double)a3
{
  NSObject *fastQueue;
  _QWORD v4[6];

  fastQueue = self->_fastQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__ATXPredictionJSONScoreLogger_setCacheAge___block_invoke;
  v4[3] = &unk_1E82DC688;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(fastQueue, v4);
}

void __44__ATXPredictionJSONScoreLogger_setCacheAge___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v2, CFSTR("PredictionCacheAge"));

}

- (void)flush
{
  -[ATXPredictionJSONScoreLogger flushWithCompletion:](self, "flushWithCompletion:", &__block_literal_global_38_0);
}

- (void)flushWithFilenameSuffix:(id)a3
{
  -[ATXPredictionJSONScoreLogger flushWithCompletion:filenameSuffix:](self, "flushWithCompletion:filenameSuffix:", &__block_literal_global_39_0, a3);
}

- (void)flushWithCompletion:(id)a3
{
  void *v4;
  uint64_t consumerSubType;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CF9508];
  consumerSubType = self->_consumerSubType;
  v6 = a3;
  objc_msgSend(v4, "safeStringForConsumerSubtype:", consumerSubType);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionJSONScoreLogger flushWithCompletion:filenameSuffix:](self, "flushWithCompletion:filenameSuffix:", v6, v7);

}

- (void)flushWithCompletion:(id)a3 filenameSuffix:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  NSObject *fastQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void (**v15)(_QWORD);

  v7 = (void (**)(_QWORD))a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D81588], "shouldIncludePredictionLogs") & 1) != 0)
  {
    sel_getName(a2);
    v9 = (void *)os_transaction_create();
    fastQueue = self->_fastQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke;
    v12[3] = &unk_1E82DFC20;
    v12[4] = self;
    v15 = v7;
    v13 = v9;
    v14 = v8;
    v11 = v9;
    dispatch_async(fastQueue, v12);

  }
  else
  {
    v7[2](v7);
  }

}

void __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v6, CFSTR("predictionSubScores"));

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(v7 + 40);
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_2;
    block[3] = &unk_1E82DB9D8;
    block[4] = v7;
    v24 = v2;
    v25 = v8;
    v11 = v2;
    dispatch_async(v9, block);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("appPredictionScoreLog_%@.json"), *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v16 = *(NSObject **)(v14 + 40);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_3;
    v18[3] = &unk_1E82DF830;
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = *(id *)(a1 + 56);
    v17 = v13;
    dispatch_async(v16, v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

id __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") >= 2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
  return (id)objc_opt_self();
}

uint64_t __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  FILE *v9;
  FILE *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint8_t v15[16];
  uint8_t buf[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "JSONScoreLogWrite", " enableTelemetry=YES ", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v7 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), 1537, 3, 0, 384);
  if ((v7 & 0x80000000) == 0)
  {
    v8 = v7;
    v9 = fdopen(v7, "w");
    if (v9)
    {
      v10 = v9;
      +[ATXScoreLogSerialization writeObject:toFile:](ATXScoreLogSerialization, "writeObject:toFile:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), v9);
      fclose(v10);
    }
    else
    {
      close(v8);
    }
  }
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v12, OS_SIGNPOST_INTERVAL_END, v3, "JSONScoreLogWrite", " enableTelemetry=YES ", v15, 2u);
  }

  v13 = (id)objc_opt_self();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slowQueue, 0);
  objc_storeStrong((id *)&self->_fastQueue, 0);
  objc_storeStrong((id *)&self->_subscoreHistories, 0);
  objc_storeStrong((id *)&self->_history, 0);
}

- (void)logInputDict:(uint64_t)a3 subscores:(uint64_t)a4 forBundleId:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Nil 'inputs' while attempting to log app prediction score inputs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)logInputDict:(uint64_t)a3 subscores:(uint64_t)a4 forBundleId:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Nil 'subscores' while attempting to log app prediction score inputs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)logInputDict:(uint64_t)a3 subscores:(uint64_t)a4 forBundleId:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Nil 'bundleId' while attempting to log app prediction score inputs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
