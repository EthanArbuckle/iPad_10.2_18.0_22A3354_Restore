@implementation ATXInstalledSuggestedPagesTracker

- (ATXInstalledSuggestedPagesTracker)init
{
  void *v3;
  ATXInstalledSuggestedPagesTracker *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("InstalledSuggestedPages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXInstalledSuggestedPagesTracker initWithPath:](self, "initWithPath:", v3);

  return v4;
}

- (ATXInstalledSuggestedPagesTracker)initWithPath:(id)a3
{
  id v4;
  ATXInstalledSuggestedPagesTracker *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  uint64_t v11;
  ATXGenericFileBasedCache *cache;
  uint64_t v13;
  ATXBiomeSuggestedHomePageStream *suggestedHomePageStream;
  ATXInstalledSuggestedPagesTracker *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXInstalledSuggestedPagesTracker;
  v5 = -[ATXInstalledSuggestedPagesTracker init](&v17, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("ATXInstalledSuggestedPagesTracker.queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x1E0CF94C0]);
    __atxlog_handle_modes();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithCacheFilePath:loggingHandle:debugName:", v4, v10, CFSTR("installed suggested pages"));
    cache = v5->_cache;
    v5->_cache = (ATXGenericFileBasedCache *)v11;

    v13 = objc_opt_new();
    suggestedHomePageStream = v5->_suggestedHomePageStream;
    v5->_suggestedHomePageStream = (ATXBiomeSuggestedHomePageStream *)v13;

    v15 = v5;
  }

  return v5;
}

- (id)allInstalledPages
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXInstalledSuggestedPagesTracker_allInstalledPages__block_invoke;
  v5[3] = &unk_1E4D590F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXInstalledSuggestedPagesTracker_allInstalledPages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_allInstalledPages");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_allInstalledPages
{
  void *v3;
  ATXGenericFileBasedCache *cache;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x1A85A4F90]();
  cache = self->_cache;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:](cache, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, 0, 3.40282347e38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (int64_t)suggestedPageTypeWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke;
  block[3] = &unk_1E4D5A158;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_allInstalledPages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E4D5A130;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "pageType");
    *a3 = 1;
  }

}

- (id)identifierOfSuggestedPageForModeUUID:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke;
  block[3] = &unk_1E4D5A158;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_allInstalledPages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke_2;
  v5[3] = &unk_1E4D5A130;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "modeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_msgSend(v10, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a3 = 1;
  }

}

- (void)_serializePages:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)MEMORY[0x1A85A4F90]();
  -[ATXGenericFileBasedCache storeSecureCodedObject:error:](self->_cache, "storeSecureCodedObject:error:", v5, 0);
  objc_autoreleasePoolPop(v4);

}

- (void)trackSuggestedHomePageWithAction:(int64_t)a3 pageType:(int64_t)a4 identifier:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  ATXInstalledSuggestedPagesTracker *v13;
  int64_t v14;
  int64_t v15;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__ATXInstalledSuggestedPagesTracker_trackSuggestedHomePageWithAction_pageType_identifier___block_invoke;
  v11[3] = &unk_1E4D57F90;
  v14 = a4;
  v15 = a3;
  v12 = v8;
  v13 = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

void __90__ATXInstalledSuggestedPagesTracker_trackSuggestedHomePageWithAction_pageType_identifier___block_invoke(_QWORD *a1)
{
  ATXBiomeSuggestedHomePageEvent *v2;

  v2 = -[ATXBiomeSuggestedHomePageEvent initWithPageType:identifier:action:]([ATXBiomeSuggestedHomePageEvent alloc], "initWithPageType:identifier:action:", a1[6], a1[4], a1[7]);
  objc_msgSend(*(id *)(a1[5] + 24), "sendEvent:", v2);

}

- (void)storePageIdentifier:(id)a3 modeUUID:(id)a4 forPageType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__ATXInstalledSuggestedPagesTracker_storePageIdentifier_modeUUID_forPageType___block_invoke;
  v13[3] = &unk_1E4D594B0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __78__ATXInstalledSuggestedPagesTracker_storePageIdentifier_modeUUID_forPageType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_allInstalledPages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setPageType:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v6, "setModeUUID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "removeObject:", v6);
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 32), "trackSuggestedHomePageWithAction:pageType:identifier:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  __atxlog_handle_modes();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXInstalledSuggestedPagesTracker: Adding installed suggested page: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_serializePages:", v5);
}

- (void)removePagesWithIdentifiersNotInSet:(id)a3
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
  v7[2] = __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke;
  v7[3] = &unk_1E4D57258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_allInstalledPages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke_2;
  v21[3] = &unk_1E4D5A180;
  v22 = *(id *)(a1 + 40);
  objc_msgSend(v5, "objectsPassingTest:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXInstalledSuggestedPagesTracker: Removing installed suggested pages: %@", buf, 0xCu);
    }

    objc_msgSend(v5, "minusSet:", v6);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v14 = *(void **)(a1 + 32);
          v15 = objc_msgSend(v13, "pageType", (_QWORD)v17);
          objc_msgSend(v13, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "trackSuggestedHomePageWithAction:pageType:identifier:", 1, v15, v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "_serializePages:", v5);
  }

}

uint64_t __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedHomePageStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
