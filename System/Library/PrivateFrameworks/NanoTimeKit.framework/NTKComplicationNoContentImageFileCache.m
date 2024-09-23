@implementation NTKComplicationNoContentImageFileCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NTKComplicationNoContentImageFileCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_21 != -1)
    dispatch_once(&sharedInstance_onceToken_21, block);
  return (id)sharedInstance___sharedInstance_7;
}

void __56__NTKComplicationNoContentImageFileCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance___sharedInstance_7;
  sharedInstance___sharedInstance_7 = (uint64_t)v0;

}

- (NTKComplicationNoContentImageFileCache)init
{
  NTKComplicationNoContentImageFileCache *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *queue_complicationNoContentImages;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *cacheQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *cacheFlushQueue;
  NTKTaskScheduler *v21;
  NTKTaskScheduler *taskScheduler;
  uint64_t v23;
  NSString *cacheIdentifier;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)NTKComplicationNoContentImageFileCache;
  v2 = -[NTKComplicationNoContentImageFileCache init](&v26, sel_init);
  if (v2)
  {
    _PathToComplicationNoContentImageArchive();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 1, 0);
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
      objc_msgSend(v5, "setDecodingFailurePolicy:", 0);
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x1E0CB2CD0]);
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      NTKValidateDictionary(v11, v12, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }

    queue_complicationNoContentImages = v2->_queue_complicationNoContentImages;
    v2->_queue_complicationNoContentImages = v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.NanoTimeKit.NTKComplicationNoContentImageFileCache.access", v15);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.NanoTimeKit.NTKComplicationNoContentImageFileCache.flush", v18);
    cacheFlushQueue = v2->_cacheFlushQueue;
    v2->_cacheFlushQueue = (OS_dispatch_queue *)v19;

    v21 = -[NTKTaskScheduler initWithQueue:]([NTKTaskScheduler alloc], "initWithQueue:", v2->_cacheFlushQueue);
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = v21;

    -[NTKTaskScheduler setWaitingPeriod:](v2->_taskScheduler, "setWaitingPeriod:", 30.0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NTKComplicationNoContentImageFileCache-%p"), v2);
    v23 = objc_claimAutoreleasedReturnValue();
    cacheIdentifier = v2->_cacheIdentifier;
    v2->_cacheIdentifier = (NSString *)v23;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationNoContentImageFileCache;
  -[NTKComplicationNoContentImageFileCache dealloc](&v3, sel_dealloc);
}

- (id)imageForClientIdentifier:(id)a3 family:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *cacheQueue;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__43;
    v19 = __Block_byref_object_dispose__43;
    v20 = 0;
    cacheQueue = self->_cacheQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__NTKComplicationNoContentImageFileCache_imageForClientIdentifier_family___block_invoke;
    v11[3] = &unk_1E6BD8B08;
    v11[4] = self;
    v13 = &v15;
    v14 = a4;
    v12 = v6;
    dispatch_sync(cacheQueue, v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __74__NTKComplicationNoContentImageFileCache_imageForClientIdentifier_family___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a1[7])
  {
    case 0:
      v6 = v2;
      objc_msgSend(v2, "modularSmallImage");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      v6 = v2;
      objc_msgSend(v2, "utilitarianSmallImage");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      v6 = v2;
      objc_msgSend(v2, "circularSmallImage");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 7:
      v6 = v2;
      objc_msgSend(v2, "extraLargeImage");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v4 = *(_QWORD *)(a1[6] + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      v2 = v6;
      break;
    default:
      break;
  }

}

- (void)setImage:(id)a3 forClientIdentifier:(id)a4 family:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *cacheQueue;
  _QWORD block[4];
  id v12;
  id v13;
  id v14[2];
  id location;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_initWeak(&location, self);
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__NTKComplicationNoContentImageFileCache_setImage_forClientIdentifier_family___block_invoke;
    block[3] = &unk_1E6BD8B30;
    objc_copyWeak(v14, &location);
    v12 = v9;
    v14[1] = (id)a5;
    v13 = v8;
    dispatch_async(cacheQueue, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }

}

