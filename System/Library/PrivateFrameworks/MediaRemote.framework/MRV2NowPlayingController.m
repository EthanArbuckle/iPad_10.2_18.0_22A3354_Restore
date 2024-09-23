@implementation MRV2NowPlayingController

- (MRV2NowPlayingController)initWithConfiguration:(id)a3
{
  id v4;
  MRV2NowPlayingController *v5;
  uint64_t v6;
  MRNowPlayingControllerConfiguration *configuration;
  MRNowPlayingControllerDestination *v8;
  MRNowPlayingControllerDestination *destination;
  NSMutableArray *v10;
  NSMutableArray *deferredContentItemsToMerge;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSString *label;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MRV2NowPlayingController;
  v5 = -[MRV2NowPlayingController init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (MRNowPlayingControllerConfiguration *)v6;

    v8 = -[MRNowPlayingControllerDestination initWithConfiguration:]([MRNowPlayingControllerDestination alloc], "initWithConfiguration:", v4);
    destination = v5->_destination;
    v5->_destination = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredContentItemsToMerge = v5->_deferredContentItemsToMerge;
    v5->_deferredContentItemsToMerge = v10;

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = objc_opt_class();
    objc_msgSend(v4, "label");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_1E30D5AF8;
    if (v14)
      v16 = (const __CFString *)v14;
    v17 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@<%p>:%@"), v13, v5, v16);
    label = v5->_label;
    v5->_label = (NSString *)v17;

    if (initWithConfiguration____onceToken != -1)
      dispatch_once(&initWithConfiguration____onceToken, &__block_literal_global_36);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRV2NowPlayingController.queue", v19, (dispatch_queue_t)initWithConfiguration____globalQueue);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v20;

  }
  return v5;
}

void __50__MRV2NowPlayingController_initWithConfiguration___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaRemote.MRV2NowPlayingController.globalQueue", v2);
  v1 = (void *)initWithConfiguration____globalQueue;
  initWithConfiguration____globalQueue = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  MRNowPlayingControllerHelper *helper;
  objc_super v6;
  uint8_t buf[4];
  MRV2NowPlayingController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_updateLoadingEnabled)
  {
    _MRLogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> End loading updates", buf, 0xCu);
    }

  }
  _MRLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  helper = self->_helper;
  self->_helper = 0;

  -[MRV2NowPlayingController setQueue:](self, "setQueue:", 0);
  -[MRV2NowPlayingController _onQueue_clearAllState](self, "_onQueue_clearAllState");
  v6.receiver = self;
  v6.super_class = (Class)MRV2NowPlayingController;
  -[MRV2NowPlayingController dealloc](&v6, sel_dealloc);
}

- (void)beginLoadingUpdates
{
  NSObject *v4;
  _QWORD v5[6];

  -[MRV2NowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MRV2NowPlayingController_beginLoadingUpdates__block_invoke;
  v5[3] = &unk_1E30C78E0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t __47__MRV2NowPlayingController_beginLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 20))
  {
    v1 = result;
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      *(_DWORD *)buf = 138412290;
      v6 = v3;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> Begin loading updates", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(v1 + 32), "isLoading"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 32), CFSTR("MRV2NowPlayingController.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.isLoading"));

    }
    return objc_msgSend(*(id *)(v1 + 32), "_reloadWithReason:", CFSTR("Begin"));
  }
  return result;
}

- (void)destinationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MRV2NowPlayingController_destinationWithCompletion___block_invoke;
  v7[3] = &unk_1E30C5B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__MRV2NowPlayingController_destinationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resolveForConfiguration:requestID:completion:", v3, CFSTR("destinationWithCompletion"), *(_QWORD *)(a1 + 40));

}

- (MRNowPlayingControllerDestination)destination
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
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  -[MRV2NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MRV2NowPlayingController_destination__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingControllerDestination *)v4;
}

void __39__MRV2NowPlayingController_destination__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)debugDescription
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
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  -[MRV2NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MRV2NowPlayingController_debugDescription__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __44__MRV2NowPlayingController_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  v2 = objc_opt_class();
  v3 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(v3 + 32);
  v18 = v2;
  v16 = *(unsigned __int8 *)(v3 + 20);
  v4 = *(unsigned __int8 *)(v3 + 24);
  objc_msgSend((id)v3, "endpointObserver");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playerPathInvalidationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "registeredForNotifications");
  objc_msgSend(*(id *)(a1 + 32), "needsImmediateReloadReason");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("None");
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "remainingIntervals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v19, "initWithFormat:", CFSTR("<%@ %p {\n   currentDestination=%@\n   updateLoadingEnabled=%u\n   loading=%u\n   endpointObserver=%@\n   playerPathInvalidationHandler=%@\n   registeredForNotifications=%u\n   needsImmediateReloadReason=%@\n   pendingDestination=%@\n   loadRetryTimer = %@}>\n"), v18, v3, v17, v16, v4, v20, v5, v6, v9, v10, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

- (void)_reloadWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  MRV2NowPlayingController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (self->_incrementingRequestID + 1);
  self->_incrementingRequestID = v9;
  v10 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%d"), v8, v9);

  _MRLogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ reloading<%@> for reason %@", buf, 0x20u);
  }

  -[MRV2NowPlayingController _notifyDelegateOfInvalidation](self, "_notifyDelegateOfInvalidation");
  -[MRV2NowPlayingController configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__MRV2NowPlayingController__reloadWithReason___block_invoke;
  v13[3] = &unk_1E30C7958;
  v13[4] = self;
  -[MRV2NowPlayingController _loadNowPlayingStateForConfiguration:requestID:completion:](self, "_loadNowPlayingStateForConfiguration:requestID:completion:", v12, v10, v13);

}

void __46__MRV2NowPlayingController__reloadWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v7, "cancelableOperations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "_configureReloadTimerForError:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", v5);
  }
  else
  {
    v9 = (void *)v7[10];
    v7[10] = 0;

    objc_msgSend(v10, "setDestination:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewResponse:", v10);
  }

}

- (void)_loadNowPlayingStateForConfiguration:(id)a3 requestID:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  MRBlockGuard *v15;
  uint64_t v16;
  id v17;
  id v18;
  MRBlockGuard *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  MRBlockGuard *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  MRBlockGuard *v41;
  MRV2NowPlayingController *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MRV2NowPlayingController queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (-[MRV2NowPlayingController isLoading](self, "isLoading"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRV2NowPlayingController.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.isLoading"));

  }
  -[MRV2NowPlayingController setIsLoading:](self, "setIsLoading:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.LoadForConfiguration<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MRBlockGuard alloc];
  v16 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke;
  v44[3] = &unk_1E30C7000;
  v17 = v13;
  v45 = v17;
  v18 = v10;
  v46 = v18;
  v19 = -[MRBlockGuard initWithTimeout:reason:handler:](v15, "initWithTimeout:reason:handler:", v17, v44, 60.0);
  v36[0] = v16;
  v36[1] = 3221225472;
  v36[2] = __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40;
  v36[3] = &unk_1E30C8EA0;
  v20 = v9;
  v37 = v20;
  v21 = v17;
  v38 = v21;
  v22 = v18;
  v39 = v22;
  v23 = v14;
  v40 = v23;
  v24 = v19;
  v41 = v24;
  v25 = v11;
  v42 = self;
  v43 = v25;
  v26 = (void *)MEMORY[0x194036C44](v36);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v21, v22);
  v28 = v27;
  if (v20)
    objc_msgSend(v27, "appendFormat:", CFSTR(" for %@"), v20);
  _MRLogForCategory(0xAuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v28;
    _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_50;
  v33[3] = &unk_1E30C8EC8;
  v34 = v22;
  v35 = v26;
  v33[4] = self;
  v30 = v22;
  v31 = v26;
  -[MRV2NowPlayingController _resolveForConfiguration:requestID:completion:](self, "_resolveForConfiguration:requestID:completion:", v20, v30, v33);

}

void __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xAuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543874;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = CFSTR("Its been 60 seconds and still waiting for response..");
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }

}

void __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v5);
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  _MRLogForCategory(0xAuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6 && v7)
  {
    v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v34 = v12;
        v35 = 2114;
        v36 = v13;
        v37 = 2112;
        v38 = v7;
        v39 = 2114;
        v40 = v8;
        v41 = 2048;
        v42 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v10;
        v18 = 52;
LABEL_19:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_20;
      }
      goto LABEL_25;
    }
    if (!v11)
      goto LABEL_25;
    v27 = *(_QWORD *)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v34 = v27;
    v35 = 2114;
    v36 = v28;
    v37 = 2112;
    v38 = v7;
    v39 = 2048;
    v40 = v29;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_18:
    v17 = v10;
    v18 = 42;
    goto LABEL_19;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v19)
      {
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v34 = v20;
        v35 = 2114;
        v36 = v21;
        v37 = 2114;
        v38 = v6;
        v39 = 2114;
        v40 = v8;
        v41 = 2048;
        v42 = v22;
        _os_log_error_impl(&dword_193827000, v10, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

        goto LABEL_25;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v10);
    }
    goto LABEL_25;
  }
  v23 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v23)
      goto LABEL_25;
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138543874;
    v34 = v30;
    v35 = 2114;
    v36 = v31;
    v37 = 2048;
    v38 = v32;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v10;
    v18 = 32;
    goto LABEL_19;
  }
  if (v23)
  {
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v34 = v24;
    v35 = 2114;
    v36 = v25;
    v37 = 2114;
    v38 = v8;
    v39 = 2048;
    v40 = v26;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_18;
  }
