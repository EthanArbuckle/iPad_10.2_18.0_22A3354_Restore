@implementation HKAnalyticsEventSubmissionManager

- (HKAnalyticsEventSubmissionManager)initWithLoggingCategory:(id)a3 healthDataSource:(id)a4
{
  id v6;
  id v7;
  HKAnalyticsDataSource *v8;
  HKAnalyticsEventSubmissionManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HKAnalyticsDataSource initWithHealthDataSource:]([HKAnalyticsDataSource alloc], "initWithHealthDataSource:", v6);

  v9 = -[HKAnalyticsEventSubmissionManager initWithDataSource:eventUsedProvider:analyticsEventConsumer:loggingCategory:](self, "initWithDataSource:eventUsedProvider:analyticsEventConsumer:loggingCategory:", v8, &__block_literal_global_26, &__block_literal_global_5, v7);
  return v9;
}

uint64_t __78__HKAnalyticsEventSubmissionManager_initWithLoggingCategory_healthDataSource___block_invoke()
{
  return AnalyticsIsEventUsed();
}

uint64_t __78__HKAnalyticsEventSubmissionManager_initWithLoggingCategory_healthDataSource___block_invoke_2()
{
  return AnalyticsSendEvent();
}

- (HKAnalyticsEventSubmissionManager)initWithDataSource:(id)a3 eventUsedProvider:(id)a4 analyticsEventConsumer:(id)a5 loggingCategory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKAnalyticsEventSubmissionManager *v15;
  HKAnalyticsEventSubmissionManager *v16;
  void *v17;
  id eventUsedProvider;
  void *v19;
  id analyticsEventConsumer;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKAnalyticsEventSubmissionManager;
  v15 = -[HKAnalyticsEventSubmissionManager init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dataSource, a3);
    v17 = _Block_copy(v12);
    eventUsedProvider = v16->_eventUsedProvider;
    v16->_eventUsedProvider = v17;

    v19 = _Block_copy(v13);
    analyticsEventConsumer = v16->_analyticsEventConsumer;
    v16->_analyticsEventConsumer = v19;

    objc_storeStrong((id *)&v16->_loggingCategory, a6);
  }

  return v16;
}

- (BOOL)submitEvent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *loggingCategory;
  BOOL v11;
  const char *v12;
  id v13;
  HKAnalyticsDataSource *dataSource;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v21;
  HKAnalyticsDataSource *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  HKAnalyticsEventSubmissionManager *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*((uint64_t (**)(void))self->_eventUsedProvider + 2))() & 1) != 0)
  {
    -[HKAnalyticsDataSource environmentDataSource](self->_dataSource, "environmentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isImproveHealthAndActivityEnabled");

    if (objc_msgSend(v6, "isEventSubmissionIHAGated") && (v9 & 1) == 0)
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      v11 = 0;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = self;
        v33 = 2114;
        v34 = v7;
        v12 = "[%{public}@:%{public}@] Analytics event not sent as event requires IH&A but IH&A not enabled";
LABEL_8:
        _os_log_impl(&dword_19A0E6000, loggingCategory, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
        v11 = 0;
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataSource = self->_dataSource;
    v30 = 0;
    objc_msgSend(v6, "makeUnrestrictedEventPayloadWithDataSource:error:", dataSource, &v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v30;
    if (v16)
    {
      v17 = v16;
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
      _HKInitializeLogging();
      v19 = self->_loggingCategory;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v32 = self;
        v33 = 2114;
        v34 = v17;
        v35 = 2114;
        v36 = v7;
        _os_log_error_impl(&dword_19A0E6000, v19, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error when extracting unrestricted event payload: %{public}@", buf, 0x20u);
      }
LABEL_17:

      goto LABEL_18;
    }
    if (v15)
    {
      v18 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v13, "addEntriesFromDictionary:", v18);

    }
    else
    {
      _HKInitializeLogging();
      v21 = self->_loggingCategory;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v32 = self;
        v33 = 2114;
        v34 = v7;
        _os_log_impl(&dword_19A0E6000, v21, OS_LOG_TYPE_INFO, "[%{public}@:%{public}@] No unrestricted payload", buf, 0x16u);
      }
    }
    if (v9)
    {
      v22 = self->_dataSource;
      v29 = 0;
      objc_msgSend(v6, "makeIHAGatedEventPayloadWithDataSource:error:", v22, &v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29;
      if (v24)
      {
        v17 = v24;
        if (a4)
          *a4 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError(v24);
        _HKInitializeLogging();
        v26 = self->_loggingCategory;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v32 = self;
          v33 = 2114;
          v34 = v17;
          v35 = 2114;
          v36 = v7;
          _os_log_error_impl(&dword_19A0E6000, v26, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error when extracting IHA gated event payload: %{public}@", buf, 0x20u);
        }

        goto LABEL_17;
      }
      if (v23)
      {
        v25 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(v13, "addEntriesFromDictionary:", v25);

      }
      else
      {
        _HKInitializeLogging();
        v27 = self->_loggingCategory;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v32 = self;
          v33 = 2114;
          v34 = v7;
          _os_log_impl(&dword_19A0E6000, v27, OS_LOG_TYPE_INFO, "[%{public}@:%{public}@] No IH&A gated payload", buf, 0x16u);
        }
      }

    }
    if (objc_msgSend(v13, "count"))
    {
      (*((void (**)(void))self->_analyticsEventConsumer + 2))();
      v11 = 1;
      goto LABEL_19;
    }
    _HKInitializeLogging();
    v28 = self->_loggingCategory;
    v11 = 0;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_19A0E6000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Not sending payload as there were no contents", buf, 0x16u);
LABEL_18:
    v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  v11 = 0;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v7;
    v12 = "[%{public}@:%{public}@] Analytics event not sent as event treated as unused by CoreAnalytics";
    goto LABEL_8;
  }
LABEL_20:

  return v11;
}

- (id)queue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  queue = self->_queue;
  if (!queue)
  {
    HKCreateSerialDispatchQueue(self, CFSTR("HKAnalyticsEventSubmissionManager.queue"));
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

- (void)submitEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKAnalyticsEventSubmissionManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HKAnalyticsEventSubmissionManager_submitEvent_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __60__HKAnalyticsEventSubmissionManager_submitEvent_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = 0;
  objc_msgSend(v2, "submitEvent:error:", v3, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_analyticsEventConsumer, 0);
  objc_storeStrong(&self->_eventUsedProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
