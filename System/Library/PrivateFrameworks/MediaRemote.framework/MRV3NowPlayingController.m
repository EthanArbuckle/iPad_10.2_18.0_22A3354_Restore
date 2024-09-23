@implementation MRV3NowPlayingController

- (MRV3NowPlayingController)initWithConfiguration:(id)a3
{
  id v4;
  MRV3NowPlayingController *v5;
  uint64_t v6;
  MRNowPlayingControllerConfiguration *configuration;
  NSMutableArray *v8;
  NSMutableArray *deferredContentItemsToMerge;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRV3NowPlayingController;
  v5 = -[MRV3NowPlayingController init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (MRNowPlayingControllerConfiguration *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredContentItemsToMerge = v5->_deferredContentItemsToMerge;
    v5->_deferredContentItemsToMerge = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.MediaRemote.MRV3NowPlayingController.queue", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  MRV3NowPlayingController *v10;
  uint8_t buf[4];
  MRV3NowPlayingController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  -[MRV3NowPlayingController queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __35__MRV3NowPlayingController_dealloc__block_invoke;
  v9 = &unk_1E30C5CA8;
  v10 = self;
  msv_dispatch_sync_on_queue();

  v5.receiver = self;
  v5.super_class = (Class)MRV3NowPlayingController;
  -[MRV3NowPlayingController dealloc](&v5, sel_dealloc);
}

uint64_t __35__MRV3NowPlayingController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForResolvedPlayerPath");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRV3NowPlayingController destinationResolver](self, "destinationResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_opt_class();
  -[MRV3NowPlayingController destinationResolver](self, "destinationResolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRV3NowPlayingController isResolving](self, "isResolving"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[MRV3NowPlayingController isUpdating](self, "isUpdating"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[MSVVariableIntervalTimer remainingIntervals](self->_loadRetryTimer, "remainingIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV3NowPlayingController response](self, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("<%@ %p {\n   resolver=%@\n   resolving=%@\n    updating=%@\n   loadRetryTimer = %@\n   response=%@\n}>\n"), v3, self, v5, v6, v7, v9, v11);

  return (NSString *)v12;
}

- (void)beginResolving
{
  void *v2;

  -[MRV3NowPlayingController queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_sync_on_queue();

}

void __42__MRV3NowPlayingController_beginResolving__block_invoke(uint64_t a1)
{
  uint64_t v1;
  MRDestinationResolver *v3;
  void *v4;
  void *v5;
  MRDestinationResolver *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 18))
  {
    *(_BYTE *)(v1 + 18) = 1;
    v3 = [MRDestinationResolver alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), *(_QWORD *)(a1 + 32));
    v6 = -[MRDestinationResolver initWithDestination:label:](v3, "initWithDestination:label:", v4, v5);
    objc_msgSend(*(id *)(a1 + 32), "setDestinationResolver:", v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "destinationResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

    objc_msgSend(*(id *)(a1 + 32), "destinationResolver");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginResolving");

  }
}

- (void)beginLoadingUpdates
{
  void *v2;

  -[MRV3NowPlayingController queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_sync_on_queue();

}

uint64_t __47__MRV3NowPlayingController_beginLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 17))
  {
    v2 = result;
    *(_BYTE *)(v1 + 17) = 1;
    objc_msgSend(*(id *)(result + 32), "beginResolving");
    _MRLogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v2 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Begin loading updates", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_reloadWithReason:", CFSTR("Begin"));
  }
  return result;
}

- (void)endLoadingUpdates
{
  NSObject *v3;
  _QWORD block[5];

  -[MRV3NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MRV3NowPlayingController_endLoadingUpdates__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __45__MRV3NowPlayingController_endLoadingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 17))
  {
    *(_BYTE *)(v2 + 17) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setLoadRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "destinationResolver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setDestinationResolver:", 0);
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> End loading updates", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForResolvedPlayerPath");
  }
  else
  {
    _MRLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Unbalanced calls to endLoadingUpdates", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 completion:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  unsigned int v24;
  unsigned int v25;
  _QWORD v26[4];
  id v27;

  v10 = a4;
  v11 = a6;
  -[MRV3NowPlayingController beginResolving](self, "beginResolving");
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke;
  v26[3] = &unk_1E30CA9C0;
  v27 = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x194036C44](v26);
  -[MRV3NowPlayingController destination](self, "destination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playerPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isResolved") & 1) != 0)
  {
    -[MRV3NowPlayingController destination](self, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRV3NowPlayingController configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
  }

  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2;
  v21[3] = &unk_1E30CF7A8;
  v22 = v10;
  v23 = v14;
  v21[4] = self;
  v24 = a3;
  v25 = a5;
  v19 = v10;
  v20 = v14;
  +[MRDestinationResolver resolvePartialDestination:level:timeout:completion:](MRDestinationResolver, "resolvePartialDestination:level:timeout:completion:", v17, 2, v21, 15.0);

}

