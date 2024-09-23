@implementation ATDownloadProgressManager

uint64_t __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)getAllDownloadsWithReplyBlock:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, _QWORD))a3;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1D19F1000, v4, OS_LOG_TYPE_DEFAULT, "got request to get all downloads", (uint8_t *)v9, 2u);
  }

  if (v3)
  {
    +[ATAssetLinkController sharedInstance](ATAssetLinkController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _ATLogCategoryFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "count");
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "total number of downloads in ATC queue (%d)", (uint8_t *)v9, 8u);
    }

    v3[2](v3, v6, 0);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *queue;
  id v18;
  _QWORD v20[5];
  id v21;
  int v22;
  _QWORD v23[5];
  int v24;
  _QWORD block[5];
  id v26;
  uint8_t buf[4];
  ATDownloadProgressManager *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "processIdentifier");
  _ATLogCategoryXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v28 = self;
    v29 = 1024;
    v30 = v8;
    _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ got connection from pid %i", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC71228);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_atcDidEnqueueAsset_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_atcDidDownloadAsset_withError_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_atcDidUpdateAsset_withProgress_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_atcDidUpdateDownloadStateForAssets_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC6BE88);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v15);

  objc_msgSend(v7, "setRemoteObjectInterface:", v10);
  objc_msgSend(v7, "setExportedObject:", self);
  v16 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v18 = v7;
  v26 = v18;
  dispatch_sync(queue, block);
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v23[3] = &unk_1E928CAA0;
  v23[4] = self;
  v24 = v8;
  objc_msgSend(v18, "setInterruptionHandler:", v23);
  objc_initWeak((id *)buf, v18);
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_70;
  v20[3] = &unk_1E928CB58;
  v20[4] = self;
  v22 = v8;
  objc_copyWeak(&v21, (id *)buf);
  objc_msgSend(v18, "setInvalidationHandler:", v20);
  objc_msgSend(v18, "resume");
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (ATDownloadProgressManager)init
{
  ATDownloadProgressManager *v2;
  objc_class *v3;
  const char *Name;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableSet *downloadObservers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATDownloadProgressManager;
  v2 = -[ATDownloadProgressManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    downloadObservers = v2->_downloadObservers;
    v2->_downloadObservers = (NSMutableSet *)v7;

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  id v4;
  NSXPCListener *v5;
  NSXPCListener *listener;
  void *v7;
  int v8;
  ATDownloadProgressManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v8, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v5 = (NSXPCListener *)objc_msgSend(v4, "initWithMachServiceName:", *MEMORY[0x1E0CF7618]);
  listener = self->_listener;
  self->_listener = v5;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  +[ATAssetLinkController sharedInstance](ATAssetLinkController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

}

- (void)stop
{
  NSObject *v3;
  NSXPCListener *listener;
  void *v5;
  int v6;
  ATDownloadProgressManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  }
  +[ATAssetLinkController sharedInstance](ATAssetLinkController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)assetLinkController:(id)a3 didEnqueueAsset:(id)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  ATDownloadProgressManager *v10;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ATDownloadProgressManager_assetLinkController_didEnqueueAsset___block_invoke;
  block[3] = &unk_1E928CDD8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

- (void)assetLinkController:(id)a3 didUpdateAsset:(id)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  ATDownloadProgressManager *v10;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ATDownloadProgressManager_assetLinkController_didUpdateAsset___block_invoke;
  block[3] = &unk_1E928CDD8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

- (void)assetLinkController:(id)a3 didProcessFinishedAsset:(id)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  ATDownloadProgressManager *v10;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ATDownloadProgressManager_assetLinkController_didProcessFinishedAsset___block_invoke;
  block[3] = &unk_1E928CDD8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

- (void)assetLinkController:(id)a3 didChangeDownloadStateForAssets:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  ATDownloadProgressManager *v12;

  v5 = (objc_class *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithArray:copyItems:", v6, 1);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke;
  block[3] = &unk_1E928CDD8;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_sync(queue, block);

}

- (void)prioritizeDownloadWithStoreForLibraryIdentifier:(int64_t)a3 withReplyBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "got request to prioritize download with library identifier:%lld", (uint8_t *)&buf, 0xCu);
  }

  v7 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1173;
  v16 = __Block_byref_object_dispose__1174;
  v17 = 0;
  +[ATAssetLinkController sharedInstance](ATAssetLinkController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__ATDownloadProgressManager_prioritizeDownloadWithStoreForLibraryIdentifier_withReplyBlock___block_invoke;
  v10[3] = &unk_1E928C8A0;
  p_buf = &buf;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "prioritizeAssetWithStoreForLibraryIdentifier:withCompletion:", a3, v10);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (v5)
    v5[2](v5, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __92__ATDownloadProgressManager_prioritizeDownloadWithStoreForLibraryIdentifier_withReplyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v33;
    v22 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(v9, "assetParts", v22) & 1) != 0)
        {
          if (v6 > 199)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v10 = *(id *)(*(_QWORD *)(v23 + 40) + 24);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v29 != v13)
                    objc_enumerationMutation(v10);
                  objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_78);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "atcDidUpdateDownloadStateForAssets:", v2);

                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
              }
              while (v12);
            }

            objc_msgSend(v2, "removeAllObjects");
            v6 = 0;
            v3 = v22;
          }
          else
          {
            ++v6;
            objc_msgSend(v2, "addObject:", v9);
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = *(id *)(*(_QWORD *)(v23 + 40) + 24);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * k), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_80);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "atcDidUpdateDownloadStateForAssets:", v2);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v18);
    }

    objc_msgSend(v2, "removeAllObjects");
  }

}

