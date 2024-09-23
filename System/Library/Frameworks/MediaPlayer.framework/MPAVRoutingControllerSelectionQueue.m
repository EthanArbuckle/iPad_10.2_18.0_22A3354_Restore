@implementation MPAVRoutingControllerSelectionQueue

- (MPAVRoutingControllerSelectionQueue)initWithRoutingController:(id)a3
{
  id v4;
  MPAVRoutingControllerSelectionQueue *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  uint64_t v8;
  NSMutableArray *selectionsEnqueued;
  uint64_t v10;
  NSMutableSet *pendingRoutes;
  uint64_t v12;
  NSMapTable *pendingSelectionTimers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPAVRoutingControllerSelectionQueue;
  v5 = -[MPAVRoutingControllerSelectionQueue init](&v15, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingControllerSelection/serialQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    selectionsEnqueued = v5->_selectionsEnqueued;
    v5->_selectionsEnqueued = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_routingController, v4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingRoutes = v5->_pendingRoutes;
    v5->_pendingRoutes = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingSelectionTimers = v5->_pendingSelectionTimers;
    v5->_pendingSelectionTimers = (NSMapTable *)v12;

  }
  return v5;
}

void __59__MPAVRoutingControllerSelectionQueue_pickedRouteDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "routes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = 1;
    v8 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "pickedRoutes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v11, "containsObject:", v10);

        objc_msgSend(WeakRetained, "pickedRoutes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 &= objc_msgSend(v12, "containsObject:", v10) ^ 1;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
    v8 = 1;
  }

  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "selectionOperation") == 1)
      v13 = v8;
    else
      v13 = 0;
    if ((v13 & 1) != 0
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "selectionOperation") == 2 ? (v14 = v7) : (v14 = 0),
          (v14 & 1) != 0))
    {
      v15 = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "selectionOperation"))
        v23 = 0;
      else
        v23 = v8;
      if (v23 != 1)
        goto LABEL_30;
      objc_msgSend(WeakRetained, "pickedRoutes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v24, "count") != 1;

    }
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v16 && !v15)
    {
      objc_msgSend(v16, "invalidate");
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = 0;

      v19 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        *(_DWORD *)buf = 138543362;
        v30 = v20;
        _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "RCS pickedRouteDidChange caused us to drop selection %{public}@", buf, 0xCu);
      }

      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 24);
      *(_QWORD *)(v21 + 24) = 0;

    }
  }
LABEL_30:

}

- (void)pickedRouteDidChange
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MPAVRoutingControllerSelectionQueue_pickedRouteDidChange__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  -[MPAVRoutingControllerSelectionQueue _dequeue](self, "_dequeue");
}

- (void)_dequeue
{
  NSObject *serialQueue;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8481;
  v14 = __Block_byref_object_dispose__8482;
  v15 = 0;
  serialQueue = self->_serialQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(serialQueue, block);
  if (v11[5])
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v11[5];
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "RCS dequeue %{public}@", buf, 0xCu);
    }

    v7 = v11[5];
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke_481;
    v8[3] = &unk_1E31547A0;
    v8[4] = self;
    v8[5] = &v10;
    -[MPAVRoutingControllerSelectionQueue _processSelection:completion:](self, "_processSelection:completion:", v7, v8);
  }
  _Block_object_dispose(&v10, 8);

}

uint64_t __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v3 + 24))
    {
      objc_msgSend(*(id *)(v3 + 16), "firstObject");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    }
  }
  return result;
}

- (void)cancelInProgressSelectionForRoute:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8481;
  v23 = __Block_byref_object_dispose__8482;
  v24 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(serialQueue, block);
  if (v20[5])
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v20[5];
      *(_DWORD *)buf = 138543362;
      v28 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "RCS cancelling in-progress selection %{public}@", buf, 0xCu);
    }

    objc_msgSend((id)v20[5], "completion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
      objc_msgSend((id)v20[5], "completion");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2938];
      v26 = CFSTR("Route selection cancelled by MPAVRoutingController cancelInProgressSelectionForRoute:");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v14);

    }
    objc_msgSend((id)v20[5], "setCompletion:", 0);
    v15 = self->_serialQueue;
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke_468;
    v17[3] = &unk_1E3163508;
    v17[4] = self;
    dispatch_sync(v15, v17);
    objc_msgSend((id)v20[5], "routes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingControllerSelectionQueue removePendingRoutes:](self, "removePendingRoutes:", v16);

    -[MPAVRoutingControllerSelectionQueue _dequeue](self, "_dequeue");
  }
  _Block_object_dispose(&v19, 8);

}

