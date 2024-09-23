@implementation ATXFaceSuggestionGenerator

- (ATXFaceSuggestionGenerator)initWithDescriptorCache:(id)a3 configurationCache:(id)a4 complicationProvider:(id)a5 complicationDescriptorProvider:(id)a6 parameters:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXFaceSuggestionGenerator *v17;
  ATXFaceSuggestionGenerator *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  _PASQueueLock *lock;
  id v25;
  uint64_t v26;
  _PASSimpleCoalescingTimer *regenerationCoalescingTimer;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *outputQueue;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;

  v32 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)ATXFaceSuggestionGenerator;
  v17 = -[ATXFaceSuggestionGenerator init](&v36, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_descriptorCache, a3);
    -[ATXPosterDescriptorCache registerObserver:](v18->_descriptorCache, "registerObserver:", v18);
    objc_storeStrong((id *)&v18->_configurationCache, a4);
    -[ATXPosterConfigurationCache registerObserver:](v18->_configurationCache, "registerObserver:", v18);
    objc_storeStrong((id *)&v18->_complicationProvider, a5);
    objc_storeStrong((id *)&v18->_complicationDescriptorProvider, a6);
    objc_storeStrong((id *)&v18->_parameters, a7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.proactive.ATXFaceSuggestionGenerator", v19);

    v21 = objc_alloc(MEMORY[0x1E0D81600]);
    v22 = (void *)objc_opt_new();
    v23 = objc_msgSend(v21, "initWithGuardedData:serialQueue:", v22, v20);
    lock = v18->_lock;
    v18->_lock = (_PASQueueLock *)v23;

    objc_initWeak(&location, v18);
    v25 = objc_alloc(MEMORY[0x1E0D81618]);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __136__ATXFaceSuggestionGenerator_initWithDescriptorCache_configurationCache_complicationProvider_complicationDescriptorProvider_parameters___block_invoke;
    v33[3] = &unk_1E82DB988;
    objc_copyWeak(&v34, &location);
    v26 = objc_msgSend(v25, "initWithQueue:operation:", v20, v33);
    regenerationCoalescingTimer = v18->_regenerationCoalescingTimer;
    v18->_regenerationCoalescingTimer = (_PASSimpleCoalescingTimer *)v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create("com.apple.proactive.ATXFaceSuggestionGenerator.Output", v28);
    outputQueue = v18->_outputQueue;
    v18->_outputQueue = (OS_dispatch_queue *)v29;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
  return v18;
}

void __136__ATXFaceSuggestionGenerator_initWithDescriptorCache_configurationCache_complicationProvider_complicationDescriptorProvider_parameters___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_lock_screen();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "running coalesced regeneration operation", v4, 2u);
    }

    objc_msgSend(WeakRetained[6], "guardedDataAssertingLockContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_generateFaceGalleryConfigurationNotifyingWithGuardedData:", v3);

  }
}

- (ATXFaceGalleryConfiguration)faceGalleryConfiguration
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
  v9 = __Block_byref_object_copy__52;
  v10 = __Block_byref_object_dispose__52;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXFaceSuggestionGenerator_faceGalleryConfiguration__block_invoke;
  v5[3] = &unk_1E82E40F8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ATXFaceGalleryConfiguration *)v3;
}

void __54__ATXFaceSuggestionGenerator_faceGalleryConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    __atxlog_handle_lock_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v12 = 136315394;
      v13 = "-[ATXFaceSuggestionGenerator faceGalleryConfiguration]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: returning in-memory configuration: %@", (uint8_t *)&v12, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  __atxlog_handle_lock_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ATXFaceSuggestionGenerator faceGalleryConfiguration]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: no in-memory configuration, generating new configuration", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_generateFaceGalleryConfigurationNotifyingWithGuardedData:", v3);
  if (v3[1])
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3[1];
      v12 = 136315394;
      v13 = "-[ATXFaceSuggestionGenerator faceGalleryConfiguration]_block_invoke";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: generated new configuration: %@", (uint8_t *)&v12, 0x16u);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = v3[1];
    v5 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)regenerateFaceGalleryConfigurationCoalescedWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationCoalescedWithReason:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: requesting coalesced face gallery regeneration for reason: %@", (uint8_t *)&v6, 0x16u);
  }

  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_regenerationCoalescingTimer, "runAfterDelaySeconds:coalescingBehavior:", 0, 2.0);
}

- (void)regenerateFaceGalleryConfigurationImmediatelyWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  _PASQueueLock *lock;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationImmediatelyWithReason:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: requesting immediate face gallery regeneration for reason: %@", buf, 0x16u);
  }

  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__ATXFaceSuggestionGenerator_regenerateFaceGalleryConfigurationImmediatelyWithReason___block_invoke;
  v7[3] = &unk_1E82E4120;
  v7[4] = self;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __86__ATXFaceSuggestionGenerator_regenerateFaceGalleryConfigurationImmediatelyWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateFaceGalleryConfigurationNotifyingWithGuardedData:", a2);
}