uint64_t __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(unsigned int *)(a1 + 56);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned int *)(a1 + 60);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteSendCommandToPlayerWithResult(v5, v6, v7, v8, v9, *(void **)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_3;
    block[3] = &unk_1E30C6770;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v10, block);

  }
}

void __70__MRV3NowPlayingController_sendCommand_options_appOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[MRCommandResult commandResultWithSendError:](MRCommandResult, "commandResultWithSendError:", 6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)destinationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MRV3NowPlayingController destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MRV3NowPlayingController_destinationWithCompletion___block_invoke;
  v7[3] = &unk_1E30C9C28;
  v8 = v4;
  v6 = v4;
  +[MRDestinationResolver resolvePartialDestination:level:timeout:completion:](MRDestinationResolver, "resolvePartialDestination:level:timeout:completion:", v5, 2, v7, 15.0);

}

void __54__MRV3NowPlayingController_destinationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "playerPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (MRNowPlayingControllerDestination)destination
{
  void *v2;
  void *v3;

  -[MRV3NowPlayingController destinationResolver](self, "destinationResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRNowPlayingControllerDestination *)v3;
}

- (void)_reloadWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MRV3NowPlayingController__reloadWithReason___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__MRV3NowPlayingController__reloadWithReason___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id location;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isResolved"))
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v35 = v6;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> reloading for reason %@", buf, 0x16u);
    }

    objc_msgSend(*v2, "_registerNotificationHandlersForResolvedPlayerPath:", v4);
    v8 = *v2;
    v33 = 0;
    objc_msgSend(v8, "_loadNowPlayingStateForPlayerPath:error:", v4, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    _MRLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __46__MRV3NowPlayingController__reloadWithReason___block_invoke_cold_1();

      objc_msgSend(*v2, "loadRetryTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (v14)
      {
        _MRLogForCategory(1uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *v2;
          objc_msgSend(*v2, "loadRetryTimer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "timeUntilNextInterval");
          *(_DWORD *)buf = 138412546;
          v35 = v27;
          v36 = 2048;
          v37 = v29;
          _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> LoadetryTimer is already scheduled to retry in %lf more seconds", buf, 0x16u);

        }
      }
      else
      {
        objc_initWeak(&location, *v2);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController.loadRetryTimer<%p>"), *v2);
        v16 = objc_alloc(MEMORY[0x1E0D4D118]);
        +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "destinationResolverReconRetryIntervals");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "queue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __46__MRV3NowPlayingController__reloadWithReason___block_invoke_28;
        v30[3] = &unk_1E30C6AA0;
        objc_copyWeak(&v31, &location);
        v20 = (void *)objc_msgSend(v16, "initWithIntervals:name:queue:block:", v18, v15, v19, v30);
        objc_msgSend(*v2, "setLoadRetryTimer:", v20);

        _MRLogForCategory(1uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *v2;
          objc_msgSend(*v2, "loadRetryTimer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeUntilNextInterval");
          *(_DWORD *)buf = 138412546;
          v35 = v22;
          v36 = 2048;
          v37 = v24;
          _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> Starting ReconRetryTimer to fire in %lf seconds", buf, 0x16u);

        }
        objc_msgSend(*v2, "_notifyDelegateOfError:", v10);
        objc_destroyWeak(&v31);

        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *v2;
        *(_DWORD *)buf = 138412546;
        v35 = v25;
        v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> End loading data. Response: %@.", buf, 0x16u);
      }

      objc_msgSend(*v2, "setLoadRetryTimer:", 0);
      objc_msgSend(*v2, "_notifyDelegateOfNewResponse:", v9);
    }

  }
}