- (void)enqueueSelectionOperation:(int64_t)a3 forRoutes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  MPAVRoutingControllerSelection *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[MPAVRoutingControllerSelection initWithRoutes:selectionOperation:]([MPAVRoutingControllerSelection alloc], "initWithRoutes:selectionOperation:", v9, a3);

  -[MPAVRoutingControllerSelection setCompletion:](v10, "setCompletion:", v8);
  -[MPAVRoutingControllerSelectionQueue _enqueue:](self, "_enqueue:", v10);

}

- (BOOL)hasPendingRoutes
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MPAVRoutingControllerSelectionQueue_hasPendingRoutes__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (MPAVRoute)pendingPickedRoute
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__8481;
  v10 = __Block_byref_object_dispose__8482;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MPAVRoutingControllerSelectionQueue_pendingPickedRoute__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPAVRoute *)v3;
}

- (NSSet)pendingPickedRoutes
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__8481;
  v10 = __Block_byref_object_dispose__8482;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MPAVRoutingControllerSelectionQueue_pendingPickedRoutes__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (BOOL)routeIsPendingPick:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MPAVRoutingControllerSelectionQueue_routeIsPendingPick___block_invoke;
  block[3] = &unk_1E31635A8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)addPendingRoutes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *serialQueue;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  os_log_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  MPAVRoutingControllerSelectionQueue *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D4D110];
  v6 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke;
  v28[3] = &unk_1E3154778;
  objc_copyWeak(&v30, &location);
  v7 = v4;
  v29 = v7;
  objc_msgSend(v5, "timerWithInterval:repeats:block:", 0, v28, 60.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  serialQueue = self->_serialQueue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke_471;
  block[3] = &unk_1E31615D0;
  v10 = v7;
  v20 = v10;
  v21 = self;
  v11 = v8;
  v22 = v11;
  v23 = &v24;
  dispatch_sync(serialQueue, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);
  v13 = WeakRetained;
  if (*((_BYTE *)v25 + 24))
  {
    v14 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    v33 = v10;
    v15 = "RCS ignoring addPendingRoute - route already pending %{public}@";
    v16 = v14;
    v17 = 12;
LABEL_4:
    _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_5;
  }
  if (!WeakRetained)
  {
    v14 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    *(_WORD *)buf = 0;
    v15 = "RCS addPendingRoute routing controller missing";
    v16 = v14;
    v17 = 2;
    goto LABEL_4;
  }
LABEL_7:
  v18 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v10;
    _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEFAULT, "RCS addPendingRoute %{public}@", buf, 0xCu);
  }

  objc_msgSend(v13, "_sendDelegatePickedRoutesChanged");
  _Block_object_dispose(&v24, 8);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)removeAllPendingRoutes
{
  id v3;

  -[NSMutableSet allObjects](self->_pendingRoutes, "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingControllerSelectionQueue removePendingRoutes:](self, "removePendingRoutes:", v3);

}

- (void)removePendingRoutes:(id)a3
{
  -[MPAVRoutingControllerSelectionQueue removePendingRoutes:withError:](self, "removePendingRoutes:withError:", a3, 1);
}

- (void)removePendingRoutes:(id)a3 withError:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *serialQueue;
  uint64_t v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id WeakRetained;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];
  _QWORD v21[4];
  id v22;
  MPAVRoutingControllerSelectionQueue *v23;
  _QWORD block[4];
  id v25;
  MPAVRoutingControllerSelectionQueue *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v4 = a4;
  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8481;
  v32 = __Block_byref_object_dispose__8482;
  v33 = 0;
  serialQueue = self->_serialQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke;
  block[3] = &unk_1E31635A8;
  v9 = v6;
  v25 = v9;
  v26 = self;
  v27 = &v28;
  dispatch_sync(serialQueue, block);
  v10 = (void *)v29[5];
  if (v10)
  {
    objc_msgSend(v10, "completion");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (v4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2938];
        v35[0] = CFSTR("Selection was cancelled due to removePendingRoute.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      ((void (**)(_QWORD, void *))v11)[2](v11, v14);

    }
    objc_msgSend((id)v29[5], "setCompletion:", 0);

  }
  v15 = self->_serialQueue;
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke_474;
  v21[3] = &unk_1E31635F8;
  v16 = v9;
  v22 = v16;
  v23 = self;
  dispatch_sync(v15, v21);
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);
  v18 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sendDelegatePickedRoutesChanged");
  }
  else
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "RCS removePendingRoute routing controller missing", v20, 2u);
    }

  }
  _Block_object_dispose(&v28, 8);

}

