@implementation HKSourceListDataSource

- (HKSourceListDataSource)initWithHealthStore:(id)a3
{
  return -[HKSourceListDataSource initWithHealthStore:queue:](self, "initWithHealthStore:queue:", a3, MEMORY[0x1E0C80D38]);
}

- (HKSourceListDataSource)initWithHealthStore:(id)a3 queue:(id)a4
{
  return -[HKSourceListDataSource initWithHealthStore:sources:queue:](self, "initWithHealthStore:sources:queue:", a3, 0, a4);
}

- (HKSourceListDataSource)initWithHealthStore:(id)a3 sources:(id)a4 queue:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HKSourceListDataSource *v14;
  HKSourceListDataSource *v15;
  uint64_t v16;
  NSArray *rawSources;
  uint64_t v18;
  OS_dispatch_queue *resultsQueue;
  NSMutableArray *v20;
  NSMutableArray *transformers;
  NSMutableArray *v22;
  NSMutableArray *followupTransformers;
  id v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  HKSynchronousObserverSet *observers;
  void *v30;
  void *v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("healthStore != nil"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != nil"));

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)HKSourceListDataSource;
  v14 = -[HKSourceListDataSource init](&v32, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_healthStore, a3);
    objc_storeStrong((id *)&v15->_mainQueue, a5);
    v16 = objc_msgSend(v11, "copy");
    rawSources = v15->_rawSources;
    v15->_rawSources = (NSArray *)v16;

    HKCreateSerialDispatchQueueWithQOSClass();
    v18 = objc_claimAutoreleasedReturnValue();
    resultsQueue = v15->_resultsQueue;
    v15->_resultsQueue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transformers = v15->_transformers;
    v15->_transformers = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    followupTransformers = v15->_followupTransformers;
    v15->_followupTransformers = v22;

    v24 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "initWithName:loggingCategory:", v26, *MEMORY[0x1E0CB5378]);
    observers = v15->_observers;
    v15->_observers = (HKSynchronousObserverSet *)v27;

    v15->_deliverUpdates = 0;
    v15->_notifyToken = -1;
    *(_DWORD *)&v15->_shouldFetchAppInstallationStatus = 1;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[HKSourceListDataSource invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HKSourceListDataSource;
  -[HKSourceListDataSource dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  HKSynchronousObserverSet *observers;
  NSMutableArray *transformers;
  NSMutableArray *followupTransformers;
  int notifyToken;

  atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
  observers = self->_observers;
  self->_observers = 0;

  transformers = self->_transformers;
  self->_transformers = 0;

  followupTransformers = self->_followupTransformers;
  self->_followupTransformers = 0;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
}

- (void)setDeliverUpdates:(BOOL)a3
{
  void *v6;

  if (self->_hasInitiatedFetch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasInitiatedFetch == NO"));

  }
  self->_deliverUpdates = a3;
}

- (void)registerObserver:(id)a3
{
  -[HKSynchronousObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[HKSynchronousObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)fetchSources
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Failed to register for %s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_7_0();
}

void __38__HKSourceListDataSource_fetchSources__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchSources");

}

void __38__HKSourceListDataSource_fetchSources__block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_didFetchSources:error:completion:", v6, v5, 0);

}

+ (void)fetchIconForSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKSourceDataModel *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[HKSourceDataModel initWithSource:]([HKSourceDataModel alloc], "initWithSource:", v7);

  objc_msgSend(a1, "_builtinIconFetchTransformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HKSourceListDataSource_fetchIconForSource_completion___block_invoke;
  v12[3] = &unk_1E9C46718;
  v13 = v6;
  v11 = v6;
  objc_msgSend(a1, "_performTransformations:model:completion:", v10, v8, v12);

}

void __56__HKSourceListDataSource_fetchIconForSource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "icon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)fetchModelForSources:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (self->_deliverUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_deliverUpdates == NO"));

  }
  if (!self->_hasInitiatedFetch)
  {
    self->_hasInitiatedFetch = 1;
    -[HKSourceListDataSource _prependBuiltinTransformers](self, "_prependBuiltinTransformers");
  }
  -[HKSourceListDataSource _didFetchSources:error:completion:](self, "_didFetchSources:error:completion:", v9, 0, v7);

}

- (void)setShouldFetchAppInstallationStatus:(BOOL)a3
{
  void *v6;

  if (self->_hasInitiatedFetch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasInitiatedFetch == NO"));

  }
  self->_shouldFetchAppInstallationStatus = a3;
}

