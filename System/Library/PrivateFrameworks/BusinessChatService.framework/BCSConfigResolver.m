@implementation BCSConfigResolver

- (id)initWithConfigCache:(void *)a3 cacheSkipper:(void *)a4 megashardFetchTrigger:(void *)a5 metricFactory:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  objc_super v16;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)BCSConfigResolver;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (void)configItemWithType:(int64_t)a3 clientBundleID:(id)a4 metric:(id)a5 completion:(id)a6
{
  void (**v9)(id, void *, _QWORD);
  BCSConfigCacheSkipping *configCacheSkipper;
  id v11;
  void *v12;
  BCSConfigCaching *configCache;
  NSObject *v14;
  void *v15;
  OS_dispatch_queue *serialDispatchQueue;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *v18;
  NSObject *v19;
  BCSMetricFactoryProtocol *metricFactory;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BCSFetchTrigger *megashardFetchTrigger;
  void *v26;
  _QWORD v27[5];
  void (**v28)(id, void *, _QWORD);
  int64_t v29;
  _QWORD block[6];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, void *, _QWORD))a6;
  if (v9)
  {
    if (self)
      configCacheSkipper = self->_configCacheSkipper;
    else
      configCacheSkipper = 0;
    v11 = a5;
    if ((-[BCSConfigCacheSkipping shouldSkipCacheForConfigItemOfType:](configCacheSkipper, "shouldSkipCacheForConfigItemOfType:", a3) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      if (self)
        configCache = self->_configCache;
      else
        configCache = 0;
      -[BCSConfigCaching configItemForType:](configCache, "configItemForType:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v12, "isExpired"))
    {
      ABSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBCSType(a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[BCSConfigResolver configItemWithType:clientBundleID:metric:completion:]";
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "%s cached config item found but expired - type: %@ --> still using it but will download megashard in background with new config for later use", buf, 0x16u);

      }
      if (self)
      {
        serialDispatchQueue = self->_serialDispatchQueue;
        if (!serialDispatchQueue)
        {
          v17 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.businessservicesd.BCSConfigResolver", 0);
          v18 = self->_serialDispatchQueue;
          self->_serialDispatchQueue = v17;

          serialDispatchQueue = self->_serialDispatchQueue;
        }
        v19 = serialDispatchQueue;
      }
      else
      {
        v19 = 0;
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__BCSConfigResolver_configItemWithType_clientBundleID_metric_completion___block_invoke;
      block[3] = &unk_24C39BD18;
      block[4] = self;
      block[5] = a3;
      dispatch_async(v19, block);

    }
    if (self)
      metricFactory = self->_metricFactory;
    else
      metricFactory = 0;
    -[BCSMetricFactoryProtocol measurementFactory](metricFactory, "measurementFactory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configCacheHitMeasurementForConfigType:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCacheHitMeasurement:", v22);

    objc_msgSend(v11, "cacheHitMeasurement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setFlag:", v12 != 0);
    if (v12)
    {
      v9[2](v9, v12, 0);
    }
    else
    {
      ABSLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromBCSType(a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[BCSConfigResolver configItemWithType:clientBundleID:metric:completion:]";
        v33 = 2112;
        v34 = v26;
        _os_log_error_impl(&dword_20ACAD000, v24, OS_LOG_TYPE_ERROR, "%s config missing!!! - type: %@ --> blocking to download megashard from server", buf, 0x16u);

      }
      if (self)
        megashardFetchTrigger = self->_megashardFetchTrigger;
      else
        megashardFetchTrigger = 0;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __73__BCSConfigResolver_configItemWithType_clientBundleID_metric_completion___block_invoke_3;
      v27[3] = &unk_24C39BD40;
      v29 = a3;
      v27[4] = self;
      v28 = v9;
      -[BCSFetchTrigger triggerFetchForReason:completion:](megashardFetchTrigger, "triggerFetchForReason:completion:", 5, v27);

    }
  }

}

uint64_t __73__BCSConfigResolver_configItemWithType_clientBundleID_metric_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__BCSConfigResolver_configItemWithType_clientBundleID_metric_completion___block_invoke_2;
  v5[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
  v5[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v3, "triggerFetchForReason:completion:", 2, v5);
}

void __73__BCSConfigResolver_configItemWithType_clientBundleID_metric_completion___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBCSType(*(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315650;
    v7 = "-[BCSConfigResolver configItemWithType:clientBundleID:metric:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "%s - Result of fetching megashards of type %@: %d", (uint8_t *)&v6, 0x1Cu);

  }
}

void __73__BCSConfigResolver_configItemWithType_clientBundleID_metric_completion___block_invoke_3(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ABSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v7)
    {
      NSStringFromBCSType(a1[6]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[BCSConfigResolver configItemWithType:clientBundleID:metric:completion:]_block_invoke";
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "%s - Failed to fetch Config and Megashard of type %@ - Error: %@", (uint8_t *)&v13, 0x20u);
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    NSStringFromBCSType(a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[BCSConfigResolver configItemWithType:clientBundleID:metric:completion:]_block_invoke";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "%s - Successfully fetched megashards of type %@", (uint8_t *)&v13, 0x16u);

  }
  v9 = a1[4];
  if (v9)
    v10 = *(void **)(v9 + 8);
  else
    v10 = 0;
  objc_msgSend(v10, "configItemForType:", a1[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    ABSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromBCSType(a1[6]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[BCSConfigResolver configItemWithType:clientBundleID:metric:completion:]_block_invoke";
      v15 = 2112;
      v16 = v12;
      _os_log_error_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_ERROR, "%s - Successfully fetched megashard of type %@ but did not find config in cache", (uint8_t *)&v13, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  (*(void (**)(void))(a1[5] + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_megashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_configCacheSkipper, 0);
  objc_storeStrong((id *)&self->_configCache, 0);
}

@end
