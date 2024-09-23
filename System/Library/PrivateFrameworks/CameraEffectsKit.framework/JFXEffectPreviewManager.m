@implementation JFXEffectPreviewManager

- (JFXEffectPreviewManager)initWithName:(id)a3 callbackQueue:(id)a4
{
  id v6;
  JFXEffectPreviewManager *v7;
  JFXEffectPreviewManager *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *previewQueue;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *synchronizationQueue;
  JFXLRUCache *v17;
  JFXLRUCache *previewCache;
  JFXEffectPreviewDiskCache *v19;
  JFXEffectPreviewDiskCache *previewDiskCache;
  dispatch_semaphore_t v21;
  OS_dispatch_semaphore *concurrentStaticPreviewSemaphore;
  uint64_t v23;
  NSObject *pickerPreviewingToken;
  uint64_t v25;
  NSMutableSet *effectsPreparingForPreview;
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)JFXEffectPreviewManager;
  v7 = -[JFXEffectPreviewManager init](&v28, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_name, a3);
    v8->_inDealloc = 0;
    objc_storeStrong((id *)&v8->_callbackQueue, MEMORY[0x24BDAC9B8]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EffectPreviewManager.%@.previewQ"), v6);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), v10);
    previewQueue = v8->_previewQueue;
    v8->_previewQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EffectPreviewManager.%@.synchronization"), v6);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    synchronizationQueue = v8->_synchronizationQueue;
    v8->_synchronizationQueue = (OS_dispatch_queue *)v15;

    v17 = -[JFXLRUCache initWithCapacity:]([JFXLRUCache alloc], "initWithCapacity:", 20);
    previewCache = v8->_previewCache;
    v8->_previewCache = v17;

    v19 = -[JFXEffectPreviewDiskCache initWithDirectory:]([JFXEffectPreviewDiskCache alloc], "initWithDirectory:", v6);
    previewDiskCache = v8->_previewDiskCache;
    v8->_previewDiskCache = v19;

    v21 = dispatch_semaphore_create(2);
    concurrentStaticPreviewSemaphore = v8->_concurrentStaticPreviewSemaphore;
    v8->_concurrentStaticPreviewSemaphore = (OS_dispatch_semaphore *)v21;

    v23 = objc_opt_new();
    pickerPreviewingToken = v8->_pickerPreviewingToken;
    v8->_pickerPreviewingToken = v23;

    v25 = objc_opt_new();
    effectsPreparingForPreview = v8->_effectsPreparingForPreview;
    v8->_effectsPreparingForPreview = (NSMutableSet *)v25;

    if (initWithName_callbackQueue__onceToken != -1)
      dispatch_once(&initWithName_callbackQueue__onceToken, &__block_literal_global_65);

  }
  return v8;
}

uint64_t __54__JFXEffectPreviewManager_initWithName_callbackQueue___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)s_renderResourceLoadingOperationsQueue;
  s_renderResourceLoadingOperationsQueue = v0;

  objc_msgSend((id)s_renderResourceLoadingOperationsQueue, "setMaxConcurrentOperationCount:", 2);
  objc_msgSend((id)s_renderResourceLoadingOperationsQueue, "setQualityOfService:", 25);
  return objc_msgSend((id)s_renderResourceLoadingOperationsQueue, "setName:", CFSTR("renderResourceLoadingOperationsQueue"));
}

- (void)dealloc
{
  objc_super v3;

  self->_inDealloc = 1;
  -[JFXEffectPreviewManager JFX_stopCachingPreviewsContinuously](self, "JFX_stopCachingPreviewsContinuously");
  -[JFXEffectPreviewManager JFX_cancelAssetRequestForAllEffects](self, "JFX_cancelAssetRequestForAllEffects");
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectPreviewManager;
  -[JFXEffectPreviewManager dealloc](&v3, sel_dealloc);
}

- (void)JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:(id)a3
{
  NSObject *v4;
  const char *label;
  const char *v6;
  NSObject *v7;
  void (**block)(void);

  block = (void (**)(void))a3;
  -[JFXEffectPreviewManager callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  label = dispatch_queue_get_label(v4);
  v6 = dispatch_queue_get_label(0);

  if (label == v6)
  {
    block[2]();
  }
  else
  {
    -[JFXEffectPreviewManager callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, block);

  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__JFXEffectPreviewManager_setDelegate___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __39__JFXEffectPreviewManager_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_opt_respondsToSelector() & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_opt_respondsToSelector() & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = objc_opt_respondsToSelector() & 1;
  result = objc_opt_respondsToSelector();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = result & 1;
  return result;
}

- (JFXEffectPreviewManagerDelegate)delegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  v12 = 0;
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__JFXEffectPreviewManager_delegate__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (JFXEffectPreviewManagerDelegate *)v4;
}

void __35__JFXEffectPreviewManager_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)JFX_delegateUpdateContinousPreviewsForEffectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke;
  v7[3] = &unk_24EE5ACA0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[6];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke_2;
    block[3] = &unk_24EE585C0;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v3;
    v7 = v5;
    dispatch_async(v4, block);

  }
}

void __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  objc_msgSend(WeakRetained, "effectPreviewManager:didUpdateContinousPreviewsForEffectIDs:", a1[5], a1[6]);

}

- (void)JFX_delegateWillBeginDownloadingPreviewAssetsForEffect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke;
  v7[3] = &unk_24EE5ACA0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[6];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9))
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke_2;
    block[3] = &unk_24EE585C0;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v3;
    v7 = v5;
    dispatch_async(v4, block);

  }
}

void __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  objc_msgSend(WeakRetained, "effectPreviewManager:willBeginDownloadingPreviewAssetsForEffect:", a1[5], a1[6]);

}

- (void)JFX_delegateDownloadingPreviewAssetsForEffect:(id)a3 progress:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke;
  block[3] = &unk_24EE5BD08;
  objc_copyWeak(v11, &location);
  block[4] = self;
  v10 = v6;
  v11[1] = *(id *)&a4;
  v8 = v6;
  dispatch_sync(v7, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[6];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke_2;
    v6[3] = &unk_24EE57B38;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = v3;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 56);
    dispatch_async(v4, v6);

  }
}

void __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "effectPreviewManager:downloadingPreviewAssetsForEffect:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));

}

- (void)JFX_delegateDidFinishDownloadingPreviewAssetsForEffect:(id)a3 wasCancelled:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke;
  v13[3] = &unk_24EE5BD58;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  v14 = v8;
  v17 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[6];
  id v7;
  id v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke_2;
    block[3] = &unk_24EE5BD30;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v3;
    v7 = v5;
    v9 = *(_BYTE *)(a1 + 64);
    v8 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
}