void __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke_79(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidUpdateDownloadStateForAsset", (uint8_t *)&v4, 0xCu);
  }

}

void __81__ATDownloadProgressManager_assetLinkController_didChangeDownloadStateForAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidUpdateDownloadStateForAsset", (uint8_t *)&v4, 0xCu);
  }

}

void __73__ATDownloadProgressManager_assetLinkController_didProcessFinishedAsset___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "assetParts") & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_75, (_QWORD)v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v8, "error");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "msv_errorByRemovingUnsafeUserInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "atcDidDownloadAsset:withError:", v8, v10);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
}

void __73__ATDownloadProgressManager_assetLinkController_didProcessFinishedAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidDownloadAsset", (uint8_t *)&v4, 0xCu);
  }

}

void __64__ATDownloadProgressManager_assetLinkController_didUpdateAsset___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "assetParts") & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_74, (_QWORD)v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v8, "downloadProgress");
          objc_msgSend(v7, "atcDidUpdateAsset:withProgress:", v8);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
}

void __64__ATDownloadProgressManager_assetLinkController_didUpdateAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "failed to obtain remote proxy. err=%{public}@. could not send atcDidUpdateAsset", (uint8_t *)&v4, 0xCu);
  }

}

void __65__ATDownloadProgressManager_assetLinkController_didEnqueueAsset___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "assetParts") & 1) != 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_73, (_QWORD)v8);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "atcDidEnqueueAsset:", *(_QWORD *)(a1 + 32));

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

void __65__ATDownloadProgressManager_assetLinkController_didEnqueueAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_ERROR, "error sending did enqueue asset notification. failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }

}

void __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_70(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];
  id v4;
  int v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2_71;
  block[3] = &unk_1E928CB58;
  block[4] = v1;
  v5 = *(_DWORD *)(a1 + 48);
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_sync(v2, block);
  objc_destroyWeak(&v4);
}

void __64__ATDownloadProgressManager_listener_shouldAcceptNewConnection___block_invoke_2_71(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 48);
    v7 = 138543618;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection invalidated from pid: %i", (uint8_t *)&v7, 0x12u);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "removeObject:", WeakRetained);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1207 != -1)
    dispatch_once(&sharedInstance_onceToken_1207, &__block_literal_global_1208);
  return (id)__sharedInstance_1209;
}

void __43__ATDownloadProgressManager_sharedInstance__block_invoke()
{
  ATDownloadProgressManager *v0;
  void *v1;

  v0 = objc_alloc_init(ATDownloadProgressManager);
  v1 = (void *)__sharedInstance_1209;
  __sharedInstance_1209 = (uint64_t)v0;

}

@end