void __46__MRV3NowPlayingController__reloadWithReason___block_invoke_28(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(WeakRetained, "loadRetryTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentInterval");
    v4 = (void *)objc_msgSend(v1, "initWithFormat:", CFSTR("LoadRetryTimer fired after %lf total seconds"), v3);

    objc_msgSend(WeakRetained, "_reloadWithReason:", v4);
  }

}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  void *v16;
  MRNowPlayingPlayerResponse *v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
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
  int v75;

  v6 = a3;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__47;
  v70 = __Block_byref_object_dispose__47;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__47;
  v64 = __Block_byref_object_dispose__47;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__47;
  v58 = __Block_byref_object_dispose__47;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__47;
  v52 = __Block_byref_object_dispose__47;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__47;
  v46 = __Block_byref_object_dispose__47;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__47;
  v40 = __Block_byref_object_dispose__47;
  v41 = 0;
  v7 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MediaRemote.MRV3NowPlayingController.callbackQueue", v8);

  v10 = -[MRNowPlayingControllerConfiguration requestSupportedCommands](self->_configuration, "requestSupportedCommands");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    dispatch_group_enter(v7);
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
    v32[3] = &unk_1E30C7A20;
    v34 = &v54;
    v35 = &v48;
    v33 = v7;
    -[MRV3NowPlayingController _requestSupportedCommandsForPlayerPath:queue:completion:](self, "_requestSupportedCommandsForPlayerPath:queue:completion:", v6, v9, v32);

  }
  if (-[MRNowPlayingControllerConfiguration requestPlaybackState](self->_configuration, "requestPlaybackState"))
  {
    dispatch_group_enter(v7);
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
    v29[3] = &unk_1E30C7A48;
    v31 = &v72;
    v30 = v7;
    MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v29);

  }
  -[MRNowPlayingControllerConfiguration playbackQueueRequest](self->_configuration, "playbackQueueRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    dispatch_group_enter(v7);
    -[MRNowPlayingControllerConfiguration playbackQueueRequest](self->_configuration, "playbackQueueRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
    v25[3] = &unk_1E30C8F68;
    v27 = &v66;
    v28 = &v60;
    v26 = v7;
    -[MRV3NowPlayingController _requestPlaybackQueueForPlayerPath:request:queue:completion:](self, "_requestPlaybackQueueForPlayerPath:request:queue:completion:", v6, v13, v9, v25);

  }
  if (-[MRNowPlayingControllerConfiguration requestLastPlayingDate](self->_configuration, "requestLastPlayingDate"))
  {
    dispatch_group_enter(v7);
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
    v22[3] = &unk_1E30C7A98;
    v24 = &v42;
    v23 = v7;
    -[MRV3NowPlayingController _requestPlayerLastPlayingDateForPlayerPath:queue:completion:](self, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v6, v9, v22);

  }
  if (-[MRNowPlayingControllerConfiguration requestClientProperties](self->_configuration, "requestClientProperties"))
  {
    dispatch_group_enter(v7);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5;
    v19[3] = &unk_1E30CF7D0;
    v21 = &v36;
    v20 = v7;
    -[MRV3NowPlayingController _requestClientPropertiesForPlayerPath:queue:completion:](self, "_requestClientPropertiesForPlayerPath:queue:completion:", v6, v9, v19);

  }
  v14 = dispatch_time(0, 5000000000);
  if (!dispatch_group_wait(v7, v14))
  {
    v16 = (void *)v61[5];
    if (!v16)
    {
      v16 = (void *)v49[5];
      if (!v16)
      {
        v17 = objc_alloc_init(MRNowPlayingPlayerResponse);
        -[MRNowPlayingPlayerResponse setPlaybackQueue:](v17, "setPlaybackQueue:", v67[5]);
        -[MRNowPlayingPlayerResponse setPlaybackState:](v17, "setPlaybackState:", *((unsigned int *)v73 + 6));
        -[MRNowPlayingPlayerResponse setSupportedCommands:](v17, "setSupportedCommands:", v55[5]);
        -[MRNowPlayingPlayerResponse setPlayerLastPlayingDate:](v17, "setPlayerLastPlayingDate:", v43[5]);
        -[MRNowPlayingPlayerResponse setClientProperties:](v17, "setClientProperties:", v37[5]);
        goto LABEL_20;
      }
    }
    if (a4)
    {
      v15 = objc_retainAutorelease(v16);
      goto LABEL_18;
    }
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  if (!a4)
    goto LABEL_19;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 26);
LABEL_18:
  v17 = 0;
  *a4 = v15;
LABEL_20:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  return v17;
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __68__MRV3NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_requestPlaybackQueueForPlayerPath:(id)a3 request:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MRV3NowPlayingController setRequestingQueue:](self, "setRequestingQueue:", 1);
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v14, "setCachingPolicy:", 2);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__MRV3NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke;
  v18[3] = &unk_1E30CAF08;
  v18[4] = self;
  v19 = v15;
  v20 = v10;
  v16 = v10;
  v17 = v15;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v12, v13, v11, v18);

}

