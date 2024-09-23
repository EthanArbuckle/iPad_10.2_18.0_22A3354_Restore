@implementation MPStoreSocialServiceController

- (MPStoreSocialServiceController)init
{
  MPStoreSocialServiceController *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  NSMutableSet *v7;
  NSMutableSet *transientStates;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPStoreSocialServiceController;
  v2 = -[MPStoreSocialServiceController init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreSocialServiceController.operationQueue"));
    v5 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreSocialServiceController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    transientStates = v2->_transientStates;
    v2->_transientStates = v7;

  }
  return v2;
}

- (void)followPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowState:onPerson:completion:](self, "_performTransientFollowState:onPerson:completion:", 1, a3, a4);
}

- (void)unfollowPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowState:onPerson:completion:](self, "_performTransientFollowState:onPerson:completion:", 4, a3, a4);
}

- (void)requestFollowPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowState:onPerson:completion:](self, "_performTransientFollowState:onPerson:completion:", 3, a3, a4);
}

- (void)cancelFollowRequestOnPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowState:onPerson:completion:](self, "_performTransientFollowState:onPerson:completion:", 2, a3, a4);
}

- (void)blockPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowState:onPerson:completion:](self, "_performTransientFollowState:onPerson:completion:", 5, a3, a4);
}

- (void)unblockPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowState:onPerson:completion:](self, "_performTransientFollowState:onPerson:completion:", 6, a3, a4);
}

- (void)removeFollower:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MPStoreSocialServiceController_removeFollower_completion___block_invoke;
  v10[3] = &unk_1E31624C0;
  v7 = v6;
  v11 = v7;
  v8 = -[MPStoreSocialServiceController _newOperationForRemovingFollower:completion:](self, "_newOperationForRemovingFollower:completion:", a3, v10);
  if (v8)
  {
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);
  }
  else if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3000, 0);
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
}

- (int64_t)transientFollowStateForPerson:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[MPStoreSocialServiceController _transientStateForPerson:shouldCreate:](self, "_transientStateForPerson:shouldCreate:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "followState");
  else
    v5 = 0;

  return v5;
}

- (void)acceptAllFollowRequestsWithCompletion:(id)a3
{
  id v4;
  MPStoreSocialRequestOperation *v5;
  MPStoreSocialPendingFollowRequestOperationDataSource *v6;

  v4 = a3;
  v6 = -[MPStoreSocialPendingFollowRequestOperationDataSource initWithAction:]([MPStoreSocialPendingFollowRequestOperationDataSource alloc], "initWithAction:", 0);
  v5 = -[MPStoreSocialRequestOperation initWithDataSource:]([MPStoreSocialRequestOperation alloc], "initWithDataSource:", v6);
  -[MPStoreSocialRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);
}

- (void)acceptFollowRequestFromPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowPendingRequestState:onPerson:completion:](self, "_performTransientFollowPendingRequestState:onPerson:completion:", 1, a3, a4);
}

- (void)declineFollowRequestFromPerson:(id)a3 completion:(id)a4
{
  -[MPStoreSocialServiceController _performTransientFollowPendingRequestState:onPerson:completion:](self, "_performTransientFollowPendingRequestState:onPerson:completion:", 2, a3, a4);
}

- (int64_t)transientFollowPendingRequestStateForPerson:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[MPStoreSocialServiceController _transientStateForPerson:shouldCreate:](self, "_transientStateForPerson:shouldCreate:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "followPendingRequestState");
  else
    v5 = 0;

  return v5;
}

- (void)_performTransientFollowState:(int64_t)a3 onPerson:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  -[MPStoreSocialServiceController _transientStateForPerson:shouldCreate:](self, "_transientStateForPerson:shouldCreate:", a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__MPStoreSocialServiceController__performTransientFollowState_onPerson_completion___block_invoke;
    v14[3] = &unk_1E31624E8;
    v10 = v8;
    v15 = v10;
    v11 = (void *)objc_msgSend(v9, "newOperationForTransientFollowState:completion:", a3, v14);
    if (v11)
    {
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);
    }
    else if (v10)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3000, 0);
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);

    }
  }
  else if (v8)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3000, 0);
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v12);

  }
}

- (void)_performTransientFollowPendingRequestState:(int64_t)a3 onPerson:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  -[MPStoreSocialServiceController _transientStateForPerson:shouldCreate:](self, "_transientStateForPerson:shouldCreate:", a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__MPStoreSocialServiceController__performTransientFollowPendingRequestState_onPerson_completion___block_invoke;
    v14[3] = &unk_1E31624E8;
    v10 = v8;
    v15 = v10;
    v11 = (void *)objc_msgSend(v9, "newOperationForTransientFollowPendingRequestState:completion:", a3, v14);
    if (v11)
    {
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);
    }
    else if (v10)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3000, 0);
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);

    }
  }
  else if (v8)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3000, 0);
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v12);

  }
}