- (void)setShouldFetchAppIcons:(BOOL)a3
{
  void *v6;

  if (self->_hasInitiatedFetch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasInitiatedFetch == NO"));

  }
  self->_shouldFetchAppIcons = a3;
}

- (void)setShouldFetchPurposeStrings:(BOOL)a3
{
  void *v6;

  if (self->_hasInitiatedFetch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasInitiatedFetch == NO"));

  }
  self->_shouldFetchPurposeStrings = a3;
}

- (void)setShouldIncludeSpecialSources:(BOOL)a3
{
  void *v6;

  if (self->_hasInitiatedFetch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasInitiatedFetch == NO"));

  }
  self->_shouldIncludeSpecialSources = a3;
}

- (void)addFetchTransformer:(id)a3
{
  id v5;
  NSMutableArray *transformers;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (self->_hasInitiatedFetch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceListDataSource.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_hasInitiatedFetch == NO"));

    v5 = v10;
  }
  transformers = self->_transformers;
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = _Block_copy(v7);
  -[NSMutableArray addObject:](transformers, "addObject:", v8);

}

+ (id)_builtinInstallationStatusTransformer
{
  return &__block_literal_global_87;
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6C20], "bundleIdentifierForInstallationStatusForSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if (objc_msgSend(v6, "_isApplication") && (objc_msgSend(v6, "_isSiri") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInstalled:", objc_msgSend(v11, "applicationIsInstalled:", v10));

    if (!objc_msgSend(v4, "installed"))
    {
      objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2;
      v13[3] = &unk_1E9C46780;
      v14 = v4;
      v15 = v10;
      v16 = v5;
      objc_msgSend(v12, "applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:", v15, v13);

      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v4, "setInstalled:", 1);
  }
  (*((void (**)(id, id))v5 + 2))(v5, v4);
LABEL_8:

}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  objc_msgSend(a1[4], "setInstalled:", a2);
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2_cold_1();
  }
  if (objc_msgSend(a1[4], "installed"))
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_214;
    v8[3] = &unk_1E9C46780;
    v7 = a1[5];
    v9 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    objc_msgSend(v6, "applicationIsInstalledOnAnyPairedDeviceWithBundleID:completion:", v7, v8);

  }
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_214(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setInstalled:", a2);
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_214_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)_builtinIconFetchTransformer
{
  return &__block_literal_global_216;
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void (**v5)(id, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(id, id);
  _QWORD block[4];
  id v32;
  id v33;
  id v34;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "_isSiri"))
  {
    if (objc_msgSend(v6, "_isResearchStudy"))
    {
      objc_msgSend(v4, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v9, "_fetchBundleWithError:", &v34);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v34;

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Icon"), v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v4, "setIcon:", v13);
          objc_msgSend(v4, "source");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_221;
          block[3] = &unk_1E9C3FC50;
          v32 = v13;
          v33 = v15;
          v16 = v15;
          v17 = v13;
          dispatch_async(MEMORY[0x1E0C80D38], block);
          v5[2](v5, v4);

LABEL_18:
          goto LABEL_19;
        }
      }
      else
      {
        _HKInitializeLogging();
        v18 = (void *)*MEMORY[0x1E0CB52C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
          __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_cold_1(v18, v4, (uint64_t)v11);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB6C20], "bundleIdentifierForIconForSource:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(v6, "bundleIdentifier");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v21;

    if (objc_msgSend(v4, "installed"))
    {
      v22 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "scale");
      objc_msgSend(v22, "_applicationIconImageForBundleIdentifier:format:scale:", v11, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIcon:", v24);

    }
    objc_msgSend(v4, "icon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v5[2](v5, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2;
      v27[3] = &unk_1E9C467F0;
      v28 = v11;
      v29 = v4;
      v30 = v5;
      objc_msgSend(v26, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v28, v27);

    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D80458], "settingsIconCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForKey:", *MEMORY[0x1E0D806B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:", v8);

  v5[2](v5, v4);
LABEL_19:

}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_221(uint64_t a1)
{
  id v2;

  +[HKAppImageManager sharedImageManager](HKAppImageManager, "sharedImageManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheAppIcon:forIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_cold_1();
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0D51850], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  if (v5)
    v12 = v5;
  else
    v12 = *(id *)(a1 + 32);
  if (v9 <= 2.0)
    v13 = 47;
  else
    v13 = 48;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_226;
  v14[3] = &unk_1E9C467C8;
  v15 = v11;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v10, "getIconForBundleID:iconVariant:block:timeout:", v12, v13, v14, -1.0);

}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_226(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_227;
    v8 = &unk_1E9C3FC50;
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], &v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "setIcon:", v4, v5, v6, v7, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_227(uint64_t a1)
{
  id v2;

  +[HKAppImageManager sharedImageManager](HKAppImageManager, "sharedImageManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheAppIcon:forIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)_builtinPurposeStringsFetchTransformer
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke;
  aBlock[3] = &__block_descriptor_40_e56_v24__0__HKSourceDataModel_8___v____HKSourceDataModel__16l;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

void __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id);
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void (**v26)(id, id);
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(id, id);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _QWORD v41[7];

  v41[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_isApplication") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "_isResearchStudy") ^ 1;
  if (!objc_msgSend(v5, "installed") || v8)
  {
    v6[2](v6, v5);
  }
  else
  {
    v35 = 0;
    objc_msgSend(v7, "_fetchBundleWithError:", &v35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v35;
    v11 = v10;
    if (v9)
    {
      v25 = v10;
      v26 = v6;
      v41[0] = CFSTR("NSHealthUpdateUsageDescription");
      v41[1] = CFSTR("NSHealthShareUsageDescription");
      v41[2] = CFSTR("NSHealthResearchStudyUsageDescription");
      v41[3] = CFSTR("NSHealthClinicalHealthRecordsShareUsageDescription");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v9, "objectForInfoDictionaryKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v16);
      }

      v21 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v5, "setPurposeStrings:", v21);

      v6 = v26;
      v26[2](v26, v5);

      v11 = v25;
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v7;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_1D7813000, v22, OS_LOG_TYPE_DEFAULT, "No bundle found for source %@, falling back to remote paired Watch. Bundle fetch error: %@", buf, 0x16u);
      }
      v23 = *(void **)(a1 + 32);
      objc_msgSend(v7, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_231;
      v27[3] = &unk_1E9C46818;
      v28 = v7;
      v30 = v6;
      v29 = v5;
      objc_msgSend(v23, "_remoteWatchAppPurposeStringsForBundleIdentifier:completion:", v24, v27);

      v14 = v28;
    }

  }
}