void __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "effectPreviewManager:didFinishDownloadingPreviewAssetsForEffect:wasCancelled:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)setContinousPreviewEffects:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__JFXEffectPreviewManager_setContinousPreviewEffects___block_invoke;
  block[3] = &unk_24EE59890;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__JFXEffectPreviewManager_setContinousPreviewEffects___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "JFX_setContinousPreviewEffects:", *(_QWORD *)(a1 + 32));

}

- (void)JFX_setContinousPreviewEffects:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[JFXEffectPreviewManager setCurrentContinousPreviewEffects:](self, "setCurrentContinousPreviewEffects:", v4);
  -[JFXEffectPreviewManager continousPreviewOptions](self, "continousPreviewOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectsToApplyToBackground");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isNone") ^ 1;

  }
  else
  {
    v9 = 0;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((v9 & 1) != 0 || (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "isNone", (_QWORD)v16) & 1) == 0)
          -[JFXEffectPreviewManager JFX_prepareEffectForContinousPreview:](self, "JFX_prepareEffectForContinousPreview:", v15, (_QWORD)v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  -[JFXEffectPreviewManager JFX_updateAssetRequestsPriorityAssociatedWithEffects:toPriority:](self, "JFX_updateAssetRequestsPriorityAssociatedWithEffects:toPriority:", v10, 1);
  -[JFXEffectPreviewManager JFX_updateAssetRequestsPriorityNotAssociatedWithEffects:toPriority:](self, "JFX_updateAssetRequestsPriorityNotAssociatedWithEffects:toPriority:", v10, 3);

}

- (NSSet)continousPreviewEffects
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  v12 = 0;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__JFXEffectPreviewManager_continousPreviewEffects__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __50__JFXEffectPreviewManager_continousPreviewEffects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "currentContinousPreviewEffects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isContinouslyPreviewing
{
  JFXEffectPreviewManager *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__JFXEffectPreviewManager_isContinouslyPreviewing__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__JFXEffectPreviewManager_isContinouslyPreviewing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 13);
  return result;
}

- (void)setContinouslyPreviewing:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__JFXEffectPreviewManager_setContinouslyPreviewing___block_invoke;
  v6[3] = &unk_24EE57C98;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __52__JFXEffectPreviewManager_setContinouslyPreviewing___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 13) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDefaultPreviewImage:(id)a3 transformValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__JFXEffectPreviewManager_setDefaultPreviewImage_transformValue___block_invoke;
  block[3] = &unk_24EE585C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __65__JFXEffectPreviewManager_setDefaultPreviewImage_transformValue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 48));
}

- (id)defaultPreviewImage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  v12 = 0;
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__JFXEffectPreviewManager_defaultPreviewImage__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__JFXEffectPreviewManager_defaultPreviewImage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (id)defaultPreviewImageDisplayTransformValue
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  v12 = 0;
  -[JFXEffectPreviewManager synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__JFXEffectPreviewManager_defaultPreviewImageDisplayTransformValue__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__JFXEffectPreviewManager_defaultPreviewImageDisplayTransformValue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)JFX_loadRenderingResourcesForEffect:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v5, "renderEffectResourcesAreReady"))
  {
    v6[2](v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1478];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__JFXEffectPreviewManager_JFX_loadRenderingResourcesForEffect_completion___block_invoke;
    v9[3] = &unk_24EE57B60;
    v10 = v5;
    objc_msgSend(v7, "blockOperationWithBlock:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompletionBlock:", v6);
    objc_msgSend((id)s_renderResourceLoadingOperationsQueue, "addOperation:", v8);

  }
}

uint64_t __74__JFXEffectPreviewManager_JFX_loadRenderingResourcesForEffect_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadRenderEffect");
}

- (void)JFX_configureCommonRenderingPropertiesForEffect:(id)a3 forPreviewSize:(CGSize)a4 withPreviewOptions:(id)a5
{
  double height;
  double width;
  NSObject *v8;
  id v9;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v9, "setRenderSize:", width, height);
}

- (void)JFX_requestPreviewAssetsForEffect:(id)a3 withPriority:(int64_t)a4 onlyThumbnailAssetWhenAvailable:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(id *, void *, char, void *);
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (objc_msgSend(v10, "arePreviewingAssetsLocal"))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setContentType:", 1);
    objc_msgSend(v13, "setUsageMode:", 1);
    objc_msgSend(v13, "setFilteringMode:", 1);
    objc_msgSend(v10, "localAssetsWithFilteringOptions:", v13);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v18, "attributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "contentType") == 1 && objc_msgSend(v19, "usageMode") == 1)
          {
            objc_msgSend(v18, "localURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }

        }
        v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_16:

    (*((void (**)(id, _QWORD, void *, _QWORD))v11 + 2))(v11, 0, v15, 0);
  }
  else
  {
    -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffectPreviewManager setAssetRequestsForPreviewEffects:](self, "setAssetRequestsForPreviewEffects:", v21);

    }
    -[JFXEffectPreviewManager JFX_delegateWillBeginDownloadingPreviewAssetsForEffect:](self, "JFX_delegateWillBeginDownloadingPreviewAssetsForEffect:", v10);
    objc_initWeak(&location, self);
    v22 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke;
    v34[3] = &unk_24EE5BD80;
    objc_copyWeak(&v36, &location);
    v23 = v10;
    v35 = v23;
    v27 = v22;
    v28 = 3221225472;
    v29 = __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_2;
    v30 = &unk_24EE5BDD0;
    objc_copyWeak(&v33, &location);
    v32 = v11;
    v24 = v23;
    v31 = v24;
    objc_msgSend(v24, "requestPreviewingAssetsWithPriority:onlyThumbnailAssetWhenAvailable:progressHandler:completionHandler:", a4, v7, v34, &v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects", v27, v28, v29, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v25, v24);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

}

void __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "JFX_delegateDownloadingPreviewAssetsForEffect:progress:", *(_QWORD *)(a1 + 32), a2);

}

void __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_2(id *a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id location;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    objc_msgSend(WeakRetained, "previewQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_3;
    block[3] = &unk_24EE5BDA8;
    objc_copyWeak(&v16, &location);
    v12 = a1[4];
    v17 = a3;
    v15 = a1[5];
    v13 = v8;
    v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void (*v5)(void);
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "assetRequestsForPreviewEffects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    if (*(_BYTE *)(a1 + 72))
    {
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (!*(_QWORD *)(a1 + 40))
      {
        v14 = 0u;
        v15 = 0u;
        v12 = 0u;
        v13 = 0u;
        v6 = *(id *)(a1 + 48);
        v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v13;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v13 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v10, "attributes", (_QWORD)v12);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "contentType") == 1 && objc_msgSend(v11, "usageMode") == 1)
              {
                objc_msgSend(v10, "localURL");
                v7 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_20;
              }

            }
            v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_20:

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        goto LABEL_7;
      }
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v5();
LABEL_7:
    objc_msgSend(v3, "JFX_delegateDidFinishDownloadingPreviewAssetsForEffect:wasCancelled:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), (_QWORD)v12);
  }

}

