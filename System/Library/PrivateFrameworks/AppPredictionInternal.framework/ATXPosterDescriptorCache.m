@implementation ATXPosterDescriptorCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_55);
  return (id)sharedInstance_cache;
}

void __42__ATXPosterDescriptorCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_cache;
  sharedInstance_cache = v0;

}

- (ATXPosterDescriptorCache)init
{
  void *v3;
  ATXPosterDescriptorCache *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "posterDescriptorCacheFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXPosterDescriptorCache initWithPath:](self, "initWithPath:", v3);

  return v4;
}

- (ATXPosterDescriptorCache)initWithPath:(id)a3
{
  id v4;
  ATXPosterDescriptorCache *v5;
  id v6;
  void *v7;
  uint64_t v8;
  ATXGenericFileBasedCache *fileCache;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *outputQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXPosterDescriptorCache;
  v5 = -[ATXPosterDescriptorCache init](&v18, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_alloc(MEMORY[0x1E0CF94C0]);
      __atxlog_handle_lock_screen();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithCacheFilePath:loggingHandle:debugName:", v4, v7, CFSTR("poster descriptors"));
      fileCache = v5->_fileCache;
      v5->_fileCache = (ATXGenericFileBasedCache *)v8;

    }
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.proactive.ATXPosterDescriptorCache.Output", v14);
    outputQueue = v5->_outputQueue;
    v5->_outputQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (NSDictionary)descriptors
{
  _PASLock *lock;
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
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ATXPosterDescriptorCache_descriptors__block_invoke;
  v5[3] = &unk_1E82DE478;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __39__ATXPosterDescriptorCache_descriptors__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)a2[1];
  if (!v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "_readDescriptorsFromDisk");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)a2[1];
    a2[1] = v7;

    v3 = (void *)a2[1];
  }
  v9 = objc_msgSend(v3, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (NSSet)allDescriptors
{
  void *v3;
  _PASLock *lock;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ATXPosterDescriptorCache_allDescriptors__block_invoke;
  v9[3] = &unk_1E82DE4C8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

void __42__ATXPosterDescriptorCache_allDescriptors__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)a2[1];
  if (!v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "_readDescriptorsFromDisk");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)a2[1];
    a2[1] = v7;

    v3 = (void *)a2[1];
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ATXPosterDescriptorCache_allDescriptors__block_invoke_2;
  v9[3] = &unk_1E82DE4A0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __42__ATXPosterDescriptorCache_allDescriptors__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);

}

- (void)updateDescriptors:(id)a3
{
  void *v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXPosterDescriptorCache *v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke;
  v7[3] = &unk_1E82DE4C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
    v7 = *(_QWORD *)(a1 + 32);
  else
    v7 = MEMORY[0x1E0C9AA70];
  if (objc_msgSend(v5, "isEqualToDictionary:", v7))
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Bypassing poster descriptor update because the descriptors are the same", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong(v3 + 1, *(id *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(*(id *)(a1 + 40), "_writeDescriptorsToDisk:");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v3[2];
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v17 = v6;
      v11 = *(_QWORD *)v21;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = *(void **)(a1 + 32);
          v16 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
          block[0] = v12;
          block[1] = 3221225472;
          block[2] = __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke_24;
          block[3] = &unk_1E82DACB0;
          block[4] = v14;
          v19 = v15;
          dispatch_async(v16, block);

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
      v6 = v17;
    }
  }

}

uint64_t __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptorCacheDidUpdateWithDescriptors:", *(_QWORD *)(a1 + 40));
}

- (void)registerObserver:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATXPosterDescriptorCache_registerObserver___block_invoke;
  v7[3] = &unk_1E82DE4F0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __45__ATXPosterDescriptorCache_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ATXPosterDescriptorCache_unregisterObserver___block_invoke;
  v7[3] = &unk_1E82DE4F0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __47__ATXPosterDescriptorCache_unregisterObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (id)_readDescriptorsFromDisk
{
  ATXGenericFileBasedCache *fileCache;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  fileCache = self->_fileCache;
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:](fileCache, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, 0, -1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_writeDescriptorsToDisk:(id)a3
{
  -[ATXGenericFileBasedCache storeSecureCodedObject:error:](self->_fileCache, "storeSecureCodedObject:error:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_fileCache, 0);
}

@end
