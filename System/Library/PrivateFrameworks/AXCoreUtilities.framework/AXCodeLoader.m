@implementation AXCodeLoader

+ (id)defaultLoader
{
  if (defaultLoader_onceToken != -1)
    dispatch_once(&defaultLoader_onceToken, &__block_literal_global_14);
  return (id)defaultLoader__DefaultLoader;
}

void __29__AXCodeLoader_defaultLoader__block_invoke()
{
  AXCodeLoader *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AXCodeLoader alloc];
  +[_AXDyldImageMonitor sharedInstance](_AXDyldImageMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AXCodeLoader initWithImageMonitor:](v0, "initWithImageMonitor:", v3);
  v2 = (void *)defaultLoader__DefaultLoader;
  defaultLoader__DefaultLoader = v1;

}

- (AXCodeLoader)initWithImageMonitor:(id)a3
{
  id v5;
  AXCodeLoader *v6;
  AXCodeLoader *v7;
  uint64_t v8;
  NSString *currentPlatformKey;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  dispatch_source_t v15;
  OS_dispatch_source *loadAccessibilityCodeItemsSource;
  NSObject *v17;
  uint64_t v19[4];
  id v20;
  id location;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXCodeLoader;
  v6 = -[AXCodeLoader init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    -[AXCodeLoader _platformKeyForPlatform:](v6, "_platformKeyForPlatform:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    currentPlatformKey = v7->_currentPlatformKey;
    v7->_currentPlatformKey = (NSString *)v8;

    if (!v7->_currentPlatformKey)
      _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/Swizzling/Loading/AXCodeLoader.m", (void *)0x56, (uint64_t)"-[AXCodeLoader initWithImageMonitor:]", CFSTR("Unknown platform"), v10, v11, v12, v19[0]);
    objc_storeStrong((id *)&v7->_imageMonitor, a3);
    v13 = dispatch_queue_create("AXCodeLoader", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)v7->_queue);
    loadAccessibilityCodeItemsSource = v7->_loadAccessibilityCodeItemsSource;
    v7->_loadAccessibilityCodeItemsSource = (OS_dispatch_source *)v15;

    objc_initWeak(&location, v7);
    v17 = v7->_loadAccessibilityCodeItemsSource;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__37__AXCodeLoader_initWithImageMonitor___block_invoke;
    v19[3] = (uint64_t)&unk_1E28C3380;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_activate((dispatch_object_t)v7->_loadAccessibilityCodeItemsSource);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __37__AXCodeLoader_initWithImageMonitor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadAccessibilityCodeItems");

}

- (AXCodeLoader)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Must use designated initializer initWithImageMonitor:"));

  return 0;
}

- (id)_validShouldLoadAccessibilityCodeItemBlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXCodeLoader shouldLoadAccessibilityCodeItemBlock](self, "shouldLoadAccessibilityCodeItemBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXCodeLoader shouldLoadAccessibilityCodeItemBlock](self, "shouldLoadAccessibilityCodeItemBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);

  }
  else
  {
    v4 = (void *)objc_msgSend(&__block_literal_global_11, "copy");
    v6 = _Block_copy(v4);
  }

  return v6;
}

uint64_t __58__AXCodeLoader__validShouldLoadAccessibilityCodeItemBlock__block_invoke()
{
  return 1;
}

- (id)_validDidLoadAccessibilityCodeItemBlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXCodeLoader didLoadAccessibilityCodeItemBlock](self, "didLoadAccessibilityCodeItemBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXCodeLoader didLoadAccessibilityCodeItemBlock](self, "didLoadAccessibilityCodeItemBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);

  }
  else
  {
    v4 = (void *)objc_msgSend(&__block_literal_global_13, "copy");
    v6 = _Block_copy(v4);
  }

  return v6;
}

uint64_t __55__AXCodeLoader__validDidLoadAccessibilityCodeItemBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
}

- (id)_validLoadEventWillOccurBlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXCodeLoader loadEventWillOccurBlock](self, "loadEventWillOccurBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXCodeLoader loadEventWillOccurBlock](self, "loadEventWillOccurBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);

  }
  else
  {
    v4 = (void *)objc_msgSend(&__block_literal_global_15, "copy");
    v6 = _Block_copy(v4);
  }

  return v6;
}

- (id)_validLoadEventDidOccurBlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXCodeLoader loadEventDidOccurBlock](self, "loadEventDidOccurBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXCodeLoader loadEventDidOccurBlock](self, "loadEventDidOccurBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);

  }
  else
  {
    v4 = (void *)objc_msgSend(&__block_literal_global_17, "copy");
    v6 = _Block_copy(v4);
  }

  return v6;
}