- (void)_enqueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  void *v35;
  void *v36;
  MPAVRoutingControllerSelectionQueue *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[4];
  id v41;
  MPAVRoutingControllerSelectionQueue *v42;
  __int128 *v43;
  _QWORD v44[4];
  id v45;
  MPAVRoutingControllerSelectionQueue *v46;
  __int128 *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[5];
  id v53;
  __int128 *p_buf;
  uint64_t v55;
  const __CFString *v56;
  __int128 v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _BYTE v62[128];
  uint64_t v63;
  const __CFString *v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "RCS enqueue %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__8481;
  v68 = __Block_byref_object_dispose__8482;
  v69 = 0;
  v7 = MEMORY[0x1E0C809B0];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke;
  block[3] = &unk_1E31635A8;
  block[4] = self;
  v9 = v4;
  v53 = v9;
  p_buf = &buf;
  dispatch_sync(serialQueue, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v37 = self;
    v10 = v9;
    v11 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      LODWORD(v57) = 138543362;
      *(_QWORD *)((char *)&v57 + 4) = v12;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "RCS will use existing selection %{public}@", (uint8_t *)&v57, 0xCu);
    }

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "completion");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v63 = *MEMORY[0x1E0CB2938];
      v64 = CFSTR("Enqueued route was cancelled because a new selection for the same route was enqueued.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 6, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v13)[2](v13, v16);

    }
    objc_msgSend(v9, "completion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setCompletion:", v17);

    v18 = objc_msgSend(v9, "selectionOperation");
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setSelectionOperation:", v18);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "routes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v23, "isPicked"))
            v24 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "selectionOperation") == 0;
          else
            v24 = 0;
          if (objc_msgSend(v23, "isPicked"))
            v25 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "selectionOperation") == 1;
          else
            v25 = 0;
          v26 = (objc_msgSend(v23, "isPicked") & 1) == 0
             && objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "selectionOperation") == 2;
          if (v24 || v25 || v26)
            objc_msgSend(v6, "addObject:", v23);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      }
      while (v20);
    }

    v9 = v10;
    self = v37;

  }
  else
  {
    *(_QWORD *)&v57 = 0;
    *((_QWORD *)&v57 + 1) = &v57;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__8481;
    v60 = __Block_byref_object_dispose__8482;
    v61 = 0;
    v27 = self->_serialQueue;
    v44[0] = v7;
    v44[1] = 3221225472;
    v44[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_477;
    v44[3] = &unk_1E31635A8;
    v28 = v9;
    v45 = v28;
    v46 = self;
    v47 = &v57;
    dispatch_sync(v27, v44);
    v29 = *(void **)(*((_QWORD *)&v57 + 1) + 40);
    if (v29 && (v30 = objc_msgSend(v29, "selectionOperation"), v30 != objc_msgSend(v28, "selectionOperation")))
    {
      v32 = self->_serialQueue;
      v40[0] = v7;
      v40[1] = 3221225472;
      v40[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_2;
      v40[3] = &unk_1E31635A8;
      v43 = &v57;
      v41 = v28;
      v42 = self;
      dispatch_sync(v32, v40);
      objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 40), "completion");
      v33 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v55 = *MEMORY[0x1E0CB2938];
        v56 = CFSTR("Route in progress was interrupted by a new selection for the same route.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("MPAVRoutingControllerErrorDomain"), 6, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v33)[2](v33, v36);

      }
      objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 40), "setCompletion:", 0);

    }
    else
    {
      v31 = self->_serialQueue;
      v38[0] = v7;
      v38[1] = 3221225472;
      v38[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_480;
      v38[3] = &unk_1E31635F8;
      v38[4] = self;
      v39 = v28;
      dispatch_sync(v31, v38);

    }
    _Block_object_dispose(&v57, 8);

  }
  -[MPAVRoutingControllerSelectionQueue removePendingRoutes:](self, "removePendingRoutes:", v6);
  -[MPAVRoutingControllerSelectionQueue _dequeue](self, "_dequeue");

  _Block_object_dispose(&buf, 8);
}

