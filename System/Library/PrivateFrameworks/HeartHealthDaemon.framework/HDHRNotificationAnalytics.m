@implementation HDHRNotificationAnalytics

- (HDHRNotificationAnalytics)initWithEventSample:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4
{
  id v6;
  HDHRNotificationAnalytics *v7;
  HDHRNotificationMetric *v8;
  HDHRNotificationMetric *metric;
  HDHRNotificationAnalytics *v10;
  objc_super v12;

  v6 = a3;
  if (!HKImproveHealthAndActivityAnalyticsAllowed())
    goto LABEL_5;
  v12.receiver = self;
  v12.super_class = (Class)HDHRNotificationAnalytics;
  v7 = -[HDHRNotificationAnalytics init](&v12, sel_init);
  self = v7;
  if (!v7
    || (v7->_areHealthNotificationsAuthorized = a4,
        -[HDHRNotificationAnalytics _createMetricFromEventSample:](v7, "_createMetricFromEventSample:", v6),
        v8 = (HDHRNotificationMetric *)objc_claimAutoreleasedReturnValue(),
        metric = self->_metric,
        self->_metric = v8,
        metric,
        self->_metric))
  {
    self = self;
    v10 = self;
  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)_createMetricFromEventSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDHRNotificationMetric *v11;
  _BOOL8 areHealthNotificationsAuthorized;
  const __CFString *v13;
  HDHRNotificationMetric *v14;
  void *v15;
  void *v16;
  HDHRNotificationMetric *v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_safeValueIfExistsForKeyPath:class:error:", *MEMORY[0x1E0CB72B0], objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "_beatsPerMinute");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "categoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "code");

  if (v10 > 155)
  {
    if (v10 == 236)
    {
      v14 = -[HDHRNotificationMetric initWithNotificationType:areHealthNotificationsAuthorized:]([HDHRNotificationMetric alloc], "initWithNotificationType:areHealthNotificationsAuthorized:", CFSTR("Cardio Fitness"), self->_areHealthNotificationsAuthorized);
      objc_msgSend(v4, "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hk_safeNumberIfExistsForKeyPath:error:", *MEMORY[0x1E0CB7328], 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (objc_msgSend(v16, "BOOLValue"))
          v19 = CFSTR("Repeat");
        else
          v19 = CFSTR("Initial");
        -[HDHRNotificationMetric setCardioFitnessNotificationType:](v14, "setCardioFitnessNotificationType:", v19);
      }
    }
    else
    {
      if (v10 != 156)
        goto LABEL_21;
      v14 = -[HDHRNotificationMetric initWithNotificationType:areHealthNotificationsAuthorized:]([HDHRNotificationMetric alloc], "initWithNotificationType:areHealthNotificationsAuthorized:", CFSTR("IRN"), self->_areHealthNotificationsAuthorized);
      objc_msgSend(v4, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_safeStringIfExistsForKeyPath:error:", *MEMORY[0x1E0CB7258], 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        -[HDHRNotificationMetric setIrregularRhythmNotificationsAlgorithmVersion:](v14, "setIrregularRhythmNotificationsAlgorithmVersion:", HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString());
    }

    goto LABEL_24;
  }
  if (v10 == 140)
  {
    v11 = [HDHRNotificationMetric alloc];
    areHealthNotificationsAuthorized = self->_areHealthNotificationsAuthorized;
    v13 = CFSTR("HHR");
LABEL_13:
    v17 = -[HDHRNotificationMetric initWithNotificationType:areHealthNotificationsAuthorized:](v11, "initWithNotificationType:areHealthNotificationsAuthorized:", v13, areHealthNotificationsAuthorized);
    v14 = v17;
    if (v8)
      -[HDHRNotificationMetric setNotificationThreshold:](v17, "setNotificationThreshold:", v8);
    goto LABEL_24;
  }
  if (v10 == 147)
  {
    v11 = [HDHRNotificationMetric alloc];
    areHealthNotificationsAuthorized = self->_areHealthNotificationsAuthorized;
    v13 = CFSTR("LHR");
    goto LABEL_13;
  }
LABEL_21:
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    -[HDHRNotificationAnalytics _createMetricFromEventSample:].cold.1(v20, (uint64_t)self, v4);
  v14 = 0;
LABEL_24:

  return v14;
}

- (void)_setDoNotDisturbOn:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHRNotificationMetric setDoNotDisturbOn:](self->_metric, "setDoNotDisturbOn:", v4);

}

- (void)_submitMetric
{
  -[HDHRNotificationMetric submit](self->_metric, "submit");
}

- (void)submit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D027B8], "userFocusComputedMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publisherFromStartTime:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "last");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__HDHRNotificationAnalytics_submit__block_invoke;
  v9[3] = &unk_1E87EFA60;
  v9[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HDHRNotificationAnalytics_submit__block_invoke_199;
  v7[3] = &unk_1E87EFA88;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  v6 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", v9, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__HDHRNotificationAnalytics_submit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] User focus computed mode publisher finished with error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_submitMetric");

}

void __35__HDHRNotificationAnalytics_submit__block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  v6 = *MEMORY[0x1E0CB52E8];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __35__HDHRNotificationAnalytics_submit__block_invoke_199_cold_2(a1, v5, v3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setDoNotDisturbOn:", objc_msgSend(v8, "isStarting"));

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __35__HDHRNotificationAnalytics_submit__block_invoke_199_cold_1(a1, v5, v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
}

- (void)_createMetricFromEventSample:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (void *)OUTLINED_FUNCTION_3_0();
  v7 = v6;
  objc_msgSend(a3, "categoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543618;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v3, v9, "[%{public}@] Analytics not compatible with sample type: %@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_2_0();
}

void __35__HDHRNotificationAnalytics_submit__block_invoke_199_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = v5;
  objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(a3, "error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543618;
  v11 = v5;
  v12 = 2114;
  v13 = v8;
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v4, v9, "[%{public}@] Received nil user focus computed mode with reason: %{public}@", (uint8_t *)&v10);

}

void __35__HDHRNotificationAnalytics_submit__block_invoke_199_cold_2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)OUTLINED_FUNCTION_3_0();
  v7 = v6;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  _os_log_debug_impl(&dword_1CC29C000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Received event: %{public}@", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

@end