uint64_t __44__AXCodeLoader__validLoadEventDidOccurBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
}

- (BOOL)isTrackingLoadedCodeItems
{
  return self->_trackingMode != 0;
}

- (BOOL)isInitialLoadFinished
{
  return self->_initialLoadHasFinished;
}

- (void)beginTrackingLoadedCodeItemsWithMode:(int64_t)a3 completion:(id)a4 targetQueue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  if (!a3)
  {
    AXLogLoading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[AXCodeLoader beginTrackingLoadedCodeItemsWithMode:completion:targetQueue:].cold.1(v10);

  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__AXCodeLoader_beginTrackingLoadedCodeItemsWithMode_completion_targetQueue___block_invoke;
  v14[3] = &unk_1E28C34A8;
  v16 = v8;
  v17 = a3;
  v14[4] = self;
  v15 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, v14);

}

void __76__AXCodeLoader_beginTrackingLoadedCodeItemsWithMode_completion_targetQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "isTrackingLoadedCodeItems") & 1) == 0 && *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(a1 + 56) == 2)
      objc_msgSend(*(id *)(a1 + 32), "_updateAccessibilityCodeItemDefinitionsIfNeeded");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addImageMonitorObserver:");
    v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v5;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  }
}

- (void)endTrackingLoadedCodeItemsWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke;
  block[3] = &unk_1E28C2D18;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isTrackingLoadedCodeItems"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeImageMonitorObserver:");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  }
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6 = v5;
    if (!v5)
    {
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
      v4 = *(void **)(a1 + 48);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke_2;
    block[3] = &unk_1E28C34D0;
    v9 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addTrackedCodeItem:(id)a3
{
  NSObject *queue;
  id v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3;
  v7[4] = __Block_byref_object_dispose__3;
  v8 = a3;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__AXCodeLoader__addTrackedCodeItem___block_invoke;
  v6[3] = &unk_1E28C34F8;
  v6[4] = self;
  v6[5] = v7;
  v5 = v8;
  dispatch_async(queue, v6);
  _Block_object_dispose(v7, 8);

}

void __36__AXCodeLoader__addTrackedCodeItem___block_invoke(uint64_t a1)
{
  void *v2;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "trackingMode"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "member:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
    {
      objc_msgSend(obj, "setIsLoaded:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isLoaded"));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isAccessibilityBundle") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_associateAccessibilityCodeItemWithLoadedCodeItem:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "trackingMode") == 1)
      goto LABEL_12;
    if (objc_msgSend(*(id *)(a1 + 32), "trackingMode") == 2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "associatedAccessibilityCodeItem");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {

LABEL_12:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        goto LABEL_13;
      }
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isAccessibilityBundle"))
        goto LABEL_12;
    }
LABEL_13:

  }
}

