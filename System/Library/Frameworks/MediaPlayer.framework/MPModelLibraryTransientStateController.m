@implementation MPModelLibraryTransientStateController

void __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    v5 = MEMORY[0x1E0C809B0];
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v4)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
      objc_msgSend(v7, "modelObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_2;
      v20[3] = &unk_1E315B380;
      v9 = *(id *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v22 = v7;
      v23 = v10;
      v21 = v9;
      objc_msgSend(v8, "enumerateItemIdentifiersUsingBlock:", v20);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (!v11)
      {
        objc_msgSend(v7, "relatedModelObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v16[0] = v5;
        v16[1] = 3221225472;
        v16[2] = __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_3;
        v16[3] = &unk_1E315B380;
        v13 = *(id *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v18 = v7;
        v19 = v14;
        v17 = v13;
        objc_msgSend(v12, "enumerateItemIdentifiersUsingBlock:", v16);

        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v8 = v12;
      }

      if (v11)
        break;
      if (v3 == ++v6)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (id)sharedDeviceLibraryController
{
  if (sharedDeviceLibraryController_sOnceToken != -1)
    dispatch_once(&sharedDeviceLibraryController_sOnceToken, &__block_literal_global_29101);
  return (id)sharedDeviceLibraryController_sSharedDeviceLibraryController;
}

- (int64_t)transientAddStateForModelObject:(id)a3
{
  void *v4;
  void *v5;
  NSObject *accessQueue;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke;
    block[3] = &unk_1E31635A8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __71__MPModelLibraryTransientStateController_sharedDeviceLibraryController__block_invoke()
{
  MPModelLibraryTransientStateController *v0;
  void *v1;

  v0 = objc_alloc_init(MPModelLibraryTransientStateController);
  v1 = (void *)sharedDeviceLibraryController_sSharedDeviceLibraryController;
  sharedDeviceLibraryController_sSharedDeviceLibraryController = (uint64_t)v0;

}

- (MPModelLibraryTransientStateController)init
{
  MPModelLibraryTransientStateController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  NSOperationQueue *v7;
  NSOperationQueue *operationQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPModelLibraryTransientStateController;
  v2 = -[MPModelLibraryTransientStateController init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryTransientStateController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryTransientStateController.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryTransientStateController.operationQueue"));
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
  }
  return v2;
}

void __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    v5 = MEMORY[0x1E0C809B0];
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v4)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
      objc_msgSend(v7, "modelObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_2;
      v20[3] = &unk_1E315B380;
      v9 = *(id *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v22 = v7;
      v23 = v10;
      v21 = v9;
      objc_msgSend(v8, "enumerateItemIdentifiersUsingBlock:", v20);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (!v11)
      {
        objc_msgSend(v7, "relatedModelObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v16[0] = v5;
        v16[1] = 3221225472;
        v16[2] = __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_3;
        v16[3] = &unk_1E315B380;
        v13 = *(id *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v18 = v7;
        v19 = v14;
        v17 = v13;
        objc_msgSend(v12, "enumerateItemIdentifiersUsingBlock:", v16);

        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v8 = v12;
      }

      if (v11)
        break;
      if (v3 == ++v6)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (int64_t)transientKeepLocalStateForModelObject:(id)a3
{
  void *v4;
  void *v5;
  NSObject *accessQueue;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke;
    block[3] = &unk_1E31635A8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addOperation:(id)a3
{
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", a3);
}

- (id)registerTransientAddState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *notificationQueue;
  id v15;
  _QWORD v17[5];
  _QWORD block[4];
  id v19;
  id v20;
  MPModelLibraryTransientStateController *v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v9 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__29050;
  v28 = __Block_byref_object_dispose__29051;
  v29 = 0;
  accessQueue = self->_accessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke;
  block[3] = &unk_1E315B330;
  v22 = &v24;
  v23 = a3;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v12 = v9;
  v13 = v8;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke_2;
  v17[3] = &unk_1E3163508;
  v17[4] = self;
  dispatch_async(notificationQueue, v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (id)registerTransientKeepLocalState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *notificationQueue;
  id v15;
  _QWORD v17[5];
  _QWORD block[4];
  id v19;
  id v20;
  MPModelLibraryTransientStateController *v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v9 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__29050;
  v28 = __Block_byref_object_dispose__29051;
  v29 = 0;
  accessQueue = self->_accessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke;
  block[3] = &unk_1E315B330;
  v22 = &v24;
  v23 = a3;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v12 = v9;
  v13 = v8;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke_2;
  v17[3] = &unk_1E3163508;
  v17[4] = self;
  dispatch_async(notificationQueue, v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (id)registerTransientFavoriteState:(int64_t)a3 forModelObjects:(id)a4 relatedModelObjects:(id)a5
{
  id v8;
  id v9;
  NSObject *accessQueue;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *notificationQueue;
  id v15;
  _QWORD v17[5];
  _QWORD block[4];
  id v19;
  id v20;
  MPModelLibraryTransientStateController *v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v9 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__29050;
  v28 = __Block_byref_object_dispose__29051;
  v29 = 0;
  accessQueue = self->_accessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke;
  block[3] = &unk_1E315B330;
  v22 = &v24;
  v23 = a3;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v12 = v9;
  v13 = v8;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke_2;
  v17[3] = &unk_1E3163508;
  v17[4] = self;
  dispatch_async(notificationQueue, v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (void)unregisterTransientState:(id)a3
{
  id v4;
  NSObject *accessQueue;
  uint64_t v6;
  id v7;
  NSObject *notificationQueue;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v11 = v4;
  v7 = v4;
  dispatch_barrier_sync(accessQueue, block);
  notificationQueue = self->_notificationQueue;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_3;
  v9[3] = &unk_1E3163508;
  v9[4] = self;
  dispatch_async(notificationQueue, v9);

}

- (int64_t)transientFavoriteStateForModelObject:(id)a3
{
  void *v4;
  void *v5;
  NSObject *accessQueue;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke;
    block[3] = &unk_1E31635A8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performDeleteEntityChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
  -[MPModelLibraryTransientStateController performDeleteEntityChangeRequest:withRelatedModelObjects:completion:](self, "performDeleteEntityChangeRequest:withRelatedModelObjects:completion:", a3, a4, 0);
}

- (void)performDeleteEntityChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MPMutableSectionedCollection *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  MPModelLibraryTransientStateController *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v8, "modelObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc_init(MPMutableSectionedCollection);
      -[MPMutableSectionedCollection appendSection:](v13, "appendSection:", &stru_1E3163D10);
      -[MPMutableSectionedCollection appendItem:](v13, "appendItem:", v12);
      -[MPModelLibraryTransientStateController registerTransientAddState:forModelObjects:relatedModelObjects:](self, "registerTransientAddState:forModelObjects:relatedModelObjects:", 2, v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v17[3] = &unk_1E315B3A8;
    v15 = v14;
    v18 = v15;
    v19 = self;
    v20 = v11;
    v16 = (void *)objc_msgSend(v8, "newOperationWithResponseHandler:", v17);
    if (v16)
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)performLibraryImportChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
  -[MPModelLibraryTransientStateController performLibraryImportChangeRequest:withRelatedModelObjects:completion:](self, "performLibraryImportChangeRequest:withRelatedModelObjects:completion:", a3, a4, 0);
}

- (void)performLibraryImportChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  MPModelLibraryTransientStateController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (objc_msgSend(v8, "shouldLibraryAdd"))
    {
      objc_msgSend(v8, "modelObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPModelLibraryTransientStateController registerTransientAddState:forModelObjects:relatedModelObjects:](self, "registerTransientAddState:forModelObjects:relatedModelObjects:", 1, v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v16[3] = &unk_1E315C0B0;
    v14 = v13;
    v17 = v14;
    v18 = self;
    v19 = v11;
    v15 = (void *)objc_msgSend(v8, "newOperationWithResponseHandler:", v16);
    if (v15)
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)performKeepLocalChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
  -[MPModelLibraryTransientStateController performKeepLocalChangeRequest:withRelatedModelObjects:completion:](self, "performKeepLocalChangeRequest:withRelatedModelObjects:completion:", a3, a4, 0);
}

- (void)performKeepLocalChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  MPMutableSectionedCollection *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  MPModelLibraryTransientStateController *v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = objc_msgSend(v8, "enableState");
    v13 = 0;
    v14 = 0;
    switch(v12)
    {
      case -1:
        v14 = 1;
        v13 = 3;
        break;
      case 1:
      case 2:
        v14 = 1;
        v13 = v12;
        break;
      case 3:
        v14 = 1;
        v13 = 4;
        break;
      default:
        break;
    }
    objc_msgSend(v8, "modelObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = 0;
    if (v14 && v15)
    {
      v18 = objc_alloc_init(MPMutableSectionedCollection);
      -[MPMutableSectionedCollection appendSection:](v18, "appendSection:", &stru_1E3163D10);
      -[MPMutableSectionedCollection appendItem:](v18, "appendItem:", v16);
      -[MPModelLibraryTransientStateController registerTransientKeepLocalState:forModelObjects:relatedModelObjects:](self, "registerTransientKeepLocalState:forModelObjects:relatedModelObjects:", v13, v18, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v21[3] = &unk_1E315B3A8;
    v22 = v17;
    v23 = self;
    v24 = v11;
    v19 = v17;
    v20 = (void *)objc_msgSend(v8, "newOperationWithResponseHandler:", v21);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v20);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)performFavoriteStateChangeRequest:(id)a3 withRelatedModelObjects:(id)a4
{
  -[MPModelLibraryTransientStateController performFavoriteStateChangeRequest:withRelatedModelObjects:completion:](self, "performFavoriteStateChangeRequest:withRelatedModelObjects:completion:", a3, a4, 0);
}

- (void)performFavoriteStateChangeRequest:(id)a3 withRelatedModelObjects:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MPMutableSectionedCollection *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  MPModelLibraryTransientStateController *v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && (objc_msgSend(v8, "requestAction"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    objc_msgSend(v8, "requestAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "changeRequestAction");

    switch(v13)
    {
      case 0:
        v14 = 1;
        v15 = 3;
        break;
      case 1:
      case 3:
        v14 = 1;
        v15 = 1;
        break;
      case 2:
        v14 = 1;
        v15 = 2;
        break;
      default:
        v14 = 0;
        v15 = 0;
        break;
    }
    objc_msgSend(v8, "modelObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = 0;
    if (v14 && v16)
    {
      v19 = objc_alloc_init(MPMutableSectionedCollection);
      -[MPMutableSectionedCollection appendSection:](v19, "appendSection:", &stru_1E3163D10);
      -[MPMutableSectionedCollection appendItem:](v19, "appendItem:", v17);
      -[MPModelLibraryTransientStateController registerTransientFavoriteState:forModelObjects:relatedModelObjects:](self, "registerTransientFavoriteState:forModelObjects:relatedModelObjects:", v15, v19, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke;
    v22[3] = &unk_1E315B3A8;
    v23 = v18;
    v24 = self;
    v25 = v10;
    v20 = v18;
    v21 = (void *)objc_msgSend(v8, "newOperationWithResponseHandler:", v22);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v21);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredTransientState, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;

  v3 = a2;
  if (a1[2].i64[0])
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E31635F8;
    v7 = a1[2];
    v5 = (id)v7.i64[0];
    v9 = vextq_s8(v7, v7, 8uLL);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  v6 = a1[3].i64[0];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __111__MPModelLibraryTransientStateController_performFavoriteStateChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterTransientState:", *(_QWORD *)(a1 + 40));
}

void __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;

  v3 = a2;
  if (a1[2].i64[0])
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E31635F8;
    v7 = a1[2];
    v5 = (id)v7.i64[0];
    v9 = vextq_s8(v7, v7, 8uLL);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  v6 = a1[3].i64[0];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __107__MPModelLibraryTransientStateController_performKeepLocalChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterTransientState:", *(_QWORD *)(a1 + 40));
}

void __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  uint64_t v9;
  int8x16_t v10;
  _QWORD block[4];
  int8x16_t v12;

  v5 = a2;
  v6 = a3;
  if (a1[2].i64[0])
  {
    v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E31635F8;
    v10 = a1[2];
    v8 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  v9 = a1[3].i64[0];
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

uint64_t __111__MPModelLibraryTransientStateController_performLibraryImportChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterTransientState:", *(_QWORD *)(a1 + 40));
}

void __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;

  v3 = a2;
  if (a1[2].i64[0])
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke_2;
    block[3] = &unk_1E31635F8;
    v7 = a1[2];
    v5 = (id)v7.i64[0];
    v9 = vextq_s8(v7, v7, 8uLL);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
  v6 = a1[3].i64[0];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __110__MPModelLibraryTransientStateController_performDeleteEntityChangeRequest_withRelatedModelObjects_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterTransientState:", *(_QWORD *)(a1 + 40));
}

void __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    v5 = MEMORY[0x1E0C809B0];
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v4)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
      objc_msgSend(v7, "modelObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_2;
      v20[3] = &unk_1E315B380;
      v9 = *(id *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v22 = v7;
      v23 = v10;
      v21 = v9;
      objc_msgSend(v8, "enumerateItemIdentifiersUsingBlock:", v20);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (!v11)
      {
        objc_msgSend(v7, "relatedModelObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v16[0] = v5;
        v16[1] = 3221225472;
        v16[2] = __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_3;
        v16[3] = &unk_1E315B380;
        v13 = *(id *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v18 = v7;
        v19 = v14;
        v17 = v13;
        objc_msgSend(v12, "enumerateItemIdentifiersUsingBlock:", v16);

        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v8 = v12;
      }

      if (v11)
        break;
      if (v3 == ++v6)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "favoriteState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __79__MPModelLibraryTransientStateController_transientFavoriteStateForModelObject___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "favoriteState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "keepLocalState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __80__MPModelLibraryTransientStateController_transientKeepLocalStateForModelObject___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "keepLocalState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "addState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __74__MPModelLibraryTransientStateController_transientAddStateForModelObject___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "addState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

void __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = MEMORY[0x1E0C809B0];
  v8 = __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_2;
  v9 = &unk_1E315B358;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v7 = 3221225472;
  v10 = v2;
  v11 = &v12;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v6);
  if (v13[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectAtIndex:", v6, v7, v8, v9);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 32);
      *(_QWORD *)(v4 + 32) = 0;

    }
  }

  _Block_object_dispose(&v12, 8);
}

void __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __67__MPModelLibraryTransientStateController_unregisterTransientState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _MPModelLibraryRegisteredTransientState *v9;

  v9 = objc_alloc_init(_MPModelLibraryRegisteredTransientState);
  -[_MPModelLibraryRegisteredTransientState setFavoriteState:](v9, "setFavoriteState:", a1[8]);
  -[_MPModelLibraryRegisteredTransientState setModelObjects:](v9, "setModelObjects:", a1[4]);
  -[_MPModelLibraryRegisteredTransientState setRelatedModelObjects:](v9, "setRelatedModelObjects:", a1[5]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  -[_MPModelLibraryRegisteredTransientState setToken:](v9, "setToken:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v5 = *(void **)(a1[6] + 32);
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = a1[6];
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v5 = *(void **)(a1[6] + 32);
  }
  objc_msgSend(v5, "addObject:", v9);

}

void __109__MPModelLibraryTransientStateController_registerTransientFavoriteState_forModelObjects_relatedModelObjects___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _MPModelLibraryRegisteredTransientState *v9;

  v9 = objc_alloc_init(_MPModelLibraryRegisteredTransientState);
  -[_MPModelLibraryRegisteredTransientState setKeepLocalState:](v9, "setKeepLocalState:", a1[8]);
  -[_MPModelLibraryRegisteredTransientState setModelObjects:](v9, "setModelObjects:", a1[4]);
  -[_MPModelLibraryRegisteredTransientState setRelatedModelObjects:](v9, "setRelatedModelObjects:", a1[5]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  -[_MPModelLibraryRegisteredTransientState setToken:](v9, "setToken:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v5 = *(void **)(a1[6] + 32);
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = a1[6];
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v5 = *(void **)(a1[6] + 32);
  }
  objc_msgSend(v5, "addObject:", v9);

}

void __110__MPModelLibraryTransientStateController_registerTransientKeepLocalState_forModelObjects_relatedModelObjects___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _MPModelLibraryRegisteredTransientState *v9;

  v9 = objc_alloc_init(_MPModelLibraryRegisteredTransientState);
  -[_MPModelLibraryRegisteredTransientState setAddState:](v9, "setAddState:", a1[8]);
  -[_MPModelLibraryRegisteredTransientState setModelObjects:](v9, "setModelObjects:", a1[4]);
  -[_MPModelLibraryRegisteredTransientState setRelatedModelObjects:](v9, "setRelatedModelObjects:", a1[5]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  -[_MPModelLibraryRegisteredTransientState setToken:](v9, "setToken:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v5 = *(void **)(a1[6] + 32);
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = a1[6];
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v5 = *(void **)(a1[6] + 32);
  }
  objc_msgSend(v5, "addObject:", v9);

}

void __104__MPModelLibraryTransientStateController_registerTransientAddState_forModelObjects_relatedModelObjects___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

@end