void __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setPurposeStrings:", v6);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_231_cold_1(a1, (uint64_t)v5, v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_prependBuiltinTransformers
{
  NSMutableArray *transformers;
  void *v4;
  NSMutableArray *followupTransformers;
  void *v6;
  NSMutableArray *v7;
  id v8;

  if (self->_shouldFetchAppInstallationStatus)
  {
    transformers = self->_transformers;
    objc_msgSend((id)objc_opt_class(), "_builtinInstallationStatusTransformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](transformers, "insertObject:atIndex:", v4, 0);

  }
  if (self->_shouldFetchAppIcons)
  {
    followupTransformers = self->_followupTransformers;
    objc_msgSend((id)objc_opt_class(), "_builtinIconFetchTransformer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](followupTransformers, "addObject:", v6);

  }
  if (self->_shouldFetchPurposeStrings)
  {
    v7 = self->_followupTransformers;
    objc_msgSend((id)objc_opt_class(), "_builtinPurposeStringsFetchTransformer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v7, "addObject:", v8);

  }
}

+ (void)_performTransformations:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void (*v13)(_QWORD *, id, _QWORD *);
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__HKSourceListDataSource__performTransformations_model_completion___block_invoke;
    v15[3] = &unk_1E9C46860;
    v18 = a1;
    v16 = v12;
    v17 = v10;
    v13 = (void (*)(_QWORD *, id, _QWORD *))v11[2];
    v14 = v12;
    v13(v11, v9, v15);

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }

}

uint64_t __67__HKSourceListDataSource__performTransformations_model_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 48), "_performTransformations:model:completion:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_didFetchSources:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  HKSourceDataModel *v28;
  void *v29;
  void *v30;
  NSObject *resultsQueue;
  id v32;
  void *v33;
  id v34;
  id v35;
  id obj;
  _QWORD block[5];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB52C0];
  if (v8)
  {
    v33 = v10;
    v34 = v9;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      v14 = v13;
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      v58 = 2048;
      v59 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1D7813000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: successfully fetched %lu sources", buf, 0x16u);

    }
    v15 = dispatch_group_create();
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (self->_shouldIncludeSpecialSources)
    {
      -[HKSourceListDataSource _specialAppBundleIdentifiers](self, "_specialAppBundleIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v51 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            dispatch_group_enter(v15);
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke;
            v47[3] = &unk_1E9C46888;
            v47[4] = self;
            v48 = v16;
            v49 = v15;
            -[HKSourceListDataSource _fakeSourceForInstalledAppWithBundleIdentifier:completion:](self, "_fakeSourceForInstalledAppWithBundleIdentifier:completion:", v22, v47);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v19);
      }

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = v8;
    obj = v8;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          dispatch_group_enter(v15);
          v28 = -[HKSourceDataModel initWithSource:]([HKSourceDataModel alloc], "initWithSource:", v27);
          v29 = (void *)-[NSMutableArray mutableCopy](self->_transformers, "mutableCopy");
          v30 = (void *)objc_opt_class();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3;
          v40[3] = &unk_1E9C46888;
          v40[4] = self;
          v41 = v16;
          v42 = v15;
          objc_msgSend(v30, "_performTransformations:model:completion:", v29, v28, v40);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v24);
    }

    resultsQueue = self->_resultsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_5;
    block[3] = &unk_1E9C3FBE0;
    block[4] = self;
    v38 = v16;
    v10 = v33;
    v39 = v33;
    v32 = v16;
    dispatch_group_notify(v15, resultsQueue, block);

    v9 = v34;
    v8 = v35;
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    -[HKSourceListDataSource _didFetchSources:error:completion:].cold.1(v11);
  }

}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v5 = a2;
  if (v5)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2;
    block[3] = &unk_1E9C3FC50;
    v7 = v3;
    v8 = v5;
    dispatch_sync(v4, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v5 = a2;
  if (v5)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4;
    block[3] = &unk_1E9C3FC50;
    v7 = v3;
    v8 = v5;
    dispatch_sync(v4, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HKSourceListDataModel *v10;
  uint64_t v11;
  NSObject *v12;
  HKSourceListDataModel *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  HKSourceListDataModel *v24;
  id v25;
  id obj;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[5];
  HKSourceListDataModel *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 138543362;
    v41 = (id)objc_opt_class();
    v4 = v41;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: finished transforming fetched sources", buf, 0xCu);

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = *(void **)(a1 + 40);
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_235;
  v37[3] = &unk_1E9C468B0;
  v25 = v5;
  v38 = v25;
  objc_msgSend(v7, "predicateWithBlock:", v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterUsingPredicate:", v9);

  v10 = -[HKSourceListDataModel initWithSourceModels:]([HKSourceListDataModel alloc], "initWithSourceModels:", *(_QWORD *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(NSObject **)(v11 + 8);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2_238;
  block[3] = &unk_1E9C3FBE0;
  block[4] = v11;
  v13 = v10;
  v35 = v13;
  v36 = *(id *)(a1 + 48);
  dispatch_async(v12, block);
  v24 = v13;
  v14 = (void *)-[HKSourceListDataModel copy](v13, "copy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v14, "allSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
        v20 = (void *)objc_opt_class();
        v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3_239;
        v27[3] = &unk_1E9C468D8;
        v22 = v14;
        v23 = *(_QWORD *)(a1 + 32);
        v28 = v22;
        v29 = v23;
        objc_msgSend(v20, "_performTransformations:model:completion:", v21, v19, v27);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v16);
  }

}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_235(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return v5 ^ 1u;
}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2_238(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForDataSourceUpdate");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3_239(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4_240;
  v6[3] = &unk_1E9C3FC50;
  v6[4] = v3;
  v7 = v2;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4_240(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_throttledNotificationOfDataSourceUpdate");
}

- (void)_notifyObserversForDataSourceUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  HKSynchronousObserverSet *observers;
  id v7;
  HKSynchronousObserverSet *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  HKSynchronousObserverSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    observers = self->_observers;
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = observers;
    v7 = v5;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: notifying observers via sourceListDataSourceDidUpdate: %@", buf, 0x16u);

  }
  v8 = self->_observers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HKSourceListDataSource__notifyObserversForDataSourceUpdate__block_invoke;
  v9[3] = &unk_1E9C46900;
  v9[4] = self;
  -[HKSynchronousObserverSet notifyObservers:](v8, "notifyObservers:", v9);
}

uint64_t __61__HKSourceListDataSource__notifyObserversForDataSourceUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceListDataSourceDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)_throttledNotificationOfDataSourceUpdate
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[HKSourceListDataSource performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__notifyObserversForDataSourceUpdate, 0, 0.25);
}