LABEL_25:

  objc_msgSend(*(id *)(a1 + 64), "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  objc_msgSend(*(id *)(a1 + 72), "setIsLoading:", 0);

}

uint64_t __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_loadNowPlayingStateForResolvedPlayerPath:requestID:completion:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_resolveForConfiguration:(id)a3 requestID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MRBlockGuard *v13;
  uint64_t v14;
  id v15;
  id v16;
  MRBlockGuard *v17;
  id v18;
  id v19;
  id v20;
  MRBlockGuard *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  MRNowPlayingControllerDestination *destination;
  void *v34;
  MRNowPlayingControllerDestination *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MRV2NowPlayingController *v45;
  void *v46;
  void *v47;
  void *v48;
  MRV2NowPlayingController *v49;
  void *v50;
  void *v51;
  MRV2NowPlayingController *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  MRBlockGuard *v70;
  id v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  MRBlockGuard *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.resolveForConfiguration<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [MRBlockGuard alloc];
  v14 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke;
  v78[3] = &unk_1E30C7000;
  v15 = v11;
  v79 = v15;
  v16 = v9;
  v80 = v16;
  v17 = -[MRBlockGuard initWithTimeout:reason:handler:](v13, "initWithTimeout:reason:handler:", v15, v78, 60.0);
  v72[0] = v14;
  v72[1] = 3221225472;
  v72[2] = __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke_54;
  v72[3] = &unk_1E30C8EF0;
  v72[4] = self;
  v18 = v15;
  v73 = v18;
  v19 = v16;
  v74 = v19;
  v20 = v12;
  v75 = v20;
  v21 = v17;
  v22 = v8;
  v70 = v21;
  v76 = v21;
  v71 = v10;
  v77 = v71;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v72);
  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "destination");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@->%@"), v25, self->_destination);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v18, v19);
  v28 = v27;
  if (v26)
    objc_msgSend(v27, "appendFormat:", CFSTR(" for %@"), v26);
  _MRLogForCategory(0xAuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v82 = v28;
    _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRNowPlayingControllerDestination resolvedPlayerPath](self->_destination, "resolvedPlayerPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MRNowPlayingControllerDestination resolvedPlayerPath](self->_destination, "resolvedPlayerPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v23)[2](v23, v31, 0);
    goto LABEL_22;
  }
  -[MRNowPlayingControllerDestination unresolvedPlayerPath](self->_destination, "unresolvedPlayerPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  destination = self->_destination;
  if (!v32)
  {
    -[MRDestination endpoint](destination, "endpoint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = self->_destination;
    if (v34)
    {
      -[MRDestination endpoint](v35, "endpoint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRV2NowPlayingController configuration](self, "configuration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "destination");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "playerPath");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "client");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRV2NowPlayingController configuration](self, "configuration");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "destination");
      v66 = v22;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "playerPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "player");
      v68 = v20;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRV2NowPlayingController _resolveForEndpoint:client:player:requestID:completion:](self, "_resolveForEndpoint:client:player:requestID:completion:", v31, v55, v38, v19, v23);

      v20 = v68;
      v22 = v66;

      goto LABEL_22;
    }
    if (-[MRNowPlayingControllerDestination isEndpointSet](v35, "isEndpointSet"))
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 24, CFSTR("endpoint observer returned a nil endpoint"));
      ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, 0, v31);
      goto LABEL_22;
    }
    v69 = v20;
    objc_msgSend(v22, "destination");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "outputDeviceUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "destination");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v41;
    v67 = v22;
    if (v40)
    {
      objc_msgSend(v41, "outputDeviceUID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "destination");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "playerPath");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "client");
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "destination");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "playerPath");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "player");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = self;
      v46 = (void *)v57;
      -[MRV2NowPlayingController _resolveForOutputDeviceUID:client:player:requestID:completion:](v45, "_resolveForOutputDeviceUID:client:player:requestID:completion:", v65, v57, v44, v19, v23);
    }
    else
    {
      objc_msgSend(v41, "outputContextUID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "destination");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v48;
      if (v47)
      {
        objc_msgSend(v48, "outputContextUID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "destination");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "playerPath");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "client");
        v58 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "destination");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "playerPath");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "player");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = self;
        v46 = (void *)v58;
        -[MRV2NowPlayingController _resolveForOutputContextUID:client:player:requestID:completion:](v49, "_resolveForOutputContextUID:client:player:requestID:completion:", v65, v58, v44, v19, v23);
      }
      else
      {
        objc_msgSend(v48, "endpoint");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "destination");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v51;
        if (!v50)
        {
          objc_msgSend(v51, "playerPath");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            objc_msgSend(v22, "destination");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "playerPath");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[MRV2NowPlayingController _resolveForUnresolvedPlayerPath:requestID:completion:](self, "_resolveForUnresolvedPlayerPath:requestID:completion:", v54, v19, v23);

          }
          else
          {
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 2, CFSTR("no destination information in configuration"));
            ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, 0, v31);
          }
          goto LABEL_21;
        }
        objc_msgSend(v51, "endpoint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "destination");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "playerPath");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "client");
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "destination");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "playerPath");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "player");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = self;
        v46 = (void *)v59;
        -[MRV2NowPlayingController _resolveForEndpoint:client:player:requestID:completion:](v52, "_resolveForEndpoint:client:player:requestID:completion:", v65, v59, v44, v19, v23);
      }
    }

    v22 = v67;
LABEL_21:
    v20 = v69;
    goto LABEL_22;
  }
  -[MRNowPlayingControllerDestination unresolvedPlayerPath](destination, "unresolvedPlayerPath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV2NowPlayingController _resolveForUnresolvedPlayerPath:requestID:completion:](self, "_resolveForUnresolvedPlayerPath:requestID:completion:", v31, v19, v23);
LABEL_22:

}

void __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xAuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543874;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = CFSTR("Its been 60 seconds and still waiting for response..");
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }

}

void __74__MRV2NowPlayingController__resolveForConfiguration_requestID_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v35 = 138544386;
        v36 = v12;
        v37 = 2114;
        v38 = v11;
        v39 = 2112;
        v40 = v5;
        v41 = 2114;
        v42 = v13;
        v43 = 2048;
        v44 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v35 = 138544130;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    v39 = 2112;
    v40 = v5;
    v41 = 2048;
    v42 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v35 = 138544386;
        v36 = v21;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v6;
        v41 = 2114;
        v42 = v22;
        v43 = 2048;
        v44 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 40);
    v33 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v35 = 138543874;
    v36 = v32;
    v37 = 2114;
    v38 = v33;
    v39 = 2048;
    v40 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v27 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v35 = 138544130;
    v36 = v26;
    v37 = 2114;
    v38 = v25;
    v39 = 2114;
    v40 = v27;
    v41 = 2048;
    v42 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  objc_msgSend(*(id *)(a1 + 64), "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_resolveForOutputDeviceUID:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  MRV2NowPlayingController *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MRV2NowPlayingController queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.resolveForOutputDevice<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke;
  v41[3] = &unk_1E30C7E58;
  v31 = v16;
  v42 = v31;
  v20 = (void *)MEMORY[0x194036C44](v41);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v18, v15);
  v22 = v21;
  if (v12)
    objc_msgSend(v21, "appendFormat:", CFSTR(" for %@"), v12);
  _MRLogForCategory(0xAuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v22;
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke_64;
  v32[3] = &unk_1E30C8F18;
  v33 = v12;
  v34 = v18;
  v35 = v15;
  v36 = v19;
  v37 = self;
  v38 = v13;
  v39 = v14;
  v40 = v20;
  v24 = v20;
  v25 = v14;
  v26 = v13;
  v27 = v19;
  v28 = v15;
  v29 = v18;
  v30 = v12;
  -[MRV2NowPlayingController _onQueue_retrieveEndpointForUID:completion:](self, "_onQueue_retrieveEndpointForUID:completion:", v30, v32);

}

uint64_t __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MRV2NowPlayingController__resolveForOutputDeviceUID_client_player_requestID_completion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138544386;
        v40 = v18;
        v41 = 2114;
        v42 = v19;
        v43 = 2112;
        v44 = v13;
        v45 = 2114;
        v46 = v20;
        v47 = 2048;
        v48 = v22;
        v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v24 = v8;
        v25 = 52;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v33 = *(_QWORD *)(a1 + 40);
        v34 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138544130;
        v40 = v33;
        v41 = 2114;
        v42 = v34;
        v43 = 2112;
        v44 = v13;
        v45 = 2048;
        v46 = v35;
        v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v24 = v8;
        v25 = 42;
      }
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v39, v25);

    }
    else
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v27 = *(_QWORD *)(a1 + 40);
        v26 = *(_QWORD *)(a1 + 48);
        v28 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138544130;
        v40 = v27;
        v41 = 2114;
        v42 = v26;
        v43 = 2114;
        v44 = v28;
        v45 = 2048;
        v46 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 40);
        v37 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138543874;
        v40 = v36;
        v41 = 2114;
        v42 = v37;
        v43 = 2048;
        v44 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, v32);
    }
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v39 = 138544386;
    v40 = v11;
    v41 = 2114;
    v42 = v10;
    v43 = 2114;
    v44 = v6;
    v45 = 2114;
    v46 = v12;
    v47 = 2048;
    v48 = v14;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v8);
