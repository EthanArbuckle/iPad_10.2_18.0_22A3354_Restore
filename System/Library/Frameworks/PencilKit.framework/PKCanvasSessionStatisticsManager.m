@implementation PKCanvasSessionStatisticsManager

+ (id)sharedStatisticsManager
{
  objc_opt_self();
  if (_MergedGlobals_141 != -1)
    dispatch_once(&_MergedGlobals_141, &__block_literal_global_58);
  return (id)qword_1ECEE6328;
}

void __59__PKCanvasSessionStatisticsManager_sharedStatisticsManager__block_invoke()
{
  PKCanvasSessionStatisticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKCanvasSessionStatisticsManager);
  v1 = (void *)qword_1ECEE6328;
  qword_1ECEE6328 = (uint64_t)v0;

}

- (void)_logFeatureUsed:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v11 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v3 = v11;
      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "integerValue") + 1;
    else
      v9 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v10, v11);

    v3 = v11;
  }

}

- (void)logFeatureUsed:(uint64_t)a1
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PKCanvasSessionStatisticsManager _logFeatureUsed:](a1, v3);
    }
    else
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __51__PKCanvasSessionStatisticsManager_logFeatureUsed___block_invoke;
      v4[3] = &unk_1E7777C20;
      v4[4] = a1;
      v5 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v4);

    }
  }

}

void __51__PKCanvasSessionStatisticsManager_logFeatureUsed___block_invoke(uint64_t a1)
{
  -[PKCanvasSessionStatisticsManager _logFeatureUsed:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_sendUsageSessionStatistics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[18];

  v29[16] = *MEMORY[0x1E0C80C00];
  +[PKRecognitionSessionManager enabledLocales](PKRecognitionSessionManager, "enabledLocales");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 8), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend(v10, "intValue") <= 0)
          v11 = &unk_1E77EBDA8;
        else
          v11 = &unk_1E77EBD90;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __63__PKCanvasSessionStatisticsManager__sendUsageSessionStatistics__block_invoke;
  v22 = &unk_1E777BAF8;
  v23 = v4;
  v24 = v18;
  v13 = v18;
  v19 = v4;
  v14 = v20;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.handwritingd.pkanalytics"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF5F3EC0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRemoteObjectInterface:", v16);
  objc_msgSend(v15, "resume");
  *(_QWORD *)&v25 = 0;
  *((_QWORD *)&v25 + 1) = &v25;
  *(_QWORD *)&v26 = 0x2020000000;
  BYTE8(v26) = 0;
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __79__PKCanvasSessionStatisticsManager__messageHandwritingAnalyticsWithProxyBlock___block_invoke;
  v29[3] = &unk_1E777BB20;
  v29[4] = &v25;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(*((_QWORD *)&v25 + 1) + 24))
    v21((uint64_t)v14, v17);
  objc_msgSend(v15, "invalidate");

  _Block_object_dispose(&v25, 8);
}

- (void)endSession
{
  void *v2;
  _QWORD block[5];

  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PKCanvasSessionStatisticsManager _sendUsageSessionStatistics](a1);
      v2 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__PKCanvasSessionStatisticsManager_endSession__block_invoke;
      block[3] = &unk_1E7778020;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __46__PKCanvasSessionStatisticsManager_endSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    -[PKCanvasSessionStatisticsManager _sendUsageSessionStatistics](*(_QWORD *)(a1 + 32));
    v2 = *(void **)(v1 + 8);
    *(_QWORD *)(v1 + 8) = 0;

  }
}

uint64_t __63__PKCanvasSessionStatisticsManager__sendUsageSessionStatistics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndPKCanvasSession:withInputMode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __79__PKCanvasSessionStatisticsManager__messageHandwritingAnalyticsWithProxyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection for analytics: %@", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDictionary, 0);
}

@end
