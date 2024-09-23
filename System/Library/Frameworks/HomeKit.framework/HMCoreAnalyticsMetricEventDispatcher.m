@implementation HMCoreAnalyticsMetricEventDispatcher

- (HMCoreAnalyticsMetricEventDispatcher)init
{
  return -[HMCoreAnalyticsMetricEventDispatcher initWithSendEventHandler:](self, "initWithSendEventHandler:", &__block_literal_global_19214);
}

- (HMCoreAnalyticsMetricEventDispatcher)initWithSendEventHandler:(id)a3
{
  id v4;
  void *v5;
  HMCoreAnalyticsMetricEventDispatcher *v6;
  void *v7;
  id sendEventHandler;
  HMAccessorySettingsMetricsDispatcher *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)HMCoreAnalyticsMetricEventDispatcher;
    v6 = -[HMCoreAnalyticsMetricEventDispatcher init](&v13, sel_init);
    if (v6)
    {
      v7 = _Block_copy(v5);
      sendEventHandler = v6->_sendEventHandler;
      v6->_sendEventHandler = v7;

    }
    return v6;
  }
  else
  {
    v10 = (HMAccessorySettingsMetricsDispatcher *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsMetricEventDispatcher *)-[HMAccessorySettingsMetricsDispatcher initWithCoreAnalyticsMetricDispatcher:](v10, v11, v12);
  }
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  HMCoreAnalyticsMetricEventDispatcher *v6;
  NSObject *v7;
  void *v8;
  void (**sendEventHandler)(id, void *, void *);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending event: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  sendEventHandler = (void (**)(id, void *, void *))v6->_sendEventHandler;
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sendEventHandler[2](sendEventHandler, v10, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendEventHandler, 0);
}

void __44__HMCoreAnalyticsMetricEventDispatcher_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v10)(id, _QWORD *);
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _BYTE buf[24];
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__HMCoreAnalyticsMetricEventDispatcher_init__block_invoke_2;
  v15[3] = &unk_1E3AB3278;
  v7 = v5;
  v16 = v7;
  v8 = v4;
  v9 = v15;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v10 = (uint64_t (*)(id, _QWORD *))getAnalyticsSendEventLazySymbolLoc_ptr;
  v20 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    *(_QWORD *)buf = v6;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v22 = &unk_1E3AB4620;
    v23 = &v17;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)buf);
    v10 = (uint64_t (*)(id, _QWORD *))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v10)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v11 = v10(v8, v9);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[HMCoreAnalyticsMetricEventDispatcherSendHandler] no event registered for event: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

id __44__HMCoreAnalyticsMetricEventDispatcher_init__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