- (void)JFX_updateAssetRequestsPriorityAssociatedWithEffects:(id)a3 toPriority:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v11, "updatePriorityForAssetRequest:newPriority:", v13, a4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)JFX_updateAssetRequestsPriorityNotAssociatedWithEffects:(id)a3 toPriority:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMapTable *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCEF0];
    -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects");
    v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    NSAllMapTableKeys(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "minusSet:", v6);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
          -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "updatePriorityForAssetRequest:newPriority:", v21, a4);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

  }
}

- (void)JFX_cancelAssetRequestForAllEffects
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!self->_inDealloc)
  {
    -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[JFXEffectPreviewManager assetRequestsForPreviewEffects](self, "assetRequestsForPreviewEffects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "cancelAssetRequest:", v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[JFXEffectPreviewManager setAssetRequestsForPreviewEffects:](self, "setAssetRequestsForPreviewEffects:", 0);
}

- (void)startPreparingPreviewsContinuouslyAtSize:(CGSize)a3 options:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11[3];
  id location;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (!-[JFXEffectPreviewManager isContinouslyPreviewing](self, "isContinouslyPreviewing"))
  {
    -[JFXEffectPreviewManager setContinouslyPreviewing:](self, "setContinouslyPreviewing:", 1);
    objc_initWeak(&location, self);
    -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__JFXEffectPreviewManager_startPreparingPreviewsContinuouslyAtSize_options___block_invoke;
    block[3] = &unk_24EE5BDF8;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&width;
    v11[2] = *(id *)&height;
    v10 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __76__JFXEffectPreviewManager_startPreparingPreviewsContinuouslyAtSize_options___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "JFX_startPreparingPreviewsContinuouslyAtSize:options:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

- (void)JFX_startPreparingPreviewsContinuouslyAtSize:(CGSize)a3 options:(id)a4
{
  double height;
  double width;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD block[4];
  id v58;
  id v59;
  id location;
  uint64_t v61;
  _QWORD v62[2];

  height = a3.height;
  width = a3.width;
  v62[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[JFXEffectPreviewManager previewCache](self, "previewCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCapacity:", 0);

  -[JFXEffectPreviewManager setContinousPreviewSize:](self, "setContinousPreviewSize:", width, height);
  v10 = (void *)objc_msgSend(v7, "copy");
  -[JFXEffectPreviewManager setContinousPreviewOptions:](self, "setContinousPreviewOptions:", v10);

  v61 = *MEMORY[0x24BE79640];
  -[JFXEffectPreviewManager continousPreviewOptions](self, "continousPreviewOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "outputColorSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79078]), "initWithOptions:delegate:", v13, self);
  -[JFXEffectPreviewManager setContinousPreviewPlayer:](self, "setContinousPreviewPlayer:", v14);

  -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectPreviewManager continousPreviewOptions](self, "continousPreviewOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setQueueSize:", objc_msgSend(v16, "maxFramesRenderedAtATime"));

  -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD17C8];
  -[JFXEffectPreviewManager name](self, "name");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("PreviewManagerPVPlayer_%@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setName:", v20);

  -[JFXEffectPreviewManager continousPreviewOptions](self, "continousPreviewOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v21, "parentCode") == -1;

  if ((v19 & 1) == 0)
  {
    -[JFXEffectPreviewManager continousPreviewOptions](self, "continousPreviewOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "parentCode");
    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setParentCode:", v23);

  }
  v25 = (void *)objc_opt_new();
  -[JFXEffectPreviewManager setPreparedContinousPreviewEffects:](self, "setPreparedContinousPreviewEffects:", v25);

  v26 = objc_msgSend(v7, "backgroundType");
  if (!v26)
  {
    v30 = v7;
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79080]), "initWithCADisplayLinkFPS:", objc_msgSend(v30, "preferredUpdatesPerSecond"));
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__JFXEffectPreviewManager_JFX_startPreparingPreviewsContinuouslyAtSize_options___block_invoke;
    block[3] = &unk_24EE59890;
    objc_copyWeak(&v59, &location);
    v31 = v41;
    v58 = v31;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v42 = objc_alloc_init(MEMORY[0x24BE790A0]);
    CreatePVLPThrottlingControlParameters();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setThermalLevel:controlParameters:", 0, v43);

    CreatePVLPThrottlingControlParameters();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setThermalLevel:controlParameters:", 10, v44);

    CreatePVLPThrottlingControlParameters();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setThermalLevel:controlParameters:", 20, v45);

    CreatePVLPThrottlingControlParameters();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setThermalLevel:controlParameters:", 30, v46);

    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setThermalThrottlingPolicy:", v42);

    objc_msgSend(v30, "backgroundImage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      v50 = v48;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "JFX_createTransparentEmptyImageForPreviewSize:", width, height);
      v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    v51 = v50;

    v52 = objc_alloc(MEMORY[0x24BE79098]);
    objc_msgSend(v51, "pvImageBuffer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v52, "initWithPVImageBuffer:", v53);

    -[JFXEffectPreviewManager setDefaultPreviewImage:transformValue:](self, "setDefaultPreviewImage:transformValue:", v51, 0);
    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setSource:inputID:", v54, 0);

    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "start");

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  if (v26 == 1)
  {
    +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectPreviewManager pickerPreviewingToken](self, "pickerPreviewingToken");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerPickerAsPreviewingWithObject:", v28);

    +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pickerSource");
    v30 = (id)objc_claimAutoreleasedReturnValue();

    v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE79088]), "initWithPlayerCameraSource:", v30);
    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSource:inputID:", v30, 0);

    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRenderLink:", v31);

    v34 = objc_alloc_init(MEMORY[0x24BE790A0]);
    CreatePVLPThrottlingControlParameters();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setThermalLevel:controlParameters:", 0, v35);

    CreatePVLPThrottlingControlParameters();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setThermalLevel:controlParameters:", 10, v36);

    CreatePVLPThrottlingControlParameters();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setThermalLevel:controlParameters:", 20, v37);

    CreatePVLPThrottlingControlParameters();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setThermalLevel:controlParameters:", 30, v38);

    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setThermalThrottlingPolicy:", v34);

    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "start");