- (void)_generateFaceGalleryConfigurationNotifyingWithGuardedData:(id)a3
{
  id *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL8 v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  _BOOL8 v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  ATXFaceSuggestionGenerator *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  ATXFaceGalleryFileReader *v31;
  void *v32;
  NSObject *v33;
  id v34;
  NSObject *outputQueue;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  sel_getName(a2);
  v44 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_lock_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
    v51 = 2112;
    v52 = (uint64_t)v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: using locale: %@", buf, 0x16u);
  }

  v8 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v43 = (void *)objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v9 = objc_msgSend(v43, "integerForKey:", *MEMORY[0x1E0CF95D0]);
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v10, "fetchAccessoryWidgetDescriptorMetadataWithError:", &v48);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v48;

  if (!v11)
  {
    __atxlog_handle_lock_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:].cold.1((uint64_t)v12, v13);

    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  v42 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0CF8CB8]);
  objc_msgSend(v14, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:](_TtC21AppPredictionInternal26ATXCompanionBundleIdMapper, "generateMappingForAppBundleIds:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v23 = -[ATXFaceSuggestionGenerator shouldUseDayZeroCuration](self, "shouldUseDayZeroCuration");
    __atxlog_handle_lock_screen();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
        v26 = "%s: day zero criteria met, using day zero curation";
LABEL_21:
        _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
      v26 = "%s: day zero criteria not met, generating personalized layout";
      goto LABEL_21;
    }

    v27 = self;
    v28 = v23;
    goto LABEL_25;
  }
  __atxlog_handle_lock_screen();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
    v51 = 2048;
    v52 = v9;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "%s: using face gallery source override: %zd", buf, 0x16u);
  }

  switch(v9)
  {
    case 1:
      v27 = self;
      v28 = 0;
      break;
    case 2:
      v27 = self;
      v28 = 1;
      break;
    case 3:
      v19 = -[ATXFaceSuggestionGenerator shouldUseDayZeroCuration](self, "shouldUseDayZeroCuration");
      __atxlog_handle_lock_screen();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
          v22 = "%s: day zero criteria met, using day zero curation for demo mode";
LABEL_34:
          _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
        }
      }
      else if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
        v22 = "%s: day zero criteria not met, generating personalized layout for demo mode";
        goto LABEL_34;
      }

      -[ATXFaceSuggestionGenerator _createLayoutGeneratorWithDayZero:locale:](self, "_createLayoutGeneratorWithDayZero:locale:", v19, v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[ATXFaceGalleryFileReader initWithSource:]([ATXFaceGalleryFileReader alloc], "initWithSource:", 0);
      objc_msgSend(v29, "generatedConfigurationWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v11, v15, v17);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXFaceGalleryFileReader configuration](v31, "configuration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "configurationByApplyingConfiguration:", v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v5[1];
      v5[1] = (id)v40;

      goto LABEL_26;
    default:
      goto LABEL_27;
  }
LABEL_25:
  -[ATXFaceSuggestionGenerator _createLayoutGeneratorWithDayZero:locale:](v27, "_createLayoutGeneratorWithDayZero:locale:", v28, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "generatedConfigurationWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v11, v15, v17);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (ATXFaceGalleryFileReader *)v5[1];
  v5[1] = (id)v30;
LABEL_26:

LABEL_27:
  v32 = (void *)objc_msgSend(v5[1], "copy");
  if (!v32)
  {
    __atxlog_handle_lock_screen();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
      _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "%s: no configuration generated, creating blank configuration", buf, 0xCu);
    }

    v34 = objc_alloc(MEMORY[0x1E0CF8E08]);
    v32 = (void *)objc_msgSend(v34, "initWithSections:source:locale:dayZero:", MEMORY[0x1E0C9AA60], 1, v6, 0);
  }
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ATXFaceSuggestionGenerator__generateFaceGalleryConfigurationNotifyingWithGuardedData___block_invoke;
  block[3] = &unk_1E82DB9D8;
  block[4] = self;
  v46 = v32;
  v47 = v44;
  v36 = v44;
  v37 = v32;
  dispatch_async(outputQueue, block);

}

id __88__ATXFaceSuggestionGenerator__generateFaceGalleryConfigurationNotifyingWithGuardedData___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatorDidUpdateFaceGalleryConfiguration:", *(_QWORD *)(a1 + 40));

  return (id)objc_opt_self();
}