void __88__MRV3NowPlayingController__requestPlaybackQueueForPlayerPath_request_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastQueueRequestDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastQueueRequestDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 >= 0.0)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "setRequestingQueue:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setLastQueueRequestDate:", *(_QWORD *)(a1 + 40));
    v10 = a2;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "contentItemForIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "mergeFrom:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllObjects");

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MRPlaybackQueueRequest *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[MRPlaybackQueueRequest initWithIdentifiers:]([MRPlaybackQueueRequest alloc], "initWithIdentifiers:", v12);

  -[MRPlaybackQueueRequest setArtworkHeight:](v13, "setArtworkHeight:", 600.0);
  -[MRPlaybackQueueRequest setArtworkWidth:](v13, "setArtworkWidth:", 600.0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__MRV3NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E30C7B60;
  v16 = v9;
  v14 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v11, v10, v15);

}

uint64_t __86__MRV3NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
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
  v9[2] = __84__MRV3NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E30C6B70;
  v10 = v7;
  v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);

}

uint64_t __84__MRV3NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRNowPlayingRequest *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MRNowPlayingRequest initWithPlayerPath:]([MRNowPlayingRequest alloc], "initWithPlayerPath:", v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v13[3] = &unk_1E30C9A88;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  -[MRNowPlayingRequest requestLastPlayingDateOnQueue:completion:](v11, "requestLastPlayingDateOnQueue:completion:", v9, v13);

}

void __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

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
  v13[2] = __83__MRV3NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke;
  v13[3] = &unk_1E30C8FE0;
  v14 = v7;
  v12 = v7;
  MRMediaRemoteGetClientProperties((uint64_t)v10, (uint64_t)v11, v8, v13);

}

uint64_t __83__MRV3NowPlayingController__requestClientPropertiesForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)destinationResolverDestinationDidInvalidate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[MRV3NowPlayingController queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MRV3NowPlayingController_destinationResolverDestinationDidInvalidate___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __72__MRV3NowPlayingController_destinationResolverDestinationDidInvalidate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearStateForResolvedPlayerPath");
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfInvalidation");
}

- (void)destinationResolver:(id)a3 playerPathDidChange:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV3NowPlayingController _notifyDelegateOfPlayerPathChange:](self, "_notifyDelegateOfPlayerPathChange:", v6);

  -[MRV3NowPlayingController _reloadWithReason:](self, "_reloadWithReason:", CFSTR("playerPath Invalidation"));
}

- (void)destinationResolver:(id)a3 didFailWithError:(id)a4
{
  -[MRV3NowPlayingController _notifyDelegateOfError:](self, "_notifyDelegateOfError:", a4);
}

