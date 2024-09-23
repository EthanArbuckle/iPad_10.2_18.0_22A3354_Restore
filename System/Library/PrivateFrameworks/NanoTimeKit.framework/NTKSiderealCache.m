@implementation NTKSiderealCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1)
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_37);
  return (id)sharedCache_sharedCache;
}

void __31__NTKSiderealCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NTKSiderealCache _init]([NTKSiderealCache alloc], "_init");
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = (uint64_t)v0;

}

- (id)_init
{
  NTKSiderealCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *readerWriterQueue;
  NSCache *v5;
  NSCache *dataCache;
  NSCache *v7;
  NSCache *aplCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKSiderealCache;
  v2 = -[NTKSiderealCache init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("NTKSiderealCache Queue", MEMORY[0x1E0C80D50]);
    readerWriterQueue = v2->_readerWriterQueue;
    v2->_readerWriterQueue = (OS_dispatch_queue *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    dataCache = v2->_dataCache;
    v2->_dataCache = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    aplCache = v2->_aplCache;
    v2->_aplCache = v7;

    -[NSCache setCountLimit:](v2->_aplCache, "setCountLimit:", 64);
    -[NTKSiderealCache _purgeEverything](v2, "_purgeEverything");
  }
  return v2;
}

- (void)_purgeEverything
{
  NSObject *readerWriterQueue;
  _QWORD block[5];

  readerWriterQueue = self->_readerWriterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NTKSiderealCache__purgeEverything__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_barrier_async(readerWriterQueue, block);
}

uint64_t __36__NTKSiderealCache__purgeEverything__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (void)purgeCachedKey:(id)a3
{
  id v4;
  NSObject *readerWriterQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  readerWriterQueue = self->_readerWriterQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__NTKSiderealCache_purgeCachedKey___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(readerWriterQueue, v7);

}

uint64_t __35__NTKSiderealCache_purgeCachedKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)purgeAPLCache
{
  NSObject *readerWriterQueue;
  _QWORD block[5];

  readerWriterQueue = self->_readerWriterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NTKSiderealCache_purgeAPLCache__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_barrier_async(readerWriterQueue, block);
}

uint64_t __33__NTKSiderealCache_purgeAPLCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (id)imageDataForKey:(id)a3 generationBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *readerWriterQueue;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  readerWriterQueue = self->_readerWriterQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke;
  block[3] = &unk_1E6BD0830;
  v22 = &v23;
  block[4] = self;
  v10 = v6;
  v21 = v10;
  dispatch_sync(readerWriterQueue, block);
  if (!v24[5])
  {
    v7[2](v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v24[5];
    v24[5] = v11;

    if (v24[5])
    {
      v13 = self->_readerWriterQueue;
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke_2;
      v17[3] = &unk_1E6BD0858;
      v17[4] = self;
      v19 = &v23;
      v18 = v10;
      dispatch_barrier_async(v13, v17);

    }
    else
    {
      _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NTKSiderealCache imageDataForKey:generationBlock:].cold.1((uint64_t)v10, v14);

    }
  }
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

- (float)aplForDate:(id)a3 generationBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *readerWriterQueue;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  float v16;
  float v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD *);
  void *v22;
  NTKSiderealCache *v23;
  id v24;
  uint64_t *v25;
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__9;
  v33 = __Block_byref_object_dispose__9;
  v34 = 0;
  readerWriterQueue = self->_readerWriterQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke;
  block[3] = &unk_1E6BD0830;
  v28 = &v29;
  block[4] = self;
  v10 = v6;
  v27 = v10;
  dispatch_sync(readerWriterQueue, block);
  v11 = (void *)v30[5];
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v7[2](v7);
    objc_msgSend(v12, "numberWithFloat:");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v30[5];
    v30[5] = v13;

    if (v30[5])
    {
      v15 = self->_readerWriterQueue;
      v19 = v9;
      v20 = 3221225472;
      v21 = __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke_2;
      v22 = &unk_1E6BD0858;
      v23 = self;
      v25 = &v29;
      v24 = v10;
      dispatch_barrier_async(v15, &v19);

      v11 = (void *)v30[5];
    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(v11, "floatValue", v19, v20, v21, v22, v23);
  v17 = v16;

  _Block_object_dispose(&v29, 8);
  return v17;
}

void __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aplCache, 0);
  objc_storeStrong((id *)&self->_readerWriterQueue, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
}

- (void)imageDataForKey:(uint64_t)a1 generationBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[NTKSiderealCache imageDataForKey:generationBlock:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%s received nil imageData for key:%@", (uint8_t *)&v2, 0x16u);
}

@end
