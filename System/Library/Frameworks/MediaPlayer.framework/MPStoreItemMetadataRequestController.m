@implementation MPStoreItemMetadataRequestController

void __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  MPStoreItemMetadataCache *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:");
  v3 = (MPStoreItemMetadataCache *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[MPStoreItemMetadataCache initWithCacheSize:]([MPStoreItemMetadataCache alloc], "initWithCacheSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v3, v5);
  }
  v4 = -[MPStoreItemMetadataCache addMetadata:forItemIdentifier:](v3, "addMetadata:forItemIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_removeExpiredItemsPeriodically");
  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", 0);

}

- (void)_removeExpiredItemsPeriodically
{
  os_unfair_lock_s *p_transactionLock;
  int64_t transactionCount;
  uint64_t v5;
  unint64_t v6;
  mach_timebase_info info;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  transactionCount = self->_transactionCount;
  os_unfair_lock_unlock(p_transactionLock);
  if (transactionCount <= 0)
  {
    info = 0;
    mach_timebase_info(&info);
    if (info.denom)
    {
      v5 = mach_absolute_time();
      if ((v5 - self->_lastExpiredMetadataPurgeMachTime) * (info.numer / info.denom) >= 0x6FC23AC00)
      {
        v6 = v5;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_itemCaches, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_28);
        self->_lastExpiredMetadataPurgeMachTime = v6;
      }
    }
  }
}

void __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  MPStoreItemMetadataRequest *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MPStoreItemMetadataRequest);
  v14[0] = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadataRequest setItemIdentifiers:](v4, "setItemIdentifiers:", v5);

  -[MPStoreItemMetadataRequest setPersonalizationStyle:](v4, "setPersonalizationStyle:", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke_2;
  v10[3] = &unk_1E3154C40;
  v6 = (void *)a1[6];
  v10[4] = a1[5];
  v7 = v6;
  v8 = a1[4];
  v11 = v7;
  v12 = v8;
  v13 = v3;
  v9 = v3;
  +[MPStoreItemMetadataCacheKey getCacheKeyWithRequest:completionHandler:](MPStoreItemMetadataCacheKey, "getCacheKeyWithRequest:completionHandler:", v4, v10);

}

- (void)addStoreItemMetadata:(id)a3 forUserIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MPAsyncBlockOperation *v9;
  MPAsyncBlockOperation *v10;
  MPStoreItemMetadataImportWindow *importWindow;
  void *v12;
  _QWORD v13[6];
  id v14;

  v6 = a3;
  v7 = a4;
  if ((MSVDeviceIsAudioAccessory() & 1) == 0)
  {
    objc_msgSend(v6, "cacheableItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = [MPAsyncBlockOperation alloc];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke;
      v13[3] = &unk_1E3154C68;
      v13[4] = v8;
      v13[5] = self;
      v14 = v6;
      v10 = -[MPAsyncBlockOperation initWithStartHandler:](v9, "initWithStartHandler:", v13);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);

    }
  }
  importWindow = self->_importWindow;
  objc_msgSend(v6, "importableStorePlatformDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadataImportWindow addPayload:userIdentity:](importWindow, "addPayload:userIdentity:", v12, v7);

}

- (void)addStoreItemMetadata:(id)a3
{
  -[MPStoreItemMetadataRequestController addStoreItemMetadata:forUserIdentity:](self, "addStoreItemMetadata:forUserIdentity:", a3, 0);
}

+ (MPStoreItemMetadataRequestController)sharedStoreItemMetadataRequestController
{
  if (sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestControllerOnceToken != -1)
    dispatch_once(&sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestControllerOnceToken, &__block_literal_global_10140);
  return (MPStoreItemMetadataRequestController *)(id)sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestController;
}

void __80__MPStoreItemMetadataRequestController_sharedStoreItemMetadataRequestController__block_invoke()
{
  MPStoreItemMetadataRequestController *v0;
  void *v1;

  v0 = objc_alloc_init(MPStoreItemMetadataRequestController);
  v1 = (void *)sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestController;
  sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestController = (uint64_t)v0;

}