- (void)_onQueue_clearStateForResolvedPlayerPath
{
  NSObject *v3;
  id v4;

  -[MRV3NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MRV3NowPlayingController _unregisterNotificationHandlers](self, "_unregisterNotificationHandlers");
  -[MRV3NowPlayingController deferredContentItemsToMerge](self, "deferredContentItemsToMerge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (MRNowPlayingControllerHelper)helper
{
  MRNowPlayingControllerHelper *helper;

  if (-[MRV3NowPlayingController isUpdating](self, "isUpdating"))
    helper = self->_helper;
  else
    helper = 0;
  return helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didLoadResponse");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v3 = *(_QWORD *)&a3;
  -[MRV3NowPlayingController helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackStateDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackQueueDidChange");
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
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentItemsDidUpdate");
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
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentItemsDidLoadArtwork");
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
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportedCommandsDidChange");
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
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerLastPlayingDateDidChange");
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
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientPropertiesDidChange");
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
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerPathDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfInvalidation
{
  void *v3;
  void (**v4)(void);
  id v5;

  -[MRV3NowPlayingController helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didInvalidate");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV3NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV3NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV3NowPlayingController *v9;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_8;
  }
  _MRLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "deferredContentItemsToMerge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "playbackQueueRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v12, "setArtworkWidth:", 0.0);
  objc_msgSend(v12, "setArtworkHeight:", 0.0);
  v13 = *(void **)(a1 + 40);
  objc_msgSend(v13, "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_48;
  v17[3] = &unk_1E30C7C78;
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v13, "_requestPlaybackQueueForPlayerPath:request:queue:completion:", v15, v12, v16, v17);

LABEL_8:
}

uint64_t __68__MRV3NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfPlaybackQueueChange:", a2);
}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV3NowPlayingController *v9;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "isEqual:", v3);

    if ((v8 & 1) == 0)
      goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mr_compactMap:", &__block_literal_global_101);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 40), "requestingQueue");
  _MRLogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
      __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1();

    objc_msgSend(*v4, "deferredContentItemsToMerge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v10);

  }
  else
  {
    if (v14)
      __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2();

    objc_msgSend(*v4, "_notifyDelegateOfUpdatedContentItemsWithContentItems:", v10);
  }

LABEL_13:
}

uint64_t __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV3NowPlayingController *v9;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "isEqual:", v3);

    if ((v8 & 1) == 0)
      goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mr_compactMap:", &__block_literal_global_50_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1();

  v13 = *v4;
  objc_msgSend(*v4, "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v4, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_51;
  v17[3] = &unk_1E30C7C78;
  v17[4] = *v4;
  objc_msgSend(v13, "_requestContentItemArtwork:forPlayerPath:queue:completion:", v11, v15, v16, v17);

LABEL_8:
}

uint64_t __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_51(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", a3);
  }
  else
  {
    _MRLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "contentItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> updated artwork for content items %@.", (uint8_t *)&v11, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "contentItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_notifyDelegateOfUpdatedArtwork:", v10);

  }
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV3NowPlayingController *v9;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  _BOOL4 IsAdvancing;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(1uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v9, "intValue"));
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRV3NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", buf, 0x16u);
  }

  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "playbackState");
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackStateChange:", objc_msgSend(v9, "intValue"));
  IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(v12);
  if (IsAdvancing != MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v9, "intValue")))
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v14, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_52;
    v18[3] = &unk_1E30C7CC0;
    v18[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v16, v17, v18);

  }
LABEL_10:

}