- (void)_dequeueSelectionWhenPossible
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)_processSelection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MPAVRoutingController **p_routingController;
  NSObject *WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  uint8_t buf[4];
  _BYTE v49[10];
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "routes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_msgSend(v6, "selectionOperation");
  p_routingController = &self->_routingController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);
  -[NSObject dataSource](WeakRetained, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject _clearLegacyCachedRoute](WeakRetained, "_clearLegacyCachedRoute");
  if (WeakRetained)
  {
    -[NSObject pickedRoute](WeakRetained, "pickedRoute");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (!v10)
    {
LABEL_38:
      objc_msgSend(v9, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v49 = v37;
        _os_log_impl(&dword_193B9B000, v38, OS_LOG_TYPE_DEFAULT, "RCS set picked route %{public}@", buf, 0xCu);
      }

      objc_msgSend(v13, "setPickedRoute:withPassword:completion:", v37, 0, v7);
      goto LABEL_41;
    }
    if (v10 == 2)
    {
      v29 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v49 = v9;
        _os_log_impl(&dword_193B9B000, v29, OS_LOG_TYPE_DEFAULT, "RCS remove routes %{public}@", buf, 0xCu);
      }

      objc_msgSend(v13, "removeRoutesFromGroup:completion:", v9, v7);
      goto LABEL_41;
    }
    if (v10 != 1)
    {
LABEL_41:

      goto LABEL_42;
    }
    v42 = (void *)v14;
    v16 = -[NSObject supportsMultipleSelection](WeakRetained, "supportsMultipleSelection");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v6, "routes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v18)
    {
      v19 = v18;
      v40 = v13;
      v41 = v7;
      LODWORD(v39) = v16;
      HIDWORD(v39) = v16 ^ 1;
      v20 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v23 = objc_msgSend(v22, "isDeviceSpeakerRoute", v39);
          v24 = objc_msgSend(v22, "supportsGrouping");
        }
        v25 = v24;
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v19);
      v26 = v25 ^ 1;

      if (v23)
      {
        v27 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        v13 = v40;
        v7 = v41;
        v15 = v42;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v49 = v42;
          _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_DEFAULT, "RCS cannot add local speaker route. Picked route: %{public}@", buf, 0xCu);
        }

        v28 = 1;
        goto LABEL_31;
      }
      v13 = v40;
      v7 = v41;
      v15 = v42;
      if ((v39 & 1) != 0)
      {
        if ((v25 & 1) == 0)
        {
          HIDWORD(v39) = 0;
          v28 = 0;
          v26 = 1;
LABEL_31:
          v33 = os_log_create("com.apple.amp.mediaplayer", "Routing");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_193B9B000, v33, OS_LOG_TYPE_DEFAULT, "RCS treating Add as a Set", buf, 2u);
          }

          if ((unint64_t)objc_msgSend(v9, "count") >= 2)
          {
            v34 = os_log_create("com.apple.amp.mediaplayer", "Routing");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v49 = v28;
              *(_WORD *)&v49[4] = 1024;
              *(_DWORD *)&v49[6] = HIDWORD(v39);
              v50 = 1024;
              v51 = v26;
              v52 = 2114;
              v53 = v9;
              _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_FAULT, "Set command invoked with >1 route. (localSpeakerRoute=%{BOOL}U|toNonGroupableOutputContext=%{BOOL}U|nonGroupableRoute=%{BOOL}U: %{public}@", buf, 0x1Eu);
            }

          }
          objc_msgSend(v9, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
          v36 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v36;
          goto LABEL_38;
        }
