@implementation LDCMMobileAssetManager

void __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s Failed to download catalog (%ld)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

uint64_t __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1 + 40;
  if (!*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "updateMetadata");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNextQueryAsRetry:", 1);
}

void __41__LDCMMobileAssetManager_downloadCatalog__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2;
  v4[3] = &unk_1E9214528;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

- (void)scheduleNextQueryAsRetry:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint32_t v7;
  NSObject *timer;
  dispatch_time_t v9;

  v4 = 12;
  if (a3)
    v4 = 20;
  v5 = 16;
  if (a3)
    v5 = 24;
  v6 = *(_DWORD *)((char *)&self->super.isa + v4);
  v7 = arc4random_uniform(*(_DWORD *)((char *)&self->super.isa + v5) + 1);
  timer = self->_timer;
  v9 = dispatch_walltime(0, 1000000000 * (v7 + v6));
  dispatch_source_set_timer(timer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (LDCMMobileAssetManager)init
{
  LDCMMobileAssetManager *v2;
  LDCMMobileAssetManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *assetManagerQueue;
  dispatch_source_t v7;
  OS_dispatch_source *timer;
  LDCMMobileAssetManager *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  LDCMMobileAssetManager *v19;
  _QWORD handler[4];
  LDCMMobileAssetManager *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)LDCMMobileAssetManager;
  v2 = -[LDCMMobileAssetManager init](&v23, sel_init);
  if (!v2)
    return 0;
  v3 = v2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[LDCMMobileAssetManager init]";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Initializing LDCM Asset Manager", buf, 0xCu);
  }
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create_with_target_V2("LDCMAssetManagerQueue", 0, v4);
  assetManagerQueue = v3->_assetManagerQueue;
  v3->_assetManagerQueue = (OS_dispatch_queue *)v5;

  v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v3->_assetManagerQueue);
  timer = v3->_timer;
  v3->_timer = (OS_dispatch_source *)v7;

  if (v3->_timer)
  {
    v3->_lastProcessedAssetVersion = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (LDCMMobileAssetManager *)objc_claimAutoreleasedReturnValue();
    v10 = -[LDCMMobileAssetManager integerForKey:](v9, "integerForKey:", CFSTR("LDCMAssetQueryFrequency"));
    v11 = -[LDCMMobileAssetManager integerForKey:](v9, "integerForKey:", CFSTR("LDCMAssetQueryFrequencyTolerance"));
    v12 = -[LDCMMobileAssetManager integerForKey:](v9, "integerForKey:", CFSTR("LDCMAssetRetryQueryFrequency"));
    v13 = -[LDCMMobileAssetManager integerForKey:](v9, "integerForKey:", CFSTR("LDCMAssetRetryQueryFrequencyTolerance"));
    if (v10)
      v14 = v10;
    else
      v14 = 259200;
    if (v11)
      v15 = v11;
    else
      v15 = 172800;
    v3->_queryFrequencySec = v14;
    v3->_queryFrequencyToleranceSec = v15;
    if (v12)
      v16 = v12;
    else
      v16 = 86400;
    if (v13)
      v17 = v13;
    else
      v17 = 86400;
    v3->_retryQueryFrequencySec = v16;
    v3->_retryQueryFrequencyToleranceSec = v17;
    v18 = v3->_timer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30__LDCMMobileAssetManager_init__block_invoke;
    handler[3] = &unk_1E9214228;
    v19 = v3;
    v22 = v19;
    dispatch_source_set_event_handler(v18, handler);
    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v3->_timer);

    v3 = v9;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __30__LDCMMobileAssetManager_init__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[5];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__LDCMMobileAssetManager_init__block_invoke_2;
  block[3] = &unk_1E9214228;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __30__LDCMMobileAssetManager_init__block_invoke_2(uint64_t a1)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[LDCMMobileAssetManager init]_block_invoke_2";
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s LDCM Asset timer fired, querying metadata", (uint8_t *)&v3, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "queryMetadata");
}