uint64_t __68__MRV3NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_52(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedPlayerLastPlayingDate:", a2);
}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV3NowPlayingController *v9;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  v4 = (id *)(a1 + 40);
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v3)
  {

  }
  else
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "isEqual:", v3);

    if ((v9 & 1) == 0)
      goto LABEL_8;
  }
  _MRLogForCategory(1uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1();

  v11 = *v4;
  objc_msgSend(*v4, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v4, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_53;
  v15[3] = &unk_1E30C7CE8;
  v15[4] = *v4;
  objc_msgSend(v11, "_requestSupportedCommandsForPlayerPath:queue:completion:", v13, v14, v15);

LABEL_8:
}

uint64_t __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_53(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfSupportedCommandsChange:", a2);
}

- (void)_handleClientPropertiesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV3NowPlayingController *v9;

  v4 = a3;
  -[MRV3NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOriginUserInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingClientUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  v6 = (id *)(a1 + 40);
  objc_msgSend(v7, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "origin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v3) & 1) != 0)
  {
    objc_msgSend(*v6, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v5);

    if (v14)
    {
      _MRLogForCategory(1uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_cold_1();

      v16 = *v6;
      objc_msgSend(*v6, "destination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v6, "queue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_54;
      v20[3] = &unk_1E30CA578;
      v20[4] = *v6;
      objc_msgSend(v16, "_requestClientPropertiesForPlayerPath:queue:completion:", v18, v19, v20);

    }
  }
  else
  {

  }
}

uint64_t __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfUpdatedClientProperties:", a2);
}

- (void)_registerNotificationHandlersForResolvedPlayerPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!-[MRV3NowPlayingController registeredForNotifications](self, "registeredForNotifications", a3))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    -[MRNowPlayingControllerConfiguration playbackQueueRequest](self->_configuration, "playbackQueueRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handlePlaybackQueueChangedNotification_, CFSTR("kMRPlayerPlaybackQueueChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handlePlaybackQueueContentItemsChangedNotification_, CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handlePlaybackQueueContentItemsArtworkChangedNotification_, CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification"), 0);

    }
    if (-[MRNowPlayingControllerConfiguration requestPlaybackState](self->_configuration, "requestPlaybackState"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handlePlaybackStateChangedNotification_, CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification"), 0);

    }
    if (-[MRNowPlayingControllerConfiguration requestSupportedCommands](self->_configuration, "requestSupportedCommands"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleSupportedCommandsChangedNotification_, CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification"), 0);

    }
    if (-[MRNowPlayingControllerConfiguration requestClientProperties](self->_configuration, "requestClientProperties"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleClientPropertiesDidChange_, CFSTR("kMRMediaRemoteApplicationClientStateDidChange"), 0);

    }
    -[MRV3NowPlayingController setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 1);
  }
}

- (void)_unregisterNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[MRV3NowPlayingController registeredForNotifications](self, "registeredForNotifications"))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    -[MRNowPlayingControllerConfiguration playbackQueueRequest](self->_configuration, "playbackQueueRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("kMRPlayerPlaybackQueueChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification"), 0);

    }
    if (-[MRNowPlayingControllerConfiguration requestPlaybackState](self->_configuration, "requestPlaybackState"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification"), 0);

    }
    if (-[MRNowPlayingControllerConfiguration requestSupportedCommands](self->_configuration, "requestSupportedCommands"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification"), 0);

    }
    if (-[MRNowPlayingControllerConfiguration requestClientProperties](self->_configuration, "requestClientProperties"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("kMRMediaRemoteApplicationClientStateDidChange"), 0);

    }
    -[MRV3NowPlayingController setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 0);
  }
}

- (BOOL)isUpdating
{
  void *v2;
  char v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[MRV3NowPlayingController queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  msv_dispatch_sync_on_queue();

  v3 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __38__MRV3NowPlayingController_isUpdating__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (MRNowPlayingPlayerResponse)response
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
  v10 = __Block_byref_object_copy__47;
  v11 = __Block_byref_object_dispose__47;
  v12 = 0;
  -[MRV3NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MRV3NowPlayingController_response__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingPlayerResponse *)v4;
}

void __36__MRV3NowPlayingController_response__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MRNowPlayingControllerConfiguration)configuration
{
  return (MRNowPlayingControllerConfiguration *)(id)-[MRNowPlayingControllerConfiguration copy](self->_configuration, "copy");
}

- (MRDestinationResolver)destinationResolver
{
  return self->_destinationResolver;
}

- (void)setDestinationResolver:(id)a3
{
  objc_storeStrong((id *)&self->_destinationResolver, a3);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isResolving
{
  return self->_isResolving;
}

- (void)setIsResolving:(BOOL)a3
{
  self->_isResolving = a3;
}

- (BOOL)requestingQueue
{
  return self->_requestingQueue;
}

- (void)setRequestingQueue:(BOOL)a3
{
  self->_requestingQueue = a3;
}

- (NSDate)lastQueueRequestDate
{
  return self->_lastQueueRequestDate;
}

- (void)setLastQueueRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueueRequestDate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MSVVariableIntervalTimer)loadRetryTimer
{
  return self->_loadRetryTimer;
}

- (void)setLoadRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadRetryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadRetryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastQueueRequestDate, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_destinationResolver, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

void __46__MRV3NowPlayingController__reloadWithReason___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> Error loading data %@.");
  OUTLINED_FUNCTION_8();
}

void __88__MRV3NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> Failed to retrieve player last playing date with error: %@");
  OUTLINED_FUNCTION_8();
}

void __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.");
  OUTLINED_FUNCTION_8();
}

void __80__MRV3NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.");
  OUTLINED_FUNCTION_8();
}

void __87__MRV3NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.");
  OUTLINED_FUNCTION_8();
}

void __72__MRV3NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

void __61__MRV3NowPlayingController__handleClientPropertiesDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "[MRV3NowPlayingController] <%@> processing ClientPropertiesDidChangeNotification.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

@end