- (MPStoreItemMetadataRequestController)init
{
  MPStoreItemMetadataRequestController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *itemCaches;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  NSOperationQueue *v7;
  NSOperationQueue *operationQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemMetadataRequestController;
  v2 = -[MPStoreItemMetadataRequestController init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemCaches = v2->_itemCaches;
    v2->_itemCaches = v3;

    v2->_lastExpiredMetadataPurgeMachTime = mach_absolute_time();
    v2->_cacheSize = 250;
    v5 = dispatch_queue_create("com.apple.MediaPlayer/MPStoreItemMetadata.callout", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreItemMetadataRequestController.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v2->_transactionLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)beginTransaction
{
  os_unfair_lock_s *p_transactionLock;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  ++self->_transactionCount;
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)endTransaction
{
  os_unfair_lock_s *p_transactionLock;
  int64_t transactionCount;
  BOOL v6;
  int64_t v7;
  id v8;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  transactionCount = self->_transactionCount;
  v6 = transactionCount < 1;
  v7 = transactionCount - 1;
  if (v6)
  {
    os_unfair_lock_unlock(p_transactionLock);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPStoreItemMetadataRequestController.m"), 91, CFSTR("Attempting to end a transaction that never began"));

  }
  else
  {
    self->_transactionCount = v7;
    os_unfair_lock_unlock(p_transactionLock);
  }
}

- (void)setCacheSize:(int64_t)a3
{
  MPAsyncBlockOperation *v5;
  MPAsyncBlockOperation *v6;
  _QWORD v7[6];

  v5 = [MPAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MPStoreItemMetadataRequestController_setCacheSize___block_invoke;
  v7[3] = &unk_1E3154C18;
  v7[4] = self;
  v7[5] = a3;
  v6 = -[MPAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", v7);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);

}

- (void)requestStoreItemMetadataForReason:(unint64_t)a3 withItemIdentifiers:(id)a4 responseHandler:(id)a5
{
  id v8;
  MPStoreItemMetadataRequest *v9;
  id v10;
  id v11;

  v11 = a5;
  v8 = a4;
  v9 = objc_alloc_init(MPStoreItemMetadataRequest);
  -[MPStoreItemMetadataRequest setItemIdentifiers:](v9, "setItemIdentifiers:", v8);

  -[MPStoreItemMetadataRequest setReason:](v9, "setReason:", a3);
  v10 = -[MPStoreItemMetadataRequestController getStoreItemMetadataForRequest:responseHandler:](self, "getStoreItemMetadataForRequest:responseHandler:", v9, v11);

}

- (id)getStoreItemMetadataForRequest:(id)a3 responseHandler:(id)a4
{
  return -[MPStoreItemMetadataRequestController getStoreItemMetadataForRequest:includeBatchResponseError:responseHandler:](self, "getStoreItemMetadataForRequest:includeBatchResponseError:responseHandler:", a3, 0, a4);
}

- (id)getStoreItemMetadataForRequest:(id)a3 includeBatchResponseError:(BOOL)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  MPStoreItemMetadataResponse *v12;
  _QWORD v14[6];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "setCancellable:", 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke;
    v14[3] = &unk_1E3154D58;
    v14[4] = v11;
    v14[5] = self;
    v15 = v8;
    v17 = v9;
    v16 = v10;
    v18 = a4;
    +[MPStoreItemMetadataCacheKey getCacheKeyWithRequest:completionHandler:](MPStoreItemMetadataCacheKey, "getCacheKeyWithRequest:completionHandler:", v15, v14);

  }
  else
  {
    objc_msgSend(v10, "setCompletedUnitCount:", 1);
    if (v9)
    {
      v12 = objc_alloc_init(MPStoreItemMetadataResponse);
      -[MPStoreItemMetadataResponse setFinalResponse:](v12, "setFinalResponse:", 1);
      (*((void (**)(id, MPStoreItemMetadataResponse *, _QWORD))v9 + 2))(v9, v12, 0);

    }
  }

  return v10;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importWindow, 0);
  objc_storeStrong((id *)&self->_itemCaches, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

uint64_t __71__MPStoreItemMetadataRequestController__removeExpiredItemsPeriodically__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeExpiredMetadata");
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MPAsyncBlockOperation *v4;
  id v5;
  MPAsyncBlockOperation *v6;
  _QWORD v7[4];
  __int128 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  v4 = [MPAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_2;
  v7[3] = &unk_1E3154D30;
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  v13 = *(_BYTE *)(a1 + 72);
  v5 = v3;
  v6 = -[MPAsyncBlockOperation initWithStartHandler:](v4, "initWithStartHandler:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addOperation:", v6);

}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  MPStoreItemMetadataResponse *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  MPStoreItemMetadataResponse *v33;
  void *v34;
  _QWORD v35[6];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  dispatch_queue_t v41;
  MPStoreItemMetadataResponse *v42;
  id v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v5 = objc_alloc_init(MPStoreItemMetadataResponse);
  -[MPStoreItemMetadataResponse setRequestItemIdentifiers:](v5, "setRequestItemIdentifiers:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 56), "reason");
  v34 = (void *)v6;
  if (v6 && (v8 = v7, !objc_msgSend(*(id *)(a1 + 56), "shouldIgnoreCache")))
  {
    v32 = v3;
    v33 = v5;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = a1;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v46;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v46 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v15);
          objc_msgSend(v34, "metadataForItemIdentifier:ignoreExpiration:", v16, objc_msgSend(*(id *)(v10 + 56), "shouldIgnoreExpiration"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            -[MPStoreItemMetadataResponse setStoreItemMetadata:forItemIdentifier:](v33, "setStoreItemMetadata:forItemIdentifier:", v17, v16);
          if (objc_msgSend(v17, "hasMetadataForRequestReason:", v8))
            v18 = v9;
          else
            v18 = v4;
          objc_msgSend(v18, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v13);
    }

    v5 = v33;
    -[MPStoreItemMetadataResponse setLastBatchItemIdentifiers:](v33, "setLastBatchItemIdentifiers:", v9);

    v3 = v32;
    a1 = v10;
  }
  else
  {
    objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  }
  if (objc_msgSend(v4, "count") && !objc_msgSend(*(id *)(a1 + 56), "shouldRequireCachedResults"))
  {
    -[MPStoreItemMetadataResponse lastBatchItemIdentifiers](v5, "lastBatchItemIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v22 = *(_QWORD *)(a1 + 72);
      if (v22)
      {
        v23 = (void *)-[MPStoreItemMetadataResponse copy](v5, "copy");
        (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "storePlatformRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setItemIdentifiers:", v25);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreItemMetadataRequestController", v26);

    v28 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_3;
    v38[3] = &unk_1E3154CE0;
    v29 = *(id *)(a1 + 56);
    v30 = *(_QWORD *)(a1 + 40);
    v39 = v29;
    v40 = v30;
    v41 = v27;
    v42 = v5;
    v43 = *(id *)(a1 + 72);
    v44 = *(_BYTE *)(a1 + 80);
    objc_msgSend(v24, "setBatchResultsHandler:", v38);
    v35[0] = v28;
    v35[1] = 3221225472;
    v35[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_8;
    v35[3] = &unk_1E3154D08;
    v37 = *(id *)(a1 + 72);
    v35[4] = v27;
    v35[5] = v5;
    v36 = v3;
    objc_msgSend(v24, "performWithResponseHandler:", v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "addChild:withPendingUnitCount:", v31, 1);

  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPStoreItemMetadataResponse setCacheMissItemIdentifiers:](v5, "setCacheMissItemIdentifiers:", v19);

    }
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 64), "setCompletedUnitCount:", 1);
      -[MPStoreItemMetadataResponse setFinalResponse:](v5, "setFinalResponse:", 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    objc_msgSend(v3, "finishWithError:", 0);
  }

}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  MPStoreItemMetadataCacheKey *v13;
  MPStoreItemMetadataCache *v14;
  MPStoreItemMetadataCache *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[6];
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  _QWORD v28[4];
  MPStoreItemMetadataCache *v29;
  _QWORD v30[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_4;
    v30[3] = &unk_1E3154C90;
    v30[4] = v10;
    objc_msgSend(v8, "enumerateItemsUsingBlock:", v30);
    if ((MSVDeviceIsAudioAccessory() & 1) == 0)
    {
      v13 = -[MPStoreItemMetadataCacheKey initWithRequest:response:]([MPStoreItemMetadataCacheKey alloc], "initWithRequest:response:", *(_QWORD *)(a1 + 32), v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v13);
      v14 = (MPStoreItemMetadataCache *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v14 = -[MPStoreItemMetadataCache initWithCacheSize:]([MPStoreItemMetadataCache alloc], "initWithCacheSize:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v14, v13);
      }
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_5;
      v28[3] = &unk_1E3154CB8;
      v29 = v14;
      v15 = v14;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v28);

    }
    objc_msgSend(*(id *)(a1 + 40), "_removeExpiredItemsPeriodically");
  }
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_6;
  block[3] = &unk_1E31616D8;
  v17 = *(NSObject **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  block[4] = v11;
  block[5] = v16;
  v23 = v7;
  v24 = v8;
  v18 = *(id *)(a1 + 64);
  v27 = *(_BYTE *)(a1 + 72);
  v25 = v9;
  v26 = v18;
  v19 = v9;
  v20 = v8;
  v21 = v7;
  dispatch_async(v17, block);

}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_9;
    block[3] = &unk_1E3161780;
    v6 = *(NSObject **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    v9 = v5;
    v8 = v4;
    dispatch_async(v6, block);

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", 0);

}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_9(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v2, "setLastBatchItemIdentifiers:", 0);
  objc_msgSend(v2, "setFinalResponse:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  MPStoreItemMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  MPStoreItemMetadata *v8;

  v3 = a2;
  v4 = [MPStoreItemMetadata alloc];
  objc_msgSend(v3, "metadataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MPStoreItemMetadata initWithStorePlatformDictionary:expirationDate:](v4, "initWithStorePlatformDictionary:expirationDate:", v5, v6);
  -[MPStoreItemMetadata cacheableItemIdentifier](v8, "cacheableItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7);

}

id __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "addMetadata:forItemIdentifier:", a3, a2);
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_7;
  v8[3] = &unk_1E3154CB8;
  v2 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 40), "setLastBatchItemIdentifiers:", *(_QWORD *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "performanceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPerformanceMetrics:", v4);

  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    if (*(_BYTE *)(a1 + 80))
      v7 = *(_QWORD *)(a1 + 64);
    else
      v7 = 0;
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, v7);

  }
}

uint64_t __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStoreItemMetadata:forItemIdentifier:", a3, a2);
}

void __53__MPStoreItemMetadataRequestController_setCacheSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 != *(_QWORD *)(v4 + 64))
  {
    objc_msgSend(*(id *)(v4 + 32), "removeAllObjects");
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v4 + 64) = v3;
  objc_msgSend(v5, "finishWithError:", 0);

}

+ (unint64_t)optimalBatchSize
{
  return *MEMORY[0x1E0DDC110];
}

@end