- (void)queryMetadata
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s Failed to query metadata (%ld)", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)downloadCatalog
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_opt_new();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__LDCMMobileAssetManager_downloadCatalog__block_invoke;
  v4[3] = &unk_1E9214550;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D4E038], "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.IOAccessoryManager"), v3, v4);

}

- (void)updateMetadata
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  int lastProcessedAssetVersion;
  int v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  _QWORD v36[4];
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  _BYTE v45[10];
  _DWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.IOAccessoryManager"));
  objc_msgSend(v2, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v2, "queryMetaDataSync");
  objc_msgSend(v2, "results");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        objc_msgSend(v2, "results"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        !v6))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[LDCMMobileAssetManager updateMetadata]";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s Query had no results", buf, 0xCu);
    }
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v2, "results", v2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (!v7)
  {
    v31 = 0;
    v32 = 0;
    v30 = 0;
    goto LABEL_30;
  }
  v8 = v7;
  v31 = 0;
  v32 = 0;
  v30 = 0;
  v34 = *(_QWORD *)v39;
  v9 = *MEMORY[0x1E0D4DEE0];
  v10 = *MEMORY[0x1E0D4DEE8];
  v11 = MEMORY[0x1E0C81028];
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v39 != v34)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
      objc_msgSend(v13, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      objc_msgSend(v13, "attributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v20 = objc_msgSend(v13, "state");
        *(_DWORD *)buf = 136315650;
        v43 = "-[LDCMMobileAssetManager updateMetadata]";
        v44 = 2048;
        *(_QWORD *)v45 = v20;
        *(_WORD *)&v45[8] = 1024;
        v46[0] = v19;
        _os_log_impl(&dword_1D13BF000, v11, OS_LOG_TYPE_INFO, "%s found asset state:%ld version:%d", buf, 0x1Cu);
      }
      if (-[LDCMMobileAssetManager supportsCompatabilityVersion:](self, "supportsCompatabilityVersion:", v16))
      {
        if (objc_msgSend(v13, "state") != 2)
        {
          if (SHIDWORD(v32) >= v19)
            goto LABEL_24;
          v25 = v30;
          v30 = v13;
          HIDWORD(v32) = v19;
          goto LABEL_23;
        }
        if ((int)v32 >= v19)
          goto LABEL_24;
        v21 = v13;
        if (v31)
        {
          objc_msgSend(v31, "attributes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "intValue");

          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v43 = "-[LDCMMobileAssetManager updateMetadata]";
            v44 = 1024;
            *(_DWORD *)v45 = v24;
            _os_log_impl(&dword_1D13BF000, v11, OS_LOG_TYPE_INFO, "%s requesting purge of asset version %d", buf, 0x12u);
          }
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __40__LDCMMobileAssetManager_updateMetadata__block_invoke;
          v36[3] = &__block_descriptor_36_e8_v16__0q8l;
          v37 = v24;
          v25 = v31;
          objc_msgSend(v31, "purge:", v36);
          LODWORD(v32) = v19;
          v31 = v21;
LABEL_23:

          goto LABEL_24;
        }
        v31 = v21;
        LODWORD(v32) = v19;
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[LDCMMobileAssetManager updateMetadata]";
        v44 = 1024;
        *(_DWORD *)v45 = v19;
        _os_log_impl(&dword_1D13BF000, v11, OS_LOG_TYPE_INFO, "%s asset version %d not compatible, skipping", buf, 0x12u);
      }
LABEL_24:
      ++v12;
    }
    while (v8 != v12);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    v8 = v26;
  }
  while (v26);
LABEL_30:

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    lastProcessedAssetVersion = self->_lastProcessedAssetVersion;
    *(_DWORD *)buf = 136315906;
    v43 = "-[LDCMMobileAssetManager updateMetadata]";
    v44 = 1024;
    *(_DWORD *)v45 = v32;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = HIDWORD(v32);
    LOWORD(v46[0]) = 1024;
    *(_DWORD *)((char *)v46 + 2) = lastProcessedAssetVersion;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s bestInstalledAssetVersion:%d bestNotInstalledAssetVersion:%d _lastProcessedAssetVersion:%d", buf, 0x1Eu);
  }
  v28 = self->_lastProcessedAssetVersion;
  if ((int)v32 > v28 || SHIDWORD(v32) > v28)
  {
    if (SHIDWORD(v32) >= (int)v32)
    {
      -[LDCMMobileAssetManager downloadAsset:](self, "downloadAsset:", v30);
    }
    else
    {
      -[LDCMMobileAssetManager processAsset:](self, "processAsset:", v31);
      self->_lastProcessedAssetVersion = v32;
    }
  }

}

