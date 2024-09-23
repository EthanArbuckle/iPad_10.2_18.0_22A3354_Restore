@implementation AFCoreAnalyticsLoggingService

- (AFCoreAnalyticsLoggingService)init
{

  return 0;
}

- (id)_init
{
  AFCoreAnalyticsLoggingService *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFCoreAnalyticsLoggingService;
  v2 = -[AFCoreAnalyticsLoggingService init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.assistant.coreanalytics.client", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)logToCoreAnalyticsCrossDeviceRequestEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke;
  block[3] = &unk_1E3A36F30;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "nearbyDevicesPayloads");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);

}

void __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[AFCoreAnalyticsLoggingService logToCoreAnalyticsCrossDeviceRequestEvent:]_block_invoke_2";
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s log to CoreAnalytics nearby device context %@: %@", buf, 0x20u);
  }
  v8 = v5;
  v7 = v5;
  AnalyticsSendEventLazy();

}

uint64_t __75__AFCoreAnalyticsLoggingService_logToCoreAnalyticsCrossDeviceRequestEvent___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "buildDictionaryRepresentation");
}

+ (id)sharedLoggingService
{
  if (sharedLoggingService_onceToken != -1)
    dispatch_once(&sharedLoggingService_onceToken, &__block_literal_global_12250);
  return (id)sharedLoggingService_analyticsService;
}

void __53__AFCoreAnalyticsLoggingService_sharedLoggingService__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AFCoreAnalyticsLoggingService _init]([AFCoreAnalyticsLoggingService alloc], "_init");
  v1 = (void *)sharedLoggingService_analyticsService;
  sharedLoggingService_analyticsService = (uint64_t)v0;

}

@end
