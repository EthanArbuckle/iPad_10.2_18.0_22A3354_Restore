@implementation AVTStickerRecentsSwiftProvider

- (AVTStickerRecentsSwiftProvider)initWithDelegate:(id)a3
{
  id v4;
  AVTStickerRecentsSwiftProvider *v5;
  AVTStickerRecentsSwiftProvider *v6;
  uint64_t v7;
  AVTUIEnvironment *environment;
  uint64_t v9;
  AVTClippableImageStore *imageStore;
  AVTAvatarStore *v11;
  AVTAvatarStore *v12;
  AVTUIStickerGeneratorPool *v13;
  void *v14;
  uint64_t v15;
  AVTUIStickerGeneratorPool *generatorPool;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  OS_dispatch_queue *recentsWorkQueue;
  uint64_t v20;
  OS_dispatch_queue *renderingQueue;
  uint64_t v22;
  OS_dispatch_queue *encodingQueue;
  uint64_t v24;
  AVTResourceCache *cache;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  AVTStickerConfigurationProvider *v31;
  AVTStickerConfigurationProvider *configurationProvider;
  AVTStickerRecentsMigrator *v33;
  AVTStickerRecentsMigrator *stickerRecentsMigrator;
  void *v35;
  uint64_t v36;
  AVTSerialTaskScheduler *taskScheduler;
  objc_super v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AVTStickerRecentsSwiftProvider;
  v5 = -[AVTStickerRecentsSwiftProvider init](&v39, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_recentsRequestedCount = 0;
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v7 = objc_claimAutoreleasedReturnValue();
    environment = v6->_environment;
    v6->_environment = (AVTUIEnvironment *)v7;

    objc_msgSend((id)objc_opt_class(), "imageStoreWithEnvironment:", v6->_environment);
    v9 = objc_claimAutoreleasedReturnValue();
    imageStore = v6->_imageStore;
    v6->_imageStore = (AVTClippableImageStore *)v9;

    v11 = objc_alloc_init(AVTAvatarStore);
    if ((-[AVTAvatarStore conformsToProtocol:](v11, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v11);
    v12 = v11;
    -[AVTAvatarStore setStickerBackendDelegate:](v12, "setStickerBackendDelegate:", v6);
    objc_storeStrong((id *)&v6->_avatarStore, v11);
    v13 = [AVTUIStickerGeneratorPool alloc];
    -[AVTUIEnvironment logger](v6->_environment, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:logger:](v13, "initWithMaxStickerGeneratorCount:logger:", 1, v14);
    generatorPool = v6->_generatorPool;
    v6->_generatorPool = (AVTUIStickerGeneratorPool *)v15;

    -[AVTUIEnvironment serialQueueProvider](v6->_environment, "serialQueueProvider");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v17)[2](v17, "com.apple.AvatarUI.StickerRecentsWorkQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    recentsWorkQueue = v6->_recentsWorkQueue;
    v6->_recentsWorkQueue = (OS_dispatch_queue *)v18;

    -[AVTUIEnvironment backgroundRenderingQueue](v6->_environment, "backgroundRenderingQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    renderingQueue = v6->_renderingQueue;
    v6->_renderingQueue = (OS_dispatch_queue *)v20;

    -[AVTUIEnvironment backgroundEncodingQueue](v6->_environment, "backgroundEncodingQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    encodingQueue = v6->_encodingQueue;
    v6->_encodingQueue = (OS_dispatch_queue *)v22;

    objc_msgSend((id)objc_opt_class(), "stickerCacheWithEnvironment:", v6->_environment);
    v24 = objc_claimAutoreleasedReturnValue();
    cache = v6->_cache;
    v6->_cache = (AVTResourceCache *)v24;

    if ((AVTUIShowPrereleaseStickerPack_once() & 1) != 0)
    {
      v26 = *MEMORY[0x1E0D006D0];
      v41[0] = *MEMORY[0x1E0D006B0];
      v41[1] = v26;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v41;
      v29 = 2;
    }
    else
    {
      v40 = *MEMORY[0x1E0D006B0];
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v40;
      v29 = 1;
    }
    objc_msgSend(v27, "arrayWithObjects:count:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[AVTStickerConfigurationProvider initWithEnvironment:forStickerPacks:stickerConfigurationNames:]([AVTStickerConfigurationProvider alloc], "initWithEnvironment:forStickerPacks:stickerConfigurationNames:", v6->_environment, v30, 0);
    configurationProvider = v6->_configurationProvider;
    v6->_configurationProvider = v31;

    v33 = -[AVTStickerRecentsMigrator initWithStore:stickerConfigurationProvider:environment:]([AVTStickerRecentsMigrator alloc], "initWithStore:stickerConfigurationProvider:environment:", v6->_avatarStore, v6->_configurationProvider, v6->_environment);
    stickerRecentsMigrator = v6->_stickerRecentsMigrator;
    v6->_stickerRecentsMigrator = v33;

    -[AVTUIEnvironment coreEnvironment](v6->_environment, "coreEnvironment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:](AVTSerialTaskScheduler, "fifoSchedulerWithEnvironment:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    taskScheduler = v6->_taskScheduler;
    v6->_taskScheduler = (AVTSerialTaskScheduler *)v36;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSObject *avatarStoreChangeObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerRecentsSwiftProvider;
  -[AVTStickerRecentsSwiftProvider dealloc](&v5, sel_dealloc);
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AVTPassThroughResourceCache *v6;

  v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

    AVTUISetFlushStickersCache();
  }
  v6 = objc_alloc_init(AVTPassThroughResourceCache);

  return v6;
}

+ (id)imageStoreWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AVTClippableImageStore *v7;
  void *v8;
  void *v9;
  AVTClippableImageStore *v10;

  v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    objc_msgSend(v3, "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

    AVTUISetFlushStickersCache();
  }
  +[AVTUIStickerRenderer imageEncoder](AVTUIStickerRenderer, "imageEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AVTClippableImageStore alloc];
  objc_msgSend(v3, "coreEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerImageStoreLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTImageStore initWithEnvironment:validateImages:location:encoder:](v7, "initWithEnvironment:validateImages:location:encoder:", v8, 1, v9, v6);

  return v10;
}

- (id)fetchRecents:(int64_t)a3 excludingStickersMatchingRules:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AVTAvatarStoreInternal *avatarStore;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AVTStickerConfigurationProvider *configurationProvider;
  void *v27;
  void *v28;
  AVTUIStickerRenderer *v29;
  void *v30;
  AVTUIStickerRenderer *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  int64_t v44;
  AVTStickerRecentsSwiftProvider *val;
  id obj;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id location;
  _QWORD v54[6];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD block[5];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v44 = a3;
  self->_recentsRequestedCount = a3;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke;
  block[3] = &unk_1EA51D188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  val = self;
  -[AVTStickerRecentsMigrator performMigrationIfNeeded](self->_stickerRecentsMigrator, "performMigrationIfNeeded");
  -[AVTStickerRecentsSwiftProvider fetchDefaultMemojiIfNeeded](self, "fetchDefaultMemojiIfNeeded");
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__13;
  v69 = __Block_byref_object_dispose__13;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__13;
  v63 = __Block_byref_object_dispose__13;
  v64 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v55 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x1E0D00888]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "avatarRecordIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stickerConfigurationIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v12, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v14, v15, v16, &unk_1EA5716C8, &unk_1EA5716E0);

        objc_msgSend(v47, "addObject:", v17);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    }
    while (v8);
  }

  -[AVTAvatarRecord identifier](val->_defaultMemoji, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  avatarStore = val->_avatarStore;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_101;
  v54[3] = &unk_1EA51DB68;
  v54[4] = &v65;
  v54[5] = &v59;
  +[AVTStickerRecentsPresetsProvider filteredAndPaddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:avatarStore:numberOfStickers:resultBlock:](AVTStickerRecentsPresetsProvider, "filteredAndPaddedStickerRecordsWithRecents:excludingRecords:paddingMemojiIdentifier:avatarStore:numberOfStickers:resultBlock:", MEMORY[0x1E0C9AA60], v47, v18, avatarStore, v44, v54);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v66[5], "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 >= 1)
  {
    v21 = 0;
    while (v21 < objc_msgSend((id)v66[5], "count"))
    {
      objc_msgSend((id)v66[5], "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v60[5];
      objc_msgSend(v22, "avatarRecordIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      configurationProvider = val->_configurationProvider;
      objc_msgSend(v22, "stickerConfigurationIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerConfigurationProvider stickerConfigurationForAvatarRecord:stickerName:](configurationProvider, "stickerConfigurationForAvatarRecord:stickerName:", v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        -[AVTStickerRecentsMigrator setNeedsMigrationOnNextLaunch](val->_stickerRecentsMigrator, "setNeedsMigrationOnNextLaunch");
        -[AVTUIEnvironment logger](val->_environment, "logger");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "description");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logFetchedRecentStickerWithNoStickerConfiguration:", v42);

        v40 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_17;
      }
      v29 = [AVTUIStickerRenderer alloc];
      v30 = (void *)MEMORY[0x1E0C80D38];
      v31 = -[AVTUIStickerRenderer initWithAvatarRecord:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:](v29, "initWithAvatarRecord:cache:imageStore:stickerGeneratorPool:environment:renderingScheduler:renderingQueue:encodingQueue:callbackQueue:", v25, val->_cache, val->_imageStore, val->_generatorPool, val->_environment, val->_taskScheduler, val->_renderingQueue, val->_encodingQueue, MEMORY[0x1E0C80D38]);

      -[AVTUIStickerRenderer scheduledStickerResourceProviderForStickerConfiguration:](v31, "scheduledStickerResourceProviderForStickerConfiguration:", v28);
      v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v22, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithUUIDString:", v34);

      objc_initWeak(&location, val);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_2;
      v48[3] = &unk_1EA51ED28;
      objc_copyWeak(&v52, &location);
      v36 = v35;
      v49 = v36;
      v37 = v28;
      v50 = v37;
      v38 = v22;
      v51 = v38;
      ((void (**)(_QWORD, _QWORD *, _QWORD))v32)[2](v32, v48, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        -[AVTSerialTaskScheduler scheduleTask:](val->_taskScheduler, "scheduleTask:", v39);
      objc_msgSend(v20, "addObject:", v36);

      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);

      if (v44 == ++v21)
        break;
    }
  }
  v40 = v20;
LABEL_17:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v40;
}

uint64_t __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginObservingAvatarStoreChanges");
}

void __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 1);
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "avatarRecordIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "stickerConfigurationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avtStickerRecentRenderedWithIdentifier:localizedDescription:image:url:avatarRecordIdentifier:stickerConfigurationIdentifier:", v6, v7, v8, v9, v10, v11);

  }
}

- (void)fetchDefaultMemojiIfNeeded
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DC9A6000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch default memoji: %@", (uint8_t *)&v2, 0xCu);
}

- (void)beginObservingAvatarStoreChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *avatarStoreChangeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D006D8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AVTStickerRecentsSwiftProvider_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_1EA51DB40;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__AVTStickerRecentsSwiftProvider_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyStoreChanged");

}

- (void)endObservingAvatarStoreChanges
{
  void *v3;
  NSObject *avatarStoreChangeObserver;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

}

- (void)_notifyStoreChanged
{
  NSObject *recentsWorkQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recentsWorkQueue = self->_recentsWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVTStickerRecentsSwiftProvider__notifyStoreChanged__block_invoke;
  v4[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(recentsWorkQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__AVTStickerRecentsSwiftProvider__notifyStoreChanged__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (uint64_t)WeakRetained[2] >= 1)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "avtStickerRecentStoreDidChange");

    WeakRetained = v3;
  }

}

- (AVTStickerRecentsMigrator)stickerRecentsMigrator
{
  return self->_stickerRecentsMigrator;
}

- (void)setStickerRecentsMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_stickerRecentsMigrator, a3);
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, a3);
}

- (BOOL)hasFetchedDefaultMemoji
{
  return self->_hasFetchedDefaultMemoji;
}

- (void)setHasFetchedDefaultMemoji:(BOOL)a3
{
  self->_hasFetchedDefaultMemoji = a3;
}

- (AVTAvatarRecord)defaultMemoji
{
  return self->_defaultMemoji;
}

- (void)setDefaultMemoji:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMemoji, a3);
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTStickerGenerator)stickerGenerator
{
  return self->_stickerGenerator;
}

- (OS_dispatch_queue)recentsWorkQueue
{
  return self->_recentsWorkQueue;
}

- (void)setRecentsWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recentsWorkQueue, a3);
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setRenderingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_renderingQueue, a3);
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (void)setEncodingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_encodingQueue, a3);
}

- (AVTStickerConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_configurationProvider, a3);
}

- (AVTSerialTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_taskScheduler, a3);
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
  objc_storeStrong((id *)&self->_generatorPool, a3);
}

- (AVTStickerRecentsLayout)stickerRecentsLayout
{
  return self->_stickerRecentsLayout;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_stickerRecentsLayout, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_recentsWorkQueue, 0);
  objc_storeStrong((id *)&self->_stickerGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_defaultMemoji, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_stickerRecentsMigrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