- (id)loadedCodeItemPathsUsingTrackedItemsIfAvailable:(BOOL)a3
{
  NSObject *queue;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  if (!a3)
    goto LABEL_4;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__AXCodeLoader_loadedCodeItemPathsUsingTrackedItemsIfAvailable___block_invoke;
  v9[3] = &unk_1E28C34F8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v5 = (void *)v11[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
LABEL_4:
    -[AXImageMonitor loadedImagePaths](self->_imageMonitor, "loadedImagePaths");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __64__AXCodeLoader_loadedCodeItemPathsUsingTrackedItemsIfAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isTrackingLoadedCodeItems"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "path", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (id)_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:(BOOL)a3
{
  NSMutableSet *v4;
  void *v5;
  AXImageMonitor *imageMonitor;
  _QWORD v8[4];
  NSMutableSet *v9;

  if (!a3
    || !-[AXCodeLoader isTrackingLoadedCodeItems](self, "isTrackingLoadedCodeItems")
    || (v4 = self->_trackedCodeItems) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    imageMonitor = self->_imageMonitor;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__AXCodeLoader__queue_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke;
    v8[3] = &unk_1E28C3338;
    v4 = v5;
    v9 = v4;
    -[AXImageMonitor enumerateLoadedImagePaths:](imageMonitor, "enumerateLoadedImagePaths:", v8);

  }
  return v4;
}

void __67__AXCodeLoader__queue_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  AXCodeItem *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[AXCodeItem initWithPath:isDyldOpened:]([AXCodeItem alloc], "initWithPath:isDyldOpened:", v3, 1);

  objc_msgSend(v2, "addObject:", v4);
}

- (id)loadedCodeItemsUsingTrackedItemsIfAvailable:(BOOL)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AXCodeLoader_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke;
  block[3] = &unk_1E28C3520;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __60__AXCodeLoader_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:", *(unsigned __int8 *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)codeItemForBundle:(id)a3
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AXCodeLoader_codeItemForBundle___block_invoke;
  block[3] = &unk_1E28C3548;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __34__AXCodeLoader_codeItemForBundle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByDeletingLastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "bundlePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setAccessibilityCodeItemsNeedLoaded
{
  dispatch_source_merge_data((dispatch_source_t)self->_loadAccessibilityCodeItemsSource, 1uLL);
}

- (void)_scheduleDyldImageActivityTimerWithDelay:(double)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *dyldImageActivityCoalesceTimer;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[5];
  id v10;
  id location;

  if (!self->_dyldImageActivityCoalesceTimer)
  {
    objc_initWeak(&location, self);
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    dyldImageActivityCoalesceTimer = self->_dyldImageActivityCoalesceTimer;
    self->_dyldImageActivityCoalesceTimer = v5;

    v7 = self->_dyldImageActivityCoalesceTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__AXCodeLoader__scheduleDyldImageActivityTimerWithDelay___block_invoke;
    handler[3] = &unk_1E28C3570;
    objc_copyWeak(&v10, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate((dispatch_object_t)self->_dyldImageActivityCoalesceTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_dyldImageActivityCoalesceTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __57__AXCodeLoader__scheduleDyldImageActivityTimerWithDelay___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  -[dispatch_source_t _consumeBeginTrackingCompletionHandlerIfNeeded](WeakRetained, "_consumeBeginTrackingCompletionHandlerIfNeeded");
  if (*(uint64_t *)(*(_QWORD *)(a1 + 32) + 40) >= 1
    && -[dispatch_source_t shouldAutoloadAccessibilityCodeItems](WeakRetained, "shouldAutoloadAccessibilityCodeItems"))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    dispatch_source_merge_data(WeakRetained[3], 1uLL);
  }

}

- (void)_cancelDyldImageActivityTimer
{
  NSObject *dyldImageActivityCoalesceTimer;

  dyldImageActivityCoalesceTimer = self->_dyldImageActivityCoalesceTimer;
  if (dyldImageActivityCoalesceTimer)
    dispatch_source_set_timer(dyldImageActivityCoalesceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_consumeBeginTrackingCompletionHandlerIfNeeded
{
  id beginTrackingCompletion;
  void *v4;
  OS_dispatch_queue *beginTrackingCompletionQueue;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  _QWORD block[4];
  id v12;

  beginTrackingCompletion = self->_beginTrackingCompletion;
  if (beginTrackingCompletion)
  {
    v4 = (void *)objc_msgSend(beginTrackingCompletion, "copy");
    beginTrackingCompletionQueue = self->_beginTrackingCompletionQueue;
    v6 = beginTrackingCompletionQueue;
    if (!beginTrackingCompletionQueue)
    {
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AXCodeLoader__consumeBeginTrackingCompletionHandlerIfNeeded__block_invoke;
    block[3] = &unk_1E28C34D0;
    v12 = v4;
    v8 = v4;
    dispatch_async(v6, block);
    if (!beginTrackingCompletionQueue)

    v9 = self->_beginTrackingCompletion;
    self->_beginTrackingCompletion = 0;

    v10 = self->_beginTrackingCompletionQueue;
    self->_beginTrackingCompletionQueue = 0;

  }
}

uint64_t __62__AXCodeLoader__consumeBeginTrackingCompletionHandlerIfNeeded__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prewarmAccessibilityCodeItemDefinitionsWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke;
  block[3] = &unk_1E28C2D18;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_updateAccessibilityCodeItemDefinitionsIfNeeded");
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 40);
    v4 = v3;
    if (!v3)
    {
      v4 = MEMORY[0x1E0C80D38];
      v5 = MEMORY[0x1E0C80D38];
      v2 = *(void **)(a1 + 48);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke_2;
    block[3] = &unk_1E28C34D0;
    v7 = v2;
    dispatch_async(v4, block);
    if (!v3)

  }
}

uint64_t __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateAccessibilityCodeItemDefinitionsIfNeeded
{
  NSObject *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *accessibilityCodeItems;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (!self->_accessibilityCodeItems)
  {
    AXLogLoading();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18EBEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateAXCodeItemDefs", ", buf, 2u);
    }

    -[AXCodeLoader _accessibilityBundleMapURLs](self, "_accessibilityBundleMapURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:](self, "_createAccessibilityCodeItemsFromBundleMapURLs:", v4);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    accessibilityCodeItems = self->_accessibilityCodeItems;
    self->_accessibilityCodeItems = v5;

    AXLogLoading();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_18EBEC000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateAXCodeItemDefs", ", v8, 2u);
    }

    -[AXCodeLoader _reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions](self, "_reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions");
    -[AXCodeLoader _initializeCodeItemMappings](self, "_initializeCodeItemMappings");
  }
}

