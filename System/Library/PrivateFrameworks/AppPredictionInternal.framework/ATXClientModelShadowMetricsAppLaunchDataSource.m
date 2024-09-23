@implementation ATXClientModelShadowMetricsAppLaunchDataSource

- (void)replayHistoryBetweenStartDate:(id)a3 endDate:(id)a4 shadowEventHandler:(id)a5 predictionCacheHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "App");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "InFocus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "atx_publisherFromStartDate:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "filterWithIsIncluded:", &__block_literal_global_85);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[_ATXClientModelShadowMetricsDataSourceBase replayHistoryWithShadowEventPublisher:startDate:endDate:shadowEventHandler:predictionCacheHandler:](self, "replayHistoryWithShadowEventPublisher:startDate:endDate:shadowEventHandler:predictionCacheHandler:", v18, v13, v12, v11, v10);
}

uint64_t __130__ATXClientModelShadowMetricsAppLaunchDataSource_replayHistoryBetweenStartDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

- (unint64_t)cacheHitIndexForShadowEvent:(id)a3 predictionCache:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v6, "suggestions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __94__ATXClientModelShadowMetricsAppLaunchDataSource_cacheHitIndexForShadowEvent_predictionCache___block_invoke;
      v12[3] = &unk_1E82E49F0;
      v10 = v8;
      v13 = v10;
      v14 = &v15;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

      v7 = v16[3];
      _Block_object_dispose(&v15, 8);

    }
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

void __94__ATXClientModelShadowMetricsAppLaunchDataSource_cacheHitIndexForShadowEvent_predictionCache___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "executableType") == 1)
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
  v5.super_class = (Class)ATXClientModelShadowMetricsAppLaunchDataSource;
  return -[_ATXClientModelShadowMetricsDataSourceBase isPrediction:equalToPrediction:](&v5, sel_isPrediction_equalToPrediction_, a3, a4);
}

- (unint64_t)numberOfPredictionsInCache:(id)a3
{
  return -[_ATXClientModelShadowMetricsDataSourceBase numberOfPredictionsInCache:ofType:](self, "numberOfPredictionsInCache:ofType:", a3, 1);
}

- (void)enumeratePredictionsInCache:(id)a3 usingBlock:(id)a4
{
  -[_ATXClientModelShadowMetricsDataSourceBase enumeratePredictionsInCache:ofType:usingBlock:](self, "enumeratePredictionsInCache:ofType:usingBlock:", a3, 1, a4);
}

@end
