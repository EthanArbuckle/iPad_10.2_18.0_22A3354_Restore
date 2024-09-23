@implementation BCSCoreAnalyticsMetricHandler

- (void)handleSubmittedMetric:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_254632EC8))
  {
    v4 = v3;
    if (qword_253EC0A68 != -1)
      dispatch_once(&qword_253EC0A68, &__block_literal_global_4);
    v5 = (id)_MergedGlobals_36;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "coreAnalyticsEventName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "coreAnalyticsPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_debug_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEBUG, "%@ - %@", buf, 0x16u);

    }
    objc_msgSend(v4, "coreAnalyticsEventName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    v7 = v4;
    AnalyticsSendEventLazy();

  }
}

uint64_t __55__BCSCoreAnalyticsMetricHandler_handleSubmittedMetric___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coreAnalyticsPayload");
}

@end
