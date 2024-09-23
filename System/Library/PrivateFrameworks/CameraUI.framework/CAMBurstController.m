@implementation CAMBurstController

- (CAMBurstController)initWithProtectionController:(id)a3 powerController:(id)a4 remoteShutterController:(id)a5
{
  id v9;
  id v10;
  id v11;
  CAMBurstController *v12;
  CAMBurstController *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *analysisQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *mutexQueue;
  NSObject *v20;
  CAMBurstController *v21;
  CAMBurstController *v22;
  _QWORD block[4];
  CAMBurstController *v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CAMBurstController;
  v12 = -[CAMBurstController init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->__protectionController, a3);
    objc_storeStrong((id *)&v13->__powerController, a4);
    objc_storeStrong((id *)&v13->__remoteShutterController, a5);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.camera.burst-controller.analysis-queue", v14);
    analysisQueue = v13->__analysisQueue;
    v13->__analysisQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.camera.burst-controller.mutex-queue", v17);
    mutexQueue = v13->__mutexQueue;
    v13->__mutexQueue = (OS_dispatch_queue *)v18;

    v20 = v13->__mutexQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__CAMBurstController_initWithProtectionController_powerController_remoteShutterController___block_invoke;
    block[3] = &unk_1EA328868;
    v21 = v13;
    v25 = v21;
    dispatch_sync(v20, block);
    v22 = v21;

  }
  return v13;
}

void __91__CAMBurstController_initWithProtectionController_powerController_remoteShutterController___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

  v11 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(_QWORD *)(v15 + 48) = v14;

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 56);
  *(_QWORD *)(v17 + 56) = 0;

}

- (void)setPersistenceController:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, a3);
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CAMBurstController_setPersistenceController___block_invoke;
  block[3] = &unk_1EA32DBC8;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_sync(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)_mutexQueue
{
  return self->__mutexQueue;
}

void __47__CAMBurstController_setPersistenceController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 72), WeakRetained);

}

- (unint64_t)estimatedCountForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CAMBurstController_estimatedCountForIdentifier___block_invoke;
  block[3] = &unk_1EA32DC90;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__CAMBurstController_estimatedCountForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sessionsByIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "estimatedCount");

}

- (NSMutableDictionary)_sessionsByIdentifier
{
  return self->__sessionsByIdentifier;
}

- (CAMBurstController)init
{
  -[CAMBurstController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMBurstController initWithProtectionController:powerController:remoteShutterController:](self, "initWithProtectionController:powerController:remoteShutterController:", 0, 0, 0);
}

