@implementation ATXHeroAppManager

- (ATXHeroAppManager)init
{
  void *v3;
  ATXHeroAppManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXHeroAppManager initWithFeedback:](self, "initWithFeedback:", v3);

  return v4;
}

- (ATXHeroAppManager)initWithFeedback:(id)a3
{
  id v5;
  ATXHeroAppManager *v6;
  ATXHeroAppManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAppManager;
  v6 = -[ATXHeroAppManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heroFeedback, a3);

  return v7;
}

- (void)donateHeroAppPredictions:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__ATXHeroAppManager_donateHeroAppPredictions___block_invoke;
  v16[3] = &unk_1E82DD4C8;
  v16[4] = self;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v16);
  v3 = objc_claimAutoreleasedReturnValue();
  __atxlog_handle_hero();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSObject count](v3, "count");
    *(_DWORD *)buf = 134217984;
    v18 = *(double *)&v5;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Left with %lu predictions after removing predictions based on feedback.", buf, 0xCu);
  }

  if (-[NSObject count](v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getCurrentPreciseLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      v18 = -v10;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Took %f seconds to fetch precise location", buf, 0xCu);
    }

    if (v8)
    {
      +[ATXHeroDataServerHelper inRadiusPredictionsFrom:currentLocation:](ATXHeroDataServerHelper, "inRadiusPredictionsFrom:currentLocation:", v3, v8);
      v11 = objc_claimAutoreleasedReturnValue();

      __atxlog_handle_hero();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[NSObject count](v11, "count");
        *(_DWORD *)buf = 134217984;
        v18 = *(double *)&v12;
        _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Left with %lu predictions after removing predictions based on gps location.", buf, 0xCu);
      }
    }
    else
    {
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXHeroAppManager donateHeroAppPredictions:].cold.1(v13);

      v11 = objc_opt_new();
    }

    v3 = v11;
  }
  else
  {
    v8 = 0;
  }
  __atxlog_handle_hero();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject description](v3, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = *(double *)&v15;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Sending hero app predictions to blending layer. Predictions: %@", buf, 0xCu);

  }
  +[ATXHeroAppBlendingUpdater updateBlendingLayerWithHeroAppPredictions:currentLocation:](ATXHeroAppBlendingUpdater, "updateBlendingLayerWithHeroAppPredictions:currentLocation:", v3, v8);

}

uint64_t __46__ATXHeroAppManager_donateHeroAppPredictions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "shouldShowHeroAppPrediction:", a2);
}

- (ATXHeroAppFeedback)heroFeedback
{
  return self->_heroFeedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroFeedback, 0);
}

- (void)donateHeroAppPredictions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Could not get precise location. Clearing predictions.", v1, 2u);
}

@end