LABEL_21:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 32), "setEndpoint:", v5);
  objc_msgSend(*(id *)(a1 + 64), "_registerForEndpointChangesForOutputDeviceUID:", *(_QWORD *)(a1 + 32));
  if (v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 64), "_resolveForEndpoint:client:player:requestID:completion:", v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88));

}

- (void)_resolveForOutputContextUID:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  MRV2NowPlayingController *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[MRV2NowPlayingController queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.resolveForOutputContextUID<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __91__MRV2NowPlayingController__resolveForOutputContextUID_client_player_requestID_completion___block_invoke;
  v31[3] = &unk_1E30C8F18;
  v20 = v12;
  v32 = v20;
  v21 = v18;
  v33 = v21;
  v22 = v15;
  v34 = v22;
  v23 = v19;
  v35 = v23;
  v36 = self;
  v30 = v13;
  v37 = v30;
  v24 = v14;
  v38 = v24;
  v25 = v16;
  v39 = v25;
  v26 = (void *)MEMORY[0x194036C44](v31);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v21, v22);
  v28 = v27;
  if (v20)
    objc_msgSend(v27, "appendFormat:", CFSTR(" for %@"), v20);
  _MRLogForCategory(0xAuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v28;
    _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRV2NowPlayingController _onQueue_retrieveEndpointForContextUID:completion:](self, "_onQueue_retrieveEndpointForContextUID:completion:", v20, v26);
}

void __91__MRV2NowPlayingController__resolveForOutputContextUID_client_player_requestID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138544386;
        v40 = v18;
        v41 = 2114;
        v42 = v19;
        v43 = 2112;
        v44 = v13;
        v45 = 2114;
        v46 = v20;
        v47 = 2048;
        v48 = v22;
        v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v24 = v8;
        v25 = 52;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v33 = *(_QWORD *)(a1 + 40);
        v34 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138544130;
        v40 = v33;
        v41 = 2114;
        v42 = v34;
        v43 = 2112;
        v44 = v13;
        v45 = 2048;
        v46 = v35;
        v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v24 = v8;
        v25 = 42;
      }
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v39, v25);

    }
    else
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v27 = *(_QWORD *)(a1 + 40);
        v26 = *(_QWORD *)(a1 + 48);
        v28 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138544130;
        v40 = v27;
        v41 = 2114;
        v42 = v26;
        v43 = 2114;
        v44 = v28;
        v45 = 2048;
        v46 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 40);
        v37 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v39 = 138543874;
        v40 = v36;
        v41 = 2114;
        v42 = v37;
        v43 = 2048;
        v44 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, v32);
    }
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v39 = 138544386;
    v40 = v11;
    v41 = 2114;
    v42 = v10;
    v43 = 2114;
    v44 = v6;
    v45 = 2114;
    v46 = v12;
    v47 = 2048;
    v48 = v14;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v8);
LABEL_21:

  if (v5)
    objc_msgSend(*(id *)(a1 + 64), "_resolveForEndpoint:client:player:requestID:completion:", v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

- (void)_resolveForEndpoint:(id)a3 client:(id)a4 player:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  MRBlockGuard *v18;
  uint64_t v19;
  id v20;
  id v21;
  MRBlockGuard *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  MRV2NowPlayingController *v41;
  id v42;
  _QWORD v43[4];
  MRBlockGuard *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v35 = a5;
  v34 = a4;
  -[MRV2NowPlayingController queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.resolveForEndpoint<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [MRBlockGuard alloc];
  v19 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke;
  v46[3] = &unk_1E30C7000;
  v20 = v16;
  v47 = v20;
  v21 = v13;
  v48 = v21;
  v43[0] = v19;
  v43[1] = 3221225472;
  v43[2] = __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_70;
  v43[3] = &unk_1E30C79F8;
  v22 = -[MRBlockGuard initWithTimeout:reason:handler:](v18, "initWithTimeout:reason:handler:", v20, v46, 60.0);
  v44 = v22;
  v23 = v14;
  v45 = v23;
  v24 = (void *)MEMORY[0x194036C44](v43);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v20, v21);
  objc_msgSend(v12, "debugName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v12, "debugName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendFormat:", CFSTR(" for %@"), v27);

  }
  _MRLogForCategory(0xAuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v25;
    _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_71;
  v36[3] = &unk_1E30C8EF0;
  v37 = v12;
  v38 = v20;
  v39 = v21;
  v40 = v17;
  v41 = self;
  v42 = v24;
  v29 = v24;
  v30 = v17;
  v31 = v21;
  v32 = v20;
  v33 = v12;
  -[MRV2NowPlayingController _createUnresolvedPlayerPathForEndpoint:client:player:completion:](self, "_createUnresolvedPlayerPathForEndpoint:client:player:completion:", v33, v34, v35, v36);

}

void __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xAuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543874;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = CFSTR("Its been 60 seconds and still waiting for response..");
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }

}

void __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__MRV2NowPlayingController__resolveForEndpoint_client_player_requestID_completion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "debugName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10)
        goto LABEL_25;
      v12 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v40 = 138544386;
      v41 = v12;
      v42 = 2114;
      v43 = v11;
      v44 = 2112;
      v45 = v5;
      v46 = 2114;
      v47 = v13;
      v48 = 2048;
      v49 = v15;
      v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v17 = v9;
      v18 = 52;
LABEL_13:
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v40, v18);

LABEL_24:
LABEL_25:

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 32), "setUnresolvedPlayerPath:", v5);
      objc_msgSend(*(id *)(a1 + 64), "_registerForEndpointInvalidations:", *(_QWORD *)(a1 + 32));
      if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
      {
        objc_msgSend(*(id *)(a1 + 64), "_resolveForUnresolvedPlayerPath:requestID:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
      }
      else
      {
        v38 = *(_QWORD *)(a1 + 72);
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 121, CFSTR("connection succeded but then shortly after disconnected"));
        (*(void (**)(uint64_t, _QWORD, void *))(v38 + 16))(v38, 0, v39);

      }
      goto LABEL_28;
    }
    if (!v10)
      goto LABEL_25;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v40 = 138544130;
    v41 = v29;
    v42 = 2114;
    v43 = v30;
    v44 = 2112;
    v45 = v5;
    v46 = 2048;
    v47 = v31;
    v32 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v33 = v9;
    v34 = 42;
    goto LABEL_23;
  }
  if (!v6)
  {
    v25 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v25)
        goto LABEL_25;
      v27 = *(_QWORD *)(a1 + 40);
      v26 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v40 = 138544130;
      v41 = v27;
      v42 = 2114;
      v43 = v26;
      v44 = 2114;
      v45 = v13;
      v46 = 2048;
      v47 = v28;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v17 = v9;
      v18 = 42;
      goto LABEL_13;
    }
    if (!v25)
      goto LABEL_25;
    v35 = *(_QWORD *)(a1 + 40);
    v36 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v40 = 138543874;
    v41 = v35;
    v42 = 2114;
    v43 = v36;
    v44 = 2048;
    v45 = v37;
    v32 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v33 = v9;
    v34 = 32;
LABEL_23:
    _os_log_impl(&dword_193827000, v33, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v40, v34);
    goto LABEL_24;
  }
  v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v19)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "debugName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v40 = 138544386;
      v41 = v21;
      v42 = 2114;
      v43 = v20;
      v44 = 2114;
      v45 = v6;
      v46 = 2114;
      v47 = v22;
      v48 = 2048;
      v49 = v24;
      _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v40, 0x34u);

    }
  }
  else if (v19)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 32), "setUnresolvedPlayerPath:", v5);
  if (objc_msgSend(v6, "code") == 24)
    objc_msgSend(*(id *)(a1 + 64), "_onQueue_clearStateForEndpoint");
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_28:

}

- (void)_resolveForUnresolvedPlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  MRBlockGuard *v14;
  uint64_t v15;
  id v16;
  id v17;
  MRBlockGuard *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  MRV2NowPlayingController *v34;
  id v35;
  _QWORD v36[4];
  MRBlockGuard *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MRV2NowPlayingController queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.resolveForUnresolvedPlayerPath<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [MRBlockGuard alloc];
  v15 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke;
  v39[3] = &unk_1E30C7000;
  v16 = v12;
  v40 = v16;
  v17 = v9;
  v41 = v17;
  v36[0] = v15;
  v36[1] = 3221225472;
  v36[2] = __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_76;
  v36[3] = &unk_1E30C79F8;
  v18 = -[MRBlockGuard initWithTimeout:reason:handler:](v14, "initWithTimeout:reason:handler:", v16, v39, 60.0);
  v37 = v18;
  v19 = v10;
  v38 = v19;
  v20 = (void *)MEMORY[0x194036C44](v36);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v16, v17);
  v22 = v21;
  if (v8)
    objc_msgSend(v21, "appendFormat:", CFSTR(" for %@"), v8);
  _MRLogForCategory(0xAuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v22;
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRV2NowPlayingController _registerForPlayerPathInvalidationsForUnresolvedPlayerPath:](self, "_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:", v8);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_77;
  v29[3] = &unk_1E30C8EF0;
  v30 = v8;
  v31 = v16;
  v32 = v17;
  v33 = v13;
  v34 = self;
  v35 = v20;
  v24 = v20;
  v25 = v13;
  v26 = v17;
  v27 = v16;
  v28 = v8;
  -[MRV2NowPlayingController _resolvePlayerPath:requestID:completion:](self, "_resolvePlayerPath:requestID:completion:", v28, v26, v29);

}

void __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xAuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543874;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = CFSTR("Its been 60 seconds and still waiting for response..");
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }

}