- (NSString)currentBurstIdentifier
{
  NSObject *v3;
  void *v4;
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
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CAMBurstController_currentBurstIdentifier__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)v8[5], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __44__CAMBurstController_currentBurstIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_activeSession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)currentBurstCount
{
  NSObject *v3;
  unint64_t v4;
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
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CAMBurstController_currentBurstCount__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = objc_msgSend((id)v8[5], "count");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__CAMBurstController_currentBurstCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_activeSession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)startBurstCaptureWithAnalyticsEvent:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CAMBurstController_startBurstCaptureWithAnalyticsEvent___block_invoke;
  block[3] = &unk_1EA32C990;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__CAMBurstController_startBurstCaptureWithAnalyticsEvent___block_invoke(uint64_t a1)
{
  CAMBurstSession *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_activeSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(CAMBurstSession);
  objc_msgSend(*(id *)(a1 + 32), "_setActiveSession:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_sessionsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBurstSession identifier](v2, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_analyticsEventsByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "_protectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startProtectingBurstProcessingForIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(v8, "startProtectingNebulaDaemonWritesForIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)_mutexQueueProcessCompleteBurstSessionWithIdentifier:(id)a3 device:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  int64_t v18;

  v6 = a3;
  if (v6)
  {
    -[CAMBurstController _protectionController](self, "_protectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMBurstController _persistenceController](self, "_persistenceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMBurstController _powerController](self, "_powerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke;
    v13[3] = &unk_1EA32DC68;
    v13[4] = self;
    v14 = v6;
    v15 = v9;
    v17 = v7;
    v18 = a4;
    v16 = v8;
    v10 = v7;
    v11 = v8;
    v12 = v9;
    objc_msgSend(v11, "performDeferredRemotePersistenceWithCompletionHandler:", v13);

  }
}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_cold_1((uint64_t)v3, v4);

  }
  objc_msgSend(a1[4], "_sessionsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", a1[5]);
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_faceResultsByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  objc_msgSend(a1[6], "addAssertionForIndentifier:withReason:", objc_msgSend(a1[6], "generateAssertionIdentifier"), 16);
  objc_msgSend(a1[4], "_analysisQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = a1[5];
  v15 = a1[7];
  v16 = a1[8];
  v17 = a1[6];
  v11 = v7;
  v12 = v6;
  pl_dispatch_async();

}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  int v18;

  objc_msgSend(*(id *)(a1 + 32), "performBurstAnalysisForDevice:", *(_QWORD *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_analyticsEventsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_analyticsEventsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  objc_msgSend(v2, "allAssetIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "populateBurstLength:", objc_msgSend(v6, "count"));

  objc_msgSend(v4, "publish");
  v7 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_2;
  v12[3] = &unk_1EA32DC18;
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 80);
  v18 = *(_DWORD *)(a1 + 96);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v9;
  v16 = v10;
  v17 = v2;
  v11 = v2;
  objc_msgSend(v7, "persistBurstWithIdentifier:result:completionHandler:", v8, v11, v12);

}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  uint64_t *v21;

  objc_msgSend(*(id *)(a1 + 32), "stopProtectingBurstProcessingForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "stopProtectingNebulaDaemonWritesForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removeAssertionForIdentifier:withReason:", *(unsigned int *)(a1 + 72), 16);
  objc_msgSend(*(id *)(a1 + 56), "_remoteShutterController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a2 && *(_QWORD *)(a1 + 64) && objc_msgSend(v4, "isConnected"))
  {
    v6 = *(void **)(a1 + 64);
    v7 = MEMORY[0x1E0C809B0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_3;
    v18 = &unk_1EA32DBF0;
    v19 = v5;
    v8 = v6;
    v9 = &v15;
    objc_msgSend(v8, "bestAssetIdentifier", v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_8;
    objc_msgSend(v8, "goodAssetIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      || (objc_msgSend(v8, "allAssetIdentifiers"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "firstObject"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v10))
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourceInternalClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = ___loadThumbnailForBurstResult_block_invoke;
      v20[3] = &unk_1EA32DCB8;
      v21 = v9;
      objc_msgSend(v14, "requestMasterThumbnailForAssetUUID:completionHandler:", v10, v20);

    }
    else
    {
      v17((uint64_t)v9, 0);
    }

  }
}

uint64_t __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "sendThumbnailData:isVideo:", a2, 0);
  return result;
}

- (void)finishBurstCaptureForDevice:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CAMBurstController_finishBurstCaptureForDevice___block_invoke;
  v6[3] = &unk_1EA328B18;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

void __50__CAMBurstController_finishBurstCaptureForDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_requestsPendingPersistenceByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_activeSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "countForObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_setActiveSession:", 0);
  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "_mutexQueueProcessCompleteBurstSessionWithIdentifier:device:", v3, *(_QWORD *)(a1 + 40));

}

- (void)cancelBurstCapture
{
  void *v3;
  void *v4;
  id v5;

  -[CAMBurstController _activeSession](self, "_activeSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBurstController _setActiveSession:](self, "_setActiveSession:", 0);
  -[CAMBurstController _protectionController](self, "_protectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopProtectingBurstProcessingForIdentifier:", v3);
  objc_msgSend(v4, "stopProtectingNebulaDaemonWritesForIdentifier:", v3);

}

- (void)processEnqueuedRequest:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  objc_msgSend(a3, "burstIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CAMBurstController _mutexQueue](self, "_mutexQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CAMBurstController_processEnqueuedRequest___block_invoke;
    v7[3] = &unk_1EA328A40;
    v7[4] = self;
    v8 = v4;
    dispatch_sync(v5, v7);

  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to enqueue a request for a burst session without an identifier specified!", buf, 2u);
    }

  }
}