LABEL_10:
  }

}

void __80__JFXEffectPreviewManager_JFX_startPreparingPreviewsContinuouslyAtSize_options___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "continousPreviewPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRenderLink:", *(_QWORD *)(a1 + 32));

}

+ (id)JFX_createTransparentEmptyImageForPreviewSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(v5, "setPreferredRange:", 2);
  objc_msgSend(v5, "setScale:", 1.0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithBounds:format:", v5, 0.0, 0.0, width, height);
  objc_msgSend(v6, "imageWithActions:", &__block_literal_global_54_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[JTImage jtImageWithUIImage:](JTImage, "jtImageWithUIImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)JFX_prepareEffectForContinousPreview:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[JFXEffectPreviewManager preparedContinousPreviewEffects](self, "preparedContinousPreviewEffects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v4))
  {

  }
  else
  {
    -[JFXEffectPreviewManager effectsPreparingForPreview](self, "effectsPreparingForPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) == 0)
    {
      -[JFXEffectPreviewManager effectsPreparingForPreview](self, "effectsPreparingForPreview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

      objc_initWeak(&location, self);
      v10 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke;
      v18[3] = &unk_24EE59890;
      objc_copyWeak(&v20, &location);
      v11 = v4;
      v19 = v11;
      v12 = (void *)MEMORY[0x2276A1F6C](v18);
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_2;
      v14[3] = &unk_24EE5BE88;
      objc_copyWeak(&v17, &location);
      v13 = v12;
      v16 = v13;
      v15 = v11;
      -[JFXEffectPreviewManager JFX_requestPreviewAssetsForEffect:withPriority:onlyThumbnailAssetWhenAvailable:completion:](self, "JFX_requestPreviewAssetsForEffect:withPriority:onlyThumbnailAssetWhenAvailable:completion:", v15, 1, 0, v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "effectsPreparingForPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_2(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v10 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "isContinouslyPreviewing") & 1) != 0
    && (objc_msgSend(v10, "previewQueue"),
        v11 = objc_claimAutoreleasedReturnValue(),
        dispatch_assert_queue_V2(v11),
        v11,
        !a2))
  {
    v12 = a1[4];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_3;
    v13[3] = &unk_24EE5BE60;
    objc_copyWeak(&v16, a1 + 6);
    v15 = a1[5];
    v14 = a1[4];
    objc_msgSend(v10, "JFX_loadRenderingResourcesForEffect:completion:", v12, v13);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_3(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "previewQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_4;
    block[3] = &unk_24EE5BE60;
    objc_copyWeak(&v9, v2);
    v8 = a1[5];
    v7 = a1[4];
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, double, double);
  void *v14;
  CMTimeRange v15;
  CMTimeRange v16;
  CMTime duration;
  CMTime start;
  CMTimeRange v19;
  CMTime v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isContinouslyPreviewing") & 1) != 0)
  {
    objc_msgSend(v3, "continousPreviewOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    memset(&v20, 0, sizeof(v20));
    if (v4)
      objc_msgSend(v4, "effectAnimationDuration");
    memset(&v19, 0, sizeof(v19));
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    duration = v20;
    CMTimeRangeMake(&v19, &start, &duration);
    v6 = v20.flags & 1;
    objc_msgSend(*(id *)(a1 + 32), "setForceRenderAtPosterFrame:", (v20.flags & 1) == 0);
    objc_msgSend(*(id *)(a1 + 32), "setBuildInAnimation:", v6);
    v16 = v19;
    objc_msgSend(*(id *)(a1 + 32), "renderEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    objc_msgSend(v7, "setEffectRange:", &v15);

    objc_msgSend(v3, "continousPreviewSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "JFX_configureCommonRenderingPropertiesForEffect:forPreviewSize:withPreviewOptions:", *(_QWORD *)(a1 + 32), v5);
    objc_msgSend(v5, "renderPropertiesConfigurationBlock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v5, "renderPropertiesConfigurationBlock");
      v13 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
      v13[2](v13, *(_QWORD *)(a1 + 32), v9, v11);

    }
    objc_msgSend(v3, "preparedContinousPreviewEffects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)continousPreviewsForEffectIDs:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD block[4];
  id v23;
  id v24;

  v5 = a3;
  v19 = a4;
  if (continousPreviewsForEffectIDs_completion__onceToken != -1)
    dispatch_once(&continousPreviewsForEffectIDs_completion__onceToken, &__block_literal_global_57);
  -[JFXEffectPreviewManager previewCache](self, "previewCache", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsForKeys:notFoundMarker:", v5, continousPreviewsForEffectIDs_completion__s_missingImageMarker);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v8);
  v10 = 0;
  if (v8)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)continousPreviewsForEffectIDs_completion__s_missingImageMarker)
        break;
      if (v13)
        goto LABEL_7;
LABEL_8:

      if (v8 == ++v11)
        goto LABEL_14;
    }
    if ((v12 & 1) == 0)
    {
      -[JFXEffectPreviewManager defaultPreviewImage](self, "defaultPreviewImage");
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v15;
    }
    v10 = v10;

    v12 = 1;
    v13 = v10;
    if (!v10)
      goto LABEL_8;
LABEL_7:
    objc_msgSend(v9, "setObject:forKey:", v13, v14);
    goto LABEL_8;
  }
LABEL_14:
  -[JFXEffectPreviewManager callbackQueue](self, "callbackQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__JFXEffectPreviewManager_continousPreviewsForEffectIDs_completion___block_invoke_2;
  block[3] = &unk_24EE58FF0;
  v23 = v9;
  v24 = v20;
  v17 = v9;
  v18 = v20;
  dispatch_async(v16, block);

}

void __68__JFXEffectPreviewManager_continousPreviewsForEffectIDs_completion___block_invoke()
{
  JTImage *v0;
  void *v1;

  v0 = objc_alloc_init(JTImage);
  v1 = (void *)continousPreviewsForEffectIDs_completion__s_missingImageMarker;
  continousPreviewsForEffectIDs_completion__s_missingImageMarker = (uint64_t)v0;

}

uint64_t __68__JFXEffectPreviewManager_continousPreviewsForEffectIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)stopCachingPreviewsContinuously
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__JFXEffectPreviewManager_stopCachingPreviewsContinuously__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __58__JFXEffectPreviewManager_stopCachingPreviewsContinuously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_stopCachingPreviewsContinuously");
}

- (void)JFX_stopCachingPreviewsContinuously
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_inDealloc)
  {
    -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  if (-[JFXEffectPreviewManager isContinouslyPreviewing](self, "isContinouslyPreviewing"))
  {
    -[JFXEffectPreviewManager setContinouslyPreviewing:](self, "setContinouslyPreviewing:", 0);
    +[JFXPickerCameraSource sharedInstance](JFXPickerCameraSource, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectPreviewManager pickerPreviewingToken](self, "pickerPreviewingToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterPickerAsPreviewingWithObject:", v5);

    -[JFXEffectPreviewManager previewCache](self, "previewCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCapacity:", 20);

    -[JFXEffectPreviewManager continousPreviewPlayer](self, "continousPreviewPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shutdown");

    -[JFXEffectPreviewManager setContinousPreviewPlayer:](self, "setContinousPreviewPlayer:", 0);
    -[JFXEffectPreviewManager setContinousPreviewOptions:](self, "setContinousPreviewOptions:", 0);
    -[JFXEffectPreviewManager setDefaultPreviewImage:transformValue:](self, "setDefaultPreviewImage:transformValue:", 0, 0);
    -[JFXEffectPreviewManager setPreparedContinousPreviewEffects:](self, "setPreparedContinousPreviewEffects:", 0);
    -[JFXEffectPreviewManager JFX_cancelAssetRequestForAllEffects](self, "JFX_cancelAssetRequestForAllEffects");
  }
}

- (BOOL)JFX_rendersDefaultContinousPreviewImage
{
  void *v2;
  BOOL v3;

  -[JFXEffectPreviewManager continousPreviewOptions](self, "continousPreviewOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundType") == 1;

  return v3;
}

- (BOOL)JFX_lowPriorityScheduling
{
  return 0;
}

- (id)buildRenderRequest:(id)a3 time:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__24;
  v19 = __Block_byref_object_dispose__24;
  v20 = 0;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke;
  v11[3] = &unk_24EE5ACF0;
  v14 = *a4;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  JFXEffectsPreviewGenerationRequest *v28;
  JTImage *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  JFXEffectsPreviewGenerationRequest *v55;
  JFXEffectsPreviewGenerationRequest *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  JFXEffectsPreviewRequestHandler *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _OWORD v73[3];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[5];
  _OWORD v79[3];
  _OWORD time2[3];
  _OWORD time1[2];
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v86 = *(_OWORD *)(a1 + 56);
  v87 = *(_QWORD *)(a1 + 72);
  v83 = 0;
  v84 = 0;
  v85 = 0;
  objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "effectAnimationDuration");
  }
  else
  {
    v83 = 0;
    v84 = 0;
    v85 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loopAnimation");

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", &unk_24EE9C068);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "colorImageBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectsToApplyToBackground");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    time1[0] = *MEMORY[0x24BDBD8B8];
    time1[1] = v14;
    v82 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v7;
    if (objc_msgSend(v15, "backgroundType") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rotateCameraFrameToInterfaceOrientation");

      if (v17)
      {
        +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "cameraPosition");

        +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "captureVideoOrientation");

        v22 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
        objc_msgSend(v7, "size");
        +[JFXRotationTransforms transformFromTopLeftCaptureDevicePivotPosition:captureVideoOrientation:toInterfaceOrientation:size:](JFXRotationTransforms, "transformFromTopLeftCaptureDevicePivotPosition:captureVideoOrientation:toInterfaceOrientation:size:", v19, v21, v22);
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromImageBuffer:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "JFX_rendersDefaultContinousPreviewImage"))
    {
      if (objc_msgSend(v13, "count")
        && (objc_msgSend(v13, "firstObject"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "isNone"),
            v26,
            !v27)
        || (objc_msgSend(v25, "isHDRSpace") & 1) != 0)
      {
        v28 = [JFXEffectsPreviewGenerationRequest alloc];
        time2[0] = kDefaultEffectPreviewRenderTime;
        *(_QWORD *)&time2[1] = 0;
        v29 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v28, "initWithInput:effectStack:outputSize:renderTime:", v7, v13, time2, v9, v11);
        objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "parentCode");

        if (v31 != -1)
        {
          objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[JTImage setParentCode:](v29, "setParentCode:", objc_msgSend(v32, "parentCode"));

        }
        v79[0] = time1[0];
        v79[1] = time1[1];
        v79[2] = v82;
        -[JTImage setUserSourceTransform:](v29, "setUserSourceTransform:", v79);
        -[JTImage centerAnimationInfo](v29, "centerAnimationInfo");
        objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[JTImage setHighQuality:](v29, "setHighQuality:", objc_msgSend(v33, "quality") == 2);

        -[JTImage setPriority:](v29, "setPriority:", objc_msgSend(*(id *)(a1 + 32), "JFX_lowPriorityScheduling") ^ 1);
        objc_msgSend(*(id *)(a1 + 32), "staticPreviewGenerator");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke_2;
        v78[3] = &unk_24EE59A10;
        v78[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v34, "generatePreviewRequest:completionHandler:", v29, v78);

      }
      else
      {
        v35 = *(void **)(a1 + 32);
        v29 = -[JTImage initWithPVImage:]([JTImage alloc], "initWithPVImage:", v7);
        time2[0] = time1[0];
        time2[1] = time1[1];
        time2[2] = v82;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGAffineTransform:", time2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDefaultPreviewImage:transformValue:", v29, v36);

      }
    }
    v72 = v13;
    v70 = v6;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "currentContinousPreviewEffects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v75 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          if (objc_msgSend(v42, "type") == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "delegate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_opt_respondsToSelector();

            if ((v44 & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "delegate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "previewIsHDR");

            }
            else
            {
              v46 = 0;
            }
            objc_msgSend(v42, "setHDR:", objc_msgSend(v25, "isHDRSpace") | v46);
          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      }
      while (v39);
    }

    v47 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(*(id *)(a1 + 32), "currentContinousPreviewEffects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "allObjects");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setWithArray:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "preparedContinousPreviewEffects");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allObjects");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "intersectSet:", v54);
    v55 = [JFXEffectsPreviewGenerationRequest alloc];
    time2[0] = v86;
    *(_QWORD *)&time2[1] = v87;
    v24 = v71;
    v56 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v55, "initWithInput:effectStack:outputSize:renderTime:", v71, v72, time2, v9, v11);
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "backgroundType");

    if (v58 == 1)
    {
      v73[0] = time1[0];
      v73[1] = time1[1];
      v73[2] = v82;
      -[JFXEffectsPreviewGenerationRequest setUserSourceTransform:](v56, "setUserSourceTransform:", v73);
    }
    -[JFXEffectsPreviewGenerationRequest centerAnimationInfo](v56, "centerAnimationInfo");
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "parentCode");

    v6 = v70;
    if (v60 != -1)
    {
      objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffectsPreviewGenerationRequest setParentCode:](v56, "setParentCode:", objc_msgSend(v61, "parentCode"));

    }
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectsPreviewGenerationRequest setHighQuality:](v56, "setHighQuality:", objc_msgSend(v62, "quality") == 2);

    -[JFXEffectsPreviewGenerationRequest setPriority:](v56, "setPriority:", objc_msgSend(*(id *)(a1 + 32), "JFX_lowPriorityScheduling") ^ 1);
    objc_msgSend(v50, "allObjects");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectsPreviewGenerationRequest setPickerPreviewEffectList:](v56, "setPickerPreviewEffectList:", v63);

    v64 = -[JFXEffectsPreviewRequestHandler initWithRequest:]([JFXEffectsPreviewRequestHandler alloc], "initWithRequest:", v56);
    objc_msgSend(*(id *)(a1 + 32), "continousPreviewOptions");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "outputColorSpace");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXEffectsPreviewRequestHandler buildPVRenderRequestWithOutputColorSpace:](v64, "buildPVRenderRequestWithOutputColorSpace:", v66);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v69 = *(void **)(v68 + 40);
    *(_QWORD *)(v68 + 40) = v67;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setUserContext:", v64);
  }
  else
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = 0;
  }

}

