@implementation HDAnalyticsDailyEventManager

- (HDAnalyticsDailyEventManager)initWithProfile:(id)a3 eventSubmissionManager:(id)a4 logCategory:(id)a5 eventConstructor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDAnalyticsDailyEventManager *v14;
  HDAnalyticsDailyEventManager *v15;
  void *v16;
  id eventConstructor;
  uint64_t v18;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HDAnalyticsDailyEventManager;
  v14 = -[HDAnalyticsDailyEventManager init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_eventSubmissionManager, a4);
    objc_storeStrong((id *)&v15->_logCategory, a5);
    v16 = _Block_copy(v13);
    eventConstructor = v15->_eventConstructor;
    v15->_eventConstructor = v16;

    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v15->_queue_isObserving = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerDaemonReadyObserver:queue:", v15, v15->_queue);

  }
  return v15;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void (**observationReadyCompletion)(void);
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analyticsSubmissionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:queue:", self, self->_queue);

  observationReadyCompletion = (void (**)(void))self->_observationReadyCompletion;
  if (observationReadyCompletion)
  {
    observationReadyCompletion[2]();
    v8 = self->_observationReadyCompletion;
    self->_observationReadyCompletion = 0;

  }
  self->_queue_isObserving = 1;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  NSObject *queue;
  id v6;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[HDAnalyticsDailyEventManager _submitAnalyticsEventWithCompletion:](self, "_submitAnalyticsEventWithCompletion:", v6);

}

- (void)_submitAnalyticsEventWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t, id);
  id WeakRetained;
  void *v6;
  NSObject *logCategory;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  HKAnalyticsEventSubmissionManager *eventSubmissionManager;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t, id))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  if (WeakRetained)
  {
    (*((void (**)(void))self->_eventConstructor + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    logCategory = self->_logCategory;
    v8 = os_log_type_enabled(logCategory, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v8)
      {
        v20 = logCategory;
        *(_DWORD *)buf = 138543362;
        v35 = (id)objc_opt_class();
        v21 = v35;
        _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] No analytics event provided from trigger request.", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("No analytics event provided"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, 1, v15);
      goto LABEL_22;
    }
    if (v8)
    {
      v9 = logCategory;
      v10 = (void *)objc_opt_class();
      v11 = v10;
      objc_msgSend(v6, "eventName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      v36 = 2114;
      v37 = v12;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Received daily analytics trigger, submitting.", buf, 0x16u);

    }
    eventSubmissionManager = self->_eventSubmissionManager;
    v33 = 0;
    v14 = -[HKAnalyticsEventSubmissionManager submitEvent:error:](eventSubmissionManager, "submitEvent:error:", v6, &v33);
    v15 = v33;
    _HKInitializeLogging();
    v16 = self->_logCategory;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v29 = v16;
        v30 = (void *)objc_opt_class();
        v31 = v30;
        objc_msgSend(v6, "eventName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v30;
        v36 = 2114;
        v37 = v32;
        v38 = 2114;
        v39 = v15;
        _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Metric submission failed with error: %{public}@", buf, 0x20u);

      }
      v4[2](v4, 0, 2, v15);
      goto LABEL_22;
    }
    v22 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v22)
      {
        v23 = v16;
        v24 = (void *)objc_opt_class();
        v25 = v24;
        objc_msgSend(v6, "eventName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        v36 = 2114;
        v37 = v26;
        v27 = "[%{public}@:%{public}@] Event submitted";
LABEL_20:
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);

      }
    }
    else if (v22)
    {
      v23 = v16;
      v28 = (void *)objc_opt_class();
      v25 = v28;
      objc_msgSend(v6, "eventName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v28;
      v36 = 2114;
      v37 = v26;
      v27 = "[%{public}@:%{public}@] Event not submitted but no error";
      goto LABEL_20;
    }
    v4[2](v4, 0, 0, 0);
    v15 = 0;
LABEL_22:

    goto LABEL_23;
  }
  _HKInitializeLogging();
  v17 = self->_logCategory;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    *(_DWORD *)buf = 138543362;
    v35 = (id)objc_opt_class();
    v19 = v35;
    _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] No profile available to construct event for trigger request.", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("No profile available"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, 1, v6);
LABEL_23:

}

- (void)_unitTest_setObservationReadyCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HDAnalyticsDailyEventManager__unitTest_setObservationReadyCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __72__HDAnalyticsDailyEventManager__unitTest_setObservationReadyCompletion___block_invoke(uint64_t a1)
{
  void (**v2)(void);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void (***)(void))(a1 + 40);
  if (*(_BYTE *)(v3 + 32))
  {
    v2[2]();
  }
  else
  {
    v4 = _Block_copy(v2);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logCategory, 0);
  objc_storeStrong(&self->_observationReadyCompletion, 0);
  objc_storeStrong(&self->_eventConstructor, 0);
  objc_storeStrong((id *)&self->_eventSubmissionManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
