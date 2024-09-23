@implementation BCSShardResolver

- (id)initWithShardCache:(void *)a3 cacheSkipper:(void *)a4 megashardFetchTrigger:(void *)a5 metricFactory:
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
    v16.super_class = (Class)BCSShardResolver;
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

- (void)shardItemMatching:(id)a3 clientBundleID:(id)a4 metric:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, void *, _QWORD);
  BCSShardCacheSkipping *shardCacheSkipper;
  BCSShardCacheSkipping *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  BCSShardCaching *shardCache;
  NSObject *v19;
  void *v20;
  OS_dispatch_queue *serialDispatchQueue;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *v23;
  NSObject *v24;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  BCSFetchTrigger *megashardFetchTrigger;
  void *v32;
  _QWORD v33[4];
  id v34;
  BCSShardResolver *v35;
  void (**v36)(id, void *, _QWORD);
  _QWORD block[5];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(id, void *, _QWORD))a6;
  if (self)
    shardCacheSkipper = self->_shardCacheSkipper;
  else
    shardCacheSkipper = 0;
  v12 = shardCacheSkipper;
  v13 = a5;
  v14 = objc_msgSend(v9, "type") - 2;
  if (v14 > 3)
    v15 = 1;
  else
    v15 = qword_20AD1B590[v14];
  v16 = -[BCSShardCacheSkipping shouldSkipCacheForShardItemOfType:](v12, "shouldSkipCacheForShardItemOfType:", v15);

  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    if (self)
      shardCache = self->_shardCache;
    else
      shardCache = 0;
    -[BCSShardCaching shardItemMatching:](shardCache, "shardItemMatching:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v17, "isExpired"))
  {
    ABSLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSShardType(objc_msgSend(v9, "type"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v40 = "-[BCSShardResolver shardItemMatching:clientBundleID:metric:completion:]";
      v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_DEFAULT, "%s cached shard item found but expired - type: %@ --> will use expired shard but will attempt to download megashard from server in background", buf, 0x16u);

    }
    if (self)
    {
      serialDispatchQueue = self->_serialDispatchQueue;
      if (!serialDispatchQueue)
      {
        v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.businessservicesd.BCSShardResolver", 0);
        v23 = self->_serialDispatchQueue;
        self->_serialDispatchQueue = v22;

        serialDispatchQueue = self->_serialDispatchQueue;
      }
      v24 = serialDispatchQueue;
    }
    else
    {
      v24 = 0;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__BCSShardResolver_shardItemMatching_clientBundleID_metric_completion___block_invoke;
    block[3] = &unk_24C39BED8;
    block[4] = self;
    v38 = v9;
    dispatch_async(v24, block);

  }
  if (self)
    metricFactory = self->_metricFactory;
  else
    metricFactory = 0;
  v26 = metricFactory;
  -[BCSMetricFactoryProtocol measurementFactory](v26, "measurementFactory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shardCacheHitMeasurementForShardIdentifier:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setCacheHitMeasurement:", v28);
  objc_msgSend(v13, "cacheHitMeasurement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setFlag:", v17 != 0);
  if (v17)
  {
    v10[2](v10, v17, 0);
  }
  else
  {
    ABSLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      NSStringFromBCSShardType(objc_msgSend(v9, "type"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v40 = "-[BCSShardResolver shardItemMatching:clientBundleID:metric:completion:]";
      v41 = 2112;
      v42 = v32;
      _os_log_error_impl(&dword_20ACAD000, v30, OS_LOG_TYPE_ERROR, "%s shard item missing!!! - type: %@ --> blocking to download megashard from server", buf, 0x16u);

    }
    if (self)
      megashardFetchTrigger = self->_megashardFetchTrigger;
    else
      megashardFetchTrigger = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __71__BCSShardResolver_shardItemMatching_clientBundleID_metric_completion___block_invoke_3;
    v33[3] = &unk_24C39D020;
    v34 = v9;
    v35 = self;
    v36 = v10;
    -[BCSFetchTrigger triggerFetchForReason:completion:](megashardFetchTrigger, "triggerFetchForReason:completion:", 5, v33);

  }
}

void __71__BCSShardResolver_shardItemMatching_clientBundleID_metric_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 24);
  else
    v2 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__BCSShardResolver_shardItemMatching_clientBundleID_metric_completion___block_invoke_2;
  v3[3] = &unk_24C39CBB0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "triggerFetchForReason:completion:", 4, v3);

}

void __71__BCSShardResolver_shardItemMatching_clientBundleID_metric_completion___block_invoke_2(uint64_t a1, int a2)
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
    NSStringFromBCSShardType(objc_msgSend(*(id *)(a1 + 32), "type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315650;
    v7 = "-[BCSShardResolver shardItemMatching:clientBundleID:metric:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "%s - Result of fetching megashards of type %@: %d", (uint8_t *)&v6, 0x1Cu);

  }
}

void __71__BCSShardResolver_shardItemMatching_clientBundleID_metric_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
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
      NSStringFromBCSShardType(objc_msgSend(*(id *)(a1 + 32), "type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[BCSShardResolver shardItemMatching:clientBundleID:metric:completion:]_block_invoke";
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "%s - Failed to fetch Megashard of type %@ - Error: %@", (uint8_t *)&v13, 0x20u);
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    NSStringFromBCSShardType(objc_msgSend(*(id *)(a1 + 32), "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[BCSShardResolver shardItemMatching:clientBundleID:metric:completion:]_block_invoke";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEFAULT, "%s - Successfully fetched megashard of type %@", (uint8_t *)&v13, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    v10 = *(void **)(v9 + 8);
  else
    v10 = 0;
  objc_msgSend(v10, "shardItemMatching:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    ABSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromBCSShardType(objc_msgSend(*(id *)(a1 + 32), "type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[BCSShardResolver shardItemMatching:clientBundleID:metric:completion:]_block_invoke";
      v15 = 2112;
      v16 = v12;
      _os_log_error_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_ERROR, "%s - Successfully fetched megashard of type %@ but did not find shard in cache", (uint8_t *)&v13, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_megashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_shardCacheSkipper, 0);
  objc_storeStrong((id *)&self->_shardCache, 0);
}

@end