void __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81__MRV2NowPlayingController__resolveForUnresolvedPlayerPath_requestID_completion___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v37 = 138544386;
        v38 = v12;
        v39 = 2114;
        v40 = v11;
        v41 = 2112;
        v42 = v5;
        v43 = 2114;
        v44 = v13;
        v45 = 2048;
        v46 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v37, v18);

      }
LABEL_17:

      objc_msgSend(*(id *)(a1 + 64), "onQueue_setResolvedPlayerPath:", v5);
      v33 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
      goto LABEL_23;
    }
    if (!v10)
      goto LABEL_17;
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v37 = 138544130;
    v38 = v30;
    v39 = 2114;
    v40 = v31;
    v41 = 2112;
    v42 = v5;
    v43 = 2048;
    v44 = v32;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (!v6)
  {
    v25 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (!v25)
        goto LABEL_17;
      v34 = *(_QWORD *)(a1 + 40);
      v35 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v37 = 138543874;
      v38 = v34;
      v39 = 2114;
      v40 = v35;
      v41 = 2048;
      v42 = v36;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v9;
      v18 = 32;
      goto LABEL_16;
    }
    if (!v25)
      goto LABEL_17;
    v27 = *(_QWORD *)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 48);
    v28 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v37 = 138544130;
    v38 = v27;
    v39 = 2114;
    v40 = v26;
    v41 = 2114;
    v42 = v28;
    v43 = 2048;
    v44 = v29;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
  v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v19)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v37 = 138544386;
      v38 = v21;
      v39 = 2114;
      v40 = v20;
      v41 = 2114;
      v42 = v6;
      v43 = 2114;
      v44 = v22;
      v45 = 2048;
      v46 = v24;
      _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v37, 0x34u);

    }
  }
  else if (v19)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
  }

  if (objc_msgSend(v6, "code") == 5)
  {
    objc_msgSend(*(id *)(a1 + 64), "_unregisterForPlayerPathInvalidations");
    objc_msgSend(*(id *)(a1 + 64), "_onQueue_clearStateForUnresolvedPlayerPath");
  }
  v33 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_23:
  v33();

}

- (void)_loadNowPlayingStateForResolvedPlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  MRBlockGuard *v15;
  uint64_t v16;
  id v17;
  id v18;
  MRBlockGuard *v19;
  id v20;
  id v21;
  id v22;
  MRBlockGuard *v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  MRV2NowPlayingController *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  MRBlockGuard *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MRV2NowPlayingController queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if ((objc_msgSend(v9, "isResolved") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRV2NowPlayingController.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolvedPlayerPath.isResolved"));

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.LoadForResolvedPlayerPath<%p>"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [MRBlockGuard alloc];
  v16 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke;
  v50[3] = &unk_1E30C7000;
  v17 = v13;
  v51 = v17;
  v18 = v10;
  v52 = v18;
  v19 = -[MRBlockGuard initWithTimeout:reason:handler:](v15, "initWithTimeout:reason:handler:", v17, v50, 60.0);
  v43[0] = v16;
  v43[1] = 3221225472;
  v43[2] = __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_82;
  v43[3] = &unk_1E30C8F40;
  v20 = v9;
  v44 = v20;
  v21 = v17;
  v45 = v21;
  v22 = v18;
  v46 = v22;
  v37 = v14;
  v47 = v37;
  v23 = v19;
  v48 = v23;
  v24 = v11;
  v49 = v24;
  v25 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v43);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v21, v22);
  v27 = v26;
  if (v20)
    objc_msgSend(v26, "appendFormat:", CFSTR(" for %@"), v20);
  _MRLogForCategory(0xAuLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v27;
    _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRV2NowPlayingController _registerNotificationHandlersForResolvedPlayerPath:](self, "_registerNotificationHandlersForResolvedPlayerPath:", v20);
  v42 = 0;
  -[MRV2NowPlayingController _loadNowPlayingStateForPlayerPath:error:](self, "_loadNowPlayingStateForPlayerPath:error:", v20, &v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v42;
  if (!v30
    && -[MRV2NowPlayingController shouldDeferArtworkRequestForConfiguration:](self, "shouldDeferArtworkRequestForConfiguration:", self->_configuration))
  {
    -[MRV2NowPlayingController cancelableOperations](self, "cancelableOperations");
    v36 = v24;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRV2NowPlayingController queue](self, "queue");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_83;
    block[3] = &unk_1E30C7328;
    v39 = v29;
    v40 = self;
    v41 = v31;
    v32 = v31;
    v24 = v36;
    v34 = v32;
    dispatch_async(v35, block);

  }
  ((void (**)(_QWORD, void *, id))v25)[2](v25, v29, v30);

}

void __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xAuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543874;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    v9 = 2112;
    v10 = CFSTR("Its been 60 seconds and still waiting for response..");
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v5, 0x20u);
  }

}

void __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v35 = 138544386;
        v36 = v12;
        v37 = 2114;
        v38 = v11;
        v39 = 2112;
        v40 = v5;
        v41 = 2114;
        v42 = v13;
        v43 = 2048;
        v44 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v35 = 138544130;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    v39 = 2112;
    v40 = v5;
    v41 = 2048;
    v42 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v35 = 138544386;
        v36 = v21;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v6;
        v41 = 2114;
        v42 = v22;
        v43 = 2048;
        v44 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 40);
    v33 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v35 = 138543874;
    v36 = v32;
    v37 = 2114;
    v38 = v33;
    v39 = 2048;
    v40 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v27 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v35 = 138544130;
    v36 = v26;
    v37 = 2114;
    v38 = v25;
    v39 = 2114;
    v40 = v27;
    v41 = 2048;
    v42 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  objc_msgSend(*(id *)(a1 + 64), "disarm");
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_83(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_map:", &__block_literal_global_85);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_requestPlaybackQueueArtworkForIdentifiers:operationQueue:", v4, *(_QWORD *)(a1 + 48));
}

uint64_t __91__MRV2NowPlayingController__loadNowPlayingStateForResolvedPlayerPath_requestID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  id v19;
  void *v20;
  MRNowPlayingPlayerResponse *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  int v93;

  v6 = a3;
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__11;
  v88 = __Block_byref_object_dispose__11;
  v89 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__11;
  v82 = __Block_byref_object_dispose__11;
  v83 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__11;
  v76 = __Block_byref_object_dispose__11;
  v77 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__11;
  v70 = __Block_byref_object_dispose__11;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__11;
  v64 = __Block_byref_object_dispose__11;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__11;
  v58 = __Block_byref_object_dispose__11;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__11;
  v52 = __Block_byref_object_dispose__11;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__11;
  v46 = __Block_byref_object_dispose__11;
  v47 = 0;
  v7 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MediaRemote.MRV2NowPlayingController.callbackQueue", v8);

  -[MRV2NowPlayingController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "requestSupportedCommands");

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    dispatch_group_enter(v7);
    v38[0] = v12;
    v38[1] = 3221225472;
    v38[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
    v38[3] = &unk_1E30C7A20;
    v40 = &v72;
    v41 = &v66;
    v39 = v7;
    -[MRV2NowPlayingController _requestSupportedCommandsForPlayerPath:queue:completion:](self, "_requestSupportedCommandsForPlayerPath:queue:completion:", v6, v9, v38);

  }
  -[MRV2NowPlayingController configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requestPlaybackState");

  if (v14)
  {
    dispatch_group_enter(v7);
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
    v35[3] = &unk_1E30C7A48;
    v37 = &v90;
    v36 = v7;
    MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v35);

  }
  -[MRV2NowPlayingController configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playbackQueueRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    dispatch_group_enter(v7);
    -[MRV2NowPlayingController effectivePlaybackQueueRequest](self, "effectivePlaybackQueueRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v12;
    v31[1] = 3221225472;
    v31[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
    v31[3] = &unk_1E30C8F68;
    v33 = &v84;
    v34 = &v78;
    v32 = v7;
    -[MRV2NowPlayingController _requestPlaybackQueueForPlayerPath:request:queue:completion:](self, "_requestPlaybackQueueForPlayerPath:request:queue:completion:", v6, v17, v9, v31);

  }
  if (-[MRNowPlayingControllerConfiguration requestLastPlayingDate](self->_configuration, "requestLastPlayingDate"))
  {
    dispatch_group_enter(v7);
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
    v27[3] = &unk_1E30C8F90;
    v29 = &v60;
    v30 = &v54;
    v28 = v7;
    -[MRV2NowPlayingController _requestPlayerLastPlayingDateForPlayerPath:queue:completion:](self, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v6, v9, v27);

  }
  if (-[MRNowPlayingControllerConfiguration requestClientProperties](self->_configuration, "requestClientProperties"))
  {
    dispatch_group_enter(v7);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5;
    v23[3] = &unk_1E30C8FB8;
    v25 = &v48;
    v26 = &v42;
    v24 = v7;
    -[MRV2NowPlayingController _requestClientPropertiesForPlayerPath:queue:completion:](self, "_requestClientPropertiesForPlayerPath:queue:completion:", v6, v9, v23);

  }
  v18 = dispatch_time(0, 5000000000);
  if (!dispatch_group_wait(v7, v18))
  {
    v20 = (void *)v79[5];
    if (!v20)
    {
      v20 = (void *)v67[5];
      if (!v20)
      {
        v20 = (void *)v55[5];
        if (!v20)
        {
          v20 = (void *)v43[5];
          if (!v20)
          {
            v21 = objc_alloc_init(MRNowPlayingPlayerResponse);
            -[MRNowPlayingPlayerResponse setPlaybackQueue:](v21, "setPlaybackQueue:", v85[5]);
            -[MRNowPlayingPlayerResponse setPlaybackState:](v21, "setPlaybackState:", *((unsigned int *)v91 + 6));
            -[MRNowPlayingPlayerResponse setSupportedCommands:](v21, "setSupportedCommands:", v73[5]);
            -[MRNowPlayingPlayerResponse setPlayerLastPlayingDate:](v21, "setPlayerLastPlayingDate:", v61[5]);
            -[MRNowPlayingPlayerResponse setClientProperties:](v21, "setClientProperties:", v49[5]);
            goto LABEL_22;
          }
        }
      }
    }
    if (a4)
    {
      v19 = objc_retainAutorelease(v20);
      goto LABEL_20;
    }
LABEL_21:
    v21 = 0;
    goto LABEL_22;
  }
  if (!a4)
    goto LABEL_21;
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 26);
LABEL_20:
  v21 = 0;
  *a4 = v19;
LABEL_22:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
  return v21;
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV2NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_requestPlaybackQueueForPlayerPath:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MRV2NowPlayingController setRequestingQueue:](self, "setRequestingQueue:", 1);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__MRV2NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke;
  v15[3] = &unk_1E30C7AC0;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v12, v13, v11, v15);

}

