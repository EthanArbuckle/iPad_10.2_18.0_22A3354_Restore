@implementation _ATXClientModelShadowMetricsDataSourceBase

- (_ATXClientModelShadowMetricsDataSourceBase)initWithClientModelType:(int64_t)a3
{
  _ATXClientModelShadowMetricsDataSourceBase *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ATXClientModelShadowMetricsDataSourceBase;
  result = -[_ATXClientModelShadowMetricsDataSourceBase init](&v5, sel_init);
  if (result)
    result->_clientModelType = a3;
  return result;
}

- (id)predictionCachePublisherFromStartDate:(id)a3
{
  void *v3;
  int64_t clientModelType;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = (void *)MEMORY[0x1E0D81198];
  clientModelType = self->_clientModelType;
  v5 = a3;
  objc_msgSend(v3, "clientModelIdFromClientModelType:", clientModelType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v9 = v8;

  objc_msgSend(v7, "publisherFromStartTime:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84___ATXClientModelShadowMetricsDataSourceBase_predictionCachePublisherFromStartDate___block_invoke;
  v14[3] = &unk_1E82DF748;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "filterWithIsIncluded:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)replayHistoryWithShadowEventPublisher:(id)a3 startDate:(id)a4 endDate:(id)a5 shadowEventHandler:(id)a6 predictionCacheHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  -[_ATXClientModelShadowMetricsDataSourceBase predictionCachePublisherFromStartDate:](self, "predictionCachePublisherFromStartDate:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke;
  v27[3] = &unk_1E82E4938;
  v27[4] = self;
  objc_msgSend(v16, "orderedMergeWithOther:comparator:", v15, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_64;
  v23[3] = &unk_1E82E4980;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = (id)objc_msgSend(v18, "sinkWithCompletion:shouldContinue:", &__block_literal_global_122, v23);

}

- (id)_eventBodyDateForEvent:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int isKindOfClass;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF9D33B8);

  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "absoluteTimestamp");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v3, "timestamp");
      objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

LABEL_7:
  return v10;
}

- (BOOL)isPrediction:(id)a3 equalToPrediction:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v5;
    v8 = v6;
    v9 = objc_msgSend(v7, "executableType");
    if (v9 != objc_msgSend(v8, "executableType"))
      goto LABEL_8;
    v10 = objc_msgSend(v7, "predictionReasons");
    if (v10 != objc_msgSend(v8, "predictionReasons"))
      goto LABEL_8;
    objc_msgSend(v7, "scoreSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scoreSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      objc_msgSend(v7, "executableIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "executableIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

    }
    else
    {
LABEL_8:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)numberOfPredictionsInCache:(id)a3 ofType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "suggestions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "executableType") == a4)
            ++v9;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)enumeratePredictionsInCache:(id)a3 ofType:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v9 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "suggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92___ATXClientModelShadowMetricsDataSourceBase_enumeratePredictionsInCache_ofType_usingBlock___block_invoke;
    v10[3] = &unk_1E82E49A8;
    v12 = a4;
    v11 = v7;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

@end