- (void)_initializeCodeItemMappings
{
  NSMutableDictionary *v3;
  NSMutableDictionary *codeItemsByNameType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)objc_opt_new();
  codeItemsByNameType = self->_codeItemsByNameType;
  self->_codeItemsByNameType = v3;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_accessibilityCodeItems;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        if (self->_currentPlatformKey)
        {
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "platformToTarget");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", self->_currentPlatformKey);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "targetType"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_codeItemsByNameType, "setObject:forKeyedSubscript:", v9, v14);

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)_reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions
{
  NSMutableSet *trackedCodeItems;
  _QWORD v4[5];

  trackedCodeItems = self->_trackedCodeItems;
  if (trackedCodeItems)
  {
    if (self->_accessibilityCodeItems)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __78__AXCodeLoader__reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions__block_invoke;
      v4[3] = &unk_1E28C35D8;
      v4[4] = self;
      -[NSMutableSet enumerateObjectsUsingBlock:](trackedCodeItems, "enumerateObjectsUsingBlock:", v4);
      -[AXCodeLoader _associateAccessibilityCodeItemsWithAllTrackedCodeItems](self, "_associateAccessibilityCodeItemsWithAllTrackedCodeItems");
    }
  }
}

uint64_t __78__AXCodeLoader__reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "ax_replaceWithMatchingObject:updatingWithBlock:", a2, &__block_literal_global_24_2);
}

void __78__AXCodeLoader__reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = a2;
  objc_msgSend(v4, "platformToTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlatformToTarget:", v5);

  objc_msgSend(v7, "setTargetType:", objc_msgSend(v4, "targetType"));
  v6 = objc_msgSend(v4, "loadOrder");

  objc_msgSend(v7, "setLoadOrder:", v6);
}

- (id)_platformKeyForPlatform:(unsigned int)a3
{
  unsigned int v3;
  unint64_t v4;
  id *v5;

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 - 2;
  v3 = v4 >> 1;
  if (v3 > 7)
    v5 = (id *)&_AXBundleMapPlatformKey_iOS;
  else
    v5 = (id *)off_1E28C3820[v3];
  return *v5;
}

- (id)_accessibilityCodeItemMatchingName:(id)a3 type:(int64_t)a4 path:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  uint64_t v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  NSMutableSet *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_codeItemsByNameType, "objectForKeyedSubscript:", v10);
  v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = self->_accessibilityCodeItems;
    v11 = (NSMutableSet *)-[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v20 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(obj);
          v12 = (NSMutableSet *)*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14);

          -[NSMutableSet platformToTarget](v12, "platformToTarget");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", self->_currentPlatformKey);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqualToString:", v7))
          {
            v18 = -[NSMutableSet targetType](v12, "targetType");

            if (v18 == a4)
            {
              v11 = v12;
              v12 = obj;
              obj = v11;
              goto LABEL_13;
            }
          }
          else
          {

          }
          v14 = (NSMutableSet *)((char *)v14 + 1);
          v15 = v12;
        }
        while (v11 != v14);
        v11 = (NSMutableSet *)-[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
LABEL_13:

      v10 = v20;
    }

  }
  return v11;
}

- (void)_associateAccessibilityCodeItemWithLoadedCodeItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isAccessibilityBundle"))
  {
    AXLogLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXCodeLoader _associateAccessibilityCodeItemWithLoadedCodeItem:].cold.1(v5);
  }
  else
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "type");
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCodeLoader _accessibilityCodeItemMatchingName:type:path:](self, "_accessibilityCodeItemMatchingName:type:path:", v6, v7, v8);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAssociatedAccessibilityCodeItem:", v5);
    -[NSObject setTargetCodeItem:](v5, "setTargetCodeItem:", v4);
  }

}