void __88__MRV2NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestingQueue:", 0);
  v4 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contentItemForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "mergeFrom:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MRPlaybackQueueRequest *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[MRPlaybackQueueRequest initWithIdentifiers:]([MRPlaybackQueueRequest alloc], "initWithIdentifiers:", v13);

  -[MRNowPlayingControllerConfiguration playbackQueueRequest](self->_configuration, "playbackQueueRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "artworkHeight");
  -[MRPlaybackQueueRequest setArtworkHeight:](v14, "setArtworkHeight:");

  -[MRNowPlayingControllerConfiguration playbackQueueRequest](self->_configuration, "playbackQueueRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "artworkWidth");
  -[MRPlaybackQueueRequest setArtworkWidth:](v14, "setArtworkWidth:");

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRV2NowPlayingController label](self, "label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("artworkRequest<%@>"), v18);
  -[MRPlaybackQueueRequest setLabel:](v14, "setLabel:", v19);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__MRV2NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v21[3] = &unk_1E30C7B60;
  v22 = v10;
  v20 = v10;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v14, v12, v11, v21);

}

uint64_t __86__MRV2NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__MRV2NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E30C6B70;
  v10 = v7;
  v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);

}

uint64_t __84__MRV2NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  MRNowPlayingRequest *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MRNowPlayingRequest initWithPlayerPath:]([MRNowPlayingRequest alloc], "initWithPlayerPath:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__MRV2NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v12[3] = &unk_1E30C7BD8;
  v13 = v7;
  v11 = v7;
  -[MRNowPlayingRequest requestLastPlayingDateOnQueue:completion:](v10, "requestLastPlayingDateOnQueue:completion:", v8, v12);

}

uint64_t __88__MRV2NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestClientPropertiesForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "origin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__MRV2NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke;
  v13[3] = &unk_1E30C8FE0;
  v14 = v7;
  v12 = v7;
  MRMediaRemoteGetClientProperties((uint64_t)v10, (uint64_t)v11, v8, v13);

}

uint64_t __83__MRV2NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_onQueue_retrieveEndpointForContextUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MRAVLightweightReconnaissanceSession *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  MRAVLightweightReconnaissanceSession *v15;
  _QWORD v16[4];
  MRAVLightweightReconnaissanceSession *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[MRV2NowPlayingController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke;
  v19[3] = &unk_1E30C6FB0;
  v20 = v6;
  v11 = v6;
  -[MRV2NowPlayingController label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV2NowPlayingController queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke_2;
  v16[3] = &unk_1E30C7C28;
  v17 = v9;
  v18 = v7;
  v14 = v7;
  v15 = v9;
  -[MRAVLightweightReconnaissanceSession searchEndpointsWithPredicate:timeout:reason:queue:completion:](v15, "searchEndpointsWithPredicate:timeout:reason:queue:completion:", v19, v12, v13, v16, 7.0);

}

uint64_t __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupContextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

void __78__MRV2NowPlayingController__onQueue_retrieveEndpointForContextUID_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  MRAVLightweightReconnaissanceSession *v14;
  void *v15;
  void *v16;
  MRAVLightweightReconnaissanceSession *v17;
  _QWORD v18[4];
  MRAVLightweightReconnaissanceSession *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  -[MRV2NowPlayingController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[MRNowPlayingControllerConfiguration discoveryPredicate](self->_configuration, "discoveryPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MRNowPlayingControllerConfiguration discoveryPredicate](self->_configuration, "discoveryPredicate");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke;
    v25[3] = &unk_1E30C7C28;
    v25[4] = self;
    v26 = v7;
    ((void (**)(_QWORD, _QWORD *))v10)[2](v10, v25);

    v11 = v26;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("proactiveEndpoint")))
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3;
    v23[3] = &unk_1E30C7C00;
    v24 = v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(1, v12, v23, 7.0);

    v11 = v24;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("userSelectedEndpoint")))
    {
      v14 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
      -[MRV2NowPlayingController label](self, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRV2NowPlayingController queue](self, "queue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_5;
      v18[3] = &unk_1E30C7C28;
      v19 = v14;
      v20 = v7;
      v17 = v14;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v17, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v6, v15, v16, v18, 7.0);

      goto LABEL_8;
    }
    -[MRV2NowPlayingController queue](self, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_4;
    v21[3] = &unk_1E30C7C00;
    v22 = v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(0, v13, v21, 7.0);

    v11 = v22;
  }

LABEL_8:
}

void __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__MRV2NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithMRError:userInfo:", 47, v9);

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_createUnresolvedPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  -[MRV2NowPlayingController label](self, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke;
  v20[3] = &unk_1E30C68F0;
  v23 = v12;
  v24 = v13;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v13;
  objc_msgSend(v18, "connectToExternalDeviceWithUserInfo:completion:", v15, v20);

}

void __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke_2;
  block[3] = &unk_1E30C7C50;
  v7 = v3;
  v11 = a1[8];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v5 = v3;
  dispatch_async(v4, block);

}

void __92__MRV2NowPlayingController__createUnresolvedPlayerPathForEndpoint_client_player_completion___block_invoke_2(uint64_t a1)
{
  MRPlayerPath *v2;
  void *v3;
  MRPlayerPath *v4;
  uint64_t v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "origin");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v2 = [MRPlayerPath alloc];
      objc_msgSend(*(id *)(a1 + 40), "origin");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[MRPlayerPath initWithOrigin:client:player:](v2, "initWithOrigin:client:player:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

      (*(void (**)(_QWORD, MRPlayerPath *, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v4, 0);
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 64);
      v4 = (MRPlayerPath *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 5, CFSTR("Endpoint.Connect succeded with no origin"));
      (*(void (**)(uint64_t, _QWORD, MRPlayerPath *))(v5 + 16))(v5, 0, v4);
    }

  }
}

- (void)_resolvePlayerPath:(id)a3 requestID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MRV2NowPlayingController__resolvePlayerPath_requestID_completion___block_invoke;
  v13[3] = &unk_1E30C7E58;
  v14 = v8;
  v12 = v8;
  MRMediaRemoteNowPlayingResolvePlayerPathWithID(v10, v9, 1, v11, v13);

}

void __68__MRV2NowPlayingController__resolvePlayerPath_requestID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  void *Error;
  id v8;

  v5 = a2;
  v8 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if ((objc_msgSend(v5, "isResolved") & 1) == 0)
    {
      Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_7;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();
LABEL_7:

}

- (void)_onQueue_clearAllState
{
  void *v3;
  NSObject *v4;
  MSVVariableIntervalTimer *loadRetryTimer;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  loadRetryTimer = self->_loadRetryTimer;
  self->_loadRetryTimer = 0;

  -[MRV2NowPlayingController _onQueue_clearStateForOutputDeviceUID](self, "_onQueue_clearStateForOutputDeviceUID");
}

- (void)_onQueue_clearStateForOutputDeviceUID
{
  void *v3;
  NSObject *v4;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  -[MRV2NowPlayingController _unregisterForEndpointChanges](self, "_unregisterForEndpointChanges");
  -[MRV2NowPlayingController _onQueue_clearStateForEndpoint](self, "_onQueue_clearStateForEndpoint");
}