- (id)_transientStateForPerson:(id)a3 shouldCreate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *accessQueue;
  void *v13;
  _MPStoreSocialTransientState *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  id v22;
  id location;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a4;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__47057;
  v31 = __Block_byref_object_dispose__47058;
  v32 = 0;
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "socialProfileID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke;
    block[3] = &unk_1E31635A8;
    block[4] = self;
    v25 = v9;
    v26 = &v27;
    dispatch_sync(accessQueue, block);

  }
  v13 = (void *)v28[5];
  if (!v13 && v4)
  {
    v14 = -[_MPStoreSocialTransientState initWithPerson:]([_MPStoreSocialTransientState alloc], "initWithPerson:", v6);
    v15 = (void *)v28[5];
    v28[5] = (uint64_t)v14;

    objc_initWeak(&location, self);
    v16 = (void *)v28[5];
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_3;
    v21[3] = &unk_1E3162538;
    objc_copyWeak(&v22, &location);
    v21[4] = self;
    objc_msgSend(v16, "setCompletionBlock:", v21);
    v17 = self->_accessQueue;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_5;
    v20[3] = &unk_1E3163580;
    v20[4] = self;
    v20[5] = &v27;
    dispatch_barrier_async(v17, v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    v13 = (void *)v28[5];
  }
  v18 = v13;

  _Block_object_dispose(&v27, 8);
  return v18;
}

- (void)_populateTransientStatesSnapshot:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_transientStates;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "followState", (_QWORD)v14);
        v12 = objc_msgSend(v10, "followPendingRequestState");
        objc_msgSend(v10, "person");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_addTransientFollowState:transientFollowPendingRequestState:forPerson:", v11, v12, v13);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_notifyTransientStatesDidChangeWithSnapshot:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("MPStoreSocialServiceControllerTransientStatesSnapshotKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MPStoreSocialServiceControllerTransientStatesDidChangeNotification"), self, v7);
}

- (void)_transientStatesDidChange
{
  MPStoreSocialServiceTransientStatesSnapshot *v3;
  NSObject *accessQueue;
  MPStoreSocialServiceTransientStatesSnapshot *v5;
  _QWORD block[5];
  MPStoreSocialServiceTransientStatesSnapshot *v7;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_accessQueue);
  v3 = objc_alloc_init(MPStoreSocialServiceTransientStatesSnapshot);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MPStoreSocialServiceController__transientStatesDidChange__block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_sync(accessQueue, block);
  -[MPStoreSocialServiceController _notifyTransientStatesDidChangeWithSnapshot:](self, "_notifyTransientStatesDidChangeWithSnapshot:", v5);

}

- (void)_queue_transientStatesDidChange
{
  MPStoreSocialServiceTransientStatesSnapshot *v3;
  NSObject *v4;
  MPStoreSocialServiceTransientStatesSnapshot *v5;
  _QWORD v6[5];
  MPStoreSocialServiceTransientStatesSnapshot *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = objc_alloc_init(MPStoreSocialServiceTransientStatesSnapshot);
  -[MPStoreSocialServiceController _populateTransientStatesSnapshot:](self, "_populateTransientStatesSnapshot:", v3);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__MPStoreSocialServiceController__queue_transientStatesDidChange__block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (id)_newOperationForRemovingFollower:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  MPStoreSocialRemoveFollowerOperationDataSource *v7;
  MPStoreSocialRequestOperation *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MPStoreSocialRemoveFollowerOperationDataSource);
  -[MPStoreSocialRemoveFollowerOperationDataSource setPerson:](v7, "setPerson:", v6);

  v8 = -[MPStoreSocialRequestOperation initWithDataSource:]([MPStoreSocialRequestOperation alloc], "initWithDataSource:", v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke;
  v11[3] = &unk_1E3162588;
  v12 = v5;
  v9 = v5;
  -[MPStoreSocialRequestOperation setResponseHandler:](v8, "setResponseHandler:", v11);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientStates, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke_2;
    v6[3] = &unk_1E3162560;
    v8 = v5;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __78__MPStoreSocialServiceController__newOperationForRemovingFollower_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__MPStoreSocialServiceController__queue_transientStatesDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyTransientStatesDidChangeWithSnapshot:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__MPStoreSocialServiceController__transientStatesDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_populateTransientStatesSnapshot:", *(_QWORD *)(a1 + 40));
}

void __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_2;
  v6[3] = &unk_1E3162510;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  NSObject **v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_4;
    block[3] = &unk_1E3163698;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v5;
    dispatch_barrier_async(v6, block);

  }
}

uint64_t __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleTransientStateForPersonDidChangeNotification_, CFSTR("_MPStoreSocialTransientStateDidChangeNotification"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_transientStatesDidChange");
}

uint64_t __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("_MPStoreSocialTransientStateDidChangeNotification"), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_transientStatesDidChange");
}

void __72__MPStoreSocialServiceController__transientStateForPerson_shouldCreate___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "socialProfileID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __97__MPStoreSocialServiceController__performTransientFollowPendingRequestState_onPerson_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __83__MPStoreSocialServiceController__performTransientFollowState_onPerson_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__MPStoreSocialServiceController_removeFollower_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)_internalErrorForHTTPResponseCode:(int64_t)a3
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = -3000;
  if (a3 > 403)
  {
    v5 = -3004;
    if (a3 == 404)
      v3 = -3002;
    v4 = a3 == 409;
  }
  else
  {
    if (a3 == 200)
    {
      v7 = 0;
      return v7;
    }
    v4 = a3 == 403;
    v5 = -3003;
  }
  if (v4)
    v6 = v5;
  else
    v6 = v3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), v6, 0);
  return v7;
}

@end