- (void)_associateAccessibilityCodeItemsWithAllTrackedCodeItems
{
  NSMutableSet *trackedCodeItems;
  _QWORD v3[5];

  trackedCodeItems = self->_trackedCodeItems;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__AXCodeLoader__associateAccessibilityCodeItemsWithAllTrackedCodeItems__block_invoke;
  v3[3] = &unk_1E28C35D8;
  v3[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](trackedCodeItems, "enumerateObjectsUsingBlock:", v3);
}

void __71__AXCodeLoader__associateAccessibilityCodeItemsWithAllTrackedCodeItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isAccessibilityBundle") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_associateAccessibilityCodeItemWithLoadedCodeItem:", v3);

}

- (id)_accessibilityBundleMapURLs
{
  if (_accessibilityBundleMapURLs_onceToken != -1)
    dispatch_once(&_accessibilityBundleMapURLs_onceToken, &__block_literal_global_26_0);
  return (id)_accessibilityBundleMapURLs_KnownBundleMapURLs;
}

void __43__AXCodeLoader__accessibilityBundleMapURLs__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v1 = (void *)MEMORY[0x1E0C99E98];
  AXAccessibilityBundlesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v17[1] = CFSTR("mainbundles.axbundlemap");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURLWithPathComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v4);

  if (!_AXSMossdeepEnabled())
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    AXAccessibilityBundlesDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = CFSTR("watchbundles.axbundlemap");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPathComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v8);

  }
  if (_AXSMossdeepEnabled())
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    AXAccessibilityBundlesDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = CFSTR("mossdeepbundles.axbundlemap");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPathComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_accessibilityBundleMapURLs_KnownBundleMapURLs;
  _accessibilityBundleMapURLs_KnownBundleMapURLs = v13;

}

- (id)_createAccessibilityCodeItemsFromBundleMapURLs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id obj;
  id v20;
  uint64_t v21;
  _AXCodeItemDecoder *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[16];
  _BYTE v36[16];
  _BYTE v37[128];
  _BYTE v38[24];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(_AXCodeItemDecoder);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v24)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v5;
        -[_AXCodeItemDecoder decodedCodeItemsFromURL:decodingErrors:](v22, "decodedCodeItemsFromURL:decodingErrors:", v5, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          AXLogLoading();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:].cold.3((uint64_t)v38, (uint64_t)v6);

          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = v6;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v28;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v28 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13);
                AXLogLoading();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                  -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:].cold.2((uint64_t)v36, v14);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
            }
            while (v11);
          }

        }
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject intersectSet:](v16, "intersectSet:", v20);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __63__AXCodeLoader__createAccessibilityCodeItemsFromBundleMapURLs___block_invoke;
          v25[3] = &unk_1E28C35D8;
          v17 = v20;
          v26 = v17;
          -[NSObject enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v25);
          objc_msgSend(v17, "unionSet:", v7);

        }
        else
        {
          AXLogLoading();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:].cold.1((uint64_t)v35, v23);
        }

        ++v4;
      }
      while (v4 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  return v20;
}

void __63__AXCodeLoader__createAccessibilityCodeItemsFromBundleMapURLs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "member:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platformToTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addPlatformToTargetEntries:", v4);
}