- (void)_onQueue_clearStateForEndpoint
{
  void *v3;
  NSObject *v4;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  -[MRV2NowPlayingController _unregisterForEndpointInvalidations](self, "_unregisterForEndpointInvalidations");
  -[MRV2NowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  -[MRNowPlayingControllerDestination setEndpoint:](self->_destination, "setEndpoint:", 0);
  -[MRV2NowPlayingController _onQueue_clearStateForUnresolvedPlayerPath](self, "_onQueue_clearStateForUnresolvedPlayerPath");
}

- (void)_onQueue_clearStateForUnresolvedPlayerPath
{
  void *v3;
  NSObject *v4;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  -[MRNowPlayingControllerDestination setUnresolvedPlayerPath:](self->_destination, "setUnresolvedPlayerPath:", 0);
  -[MRV2NowPlayingController _onQueue_clearStateForResolvedPlayerPath](self, "_onQueue_clearStateForResolvedPlayerPath");
}

- (void)_onQueue_clearStateForResolvedPlayerPath
{
  void *v3;
  NSObject *v4;
  id v5;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  -[MRV2NowPlayingController _unregisterNotificationHandlers](self, "_unregisterNotificationHandlers");
  -[MRV2NowPlayingController onQueue_setResolvedPlayerPath:](self, "onQueue_setResolvedPlayerPath:", 0);
  -[MRV2NowPlayingController deferredContentItemsToMerge](self, "deferredContentItemsToMerge");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (void)onQueue_setResolvedPlayerPath:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  char v7;
  id v8;

  v8 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  -[MRDestination playerPath](self->_destination, "playerPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
  {

  }
  else
  {
    v7 = objc_msgSend(v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
      -[MRDestination setPlayerPath:](self->_destination, "setPlayerPath:", v8);
  }
  -[MRV2NowPlayingController _notifyDelegateOfPlayerPathChange:](self, "_notifyDelegateOfPlayerPathChange:", v8);

}

- (void)setHelper:(id)a3
{
  MRNowPlayingControllerHelper *v4;
  MRNowPlayingControllerHelper *helper;
  MRV2NowPlayingController *obj;

  v4 = (MRNowPlayingControllerHelper *)a3;
  obj = self;
  objc_sync_enter(obj);
  helper = obj->_helper;
  obj->_helper = v4;

  objc_sync_exit(obj);
}

- (MRNowPlayingControllerHelper)helper
{
  MRV2NowPlayingController *v2;
  MRNowPlayingControllerHelper *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_helper;
  objc_sync_exit(v2);

  return v3;
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "didLoadResponse");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v3 = *(_QWORD *)&a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "playbackStateDidChange");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, v3);

    v4 = v6;
  }

}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "playbackQueueDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contentItemsDidUpdate");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contentItemsDidLoadArtwork");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "supportedCommandsDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "playerLastPlayingDateDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "clientPropertiesDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "playerPathDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfInvalidation
{
  void *v2;
  void (**v3)(void);
  id v4;

  -[MRV2NowPlayingController helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "didInvalidate");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    v2 = v4;
  }

}

- (void)_notifyDelegateOfError:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV2NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "didFailWithError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MRV2NowPlayingController *v10;
  id v11;

  v4 = a3;
  -[MRV2NowPlayingController cancelableOperations](self, "cancelableOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v8[3] = &unk_1E30C7328;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

void __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)a1[5] + 4), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_11;
  }
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "verboseNowPlayingControllerLogging");
  _MRLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[5];
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_cold_1();
  }

  objc_msgSend(a1[5], "deferredContentItemsToMerge");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  v13 = (id *)a1[5];
  objc_msgSend(v13[4], "resolvedPlayerPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playbackQueueRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "requestByRemovingArtwork");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_108;
  v21[3] = &unk_1E30C9030;
  v19 = a1[6];
  v20 = a1[5];
  v22 = v19;
  v23 = v20;
  objc_msgSend(v13, "_requestPlaybackQueueForPlayerPath:request:queue:completion:", v14, v17, v18, v21);

LABEL_11:
}

void __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_2;
  v12[3] = &unk_1E30C9008;
  v9 = a1 + 32;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(v9 + 8);
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v12);

}

uint64_t __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
    return objc_msgSend(v2, "_notifyDelegateOfError:");
  objc_msgSend(v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackQueueRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "includeArtwork");

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "contentItemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_requestPlaybackQueueArtworkForIdentifiers:operationQueue:", v9, *(_QWORD *)(a1 + 56));

  }
  return objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackQueueChange:", *(_QWORD *)(a1 + 48));
}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV2NowPlayingController *v9;

  v4 = a3;
  -[MRV2NowPlayingController cancelableOperations](self, "cancelableOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if (!v7)
      goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mr_compactMap:", &__block_literal_global_109);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 40), "requestingQueue");
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "verboseNowPlayingControllerLogging");
  _MRLogForCategory(1uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v4;
        v19 = 138412546;
        v20 = v16;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1();
    }

    objc_msgSend(*v4, "deferredContentItemsToMerge");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v9);

  }
  else
  {
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *v4;
        v19 = 138412546;
        v20 = v17;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2();
    }

    objc_msgSend(*v4, "_notifyDelegateOfUpdatedContentItemsWithContentItems:", v9);
  }

LABEL_19:
}

uint64_t __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MRV2NowPlayingController *v10;
  id v11;

  v4 = a3;
  -[MRV2NowPlayingController cancelableOperations](self, "cancelableOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v8[3] = &unk_1E30C7328;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

void __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v3)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  objc_msgSend(*(id *)(*v4 + 40), "playbackQueueRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "includeArtwork");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "msv_map:", &__block_literal_global_110);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "verboseNowPlayingControllerLogging");
    _MRLogForCategory(1uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v4;
        v17 = 138412546;
        v18 = v16;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 40), "_requestPlaybackQueueArtworkForIdentifiers:operationQueue:", v11, *(_QWORD *)(a1 + 48));
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_requestPlaybackQueueArtworkForIdentifiers:(id)a3 operationQueue:(id)a4
{
  id v6;
  MRNowPlayingControllerDestination *destination;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MRV2NowPlayingController *v14;

  v6 = a4;
  destination = self->_destination;
  v8 = a3;
  -[MRNowPlayingControllerDestination resolvedPlayerPath](destination, "resolvedPlayerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV2NowPlayingController queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke;
  v12[3] = &unk_1E30C9030;
  v13 = v6;
  v14 = self;
  v11 = v6;
  -[MRV2NowPlayingController _requestContentItemArtwork:forPlayerPath:queue:completion:](self, "_requestContentItemArtwork:forPlayerPath:queue:completion:", v8, v9, v10, v12);

}

void __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke_2;
  v11[3] = &unk_1E30C7328;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

void __86__MRV2NowPlayingController__requestPlaybackQueueArtworkForIdentifiers_operationQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfError:");
  }
  else
  {
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "contentItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> updated artwork for content items %@.", (uint8_t *)&v7, 0x16u);

    }
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "contentItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_notifyDelegateOfUpdatedArtwork:", v6);

  }
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV2NowPlayingController *v9;

  v4 = a3;
  -[MRV2NowPlayingController cancelableOperations](self, "cancelableOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if (!v7)
      goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "verboseNowPlayingControllerLogging");
  _MRLogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *v4;
      v15 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v9, "intValue"));
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", (uint8_t *)&v16, 0x16u);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_cold_1(v4, v9, v13);
  }

  objc_msgSend((id)*v4, "_notifyDelegateOfPlaybackStateChange:", objc_msgSend(v9, "intValue"));
LABEL_11:

}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MRV2NowPlayingController *v10;
  id v11;

  v4 = a3;
  -[MRV2NowPlayingController cancelableOperations](self, "cancelableOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v8[3] = &unk_1E30C7328;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

void __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)a1[5] + 4), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_11;
  }
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "verboseNowPlayingControllerLogging");
  _MRLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[5];
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1();
  }

  v12 = (id *)a1[5];
  objc_msgSend(v12[4], "resolvedPlayerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_111;
  v17[3] = &unk_1E30C5CF8;
  v15 = a1[6];
  v16 = a1[5];
  v18 = v15;
  v19 = v16;
  objc_msgSend(v12, "_requestSupportedCommandsForPlayerPath:queue:completion:", v13, v14, v17);

LABEL_11:
}

void __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_2;
  v11[3] = &unk_1E30C7328;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

uint64_t __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v2, "_notifyDelegateOfSupportedCommandsChange:", a1[6]);
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  -[MRV2NowPlayingController configuration](self, "configuration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDeviceUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("proactiveEndpoint")))
  {

  }
  else
  {
    -[MRV2NowPlayingController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputDeviceUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("userSelectedEndpoint"));

    if (!v10)
      return;
  }
  -[MRV2NowPlayingController _handleEndpointChanged](self, "_handleEndpointChanged");
}

- (void)_registerForEndpointChangesForOutputDeviceUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MRAVEndpointObserver *v7;
  void *v8;
  MRAVEndpointObserver *v9;
  MRAVEndpointObserver *endpointObserver;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MRV2NowPlayingController shouldObserveInvalidations](self, "shouldObserveInvalidations")
    && !-[MRV2NowPlayingController registeredForEndpointChanges](self, "registeredForEndpointChanges"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("proactiveEndpoint")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("userSelectedEndpoint")))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleActiveSystemEndpointChangedNotification_, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);

    }
    else
    {
      objc_initWeak(&location, self);
      v7 = [MRAVEndpointObserver alloc];
      -[MRV2NowPlayingController label](self, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __74__MRV2NowPlayingController__registerForEndpointChangesForOutputDeviceUID___block_invoke;
      v15 = &unk_1E30C7D38;
      objc_copyWeak(&v16, &location);
      v9 = -[MRAVEndpointObserver initWithOutputDeviceUID:label:callback:](v7, "initWithOutputDeviceUID:label:callback:", v4, v8, &v12);
      endpointObserver = self->_endpointObserver;
      self->_endpointObserver = v9;

      -[MRV2NowPlayingController endpointObserver](self, "endpointObserver", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "begin");

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    -[MRV2NowPlayingController setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 1);
  }

}

void __74__MRV2NowPlayingController__registerForEndpointChangesForOutputDeviceUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleEndpointChangedToEndpoint:", a2);
    WeakRetained = v4;
  }

}

