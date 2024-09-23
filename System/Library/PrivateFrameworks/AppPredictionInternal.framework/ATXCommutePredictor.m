@implementation ATXCommutePredictor

- (ATXCommutePredictor)initWithTransitionsCache:(id)a3 locationManager:(id)a4
{
  id v7;
  id v8;
  ATXCommutePredictor *v9;
  ATXCommutePredictor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCommutePredictor;
  v9 = -[ATXCommutePredictor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v10->_manager, a4);
  }

  return v10;
}

- (id)getNextTransitionOnActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  ATXPredictedTransition *v21;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  -[ATXLocationManagerProtocol locationOfInterestAtCurrentLocation](self->_manager, "locationOfInterestAtCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "type");
    v8 = objc_msgSend(v6, "type");
    if (!v7)
    {
      -[ATXPredictedTransitionsCache getNextHomeToWorkTransitionsOnActivity:](self->_cache, "getNextHomeToWorkTransitionsOnActivity:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_dailyroutines();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Sending cached home to work transition", buf, 2u);
      }

      v18 = objc_alloc(MEMORY[0x1E0D80DE8]);
      v12 = (void *)objc_opt_new();
      objc_msgSend(v6, "coordinate");
      v13 = v18;
      v14 = v12;
      v15 = 1;
      goto LABEL_11;
    }
    if (v8 == 1)
    {
      -[ATXPredictedTransitionsCache getNextWorkToHomeTransitionsOnActivity:](self->_cache, "getNextWorkToHomeTransitionsOnActivity:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_dailyroutines();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Sending cached work to home transition", v23, 2u);
      }

      v11 = objc_alloc(MEMORY[0x1E0D80DE8]);
      v12 = (void *)objc_opt_new();
      objc_msgSend(v6, "coordinate");
      v13 = v11;
      v14 = v12;
      v15 = 0;
LABEL_11:
      v16 = (void *)objc_msgSend(v13, "initWithUUID:visits:coordinate:type:", v14, 0, v15);

      goto LABEL_12;
    }
  }
  v16 = 0;
  v9 = 0;
LABEL_12:
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[ATXPredictedTransition initWithDate:loi:]([ATXPredictedTransition alloc], "initWithDate:loi:", v20, v16);
  return v21;
}

- (void)prewarmOnActivity:(id)a3
{
  -[ATXPredictedTransitionsCache prewarmOnActivity:](self->_cache, "prewarmOnActivity:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
