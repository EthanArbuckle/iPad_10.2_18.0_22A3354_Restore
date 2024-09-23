@implementation ATXTransitionPredictorCR

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (ATXTransitionPredictorCR)initWithLocationManager:(id)a3 locationPredictionsManager:(id)a4
{
  id v7;
  id v8;
  ATXTransitionPredictorCR *v9;
  ATXTransitionPredictorCR *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXTransitionPredictorCR;
  v9 = -[ATXTransitionPredictorCR init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    objc_storeStrong((id *)&v10->_predictionsManager, a4);
    -[ATXTransitionPredictorCR invalidateCache](v10, "invalidateCache");
  }

  return v10;
}

- (id)getNextTransitionOnActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "shouldDefer") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ATXTransitionPredictorCR now](self, "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXLocationManagerProtocol getCurrentLocation](self->_locationManager, "getCurrentLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXTransitionPredictorCR getNextTransitionOnActivity:date:location:](self, "getNextTransitionOnActivity:date:location:", v4, v6, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)getNextTransitionOnActivity:(id)a3 date:(id)a4 location:(id)a5
{
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  ATXPredictedTransition *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    if (!-[ATXTransitionPredictorCR isCacheValidForDate:location:](self, "isCacheValidForDate:location:", a4, a5))
    {
      v9 = -[ATXTransitionPredictorCR updateCacheOnActivity:](self, "updateCacheOnActivity:", v8);
      __atxlog_handle_dailyroutines();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = CFSTR("failure");
        if (v9)
          v11 = CFSTR("success");
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Cache update %@", (uint8_t *)&v14, 0xCu);
      }

    }
    v12 = self->_upcomingTransition;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isCacheValidForDate:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_locationAtLastPrediction && self->_upcomingTransition)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v9 = v8;
    -[ATXPredictedTransition date](self->_upcomingTransition, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11 + 60.0;

    objc_msgSend(v7, "distanceFromLocation:", self->_locationAtLastPrediction);
    v14 = v13;
    v15 = CFSTR("No");
    if (v13 < 200.0)
      v15 = CFSTR("Yes");
    v16 = v15;
    __atxlog_handle_dailyroutines();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXPredictedTransition date](self->_upcomingTransition, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v6;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Cache status -- time: %@ <? %@ + grace period, location valid: %@", (uint8_t *)&v21, 0x20u);

    }
    v19 = v14 < 200.0 && v9 < v12;
  }
  else
  {
    __atxlog_handle_dailyroutines();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Cache not set", (uint8_t *)&v21, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (void)invalidateCache
{
  CLLocation *locationAtLastPrediction;
  ATXPredictedTransition *upcomingTransition;

  locationAtLastPrediction = self->_locationAtLastPrediction;
  self->_locationAtLastPrediction = 0;

  upcomingTransition = self->_upcomingTransition;
  self->_upcomingTransition = 0;

}

- (BOOL)updateCacheOnActivity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  ATXPredictedTransition *v9;
  ATXPredictedTransition *upcomingTransition;

  v4 = a3;
  -[ATXLocationManagerProtocol getCurrentLocation](self->_locationManager, "getCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !objc_msgSend(v4, "shouldDefer"))
  {
    -[ATXTransitionPredictorCR nextExitDate](self, "nextExitDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldDefer"))
    {
      -[ATXTransitionPredictorCR invalidateCache](self, "invalidateCache");
      v6 = 0;
    }
    else
    {
      -[ATXTransitionPredictorCR nextLoi](self, "nextLoi");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_locationAtLastPrediction, v5);
      v9 = -[ATXPredictedTransition initWithDate:loi:]([ATXPredictedTransition alloc], "initWithDate:loi:", v7, v8);
      upcomingTransition = self->_upcomingTransition;
      self->_upcomingTransition = v9;

      v6 = self->_upcomingTransition != 0;
    }

  }
  else
  {
    -[ATXTransitionPredictorCR invalidateCache](self, "invalidateCache");
    v6 = 0;
  }

  return v6;
}

- (id)nextExitDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[ATXPredictedLocationsManagerProtocol predictedExitTimes](self->_predictionsManager, "predictedExitTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__ATXTransitionPredictorCR_nextExitDate__block_invoke;
  v8[3] = &unk_1E82DC3C8;
  v8[4] = self;
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __40__ATXTransitionPredictorCR_nextExitDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  if (v5 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v6);
    v8 = v7 < 7200.0;

  }
  return v8;
}

- (id)nextLoi
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXPredictedLocationsManagerProtocol predictedLocationsOfInterest](self->_predictionsManager, "predictedLocationsOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_filteredArrayWithTest:", &__block_literal_global_130);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

BOOL __35__ATXTransitionPredictorCR_nextLoi__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 1 || objc_msgSend(v2, "type") == 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_upcomingTransition, 0);
  objc_storeStrong((id *)&self->_locationAtLastPrediction, 0);
  objc_storeStrong((id *)&self->_predictionsManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