- (void)_unregisterForEndpointChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  -[MRV2NowPlayingController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("proactiveEndpoint")))
  {

  }
  else
  {
    -[MRV2NowPlayingController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputDeviceUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("userSelectedEndpoint"));

    if (!v9)
    {
      -[MRV2NowPlayingController endpointObserver](self, "endpointObserver");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "end");
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);
LABEL_6:

  -[MRV2NowPlayingController setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 0);
}

- (void)_registerForEndpointInvalidations:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[MRV2NowPlayingController shouldObserveInvalidations](self, "shouldObserveInvalidations")
    && !-[MRV2NowPlayingController registeredForEndpointInvalidations](self, "registeredForEndpointInvalidations"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleEndpointDidDisconnectNotification_, CFSTR("MRAVEndpointDidDisconnectNotification"), v6);

    -[MRV2NowPlayingController setRegisteredForEndpointInvalidations:](self, "setRegisteredForEndpointInvalidations:", 1);
  }

}

- (void)_unregisterForEndpointInvalidations
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestination endpoint](self->_destination, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MRAVEndpointDidDisconnectNotification"), v6);

  -[MRV2NowPlayingController setRegisteredForEndpointInvalidations:](self, "setRegisteredForEndpointInvalidations:", 0);
}

- (void)_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:(id)a3
{
  id v4;
  NSObject *v5;
  MRNowPlayingPlayerPathInvalidationHandler *v6;
  void *v7;
  MRNowPlayingPlayerPathInvalidationHandler *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MRV2NowPlayingController shouldObserveInvalidations](self, "shouldObserveInvalidations")
    && !-[MRV2NowPlayingController registeredForPlayerPathInvalidations](self, "registeredForPlayerPathInvalidations"))
  {
    objc_initWeak(&location, self);
    v6 = [MRNowPlayingPlayerPathInvalidationHandler alloc];
    -[MRV2NowPlayingController queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __87__MRV2NowPlayingController__registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke;
    v14 = &unk_1E30C7D10;
    objc_copyWeak(&v15, &location);
    v8 = -[MRNowPlayingPlayerPathInvalidationHandler initWithPlayerPath:invalidateImmediatlyIfInvalid:queue:invalidationCallback:](v6, "initWithPlayerPath:invalidateImmediatlyIfInvalid:queue:invalidationCallback:", v4, 0, v7, &v11);

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient", v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addPlayerPathInvalidationHandler:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRV2NowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", v10);

    -[MRV2NowPlayingController setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 1);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __87__MRV2NowPlayingController__registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handlePlayerPathInvalidatedWithPlayerPath:", a2);
    WeakRetained = v4;
  }

}

- (void)_unregisterForPlayerPathInvalidations
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV2NowPlayingController queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

  }
  -[MRV2NowPlayingController playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MRV2NowPlayingController playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)v6);

    -[MRV2NowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", 0);
  }
  -[MRV2NowPlayingController setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 0);
}

- (void)_registerNotificationHandlersForResolvedPlayerPath:(id)a3
{
  NSObject *v4;
  MRV2NowPlayingController *v5;
  MRV2NowPlayingControllerOperationQueue *v6;
  void *v7;
  uint64_t v8;
  MRV2NowPlayingControllerOperationQueue *cancelableOperations;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;

  v21 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = self;
  objc_sync_enter(v5);
  -[MRV2NowPlayingControllerOperationQueue invalidate](v5->_cancelableOperations, "invalidate");
  v6 = [MRV2NowPlayingControllerOperationQueue alloc];
  -[MRV2NowPlayingController queue](v5, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRV2NowPlayingControllerOperationQueue initWithQueue:](v6, "initWithQueue:", v7);
  cancelableOperations = v5->_cancelableOperations;
  v5->_cancelableOperations = (MRV2NowPlayingControllerOperationQueue *)v8;

  objc_sync_exit(v5);
  if (-[MRV2NowPlayingController shouldObserveInvalidations](v5, "shouldObserveInvalidations")
    && !-[MRV2NowPlayingController registeredForNotifications](v5, "registeredForNotifications"))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1);
    -[MRV2NowPlayingController configuration](v5, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackQueueRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__handlePlaybackQueueChangedNotification_, CFSTR("kMRPlayerPlaybackQueueChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel__handlePlaybackQueueContentItemsChangedNotification_, CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__handlePlaybackQueueContentItemsArtworkChangedNotification_, CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification"), 0);

    }
    -[MRV2NowPlayingController configuration](v5, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "requestPlaybackState");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel__handlePlaybackStateChangedNotification_, CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification"), 0);

    }
    -[MRV2NowPlayingController configuration](v5, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "requestSupportedCommands");

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v5, sel__handleSupportedCommandsChangedNotification_, CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification"), 0);

    }
    -[MRV2NowPlayingController setRegisteredForNotifications:](v5, "setRegisteredForNotifications:", 1);
  }

}

- (void)_unregisterNotificationHandlers
{
  MRV2NowPlayingController *v3;
  MRV2NowPlayingControllerOperationQueue *cancelableOperations;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  if (-[MRV2NowPlayingController registeredForNotifications](self, "registeredForNotifications"))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0);
    v3 = self;
    objc_sync_enter(v3);
    -[MRV2NowPlayingControllerOperationQueue invalidate](v3->_cancelableOperations, "invalidate");
    cancelableOperations = v3->_cancelableOperations;
    v3->_cancelableOperations = 0;

    objc_sync_exit(v3);
    -[MRV2NowPlayingController configuration](v3, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackQueueRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", v3, CFSTR("kMRPlayerPlaybackQueueChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", v3, CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", v3, CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification"), 0);

    }
    -[MRV2NowPlayingController configuration](v3, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "requestPlaybackState");

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:name:object:", v3, CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification"), 0);

    }
    -[MRV2NowPlayingController configuration](v3, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "requestSupportedCommands");

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", v3, CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification"), 0);

    }
    -[MRV2NowPlayingController setRegisteredForNotifications:](v3, "setRegisteredForNotifications:", 0);
  }
}

- (void)_handleEndpointChanged
{
  void *v2;

  -[MRV2NowPlayingController queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_async_on_queue();

}

uint64_t __50__MRV2NowPlayingController__handleEndpointChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  if (objc_msgSend(*(id *)(a1 + 32), "isLoading"))
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing endpoint change", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingDestination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndpoint:", 0);

    return objc_msgSend(*(id *)(a1 + 32), "setEndpointChanged:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
    return objc_msgSend(*(id *)(a1 + 32), "_reloadWithReason:", CFSTR("endpoint Change"));
  }
}

- (void)_handleEndpointChangedToEndpoint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  msv_dispatch_async_on_queue();

}

void __61__MRV2NowPlayingController__handleEndpointChangedToEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v3)
  {

LABEL_10:
    return;
  }
  v4 = objc_msgSend(v15, "isEqual:", v3);

  if ((v4 & 1) != 0)
    return;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = 0;

  if (!objc_msgSend(*(id *)(a1 + 40), "isLoading"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_clearStateForEndpoint");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setEndpoint:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setIsEndpointSet:", 1);
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "debugName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "initWithFormat:", CFSTR("endpoint change top %@"), v14);

    objc_msgSend(*(id *)(a1 + 40), "_reloadWithReason:", v15);
    goto LABEL_10;
  }
  _MRLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "debugName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing endpoint change to %@", buf, 0x16u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pendingDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEndpoint:", v10);

  objc_msgSend(*(id *)(a1 + 40), "pendingDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsEndpointSet:", 1);

  objc_msgSend(*(id *)(a1 + 40), "setEndpointChanged:", 1);
}

- (void)_handleEndpointInvalidated
{
  void *v2;

  -[MRV2NowPlayingController queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_async_on_queue();

}

void __54__MRV2NowPlayingController__handleEndpointInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isLoading"))
    {
      _MRLogForCategory(1uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing endpoint invalidation", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "pendingDestination");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEndpoint:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setEndpointInvalidated:", 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
      objc_msgSend(*(id *)(a1 + 32), "_reloadWithReason:", CFSTR("endpoint Invalidation"));
    }
  }
}

- (void)_handlePlayerPathInvalidatedWithPlayerPath:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MRV2NowPlayingController queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  msv_dispatch_async_on_queue();

}

uint64_t __71__MRV2NowPlayingController__handlePlayerPathInvalidatedWithPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  if (objc_msgSend(*(id *)(a1 + 32), "isLoading"))
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] %@ Enqueing playerPath invalidation to %@", (uint8_t *)&v10, 0x16u);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "isResolved"))
      v7 = *(_QWORD *)(a1 + 40);
    else
      v7 = 0;
    objc_msgSend(*(id *)(a1 + 32), "pendingDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResolvedPlayerPath:", v7);

    return objc_msgSend(*(id *)(a1 + 32), "setPlayerPathInvalidated:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForUnresolvedPlayerPath");
    if (objc_msgSend(*(id *)(a1 + 40), "isResolved"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setResolvedPlayerPath:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_reloadWithReason:", CFSTR("playerPath Invalidation"));
  }
}

- (void)_handleRetryTimerElapsed
{
  void *v2;

  -[MRV2NowPlayingController queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_async_on_queue();

}

void __52__MRV2NowPlayingController__handleRetryTimerElapsed__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isLoading") & 1) == 0)
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "loadRetryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentInterval");
    v5 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("LoadRetryTimer fired after %lf total seconds"), v4);

    objc_msgSend(*(id *)(a1 + 32), "_reloadWithReason:", v5);
  }
}