void __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  JTImage *v5;
  id v6;

  objc_msgSend(a2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v5 = -[JTImage initWithPVImage:]([JTImage alloc], "initWithPVImage:", v6);
  objc_msgSend(v4, "setDefaultPreviewImage:transformValue:", v5, 0);

}

- (void)renderRequestComplete:(id)a3 results:(id)a4 completedOutOfOrder:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  JTImage *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!a5 && objc_msgSend(v8, "count"))
  {
    -[JFXEffectPreviewManager previewCache](self, "previewCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    v26 = v7;
    objc_msgSend(v7, "userContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    objc_msgSend(v24, "buildCallbackMap:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[JTImage initWithPVImage:]([JTImage alloc], "initWithPVImage:", v19);
          -[JFXEffectPreviewManager previewCache](self, "previewCache");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "effectID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v20, v22);

          objc_msgSend(v18, "effectID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v23);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "addObject:", *MEMORY[0x24BE79298]);
    -[JFXEffectPreviewManager JFX_delegateUpdateContinousPreviewsForEffectIDs:](self, "JFX_delegateUpdateContinousPreviewsForEffectIDs:", v12);

    v9 = v25;
    v7 = v26;
  }

}

- (JFXEffectsPreviewGenerator)staticPreviewGenerator
{
  NSObject *v3;
  JFXEffectsPreviewGenerator *staticPreviewGenerator;
  JFXEffectsPreviewGenerator *v5;
  JFXEffectsPreviewGenerator *v6;
  void *v7;
  void *v8;
  void *v9;

  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  staticPreviewGenerator = self->_staticPreviewGenerator;
  if (!staticPreviewGenerator)
  {
    v5 = objc_alloc_init(JFXEffectsPreviewGenerator);
    v6 = self->_staticPreviewGenerator;
    self->_staticPreviewGenerator = v5;

    -[JFXEffectsPreviewGenerator trackStats:](self->_staticPreviewGenerator, "trackStats:", 0);
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[JFXEffectPreviewManager name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("PreviewManagerStaticPreview_%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectsPreviewGenerator setName:](self->_staticPreviewGenerator, "setName:", v9);

    staticPreviewGenerator = self->_staticPreviewGenerator;
  }
  return staticPreviewGenerator;
}

- (void)preparePreviewForEffect:(id)a3 atSize:(CGSize)a4 options:(id)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  CGFloat v22;
  CGFloat v23;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke;
  v18[3] = &unk_24EE5BF70;
  v18[4] = self;
  v19 = v11;
  v20 = v12;
  v21 = v13;
  v22 = width;
  v23 = height;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  dispatch_async(v14, v18);

}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "effectsPreparingForPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(&location);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(*(id *)(a1 + 48), "dontUseThumbnailAssetWhenAvailable") ^ 1;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_2;
  v8[3] = &unk_24EE5BF48;
  objc_copyWeak(&v13, &location);
  v9 = *(id *)(a1 + 40);
  v7 = v3;
  v10 = v7;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v4, "JFX_requestPreviewAssetsForEffect:withPriority:onlyThumbnailAssetWhenAvailable:completion:", v5, 2, v6, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v10 = WeakRetained;
  if (a2 || !WeakRetained)
  {
    objc_msgSend(WeakRetained, "effectsPreparingForPreview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", *(_QWORD *)(a1 + 32));

    v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_3;
    block[3] = &unk_24EE580C8;
    v34 = *(id *)(a1 + 56);
    dispatch_async(v13, block);

  }
  else if (v7 && (objc_msgSend(*(id *)(a1 + 48), "dontUseThumbnailAssetWhenAvailable") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithContentsOfFile:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[JTImage jtImageWithUIImage:](JTImage, "jtImageWithUIImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 48), "dontCache") & 1) == 0)
    {
      objc_msgSend(v10, "previewCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "effectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v17, v19);

    }
    v20 = *(NSObject **)(a1 + 40);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_4;
    v30[3] = &unk_24EE58FF0;
    v21 = *(id *)(a1 + 56);
    v31 = v17;
    v32 = v21;
    v22 = v17;
    dispatch_async(v20, v30);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_5;
    v23[3] = &unk_24EE5BF20;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    v24 = *(id *)(a1 + 40);
    v27 = *(id *)(a1 + 56);
    v25 = *(id *)(a1 + 32);
    v26 = *(id *)(a1 + 48);
    v29 = *(_OWORD *)(a1 + 72);
    objc_msgSend(v10, "JFX_loadRenderingResourcesForEffect:completion:", v11, v23);

    objc_destroyWeak(&v28);
  }

}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD block[4];
  id v16;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "previewQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_7;
    v8[3] = &unk_24EE5BEF8;
    v6 = &v9;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_copyWeak(&v13, v2);
    v14 = *(_OWORD *)(a1 + 72);
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 56);
    dispatch_async(v5, v8);

    objc_destroyWeak(&v13);
  }
  else
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_6;
    block[3] = &unk_24EE580C8;
    v6 = &v16;
    v16 = *(id *)(a1 + 56);
    dispatch_async(v7, block);
  }

}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "effectWillRenderPreviewWithOptions:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_8;
  v5[3] = &unk_24EE5BED0;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "JFX_renderPreviewForEffect:previewSize:options:completion:", v4, v2, v5, *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_destroyWeak(&v9);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "effectsPreparingForPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 32));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_9;
  block[3] = &unk_24EE58280;
  v9 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_9(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)previewForEffect:(id)a3 atSize:(CGSize)a4 options:(id)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[3];
  id location;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke;
  v17[3] = &unk_24EE5BFC0;
  objc_copyWeak(v21, &location);
  v14 = v13;
  v20 = v14;
  v15 = v11;
  v18 = v15;
  v21[1] = *(id *)&width;
  v21[2] = *(id *)&height;
  v16 = v12;
  v19 = v16;
  -[JFXEffectPreviewManager cachedPreviewForEffect:completion:](self, "cachedPreviewForEffect:completion:", v15, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

void __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (v5 || !WeakRetained || objc_msgSend(WeakRetained, "isContinouslyPreviewing"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke_2;
    v11[3] = &unk_24EE5BF98;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "preparePreviewForEffect:atSize:options:completion:", v9, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
}

uint64_t __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)JFX_renderPreviewForEffect:(id)a3 previewSize:(CGSize)a4 options:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, double, double);
  void *v24;
  BOOL v25;
  JFXEffectsPreviewGenerationRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  JFXEffectsPreviewGenerationRequest *v30;
  JFXEffectsPreviewGenerationRequest *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  __int128 location;
  uint64_t v50;
  _QWORD v51[3];
  __int128 v52;
  __int128 v53;
  _OWORD v54[3];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];

  height = a4.height;
  width = a4.width;
  v58[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[JFXEffectPreviewManager concurrentStaticPreviewSemaphore](self, "concurrentStaticPreviewSemaphore");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v15, v16);

  if (v12)
  {
    objc_msgSend(v12, "renderRange");
  }
  else
  {
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
  }
  objc_msgSend(v11, "renderEffect");
  v17 = objc_claimAutoreleasedReturnValue();
  v54[0] = v55;
  v54[1] = v56;
  v54[2] = v57;
  objc_msgSend((id)v17, "setEffectRange:", v54);

  objc_msgSend(v11, "setForceRenderAtPosterFrame:", 1);
  -[JFXEffectPreviewManager JFX_configureCommonRenderingPropertiesForEffect:forPreviewSize:withPreviewOptions:](self, "JFX_configureCommonRenderingPropertiesForEffect:forPreviewSize:withPreviewOptions:", v11, v12, width, height);
  objc_msgSend(v12, "renderedImageCropRect");
  *(_QWORD *)&v52 = v18;
  *((_QWORD *)&v52 + 1) = v19;
  *(_QWORD *)&v53 = v20;
  *((_QWORD *)&v53 + 1) = v21;
  objc_msgSend(v12, "renderPropertiesConfigurationBlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = v22 == 0;

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v12, "renderPropertiesConfigurationBlock");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, __int128 *, double, double))v23)[2](v23, v11, &v52, width, height);

  }
  objc_msgSend(v12, "renderBackgroundImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (v25)
  {
    location = 0uLL;
    v50 = 0;
    if (v12 && (objc_msgSend(v12, "renderTime"), (v48 & 1) != 0))
    {
      objc_msgSend(v12, "renderTime");
    }
    else
    {
      location = kDefaultEffectPreviewRenderTime;
      v50 = 0;
    }
    v31 = [JFXEffectsPreviewGenerationRequest alloc];
    v46 = location;
    v47 = v50;
    v30 = -[JFXEffectsPreviewGenerationRequest initWithInputGenerator:effectStack:outputSize:renderTime:](v31, "initWithInputGenerator:effectStack:outputSize:renderTime:", v11, 0, &v46, width, height);
  }
  else
  {
    v26 = [JFXEffectsPreviewGenerationRequest alloc];
    objc_msgSend(v12, "renderBackgroundImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pvImageBuffer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v12, "renderTime");
    else
      memset(v51, 0, sizeof(v51));
    v30 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v26, "initWithInput:effectStack:outputSize:renderTime:", v28, v29, v51, width, height);

    -[JFXEffectsPreviewGenerationRequest centerAnimationInfo](v30, "centerAnimationInfo");
  }
  -[JFXEffectsPreviewGenerationRequest setHighQuality:](v30, "setHighQuality:", objc_msgSend(v12, "quality") == 2);
  if (objc_msgSend(v12, "parentCode") != -1)
    -[JFXEffectsPreviewGenerationRequest setParentCode:](v30, "setParentCode:", objc_msgSend(v12, "parentCode"));
  -[JFXEffectPreviewManager concurrentStaticPreviewSemaphore](self, "concurrentStaticPreviewSemaphore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)&location, self);
  -[JFXEffectPreviewManager staticPreviewGenerator](self, "staticPreviewGenerator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __85__JFXEffectPreviewManager_JFX_renderPreviewForEffect_previewSize_options_completion___block_invoke;
  v38[3] = &unk_24EE5BFE8;
  v34 = v32;
  v39 = v34;
  objc_copyWeak(&v43, (id *)&location);
  v35 = v13;
  v42 = v35;
  v44 = v52;
  v45 = v53;
  v36 = v12;
  v40 = v36;
  v37 = v11;
  v41 = v37;
  objc_msgSend(v33, "generatePreviewRequest:completionHandler:", v30, v38);

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)&location);

}