void __78__NTKComplicationNoContentImageFileCache_setImage_forClientIdentifier_family___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NTKComplicationNoContentImages *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (NTKComplicationNoContentImages *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = objc_alloc_init(NTKComplicationNoContentImages);
      objc_msgSend(v4[1], "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));
      objc_msgSend(v4, "_dirtyCache");
    }
    switch(*(_QWORD *)(a1 + 56))
    {
      case 0:
        -[NTKComplicationNoContentImages setModularSmallImage:](v3, "setModularSmallImage:", *(_QWORD *)(a1 + 40));
        goto LABEL_9;
      case 2:
        -[NTKComplicationNoContentImages setUtilitarianSmallImage:](v3, "setUtilitarianSmallImage:", *(_QWORD *)(a1 + 40));
        goto LABEL_9;
      case 4:
        -[NTKComplicationNoContentImages setCircularSmallImage:](v3, "setCircularSmallImage:", *(_QWORD *)(a1 + 40));
        goto LABEL_9;
      case 7:
        -[NTKComplicationNoContentImages setExtraLargeImage:](v3, "setExtraLargeImage:", *(_QWORD *)(a1 + 40));
LABEL_9:
        objc_msgSend(v4, "_dirtyCache");
        break;
      default:
        break;
    }

    WeakRetained = v4;
  }

}

- (id)noContentImagesForClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *cacheQueue;
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
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__43;
    v16 = __Block_byref_object_dispose__43;
    v17 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NTKComplicationNoContentImageFileCache_noContentImagesForClientIdentifier___block_invoke;
    block[3] = &unk_1E6BD0830;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(cacheQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __77__NTKComplicationNoContentImageFileCache_noContentImagesForClientIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setNoContentImages:(id)a3 forClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  cacheQueue = self->_cacheQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__NTKComplicationNoContentImageFileCache_setNoContentImages_forClientIdentifier___block_invoke;
  v11[3] = &unk_1E6BCF7B0;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(cacheQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__NTKComplicationNoContentImageFileCache_setNoContentImages_forClientIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      if ((objc_msgSend(v4, "isEqual:", v3) & 1) == 0)
      {
        objc_msgSend(v5[1], "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
LABEL_7:
        objc_msgSend(v5, "_dirtyCache");
      }
    }
    else if (v3)
    {
      objc_msgSend(v5[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    }

    WeakRetained = v5;
  }

}

- (void)removeAllEntriesExceptThoseWithClientIdentifiers:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__NTKComplicationNoContentImageFileCache_removeAllEntriesExceptThoseWithClientIdentifiers___block_invoke;
  block[3] = &unk_1E6BCF6D8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(cacheQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __91__NTKComplicationNoContentImageFileCache_removeAllEntriesExceptThoseWithClientIdentifiers___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(WeakRetained[1], "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(WeakRetained[1], "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
          objc_msgSend(WeakRetained, "_dirtyCache");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

- (void)_dirtyCache
{
  NTKTaskScheduler *taskScheduler;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  self->_cacheDirty = 1;
  objc_initWeak(&location, self);
  taskScheduler = self->_taskScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NTKComplicationNoContentImageFileCache__dirtyCache__block_invoke;
  v5[3] = &unk_1E6BCE0A8;
  objc_copyWeak(&v6, &location);
  v4 = -[NTKTaskScheduler scheduleTask:identifier:](taskScheduler, "scheduleTask:identifier:", v5, CFSTR("com.apple.ntk.NTKComplicationNoContentImageFileCache"));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __53__NTKComplicationNoContentImageFileCache__dirtyCache__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_flushCache");

  return v2;
}

- (id)_makeMutableCacheCopy
{
  void *v3;
  NSMutableDictionary *queue_complicationNoContentImages;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  queue_complicationNoContentImages = self->_queue_complicationNoContentImages;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__NTKComplicationNoContentImageFileCache__makeMutableCacheCopy__block_invoke;
  v7[3] = &unk_1E6BD8B58;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queue_complicationNoContentImages, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __63__NTKComplicationNoContentImageFileCache__makeMutableCacheCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)_flushCache
{
  NSObject *cacheQueue;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__43;
  v14 = __Block_byref_object_dispose__43;
  v15 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NTKComplicationNoContentImageFileCache__flushCache__block_invoke;
  block[3] = &unk_1E6BD8368;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(cacheQueue, block);
  v3 = v11[5];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11[5], 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _PathToComplicationNoContentImageArchive();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeToFile:atomically:", v5, 1);

    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "NTKComplicationNoContentImageFileCache:_flushCache flushed out to disk", v8, 2u);
    }

  }
  _Block_object_dispose(&v10, 8);

  return v3 != 0;
}

void __53__NTKComplicationNoContentImageFileCache__flushCache__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    objc_msgSend(v2, "_makeMutableCacheCopy");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheFlushQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_queue_complicationNoContentImages, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Error decoding complication no content images: %@", (uint8_t *)&v2, 0xCu);
}

@end