- (BOOL)shouldUseDayZeroCuration
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  BOOL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ATXPosterConfigurationCache configurations](self->_configurationCache, "configurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") != 1)
  {
    __atxlog_handle_lock_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[ATXFaceSuggestionGenerator shouldUseDayZeroCuration]";
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%s: day zero criteria not met- multiple poster configurations exist", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_15;
  }
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  -[NSObject extensionBundleIdentifier](v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.PaperBoard.LegacyPoster"));

  if (v5)
  {
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[ATXFaceSuggestionGenerator shouldUseDayZeroCuration]";
      v7 = "%s: day zero criteria met- sole poster configuration is Legacy";
LABEL_10:
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[NSObject extensionBundleIdentifier](v3, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.WallpaperKit.CollectionsPoster"));

  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v10)
    {
      v13 = 136315138;
      v14 = "-[ATXFaceSuggestionGenerator shouldUseDayZeroCuration]";
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s: day zero criteria not met- sole poster configuration is not Legacy or Collections", (uint8_t *)&v13, 0xCu);
    }

LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  if (v10)
  {
    v13 = 136315138;
    v14 = "-[ATXFaceSuggestionGenerator shouldUseDayZeroCuration]";
    v7 = "%s: day zero criteria met- sole poster configuration is Collections";
    goto LABEL_10;
  }
LABEL_11:

  v11 = 1;
LABEL_16:

  return v11;
}

- (id)_createLayoutGeneratorWithDayZero:(BOOL)a3 locale:(id)a4
{
  _BOOL8 v4;
  id v6;
  ATXFaceGalleryLayoutGenerator *v7;
  void *v8;
  ATXFaceGalleryLayoutGenerator *v9;

  v4 = a3;
  v6 = a4;
  v7 = [ATXFaceGalleryLayoutGenerator alloc];
  -[ATXPosterDescriptorCache descriptors](self->_descriptorCache, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXFaceGalleryLayoutGenerator initWithDescriptors:complicationProvider:complicationDescriptorProvider:parameters:dayZero:locale:](v7, "initWithDescriptors:complicationProvider:complicationDescriptorProvider:parameters:dayZero:locale:", v8, self->_complicationProvider, self->_complicationDescriptorProvider, self->_parameters, v4, v6);

  return v9;
}

- (void)descriptorCacheDidUpdateWithDescriptors:(id)a3
{
  -[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationCoalescedWithReason:](self, "regenerateFaceGalleryConfigurationCoalescedWithReason:", CFSTR("poster descriptors updated"));
}

- (void)configurationCacheDidUpdateWithNewConfigurations:(id)a3 oldConfigurations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  int v35;
  NSObject *v36;
  ATXFaceSuggestionGenerator *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_25;
  v37 = self;
  v39 = v6;
  v8 = (void *)objc_opt_new();
  v41 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v40 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38 = v7;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v15, "extensionBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v16);

        objc_msgSend(v15, "complications");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_114);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v18);

        objc_msgSend(v15, "inlineComplication");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v15, "inlineComplication");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          personalityStringFromComplication(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v21);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v12);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = v39;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v27, "extensionBundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v28);

        objc_msgSend(v27, "complications");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_pas_mappedArrayWithTransform:", &__block_literal_global_35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v30);

        objc_msgSend(v27, "inlineComplication");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v27, "inlineComplication");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          personalityStringFromComplication(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v33);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v24);
  }

  v34 = objc_msgSend(v8, "isEqualToSet:", v9);
  v35 = objc_msgSend(v41, "isEqualToSet:", v40);

  v7 = v38;
  v6 = v39;
  self = v37;
  if (!v35)
    goto LABEL_25;
  if ((v34 & 1) != 0)
  {
    __atxlog_handle_lock_screen();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[ATXFaceSuggestionGenerator configurationCacheDidUpdateWithNewConfigurations:oldConfigurations:]";
      _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "%s: not regenerating, no significant changes to poster configurations", buf, 0xCu);
    }

  }
  else
  {
LABEL_25:
    -[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationCoalescedWithReason:](self, "regenerateFaceGalleryConfigurationCoalescedWithReason:", CFSTR("poster configurations had significant changes"));
  }

}

id __97__ATXFaceSuggestionGenerator_configurationCacheDidUpdateWithNewConfigurations_oldConfigurations___block_invoke(uint64_t a1, void *a2)
{
  return personalityStringFromComplication(a2);
}

id __97__ATXFaceSuggestionGenerator_configurationCacheDidUpdateWithNewConfigurations_oldConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  return personalityStringFromComplication(a2);
}

- (ATXFaceSuggestionGeneratorDelegate)delegate
{
  return (ATXFaceSuggestionGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_regenerationCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_complicationDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_complicationProvider, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

- (void)_generateFaceGalleryConfigurationNotifyingWithGuardedData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXFaceSuggestionGenerator _generateFaceGalleryConfigurationNotifyingWithGuardedData:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: unable to fetch accessory widget descriptors: %@; using empty dictionary",
    (uint8_t *)&v2,
    0x16u);
}

@end