void __85__JFXEffectPreviewManager_JFX_renderPreviewForEffect_previewSize_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  JTImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && v14)
  {
    objc_msgSend(v14, "objectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (CGRectIsEmpty(*(CGRect *)(a1 + 72)))
        v6 = objc_msgSend(v5, "copyOfUIImage");
      else
        v6 = objc_msgSend(v5, "copyOfUIImage:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      v7 = (void *)v6;
      if (v6)
      {
        v8 = -[JTImage initWithUIImage:]([JTImage alloc], "initWithUIImage:", v6);
        if ((objc_msgSend(*(id *)(a1 + 40), "dontCache") & 1) == 0)
        {
          objc_msgSend(WeakRetained, "previewCache");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "effectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v8, v10);

          if ((objc_msgSend(*(id *)(a1 + 40), "dontCacheToDisk") & 1) == 0)
          {
            objc_msgSend(WeakRetained, "previewDiskCache");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "effectID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "contentVersion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "savePreviewForEffectID:image:version:completion:", v12, v8, v13, 0);

          }
        }
        goto LABEL_14;
      }
    }
    else
    {
      v7 = 0;
    }
    v8 = 0;
LABEL_14:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_15:

}

- (void)cachedPreviewForEffect:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v6 = a3;
  v7 = a4;
  -[JFXEffectPreviewManager previewCache](self, "previewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke;
    v29[3] = &unk_24EE58280;
    v32 = v7;
    v30 = v10;
    v31 = 0;
    -[JFXEffectPreviewManager JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:](self, "JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:", v29);

    v11 = v32;
  }
  else if (-[JFXEffectPreviewManager isContinouslyPreviewing](self, "isContinouslyPreviewing"))
  {
    -[JFXEffectPreviewManager defaultPreviewImage](self, "defaultPreviewImage");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)objc_opt_new();
      -[JFXEffectPreviewManager defaultPreviewImageDisplayTransformValue](self, "defaultPreviewImageDisplayTransformValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("JFXEffectFoundPreviewLiveCaptureImageDisplayTransform"));
      objc_msgSend(v12, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("JFXEffectFoundDefaultImageToUseWhilePreparingPreview"));
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_4;
      v19[3] = &unk_24EE58280;
      v22 = v7;
      v11 = v11;
      v20 = v11;
      v21 = v12;
      v14 = v12;
      -[JFXEffectPreviewManager JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:](self, "JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:", v19);

    }
  }
  else
  {
    -[JFXEffectPreviewManager callbackQueue](self, "callbackQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[JFXEffectPreviewManager previewDiskCache](self, "previewDiskCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_2;
    v23[3] = &unk_24EE5C010;
    objc_copyWeak(&v27, &location);
    v24 = v6;
    v11 = v15;
    v25 = v11;
    v26 = v7;
    objc_msgSend(v16, "previewForEffectID:version:completion:", v17, v18, v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

uint64_t __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "previewCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "effectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, v6);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_3;
  v10[3] = &unk_24EE58FF0;
  v7 = *(NSObject **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  dispatch_async(v7, v10);

}

uint64_t __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)purgeCachedPreviewForEffect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[JFXEffectPreviewManager previewCache](self, "previewCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)purgeCachedPreviewsForAllEffects
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[JFXEffectPreviewManager previewCache](self, "previewCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_initWeak(&location, self);
  -[JFXEffectPreviewManager previewQueue](self, "previewQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__JFXEffectPreviewManager_purgeCachedPreviewsForAllEffects__block_invoke;
  v5[3] = &unk_24EE59648;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__JFXEffectPreviewManager_purgeCachedPreviewsForAllEffects__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStaticPreviewGenerator:", 0);

}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (JFXLRUCache)previewCache
{
  return self->_previewCache;
}

- (JFXEffectPreviewDiskCache)previewDiskCache
{
  return self->_previewDiskCache;
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (OS_dispatch_queue)previewQueue
{
  return self->_previewQueue;
}

- (OS_dispatch_semaphore)concurrentStaticPreviewSemaphore
{
  return self->_concurrentStaticPreviewSemaphore;
}

- (NSObject)pickerPreviewingToken
{
  return self->_pickerPreviewingToken;
}

- (JFXEffectPreviewManagerDelegate)delegate_internal
{
  return (JFXEffectPreviewManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate_internal);
}

- (void)setDelegate_internal:(id)a3
{
  objc_storeWeak((id *)&self->_delegate_internal, a3);
}

- (BOOL)continouslyPreviewing_internal
{
  return self->_continouslyPreviewing_internal;
}

- (void)setContinouslyPreviewing_internal:(BOOL)a3
{
  self->_continouslyPreviewing_internal = a3;
}

- (JTImage)defaultPreviewImage_internal
{
  return self->_defaultPreviewImage_internal;
}

- (void)setDefaultPreviewImage_internal:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPreviewImage_internal, a3);
}

- (NSValue)_defaultPreviewImageDisplayTransformValue_internal
{
  return self->__defaultPreviewImageDisplayTransformValue_internal;
}

- (void)set_defaultPreviewImageDisplayTransformValue_internal:(id)a3
{
  objc_storeStrong((id *)&self->__defaultPreviewImageDisplayTransformValue_internal, a3);
}

- (void)setStaticPreviewGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_staticPreviewGenerator, a3);
}

