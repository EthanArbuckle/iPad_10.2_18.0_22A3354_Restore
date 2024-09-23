@implementation ATXClientModelShadowMetricsAppIntentDataSource

- (void)replayHistoryBetweenStartDate:(id)a3 endDate:(id)a4 shadowEventHandler:(id)a5 predictionCacheHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "App");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Intent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "atx_publisherFromStartDate:", v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[_ATXClientModelShadowMetricsDataSourceBase replayHistoryWithShadowEventPublisher:startDate:endDate:shadowEventHandler:predictionCacheHandler:](self, "replayHistoryWithShadowEventPublisher:startDate:endDate:shadowEventHandler:predictionCacheHandler:", v17, v13, v12, v11, v10);
}

- (unint64_t)cacheHitIndexForShadowEvent:(id)a3 predictionCache:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v5;
    objc_msgSend(v7, "atxAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8)
    {
      +[ATXProactiveSuggestionBuilder executableIdForAction:](ATXProactiveSuggestionBuilder, "executableIdForAction:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v6, "suggestions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __94__ATXClientModelShadowMetricsAppIntentDataSource_cacheHitIndexForShadowEvent_predictionCache___block_invoke;
      v14[3] = &unk_1E82E49F0;
      v12 = v10;
      v15 = v12;
      v16 = &v17;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

      v9 = v18[3];
      _Block_object_dispose(&v17, 8);

    }
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

void __94__ATXClientModelShadowMetricsAppIntentDataSource_cacheHitIndexForShadowEvent_predictionCache___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "executableType") == 2)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "executableIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

    if ((_DWORD)v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }

}

- (BOOL)isPrediction:(id)a3 equalToPrediction:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXClientModelShadowMetricsAppIntentDataSource;
  return -[_ATXClientModelShadowMetricsDataSourceBase isPrediction:equalToPrediction:](&v5, sel_isPrediction_equalToPrediction_, a3, a4);
}

- (unint64_t)numberOfPredictionsInCache:(id)a3
{
  return -[_ATXClientModelShadowMetricsDataSourceBase numberOfPredictionsInCache:ofType:](self, "numberOfPredictionsInCache:ofType:", a3, 2);
}

- (void)enumeratePredictionsInCache:(id)a3 usingBlock:(id)a4
{
  -[_ATXClientModelShadowMetricsDataSourceBase enumeratePredictionsInCache:ofType:usingBlock:](self, "enumeratePredictionsInCache:ofType:usingBlock:", a3, 2, a4);
}

@end
