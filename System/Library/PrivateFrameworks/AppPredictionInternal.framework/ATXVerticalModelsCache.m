@implementation ATXVerticalModelsCache

- (ATXVerticalModelsCache)init
{
  ATXVerticalModelsCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _PASQueueLock *lock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXVerticalModelsCache;
  v2 = -[ATXVerticalModelsCache init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.proactive.ATXVerticalModelsCache", v3);

    v5 = objc_alloc(MEMORY[0x1E0D81600]);
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v5, "initWithGuardedData:serialQueue:", v6, v4);
    lock = v2->_lock;
    v2->_lock = (_PASQueueLock *)v7;

  }
  return v2;
}

- (BOOL)writeWebsiteSuggestionsCache:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ATXVerticalModelsCache_writeWebsiteSuggestionsCache___block_invoke;
  v8[3] = &unk_1E82EB858;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __55__ATXVerticalModelsCache_writeWebsiteSuggestionsCache___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  char v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(MEMORY[0x1E0CF94D8], "websiteSuggestionsVerticalModelCacheFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "_writeCache:path:withError:", v5, v6, &v11);
  v7 = v11;

  if (v7)
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Error while writing website suggestions cache: %@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v10 = (id)a1[5];
    v8 = v3[1];
    v3[1] = v10;
    v9 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
}

- (BOOL)writeWebsiteTitlesAndSubtitlesCache:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ATXVerticalModelsCache_writeWebsiteTitlesAndSubtitlesCache___block_invoke;
  v8[3] = &unk_1E82EB858;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __62__ATXVerticalModelsCache_writeWebsiteTitlesAndSubtitlesCache___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  char v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(MEMORY[0x1E0CF94D8], "websiteTitlesAndSubtitlesCacheFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "_writeCache:path:withError:", v5, v6, &v11);
  v7 = v11;

  if (v7)
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Error while writing website suggestions cache: %@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v10 = (id)a1[5];
    v8 = v3[2];
    v3[2] = v10;
    v9 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
}

- (id)fetchWebsiteSuggestionsCache
{
  _PASQueueLock *lock;
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
  v9 = __Block_byref_object_copy__106;
  v10 = __Block_byref_object_dispose__106;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXVerticalModelsCache_fetchWebsiteSuggestionsCache__block_invoke;
  v5[3] = &unk_1E82EB880;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXVerticalModelsCache_fetchWebsiteSuggestionsCache__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  if (v4)
  {
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CF94D8], "websiteSuggestionsVerticalModelCacheFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v8, "_fetchWebsiteCacheWithPath:error:", v9, &v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = v3[1];
    v3[1] = (id)v10;

    if (v11)
    {
      __atxlog_handle_lock_screen();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading website suggestions cache: %@", buf, 0xCu);
      }

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = MEMORY[0x1E0C9AA70];
    }
    else
    {
      v16 = objc_msgSend(v3[1], "copy");
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;
    }

  }
}

- (id)fetchWebsiteTitlesAndSubtitlesCache
{
  _PASQueueLock *lock;
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
  v9 = __Block_byref_object_copy__106;
  v10 = __Block_byref_object_dispose__106;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__ATXVerticalModelsCache_fetchWebsiteTitlesAndSubtitlesCache__block_invoke;
  v5[3] = &unk_1E82EB880;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__ATXVerticalModelsCache_fetchWebsiteTitlesAndSubtitlesCache__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[2];
  if (v4)
  {
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CF94D8], "websiteTitlesAndSubtitlesCacheFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v8, "_fetchWebsiteTitlesAndSubtitlesCacheWithPath:error:", v9, &v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = v3[2];
    v3[2] = (id)v10;

    if (v11)
    {
      __atxlog_handle_lock_screen();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading website titles and subtitles cache: %@", buf, 0xCu);
      }

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = MEMORY[0x1E0C9AA70];
    }
    else
    {
      v16 = objc_msgSend(v3[2], "copy");
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;
    }

  }
}

- (BOOL)_writeCache:(id)a3 path:(id)a4 withError:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0CF94C0];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  __atxlog_handle_action_prediction();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCacheFilePath:loggingHandle:debugName:", v8, v11, CFSTR("webSuggestions"));

  LOBYTE(a5) = objc_msgSend(v12, "storeSecureCodedObject:error:", v9, a5);
  return (char)a5;
}

- (id)_fetchWebsiteCacheWithPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CF94C0]);
  __atxlog_handle_action_prediction();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCacheFilePath:loggingHandle:debugName:", v5, v7, CFSTR("webSuggestions"));

  v9 = (void *)MEMORY[0x1CAA48B6C]();
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v8, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v14, a4, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = (void *)MEMORY[0x1E0C9AA70];
  v17 = v15;

  return v17;
}

- (id)_fetchWebsiteTitlesAndSubtitlesCacheWithPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CF94C0]);
  __atxlog_handle_action_prediction();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCacheFilePath:loggingHandle:debugName:", v5, v7, CFSTR("webSuggestions"));

  v9 = (void *)MEMORY[0x1CAA48B6C]();
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v8, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v14, a4, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = (void *)MEMORY[0x1E0C9AA70];
  v17 = v15;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