- (void)_loadAccessibilityCodeItems
{
  dispatch_object_t *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  dispatch_queue_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD);
  dispatch_object_t *v39;
  _QWORD block[4];
  id v41;
  dispatch_object_t *v42;
  id v43;
  uint64_t v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v2 = (dispatch_object_t *)self;
  v62 = *MEMORY[0x1E0C80C00];
  v3 = 1;
  if (!self->_initialLoadHasOccurred)
  {
    self->_initialLoadHasOccurred = 1;
    v3 = 0;
  }
  -[AXCodeLoader _validLoadEventWillOccurBlock](self, "_validLoadEventWillOccurBlock");
  v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v38[2](v38, v3);
  dispatch_suspend(v2[3]);
  if (AXShouldLogValidationErrors())
  {
    AXLogLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EBEC000, v4, OS_LOG_TYPE_INFO, "Will reevaluate code items and load any needed ax code items now", buf, 2u);
    }

  }
  v37 = v3;
  -[dispatch_object_t _updateAccessibilityCodeItemDefinitionsIfNeeded](v2, "_updateAccessibilityCodeItemDefinitionsIfNeeded");
  -[dispatch_object_t _validShouldLoadAccessibilityCodeItemBlock](v2, "_validShouldLoadAccessibilityCodeItemBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[dispatch_object_t _queue_loadedCodeItemsUsingTrackedItemsIfAvailable:](v2, "_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke;
  v56[3] = &unk_1E28C3620;
  v56[4] = v2;
  v36 = v5;
  v57 = v36;
  objc_msgSend(v6, "ax_filteredSetUsingBlock:", v56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E10];
  v35 = v7;
  objc_msgSend(v7, "ax_flatMappedSetUsingBlock:", &__block_literal_global_42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orderedSetWithSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_44);
  v39 = v2;
  if (AXShouldLogValidationErrors())
  {
    AXLogLoading();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134217984;
      v61 = v12;
      _os_log_impl(&dword_18EBEC000, v11, OS_LOG_TYPE_DEFAULT, "found %lu axbundle(s) requiring load", buf, 0xCu);
    }

    AXLogLoading();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    if (v14)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v53;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v53 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v19);
            AXLogLoading();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v20;
              _os_log_debug_impl(&dword_18EBEC000, v21, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
            }

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        }
        while (v17);
      }

      v2 = v39;
    }
  }
  v22 = dispatch_group_create();
  -[dispatch_object_t _validDidLoadAccessibilityCodeItemBlock](v2, "_validDidLoadAccessibilityCodeItemBlock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = dispatch_queue_create("AXBundleLoadQueue", 0);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v25 = v10;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        dispatch_group_enter(v22);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_46;
        v45[3] = &unk_1E28C36C8;
        v47 = v23;
        v46 = v22;
        objc_msgSend(v30, "loadWithStrategy:onQueue:completion:", 0, v24, v45);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v27);
  }

  -[dispatch_object_t _validLoadEventDidOccurBlock](v39, "_validLoadEventDidOccurBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v39[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_49;
  block[3] = &unk_1E28C3718;
  v43 = v31;
  v44 = v37;
  v41 = v25;
  v42 = v39;
  v33 = v25;
  v34 = v31;
  dispatch_group_notify(v22, v32, block);

}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "associatedAccessibilityCodeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isLoaded") & 1) == 0 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
  {
    objc_msgSend(v4, "excludedProcesses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "excludedProcesses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if (v10)
      {
        AXLogLoading();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v12;
          _os_log_impl(&dword_18EBEC000, v11, OS_LOG_TYPE_INFO, "Not loading ax bundle '%@' because its listed as an excluded bundle", (uint8_t *)&v15, 0xCu);

        }
        goto LABEL_9;
      }

    }
    v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
LABEL_9:
  v13 = 0;
LABEL_10:

  return v13;
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_40(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedAccessibilityCodeItem");
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "loadOrder");
  if (v6 <= objc_msgSend(v5, "loadOrder"))
  {
    v8 = objc_msgSend(v4, "loadOrder");
    v7 = v8 < objc_msgSend(v5, "loadOrder");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_46(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, id, uint64_t, id, _QWORD *);
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_47;
  v13[3] = &unk_1E28C2DD8;
  v14 = v8;
  v15 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v10 = *(void (**)(uint64_t, id, uint64_t, id, _QWORD *))(v9 + 16);
  v11 = v7;
  v12 = v8;
  v10(v9, v11, a3, v12, v13);

}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_47(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    AXLogLoading();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_47_cold_1(a1, v2, v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_50;
  v7[3] = &unk_1E28C36F0;
  v5 = *(_QWORD *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = v5;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4, v7);
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_50(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_QWORD *)(a1 + 40))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 1;
  if (AXShouldLogValidationErrors())
  {
    AXLogLoading();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_18EBEC000, v2, OS_LOG_TYPE_INFO, "Finished loading ax code items", v3, 2u);
    }

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)queryAccessibilityBundleIsLoadedWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AXCodeLoader_queryAccessibilityBundleIsLoadedWithName_completion___block_invoke;
  block[3] = &unk_1E28C3740;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __68__AXCodeLoader_queryAccessibilityBundleIsLoadedWithName_completion___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1[4] + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "name", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if ((v9 & 1) != 0)
        {
          (*(void (**)(_QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], objc_msgSend(v7, "isLoaded"), objc_msgSend(v7, "loadedAtTimestamp"));

          return;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)imageMonitor:(id)a3 didAddImage:(id)a4
{
  id v5;
  AXCodeItem *v6;

  v5 = a4;
  v6 = -[AXCodeItem initWithPath:isDyldOpened:]([AXCodeItem alloc], "initWithPath:isDyldOpened:", v5, 1);

  if (!-[AXCodeItem isAccessibilityBundle](v6, "isAccessibilityBundle"))
    ++self->_monitoredLoadTriggeringImageCountSinceLastLoad;
  -[AXCodeLoader _addTrackedCodeItem:](self, "_addTrackedCodeItem:", v6);
  -[AXCodeLoader _scheduleDyldImageActivityTimerWithDelay:](self, "_scheduleDyldImageActivityTimerWithDelay:", 0.3);

}

- (void)iterateInitialImageListForImageMonitor:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  -[AXCodeLoader loadedCodeItemsUsingTrackedItemsIfAvailable:](self, "loadedCodeItemsUsingTrackedItemsIfAvailable:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AXCodeLoader_iterateInitialImageListForImageMonitor___block_invoke;
  v7[3] = &unk_1E28C2E80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __55__AXCodeLoader_iterateInitialImageListForImageMonitor___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions");
  return objc_msgSend(*(id *)(a1 + 32), "_consumeBeginTrackingCompletionHandlerIfNeeded");
}

- (int64_t)trackingMode
{
  return self->_trackingMode;
}

- (void)setTrackingMode:(int64_t)a3
{
  self->_trackingMode = a3;
}

- (BOOL)shouldAutoloadAccessibilityCodeItems
{
  return self->_shouldAutoloadAccessibilityCodeItems;
}

- (void)setShouldAutoloadAccessibilityCodeItems:(BOOL)a3
{
  self->_shouldAutoloadAccessibilityCodeItems = a3;
}

- (id)shouldLoadAccessibilityCodeItemBlock
{
  return self->_shouldLoadAccessibilityCodeItemBlock;
}

- (void)setShouldLoadAccessibilityCodeItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)didLoadAccessibilityCodeItemBlock
{
  return self->_didLoadAccessibilityCodeItemBlock;
}

- (void)setDidLoadAccessibilityCodeItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)loadEventWillOccurBlock
{
  return self->_loadEventWillOccurBlock;
}

- (void)setLoadEventWillOccurBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)loadEventDidOccurBlock
{
  return self->_loadEventDidOccurBlock;
}

- (void)setLoadEventDidOccurBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadEventDidOccurBlock, 0);
  objc_storeStrong(&self->_loadEventWillOccurBlock, 0);
  objc_storeStrong(&self->_didLoadAccessibilityCodeItemBlock, 0);
  objc_storeStrong(&self->_shouldLoadAccessibilityCodeItemBlock, 0);
  objc_storeStrong((id *)&self->_currentPlatformKey, 0);
  objc_storeStrong((id *)&self->_beginTrackingCompletionQueue, 0);
  objc_storeStrong(&self->_beginTrackingCompletion, 0);
  objc_storeStrong((id *)&self->_codeItemsByNameType, 0);
  objc_storeStrong((id *)&self->_accessibilityCodeItems, 0);
  objc_storeStrong((id *)&self->_trackedCodeItems, 0);
  objc_storeStrong((id *)&self->_dyldImageActivityCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_loadAccessibilityCodeItemsSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageMonitor, 0);
}

- (id)recomputedCodeItemsForAllFrameworks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB34D0], "allFrameworks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ax_filteredSetUsingBlock:", &__block_literal_global_204);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ax_flatMappedSetUsingBlock:", &__block_literal_global_206);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __69__AXCodeLoader_ExtendedCodeInfo__recomputedCodeItemsForAllFrameworks__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "bundlePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

AXCodeItem *__69__AXCodeLoader_ExtendedCodeInfo__recomputedCodeItemsForAllFrameworks__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  AXCodeItem *v3;
  void *v4;
  AXCodeItem *v5;

  v2 = a2;
  v3 = [AXCodeItem alloc];
  objc_msgSend(v2, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AXCodeItem initWithPath:isDyldOpened:](v3, "initWithPath:isDyldOpened:", v4, 1);
  return v5;
}

- (id)recomputedCodeItemsForLoadedAccessibilityBundles
{
  void *v2;
  void *v3;

  -[AXCodeLoader loadedCodeItemsUsingTrackedItemsIfAvailable:](self, "loadedCodeItemsUsingTrackedItemsIfAvailable:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredSetUsingBlock:", &__block_literal_global_207);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__AXCodeLoader_ExtendedCodeInfo__recomputedCodeItemsForLoadedAccessibilityBundles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityBundle");
}