- (PVLivePlayer)continousPreviewPlayer
{
  return self->_continousPreviewPlayer;
}

- (void)setContinousPreviewPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_continousPreviewPlayer, a3);
}

- (CGSize)continousPreviewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_continousPreviewSize.width;
  height = self->_continousPreviewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContinousPreviewSize:(CGSize)a3
{
  self->_continousPreviewSize = a3;
}

- (JFXEffectContinousPreviewOptions)continousPreviewOptions
{
  return self->_continousPreviewOptions;
}

- (void)setContinousPreviewOptions:(id)a3
{
  objc_storeStrong((id *)&self->_continousPreviewOptions, a3);
}

- (NSMutableSet)preparedContinousPreviewEffects
{
  return self->_preparedContinousPreviewEffects;
}

- (void)setPreparedContinousPreviewEffects:(id)a3
{
  objc_storeStrong((id *)&self->_preparedContinousPreviewEffects, a3);
}

- (NSMutableSet)effectsPreparingForPreview
{
  return self->_effectsPreparingForPreview;
}

- (void)setEffectsPreparingForPreview:(id)a3
{
  objc_storeStrong((id *)&self->_effectsPreparingForPreview, a3);
}

- (NSSet)currentContinousPreviewEffects
{
  return self->_currentContinousPreviewEffects;
}