+ (void)_remoteWatchAppPurposeStringsForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CF8858];
  v7 = a3;
  objc_msgSend(v6, "sharedDeviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E9C46950;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v7, v10);

}

void __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke_2;
    v7[3] = &unk_1E9C46928;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchApplicationOnPairedDevice:withBundleID:completion:", 0, v5, v7);

  }
}

void __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setWithObjects:", CFSTR("NSHealthShareUsageDescription"), CFSTR("NSHealthUpdateUsageDescription"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedInfoPlistStringsForKeys:fetchingFirstMatchingLocalizationInList:", v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_specialAppBundleIdentifiers
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB77E8];
  v4[0] = *MEMORY[0x1E0CB7550];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_fakeSourceForInstalledAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKSourceDataModel *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  HKSourceDataModel *v14;
  _QWORD v15[4];
  HKSourceDataModel *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C18]), "_init");
  objc_msgSend(v8, "_setBundleIdentifier:", v6);
  objc_msgSend(v8, "_setOptions:", 5);
  v9 = -[HKSourceDataModel initWithSource:]([HKSourceDataModel alloc], "initWithSource:", v8);
  v10 = (void *)objc_opt_class();
  v11 = (void *)-[NSMutableArray copy](self->_transformers, "copy");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__HKSourceListDataSource__fakeSourceForInstalledAppWithBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E9C46978;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  v14 = v9;
  objc_msgSend(v10, "_performTransformations:model:completion:", v11, v14, v15);

}