- (id)accessibilityCodeItemDefinitions
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AXCodeLoader_ExtendedCodeInfo__accessibilityCodeItemDefinitions__block_invoke;
  v5[3] = &unk_1E28C34F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__AXCodeLoader_ExtendedCodeInfo__accessibilityCodeItemDefinitions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_updateAccessibilityCodeItemDefinitionsIfNeeded");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_stateDescForItem:(id)a3
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  if (objc_msgSend(v4, "isAccessibilityBundle"))
    v5 = CFSTR("AX-BUNDLE ");
  else
    v5 = &stru_1E28C88D8;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugCodeTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isLoaded");
  v9 = CFSTR("[LOADED]");
  if (!v8)
    v9 = &stru_1E28C88D8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@.%@ <%p> %@"), v5, v6, v7, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)logLoaderState
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AXCodeLoader_ExtendedCodeInfo__logLoaderState__block_invoke;
  block[3] = &unk_1E28C1C88;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__AXCodeLoader_ExtendedCodeInfo__logLoaderState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EBEC000, v2, OS_LOG_TYPE_DEFAULT, "AXCodeLoader State:", buf, 2u);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v8, "associatedAccessibilityCodeItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "targetCodeItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        AXLogLoading();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "_stateDescForItem:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v12;
          _os_log_impl(&dword_18EBEC000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

        }
        if (v9)
        {
          AXLogLoading();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "_stateDescForItem:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v38 = v14;
            _os_log_impl(&dword_18EBEC000, v13, OS_LOG_TYPE_DEFAULT, "  -> %@", buf, 0xCu);

          }
        }
        if (objc_msgSend(v8, "isAccessibilityBundle"))
          v15 = v10 == 0;
        else
          v15 = 0;
        if (v15)
          objc_msgSend(v27, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v27, "count"))
  {
    AXLogLoading();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EBEC000, v16, OS_LOG_TYPE_DEFAULT, "-------------------------------------------------", buf, 2u);
    }

    AXLogLoading();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EBEC000, v17, OS_LOG_TYPE_DEFAULT, "\nWARNING: The following AX Bundles are loaded but\nwere not in our definitions! This means the old\nloader knows how to load some bundles that we do\nnot, and we have more compile-time work to do", buf, 2u);
    }

    AXLogLoading();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EBEC000, v18, OS_LOG_TYPE_DEFAULT, "--------------------------------------------", buf, 2u);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v27;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          AXLogLoading();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "_stateDescForItem:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v38 = v26;
            _os_log_impl(&dword_18EBEC000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v21);
    }

  }
}

- (id)trackedCodeItems
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AXCodeLoader_ExtendedCodeInfo__trackedCodeItems__block_invoke;
  v5[3] = &unk_1E28C32B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__AXCodeLoader_ExtendedCodeInfo__trackedCodeItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)rogueAccessibilityCodeItems
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__AXCodeLoader_ExtendedCodeInfo__rogueAccessibilityCodeItems__block_invoke;
  v5[3] = &unk_1E28C34F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__AXCodeLoader_ExtendedCodeInfo__rogueAccessibilityCodeItems__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "targetCodeItem", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isAccessibilityBundle"))
          v10 = v9 == 0;
        else
          v10 = 0;
        if (v10)
          objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v2;

}

- (void)beginTrackingLoadedCodeItemsWithMode:(os_log_t)log completion:targetQueue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18EBEC000, log, OS_LOG_TYPE_FAULT, "Begin tracking with AXCodeLoaderTrackingModeDisabled is invalid", v1, 2u);
}

- (void)_associateAccessibilityCodeItemWithLoadedCodeItem:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EBEC000, log, OS_LOG_TYPE_ERROR, "Trying to associate an axBundle code with another axBundle makes no sense!", v1, 2u);
}

- (void)_createAccessibilityCodeItemsFromBundleMapURLs:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  *v3 = 136315138;
  *v2 = v5;
  OUTLINED_FUNCTION_0_1(&dword_18EBEC000, v6, v7, "No code items decoded from URL %s");

  OUTLINED_FUNCTION_2_0();
}

- (void)_createAccessibilityCodeItemsFromBundleMapURLs:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "ax_nonRedundantDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_18EBEC000, v5, v6, "  %@");

  OUTLINED_FUNCTION_2_0();
}

- (void)_createAccessibilityCodeItemsFromBundleMapURLs:(uint64_t)a1 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "count");
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_18EBEC000, v5, v6, "(%lu) Decoding errors found with axbundlemap:");
  OUTLINED_FUNCTION_2_0();
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_47_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_18EBEC000, log, OS_LOG_TYPE_ERROR, "Failed to load item %@. error: %@", (uint8_t *)&v5, 0x16u);
}

@end