LABEL_25:
        v30 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v49 = v9;
          _os_log_impl(&dword_193B9B000, v30, OS_LOG_TYPE_DEFAULT, "RCS add routes %{public}@", buf, 0xCu);
        }

        objc_msgSend(v13, "addRoutesToGroup:completion:", v9, v7);
        goto LABEL_41;
      }
    }
    else
    {

      v15 = v42;
      if ((v16 & 1) != 0)
        goto LABEL_25;
      v26 = 0;
    }
    v31 = objc_loadWeakRetained((id *)p_routingController);

    v32 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v49 = v31;
      _os_log_impl(&dword_193B9B000, v32, OS_LOG_TYPE_DEFAULT, "RCS cannot add route to routing controller that does not support multiple selection routingController: %{public}@", buf, 0xCu);
    }

    v28 = 0;
    HIDWORD(v39) = 1;
    WeakRetained = v31;
    goto LABEL_31;
  }
  WeakRetained = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "RCS _processSelection:completion: routing controller missing", buf, 2u);
  }
LABEL_42:

}

- (MPAVRoutingController)routingController
{
  return (MPAVRoutingController *)objc_loadWeakRetained((id *)&self->_routingController);
}

- (BOOL)hasPendingPickedRoutes
{
  return self->_hasPendingPickedRoutes;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routingController);
  objc_storeStrong((id *)&self->_pendingSelectionTimers, 0);
  objc_storeStrong((id *)&self->_selectionInProgressTimer, 0);
  objc_storeStrong((id *)&self->_pendingRoutes, 0);
  objc_storeStrong((id *)&self->_selectionInProgress, 0);
  objc_storeStrong((id *)&self->_selectionsEnqueued, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke_481(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id WeakRetained;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  uint64_t v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "routes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePendingRoutes:withError:", v5, v3 != 0);

  if (v3 && (MRMediaRemoteErrorIsInformational() & 1) == 0)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2114;
      v33 = v3;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "RCS failed to process selection: %{public}@ error: %{public}@", buf, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    if (WeakRetained)
    {
      v8 = WeakRetained;
      objc_msgSend(WeakRetained, "_sendDelegatePickedRoutesChanged");
    }
    else
    {
      v20 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, "RCS _dequeue routing controller missing", buf, 2u);
      }

      v8 = 0;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "RCS successfully processed selection: %{public}@", buf, 0xCu);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "routes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = a1;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v27 = CFSTR("MPAVRoutingControllerRouteUserInfoKey");
          v28 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("MPAVRoutingControllerDidPickRouteNotification"), *(_QWORD *)(v11 + 32), v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v10);
      a1 = v11;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completion");
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v22)[2](v22, v3);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCompletion:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_dequeueSelectionWhenPossible");

}

void __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D4D110];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_2;
  v6[3] = &unk_1E315E5D0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v2, "timerWithInterval:repeats:block:", 0, v6, 0.25);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_3;
    block[3] = &unk_1E3163508;
    block[4] = v2;
    dispatch_sync(v3, block);
    v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v2[3];
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "RCS _dequeueSelectionWhenPossible timed out for selection %{public}@", buf, 0xCu);
    }

    objc_msgSend(v2, "_dequeue");
  }

}

void __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

void __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "routes", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "routes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_477(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "routes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "routes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 40) + 24));
}

uint64_t __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v4 = a1[4];
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "RCS changing selection in progress from %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[5] + 16), "insertObject:atIndex:", a1[4], 0);
}

uint64_t __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_480(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    *(_QWORD *)&v4 = 138543362;
    v12 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", v8, v12, (_QWORD)v13))
        {
          v9 = os_log_create("com.apple.amp.mediaplayer", "Routing");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            v18 = v8;
            _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "RCS removePendingRoute %{public}@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", v8);
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "routes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11);

  if ((_DWORD)v10)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 40) + 24));
}

void __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke_474(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", v7, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "invalidate");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObjectForKey:", v7);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "RCS pending route timed out %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "removePendingRoutes:", *(_QWORD *)(a1 + 32));
}

void __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke_471(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKey:", *(_QWORD *)(a1 + 48), v7, (_QWORD)v8);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __58__MPAVRoutingControllerSelectionQueue_routeIsPendingPick___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isEqual:", a1[5], (_QWORD)v7))
        {
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __58__MPAVRoutingControllerSelectionQueue_pendingPickedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__MPAVRoutingControllerSelectionQueue_pendingPickedRoute__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "anyObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__MPAVRoutingControllerSelectionQueue_hasPendingRoutes__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke_468(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

@end
