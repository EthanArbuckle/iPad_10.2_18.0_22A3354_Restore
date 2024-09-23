@implementation ATXCacheReader

- (ATXCacheReader)initWithCacheBasePath:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  unsigned int v17;
  NSObject *v18;
  dispatch_source_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v25[4];
  unsigned int v26;
  _QWORD handler[4];
  id v28;
  id location;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ATXCacheReader;
  v5 = -[ATXCacheReader init](&v30, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D815F0]);
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v6, "initWithGuardedData:", v7);
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    if (v4)
    {
      v10 = v4;
      v12 = (id *)(v5 + 16);
      v11 = (void *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("caches/ATXCacheFile"));
      v13 = objc_claimAutoreleasedReturnValue();
      v12 = (id *)(v5 + 16);
      v14 = (void *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v13;

    }
    objc_msgSend(*v12, "stringByDeletingLastPathComponent");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = open((const char *)objc_msgSend(v15, "UTF8String"), 0x8000);
    if ((v16 & 0x80000000) == 0)
    {
      v17 = v16;
      objc_initWeak(&location, v5);
      dispatch_get_global_queue(9, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_source_create(MEMORY[0x1E0C80DE8], v17, 2uLL, v18);
      v20 = (void *)*((_QWORD *)v5 + 3);
      *((_QWORD *)v5 + 3) = v19;

      v21 = *((_QWORD *)v5 + 3);
      v22 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __40__ATXCacheReader_initWithCacheBasePath___block_invoke;
      handler[3] = &unk_1E4D579D8;
      objc_copyWeak(&v28, &location);
      dispatch_source_set_event_handler(v21, handler);
      v23 = *((_QWORD *)v5 + 3);
      v25[0] = v22;
      v25[1] = 3221225472;
      v25[2] = __40__ATXCacheReader_initWithCacheBasePath___block_invoke_2;
      v25[3] = &__block_descriptor_36_e5_v8__0l;
      v26 = v17;
      dispatch_source_set_cancel_handler(v23, v25);
      dispatch_resume(*((dispatch_object_t *)v5 + 3));
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }

  }
  return (ATXCacheReader *)v5;
}

void __40__ATXCacheReader_initWithCacheBasePath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDirChange");

}

uint64_t __40__ATXCacheReader_initWithCacheBasePath___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  NSObject *vnodeSource;
  objc_super v4;

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_56);
  vnodeSource = self->_vnodeSource;
  if (vnodeSource)
    dispatch_source_cancel(vnodeSource);
  v4.receiver = self;
  v4.super_class = (Class)ATXCacheReader;
  -[ATXCacheReader dealloc](&v4, sel_dealloc);
}

uint64_t __25__ATXCacheReader_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(unsigned int *)(a2 + 16);
  if ((result & 0x80000000) == 0)
    return close(result);
  return result;
}

- (id)readCacheFileForConsumerSubtype:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[ATXAppPredictorAssetMapping assetMappingWithCachedAssets](ATXAppPredictorAssetMapping, "assetMappingWithCachedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getFullCachePathWithBaseCachePath:consumerSubType:", self->_cacheBasePath, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXCacheReader readCacheFileForCachePath:](self, "readCacheFileForCachePath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)readCacheFileForCachePath:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__12;
    v16 = __Block_byref_object_dispose__12;
    v17 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__ATXCacheReader_readCacheFileForCachePath___block_invoke;
    v9[3] = &unk_1E4D5A818;
    v10 = v4;
    v11 = &v12;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __44__ATXCacheReader_readCacheFileForCachePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((*((_DWORD *)v3 + 4) & 0x80000000) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *((_QWORD *)v3 + 1));
    v5 = *((_DWORD *)v3 + 4);
    if ((v4 & 1) != 0)
    {
      if ((v5 & 0x80000000) == 0)
      {
LABEL_8:
        ATXCacheFileRead();
        goto LABEL_12;
      }
    }
    else
    {
      close(v5);
      *((_DWORD *)v3 + 4) = -1;
    }
  }
  v6 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), 0);
  *((_DWORD *)v3 + 4) = v6;
  if ((v6 & 0x80000000) == 0)
  {
    objc_storeStrong((id *)v3 + 1, *(id *)(a1 + 32));
    goto LABEL_8;
  }
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *__error();
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Could not open app predictions cache: errno=%i", (uint8_t *)v9, 8u);
  }

LABEL_12:
}

- (void)_handleDirChange
{
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Directory changed, closing fd if open", v4, 2u);
  }

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_21);
}

void __34__ATXCacheReader__handleDirChange__block_invoke(uint64_t a1, _DWORD *a2)
{
  int v2;
  _DWORD *v4;

  v2 = a2[4];
  if ((v2 & 0x80000000) == 0)
  {
    v4 = a2;
    close(v2);
    a2[4] = -1;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vnodeSource, 0);
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
