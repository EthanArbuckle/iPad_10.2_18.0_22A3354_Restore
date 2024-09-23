@implementation VCPMADCoreAnalyticsManager

- (VCPMADCoreAnalyticsManager)init
{
  VCPMADCoreAnalyticsManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *managementQueue;
  uint64_t v6;
  NSMutableDictionary *sessionAnalytics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPMADCoreAnalyticsManager;
  v2 = -[VCPMADCoreAnalyticsManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.mediaanalysis.coreanalytics", v3);
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    sessionAnalytics = v2->_sessionAnalytics;
    v2->_sessionAnalytics = (NSMutableDictionary *)v6;

    v2->_singleAnalyticsSentCount = 0;
    v2->_sessionAnalyticsSentCount = 0;
  }
  return v2;
}

+ (id)sharedManager
{
  void *v2;
  void *v3;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPMADCoreAnalyticsManager"), &__block_literal_global_92);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

VCPMADCoreAnalyticsManager *__43__VCPMADCoreAnalyticsManager_sharedManager__block_invoke()
{
  return objc_alloc_init(VCPMADCoreAnalyticsManager);
}

- (void)dealloc
{
  objc_super v3;

  -[VCPMADCoreAnalyticsManager flush](self, "flush");
  v3.receiver = self;
  v3.super_class = (Class)VCPMADCoreAnalyticsManager;
  -[VCPMADCoreAnalyticsManager dealloc](&v3, sel_dealloc);
}

- (void)sendEvent:(id)a3 withAnalytics:(id)a4
{
  AnalyticsSendEvent();
}

- (void)setValue:(id)a3 forField:(id)a4 andEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *managementQueue;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      managementQueue = self->_managementQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__VCPMADCoreAnalyticsManager_setValue_forField_andEvent___block_invoke;
      v16[3] = &unk_1E6B180E8;
      v16[4] = self;
      v17 = v10;
      v18 = v8;
      v19 = v9;
      dispatch_sync(managementQueue, v16);

      goto LABEL_11;
    }
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      v13 = MEMORY[0x1E0C81028];
      v14 = "[CoreAnalyticManager] Session fields name is nil for event %@; skipping";
      v15 = 12;
      goto LABEL_10;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = MEMORY[0x1E0C81028];
    v14 = "[CoreAnalyticManager] Session event name is nil; skipping";
    v15 = 2;
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
  }
LABEL_11:

}

void __57__VCPMADCoreAnalyticsManager_setValue_forField_andEvent___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v3, a1[5]);

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = a1[5];
      v5 = objc_msgSend(*(id *)(a1[4] + 32), "count");
      v7 = 138412546;
      v8 = v4;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Start session event %@ (total session count %lu)", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", a1[6], a1[7]);

}

- (void)accumulateInt64Value:(int64_t)a3 forField:(id)a4 andEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *managementQueue;
  NSObject *v12;
  const char *v13;
  os_log_type_t v14;
  uint32_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "[CoreAnalyticManager] Session event name is nil; skipping";
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 2;
LABEL_14:
    _os_log_impl(&dword_1B6C4A000, v12, v14, v13, buf, v15);
    goto LABEL_15;
  }
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    v12 = MEMORY[0x1E0C81028];
    v13 = "[CoreAnalyticManager] Session fields name is nil for event %@; skipping";
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 12;
    goto LABEL_14;
  }
  if (a3)
  {
    managementQueue = self->_managementQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__VCPMADCoreAnalyticsManager_accumulateInt64Value_forField_andEvent___block_invoke;
    v16[3] = &unk_1E6B1B378;
    v16[4] = self;
    v17 = v9;
    v18 = v8;
    v19 = a3;
    dispatch_sync(managementQueue, v16);

    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v8;
    v12 = MEMORY[0x1E0C81028];
    v13 = "[CoreAnalyticManager] Ignore 0-accumulation for event %@ field %@";
    v14 = OS_LOG_TYPE_DEBUG;
    v15 = 22;
    goto LABEL_14;
  }
LABEL_15:

}