void __45__CAMBurstController_processEnqueuedRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_sessionsByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestsPendingPersistenceByIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_inflightRequestsByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)processCapturedRequest:(id)a3 withResult:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(a3, "burstIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CAMBurstController _mutexQueue](self, "_mutexQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CAMBurstController_processCapturedRequest_withResult___block_invoke;
    block[3] = &unk_1EA329360;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    dispatch_sync(v8, block);

  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to mark a request as captured for a burst session without an identifier specified!", buf, 2u);
    }

  }
}

void __56__CAMBurstController_processCapturedRequest_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_sessionsByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "addStillImageCaptureResult:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_inflightRequestsByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)processPersistedRequest:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "burstIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CAMBurstController _mutexQueue](self, "_mutexQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__CAMBurstController_processPersistedRequest_withResult___block_invoke;
    v11[3] = &unk_1EA3290F0;
    v11[4] = self;
    v12 = v8;
    v13 = v7;
    v14 = v6;
    dispatch_sync(v9, v11);

  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to add results to a burst session without an identifier specified!", buf, 2u);
    }

  }
}

void __57__CAMBurstController_processPersistedRequest_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_sessionsByIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_faceResultsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addStillImageLocalPersistenceResult:withFaces:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(v5, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_requestsPendingPersistenceByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_activeSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v2 && !objc_msgSend(v6, "countForObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 56), "captureRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_mutexQueueProcessCompleteBurstSessionWithIdentifier:device:", *(_QWORD *)(a1 + 40), objc_msgSend(v8, "captureDevice"));

  }
}

- (void)processFaceResults:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CAMBurstController_processFaceResults___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __41__CAMBurstController_processFaceResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_activeSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_faceResultsByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v4, "setObject:forKey:", v5, v3);
    }
    objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

    v2 = v6;
  }

}

- (unint64_t)inflightCountForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[CAMBurstController _mutexQueue](self, "_mutexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CAMBurstController_inflightCountForIdentifier___block_invoke;
  block[3] = &unk_1EA32C990;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__CAMBurstController_inflightCountForIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_inflightRequestsByIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "countForObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)_analyticsEventsByIdentifier
{
  return self->__analyticsEventsByIdentifier;
}

- (NSCountedSet)_inflightRequestsByIdentifier
{
  return self->__inflightRequestsByIdentifier;
}

- (NSCountedSet)_requestsPendingPersistenceByIdentifier
{
  return self->__requestsPendingPersistenceByIdentifier;
}

- (NSMutableDictionary)_faceResultsByIdentifier
{
  return self->__faceResultsByIdentifier;
}

- (CAMBurstSession)_activeSession
{
  return self->__activeSession;
}

- (void)_setActiveSession:(id)a3
{
  objc_storeStrong((id *)&self->__activeSession, a3);
}

- (OS_dispatch_queue)_analysisQueue
{
  return self->__analysisQueue;
}

- (CAMPersistenceController)_persistenceController
{
  return (CAMPersistenceController *)objc_loadWeakRetained((id *)&self->__persistenceController);
}

- (CAMProtectionController)_protectionController
{
  return self->__protectionController;
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (CAMRemoteShutterController)_remoteShutterController
{
  return self->__remoteShutterController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remoteShutterController, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_storeStrong((id *)&self->__protectionController, 0);
  objc_destroyWeak((id *)&self->__persistenceController);
  objc_storeStrong((id *)&self->__analysisQueue, 0);
  objc_storeStrong((id *)&self->__activeSession, 0);
  objc_storeStrong((id *)&self->__faceResultsByIdentifier, 0);
  objc_storeStrong((id *)&self->__requestsPendingPersistenceByIdentifier, 0);
  objc_storeStrong((id *)&self->__inflightRequestsByIdentifier, 0);
  objc_storeStrong((id *)&self->__analyticsEventsByIdentifier, 0);
  objc_storeStrong((id *)&self->__sessionsByIdentifier, 0);
  objc_storeStrong((id *)&self->__mutexQueue, 0);
}

void __82__CAMBurstController__mutexQueueProcessCompleteBurstSessionWithIdentifier_device___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Failed to perform deferred remote persistence: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