void __84__HKSourceListDataSource__fakeSourceForInstalledAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "installed"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CA5870]);
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 0;
    v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v8);
    v5 = v8;
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setName:", v7);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)fetchFilteredSourcesWithAuthorizationRecordsForSources:(id)a3
{
  id v4;
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  _QWORD v22[6];
  NSObject *v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB6330]);
  -[HKSourceListDataSource healthStore](self, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v5, "initWithHealthStore:", v6);

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__28;
  v33 = __Block_byref_object_dispose__28;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = dispatch_semaphore_create(0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "_isSiri"))
        {
          objc_msgSend((id)v30[5], "addObject:", v12);
        }
        else
        {
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke;
          v22[3] = &unk_1E9C469C8;
          v24 = &v29;
          v22[4] = self;
          v22[5] = v12;
          v15 = v7;
          v23 = v15;
          objc_msgSend(v21, "fetchAuthorizationRecordsForBundleIdentifier:completion:", v14, v22);

          dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v9);
  }

  _HKInitializeLogging();
  v16 = (id)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v36 = v17;
    v18 = v17;
    _os_log_impl(&dword_1D7813000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully returned the list of sources", buf, 0xCu);

  }
  v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_2;
    v9[3] = &unk_1E9C469A0;
    v11 = *(_QWORD *)(a1 + 56);
    v10 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  }
  else if (v6)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_cold_1(a1, v8);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "requestedSharing") & 1) != 0 || objc_msgSend(v6, "requestedReading"))
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)v10 = 138543362;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v9 = *(id *)&v10[4];
      _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Added source to the list of sources", v10, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 40), *(_OWORD *)v10);
    *a4 = 1;
  }

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSourceListDataModel)sources
{
  return self->_sources;
}

- (BOOL)shouldFetchAppInstallationStatus
{
  return self->_shouldFetchAppInstallationStatus;
}

- (BOOL)shouldFetchAppIcons
{
  return self->_shouldFetchAppIcons;
}

- (BOOL)shouldFetchPurposeStrings
{
  return self->_shouldFetchPurposeStrings;
}

- (BOOL)shouldIncludeSpecialSources
{
  return self->_shouldIncludeSpecialSources;
}

- (BOOL)deliverUpdates
{
  return self->_deliverUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rawSources, 0);
  objc_storeStrong((id *)&self->_followupTransformers, 0);
  objc_storeStrong((id *)&self->_transformers, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v0, (uint64_t)v0, "Failed to fetch remote application installation status for companion bundle identifier %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_7_0();
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_214_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v0, (uint64_t)v0, "Failed to fetch remote application installation status for watch bundle identifier %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_7_0();
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v5, v7, "Failed to fetch research study bundle for source %{public}@: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_0_2();
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v0, (uint64_t)v0, "Failed to fetch watch app bundle identifier for companion bundle identifier '%{public}@': %{public}@", v1);
  OUTLINED_FUNCTION_7_0();
}

void __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_231_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, a3, (uint64_t)a3, "Unable to fetch remote watch app purpose strings for source %@: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7_0();
}

- (void)_didFetchSources:(void *)a1 error:completion:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3_3();
  v4 = OUTLINED_FUNCTION_3_10(v3);
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v1, v5, "%{public}@: failed to fetch sources: %{public}@", v6);

  OUTLINED_FUNCTION_0_2();
}

void __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_3_3();
  v5 = OUTLINED_FUNCTION_3_10(v4);
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v2, v6, "%{public}@: failed to get authorization records: %{public}@", v7);

  OUTLINED_FUNCTION_0_2();
}

@end