void __69__VCPMADCoreAnalyticsManager_accumulateInt64Value_forField_andEvent___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v3, a1[5]);

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = a1[5];
      v5 = objc_msgSend(*(id *)(a1[4] + 32), "count");
      v10 = 138412546;
      v11 = v4;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Start session event %@ (total session count %lu)", (uint8_t *)&v10, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7] + objc_msgSend(v7, "longLongValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, a1[6]);

}

- (void)accumulateDoubleValue:(double)a3 forField:(id)a4 andEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *managementQueue;
  _QWORD v16[5];
  id v17;
  id v18;
  double v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v8)
    {
      if (a3 != 0.0)
      {
        managementQueue = self->_managementQueue;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70__VCPMADCoreAnalyticsManager_accumulateDoubleValue_forField_andEvent___block_invoke;
        v16[3] = &unk_1E6B1B378;
        v16[4] = self;
        v17 = v9;
        v18 = v8;
        v19 = a3;
        dispatch_sync(managementQueue, v16);

        goto LABEL_15;
      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v10;
        v22 = 2112;
        v23 = v8;
        v11 = MEMORY[0x1E0C81028];
        v12 = "[CoreAnalyticManager] Ignore 0-accumulation for event %@ field %@";
        v13 = OS_LOG_TYPE_DEBUG;
        v14 = 22;
LABEL_13:
        _os_log_impl(&dword_1B6C4A000, v11, v13, v12, buf, v14);
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      v11 = MEMORY[0x1E0C81028];
      v12 = "[CoreAnalyticManager] Session fields name is nil for event %@; skipping";
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 12;
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = MEMORY[0x1E0C81028];
    v12 = "[CoreAnalyticManager] Session event name is nil; skipping";
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 2;
    goto LABEL_13;
  }
LABEL_15:

}

void __70__VCPMADCoreAnalyticsManager_accumulateDoubleValue_forField_andEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
      v12 = 138412546;
      v13 = v4;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Start session event %@ (total session count %lu)", (uint8_t *)&v12, 0x16u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v9, "numberWithDouble:", v10 + *(double *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v11, *(_QWORD *)(a1 + 48));

}

- (id)valueForField:(id)a3 andEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *managementQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__56;
  v21 = __Block_byref_object_dispose__56;
  v22 = 0;
  managementQueue = self->_managementQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__VCPMADCoreAnalyticsManager_valueForField_andEvent___block_invoke;
  v13[3] = &unk_1E6B1B3A0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(managementQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __53__VCPMADCoreAnalyticsManager_valueForField_andEvent___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", a1[6]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = a1[5];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Session event %@ not available", buf, 0xCu);
  }
}

- (void)sendSessionEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *managementQueue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    managementQueue = self->_managementQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__VCPMADCoreAnalyticsManager_sendSessionEvent___block_invoke;
    v7[3] = &unk_1E6B16D58;
    v7[4] = self;
    v8 = v4;
    dispatch_sync(managementQueue, v7);

  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Session event name is nil; skipping",
      buf,
      2u);
  }

}

void __47__VCPMADCoreAnalyticsManager_sendSessionEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CoreAnalyticManager] Session event %@ not available; skip sending",
      (uint8_t *)&v5,
      0xCu);
  }
}

- (id)fetchSessionEvent:(id)a3
{
  id v4;
  NSObject *managementQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__56;
  v16 = __Block_byref_object_dispose__56;
  v17 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCPMADCoreAnalyticsManager_fetchSessionEvent___block_invoke;
  block[3] = &unk_1E6B16B08;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(managementQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__VCPMADCoreAnalyticsManager_fetchSessionEvent___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)flush
{
  NSObject *managementQueue;
  _QWORD block[5];
  uint8_t buf[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[CoreAnalyticManager] flushing analytics ... ", buf, 2u);
  }
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VCPMADCoreAnalyticsManager_flush__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

uint64_t __35__VCPMADCoreAnalyticsManager_flush__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    *(_DWORD *)buf = 134217984;
    v8 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[CoreAnalyticManager] flushSessionAnalytics (total count %lu)", buf, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__VCPMADCoreAnalyticsManager_flush__block_invoke_115;
  v6[3] = &unk_1E6B1B3C8;
  v6[4] = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

void __35__VCPMADCoreAnalyticsManager_flush__block_invoke_115(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
}

@end