- (void)_configureReloadTimerForError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  MRV2NowPlayingController *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_configureReloadTimerForError__onceToken != -1)
    dispatch_once(&_configureReloadTimerForError__onceToken, &__block_literal_global_141_0);
  v5 = _configureReloadTimerForError____ignorableErrorsForReload;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    -[MRV2NowPlayingController loadRetryTimer](self, "loadRetryTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _MRLogForCategory(1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[MRV2NowPlayingController loadRetryTimer](self, "loadRetryTimer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeUntilNextInterval");
        *(_DWORD *)buf = 138412546;
        v24 = self;
        v25 = 2048;
        v26 = v10;
        _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> LoadRetryTimer is already scheduled to retry in %lf more seconds", buf, 0x16u);

      }
    }
    else
    {
      objc_initWeak(&location, self);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController.loadRetryTimer<%p>"), self);
      v12 = objc_alloc(MEMORY[0x1E0D4D118]);
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "destinationResolverReconRetryIntervals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRV2NowPlayingController queue](self, "queue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __58__MRV2NowPlayingController__configureReloadTimerForError___block_invoke_148;
      v20[3] = &unk_1E30C6AA0;
      objc_copyWeak(&v21, &location);
      v16 = (void *)objc_msgSend(v12, "initWithIntervals:name:queue:block:", v14, v11, v15, v20);
      -[MRV2NowPlayingController setLoadRetryTimer:](self, "setLoadRetryTimer:", v16);

      _MRLogForCategory(1uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[MRV2NowPlayingController loadRetryTimer](self, "loadRetryTimer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeUntilNextInterval");
        *(_DWORD *)buf = 138412546;
        v24 = self;
        v25 = 2048;
        v26 = v19;
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[MRV2NowPlayingController] <%@> Starting LoadRetryTimer to fire in %lf seconds", buf, 0x16u);

      }
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
    }
  }

}

void __58__MRV2NowPlayingController__configureReloadTimerForError___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E3143B90);
  v1 = (void *)_configureReloadTimerForError____ignorableErrorsForReload;
  _configureReloadTimerForError____ignorableErrorsForReload = v0;

}

void __58__MRV2NowPlayingController__configureReloadTimerForError___block_invoke_148(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRetryTimerElapsed");

}

- (NSString)needsImmediateReloadReason
{
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;

  if (-[MRV2NowPlayingController needsImmediateReload](self, "needsImmediateReload"))
  {
    if (-[MRV2NowPlayingController endpointChanged](self, "endpointChanged"))
    {
      objc_msgSend(&stru_1E30D5AF8, "stringByAppendingString:", CFSTR("|endpoint changed"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &stru_1E30D5AF8;
    }
    if (-[MRV2NowPlayingController endpointInvalidated](self, "endpointInvalidated"))
    {
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|endpoint invalidation"));
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v4;
    }
    if (-[MRV2NowPlayingController playerPathInvalidated](self, "playerPathInvalidated"))
    {
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|playerPath invalidation"));
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v5;
    }
  }
  else
  {
    v3 = &stru_1E30D5AF8;
  }
  return (NSString *)v3;
}

- (void)setIsLoading:(BOOL)a3
{
  void *v3;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_sync_on_queue();

}

void __41__MRV2NowPlayingController_setIsLoading___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = v1;
    v4 = *(_BYTE **)(a1 + 32);
    if (!v4[24])
    {
      if (objc_msgSend(v4, "needsImmediateReload"))
      {
        objc_msgSend(*(id *)(a1 + 32), "needsImmediateReloadReason");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "endpointChanged"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
          objc_msgSend(*(id *)(a1 + 32), "setEndpointChanged:", 0);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "endpointInvalidated"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForEndpoint");
          objc_msgSend(*(id *)(a1 + 32), "setEndpointInvalidated:", 0);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "playerPathInvalidated"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForUnresolvedPlayerPath");
          objc_msgSend(*(id *)(a1 + 32), "setPlayerPathInvalidated:", 0);
        }
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(*(_QWORD *)(a1 + 32) + 72));
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(void **)(v5 + 72);
        *(_QWORD *)(v5 + 72) = 0;

        v7 = *(void **)(a1 + 32);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Previous %@"), v9);
        objc_msgSend(v7, "_reloadWithReason:", v8);

      }
    }
  }
}

- (BOOL)isLoading
{
  NSObject *v3;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_loading;
}

- (MRNowPlayingControllerDestination)pendingDestination
{
  NSObject *v3;
  MRNowPlayingControllerDestination *pendingDestination;
  MRNowPlayingControllerDestination *v5;
  MRNowPlayingControllerDestination *v6;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  pendingDestination = self->_pendingDestination;
  if (!pendingDestination)
  {
    v5 = (MRNowPlayingControllerDestination *)-[MRNowPlayingControllerDestination copy](self->_destination, "copy");
    v6 = self->_pendingDestination;
    self->_pendingDestination = v5;

    pendingDestination = self->_pendingDestination;
  }
  return pendingDestination;
}

- (BOOL)shouldObserveInvalidations
{
  void *v2;
  char v3;

  -[MRV2NowPlayingController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSingleShot") ^ 1;

  return v3;
}

- (BOOL)needsImmediateReload
{
  NSObject *v3;

  -[MRV2NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[MRV2NowPlayingController endpointChanged](self, "endpointChanged")
      || -[MRV2NowPlayingController endpointInvalidated](self, "endpointInvalidated")
      || -[MRV2NowPlayingController playerPathInvalidated](self, "playerPathInvalidated");
}

- (BOOL)updateLoadingEnabled
{
  MRV2NowPlayingController *v2;
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
  -[MRV2NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRV2NowPlayingController_updateLoadingEnabled__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __48__MRV2NowPlayingController_updateLoadingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

- (BOOL)shouldDeferArtworkRequestForConfiguration:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isSingleShot") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "playbackQueueRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "includeArtwork");

  }
  return v4;
}

- (id)effectivePlaybackQueueRequest
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[MRV2NowPlayingController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MRV2NowPlayingController shouldDeferArtworkRequestForConfiguration:](self, "shouldDeferArtworkRequestForConfiguration:", v3);
  objc_msgSend(v3, "playbackQueueRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "requestByRemovingArtwork");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (MRV2NowPlayingControllerOperationQueue)cancelableOperations
{
  MRV2NowPlayingController *v2;
  MRV2NowPlayingControllerOperationQueue *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cancelableOperations;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MRNowPlayingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
  objc_storeStrong(&self->_playerPathInvalidationObserver, a3);
}

- (MRAVEndpointObserver)endpointObserver
{
  return self->_endpointObserver;
}

- (void)setEndpointObserver:(id)a3
{
  objc_storeStrong((id *)&self->_endpointObserver, a3);
}

- (NSMutableArray)deferredContentItemsToMerge
{
  return self->_deferredContentItemsToMerge;
}

- (void)setDeferredContentItemsToMerge:(id)a3
{
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, a3);
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)registeredForEndpointChanges
{
  return self->_registeredForEndpointChanges;
}

- (void)setRegisteredForEndpointChanges:(BOOL)a3
{
  self->_registeredForEndpointChanges = a3;
}

- (BOOL)registeredForEndpointInvalidations
{
  return self->_registeredForEndpointInvalidations;
}

- (void)setRegisteredForEndpointInvalidations:(BOOL)a3
{
  self->_registeredForEndpointInvalidations = a3;
}

- (BOOL)registeredForPlayerPathInvalidations
{
  return self->_registeredForPlayerPathInvalidations;
}

- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3
{
  self->_registeredForPlayerPathInvalidations = a3;
}

- (void)setUpdateLoadingEnabled:(BOOL)a3
{
  self->_updateLoadingEnabled = a3;
}

- (BOOL)endpointChanged
{
  return self->_endpointChanged;
}

- (void)setEndpointChanged:(BOOL)a3
{
  self->_endpointChanged = a3;
}

- (BOOL)endpointInvalidated
{
  return self->_endpointInvalidated;
}

- (void)setEndpointInvalidated:(BOOL)a3
{
  self->_endpointInvalidated = a3;
}

- (BOOL)playerPathInvalidated
{
  return self->_playerPathInvalidated;
}

- (void)setPlayerPathInvalidated:(BOOL)a3
{
  self->_playerPathInvalidated = a3;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)requestingQueue
{
  return self->_requestingQueue;
}

- (void)setRequestingQueue:(BOOL)a3
{
  self->_requestingQueue = a3;
}

- (void)setPendingDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MSVVariableIntervalTimer)loadRetryTimer
{
  return self->_loadRetryTimer;
}

- (void)setLoadRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadRetryTimer, a3);
}

- (int)incrementingRequestID
{
  return self->_incrementingRequestID;
}

- (void)setIncrementingRequestID:(int)a3
{
  self->_incrementingRequestID = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setCancelableOperations:(id)a3
{
  objc_storeStrong((id *)&self->_cancelableOperations, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_cancelableOperations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loadRetryTimer, 0);
  objc_storeStrong((id *)&self->_pendingDestination, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

void __68__MRV2NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "[MRV2NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

void __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRV2NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.");
  OUTLINED_FUNCTION_8();
}

void __80__MRV2NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.");
  OUTLINED_FUNCTION_8();
}

void __87__MRV2NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRV2NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.");
  OUTLINED_FUNCTION_8();
}

void __68__MRV2NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(a2, "intValue"));
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_193827000, a3, OS_LOG_TYPE_DEBUG, "[MRV2NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", (uint8_t *)&v6, 0x16u);

}

void __72__MRV2NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "[MRV2NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

@end