- (void)setCurrentContinousPreviewEffects:(id)a3
{
  objc_storeStrong((id *)&self->_currentContinousPreviewEffects, a3);
}

- (NSMapTable)assetRequestsForPreviewEffects
{
  return self->_assetRequestsForPreviewEffects;
}

- (void)setAssetRequestsForPreviewEffects:(id)a3
{
  objc_storeStrong((id *)&self->_assetRequestsForPreviewEffects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetRequestsForPreviewEffects, 0);
  objc_storeStrong((id *)&self->_currentContinousPreviewEffects, 0);
  objc_storeStrong((id *)&self->_effectsPreparingForPreview, 0);
  objc_storeStrong((id *)&self->_preparedContinousPreviewEffects, 0);
  objc_storeStrong((id *)&self->_continousPreviewOptions, 0);
  objc_storeStrong((id *)&self->_continousPreviewPlayer, 0);
  objc_storeStrong((id *)&self->_staticPreviewGenerator, 0);
  objc_storeStrong((id *)&self->__defaultPreviewImageDisplayTransformValue_internal, 0);
  objc_storeStrong((id *)&self->_defaultPreviewImage_internal, 0);
  objc_destroyWeak((id *)&self->_delegate_internal);
  objc_storeStrong((id *)&self->_pickerPreviewingToken, 0);
  objc_storeStrong((id *)&self->_concurrentStaticPreviewSemaphore, 0);
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_previewDiskCache, 0);
  objc_storeStrong((id *)&self->_previewCache, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