void __40__LDCMMobileAssetManager_updateMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __40__LDCMMobileAssetManager_updateMetadata__block_invoke_cold_1(a1, a2);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[LDCMMobileAssetManager updateMetadata]_block_invoke";
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s purge of asset version %d succeeded", (uint8_t *)&v5, 0x12u);
  }
}

- (void)processAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "getLocalFileUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("LDCMBehavior.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[LDCMMobileAssetManager processAsset:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Attempting to process plist found in %@", buf, 0x16u);
  }
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[LDCMMobileAssetManager processAsset:].cold.1(v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "receiveBehaviorDictionary:", v7);

  }
}

- (void)downloadAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  LDCMMobileAssetManager *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__LDCMMobileAssetManager_downloadAsset___block_invoke;
  v7[3] = &unk_1E9214598;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v6, "startDownload:then:", v5, v7);

}

uint64_t __40__LDCMMobileAssetManager_downloadAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v4;
  void *v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __40__LDCMMobileAssetManager_downloadAsset___block_invoke_cold_1();
    return objc_msgSend(*(id *)(a1 + 40), "scheduleNextQueryAsRetry:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[LDCMMobileAssetManager downloadAsset:]_block_invoke";
      v9 = 1024;
      v10 = v6;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s downloaded asset version %d successfully", (uint8_t *)&v7, 0x12u);
    }
    result = objc_msgSend(*(id *)(a1 + 40), "processAsset:", *(_QWORD *)(a1 + 32));
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) = v6;
  }
  return result;
}

- (BOOL)supportsCompatabilityVersion:(int)a3
{
  return a3 == 1;
}

- (LDCMMobileAssetManagerDelegate)delegate
{
  return (LDCMMobileAssetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)assetManagerQueue
{
  return self->_assetManagerQueue;
}

- (void)setAssetManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetManagerQueue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (int)lastProcessedAssetVersion
{
  return self->_lastProcessedAssetVersion;
}

- (void)setLastProcessedAssetVersion:(int)a3
{
  self->_lastProcessedAssetVersion = a3;
}

- (unsigned)queryFrequencySec
{
  return self->_queryFrequencySec;
}

- (void)setQueryFrequencySec:(unsigned int)a3
{
  self->_queryFrequencySec = a3;
}

- (unsigned)queryFrequencyToleranceSec
{
  return self->_queryFrequencyToleranceSec;
}

- (void)setQueryFrequencyToleranceSec:(unsigned int)a3
{
  self->_queryFrequencyToleranceSec = a3;
}

- (unsigned)retryQueryFrequencySec
{
  return self->_retryQueryFrequencySec;
}

- (void)setRetryQueryFrequencySec:(unsigned int)a3
{
  self->_retryQueryFrequencySec = a3;
}

- (unsigned)retryQueryFrequencyToleranceSec
{
  return self->_retryQueryFrequencyToleranceSec;
}

- (void)setRetryQueryFrequencyToleranceSec:(unsigned int)a3
{
  self->_retryQueryFrequencyToleranceSec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assetManagerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__LDCMMobileAssetManager_updateMetadata__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 32);
  v3 = 136315650;
  v4 = "-[LDCMMobileAssetManager updateMetadata]_block_invoke";
  v5 = 1024;
  v6 = v2;
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s purge of asset version %d failed (%ld)", (uint8_t *)&v3, 0x1Cu);
}

- (void)processAsset:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v1, "%s failed to create behavior dictionary from plist (%@)", v2, v3, v4, v5, 2u);

}

void __40__LDCMMobileAssetManager_downloadAsset___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s Failed to download asset (%ld)", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

@end
