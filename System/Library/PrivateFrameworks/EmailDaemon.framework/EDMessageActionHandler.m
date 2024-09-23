@implementation EDMessageActionHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EDMessageActionHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_43 != -1)
    dispatch_once(&log_onceToken_43, block);
  return (OS_os_log *)(id)log_log_43;
}

void __29__EDMessageActionHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_43;
  log_log_43 = (uint64_t)v1;

}

- (EDMessageActionHandler)initWithExtensionsController:(id)a3
{
  id v5;
  EDMessageActionHandler *v6;
  EDMessageActionHandler *v7;
  EFCancelationToken *v8;
  EFCancelationToken *extensionsObserverCancelable;
  id v10;
  id v11;
  uint64_t v12;
  EFLocked *remoteExtensions;
  MEAppExtensionsController *extensionsController;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDMessageActionHandler;
  v6 = -[EDMessageActionHandler init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionsController, a3);
    v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    extensionsObserverCancelable = v7->_extensionsObserverCancelable;
    v7->_extensionsObserverCancelable = v8;

    v10 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_msgSend(v10, "initWithObject:", v11);
    remoteExtensions = v7->_remoteExtensions;
    v7->_remoteExtensions = (EFLocked *)v12;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    extensionsController = v7->_extensionsController;
    v21[0] = *MEMORY[0x1E0D46980];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__EDMessageActionHandler_initWithExtensionsController___block_invoke;
    v17[3] = &unk_1E949CEA0;
    objc_copyWeak(&v18, &location);
    -[MEAppExtensionsController registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:](extensionsController, "registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:", v7, v15, 0, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __55__EDMessageActionHandler_initWithExtensionsController___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id *WeakRetained;
  id *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      +[EDMessageActionHandler log](EDMessageActionHandler, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_cold_1((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

    }
    else
    {
      v20 = WeakRetained[2];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_7;
      v22[3] = &unk_1E949CE78;
      v23 = v9;
      objc_msgSend(v20, "performWhileLocked:", v22);
      objc_msgSend(v12[3], "addCancelable:", v8);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("EDMessageActionHandlerProvidersChanged"), 0);

    }
  }

}

uint64_t __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_extensionsObserverCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EDMessageActionHandler;
  -[EDMessageActionHandler dealloc](&v3, sel_dealloc);
}

- (id)actionProviderInterfacesByExtensionID
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[EFLocked getObject](self->_remoteExtensions, "getObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__EDMessageActionHandler_actionProviderInterfacesByExtensionID__block_invoke;
  v6[3] = &unk_1E949CEC8;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __63__EDMessageActionHandler_actionProviderInterfacesByExtensionID__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "synchronousMessageActionProviderInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "extensionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

}

- (NSArray)messageActionProviders
{
  void *v2;
  void *v3;

  -[EFLocked getObject](self->_remoteExtensions, "getObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

EDMessageActionProvider *__48__EDMessageActionHandler_messageActionProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  EDMessageActionProvider *v3;
  void *v4;
  void *v5;
  EDMessageActionProvider *v6;

  v2 = a2;
  v3 = [EDMessageActionProvider alloc];
  objc_msgSend(v2, "extensionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDMessageActionProvider initWithID:name:](v3, "initWithID:name:", v4, v5);

  return v6;
}

- (id)actionDecisionForMessage:(id)a3 usingMessageActionProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDMessageActionHandler actionProviderInterfacesByExtensionID](self, "actionProviderInterfacesByExtensionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__12;
  v39 = __Block_byref_object_dispose__12;
  v40 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
  objc_msgSend(v10, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __78__EDMessageActionHandler_actionDecisionForMessage_usingMessageActionProvider___block_invoke;
    v31[3] = &unk_1E949CF10;
    v13 = v11;
    v32 = v13;
    v34 = &v35;
    v33 = v10;
    objc_msgSend(v9, "decideActionForMessage:completionHandler:", v6, v31);
    v30 = 0;
    v14 = (id)-[NSObject resultWithTimeout:error:](v13, "resultWithTimeout:error:", &v30, 2.0);
    v15 = v30;
    if (v15)
    {
      -[NSObject cancel](v13, "cancel");
      +[EDMessageActionHandler log](EDMessageActionHandler, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "ef_publicDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v7;
        v43 = 2114;
        v44 = v17;
        _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Error occured requesting action for extension:  %{public}@: Error: %{public}@", buf, 0x16u);

      }
    }

    v18 = v32;
  }
  else
  {
    +[EDMessageActionHandler log](EDMessageActionHandler, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[EDMessageActionHandler actionDecisionForMessage:usingMessageActionProvider:].cold.1((uint64_t)v7, v18, v19, v20, v21, v22, v23, v24);
    v15 = 0;
  }

  v25 = (void *)v36[5];
  if (v25)
  {
    +[EDMessageActionHandler log](EDMessageActionHandler, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)v36[5];
      *(_DWORD *)buf = 138543618;
      v42 = v7;
      v43 = 2114;
      v44 = v27;
      _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Received decision from action handler: %{public}@: %{public}@", buf, 0x16u);
    }

    v25 = (void *)v36[5];
  }
  v28 = v25;

  _Block_object_dispose(&v35, 8);
  return v28;
}

void __78__EDMessageActionHandler_actionDecisionForMessage_usingMessageActionProvider___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

- (void)extensionsMatched:(id)a3
{
  id v4;
  EFLocked *remoteExtensions;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__EDMessageActionHandler_extensionsMatched___block_invoke;
  v8[3] = &unk_1E949CE78;
  v7 = v4;
  v9 = v7;
  -[EFLocked performWhileLocked:](remoteExtensions, "performWhileLocked:", v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("EDMessageActionHandlerProvidersChanged"), 0);

}

uint64_t __44__EDMessageActionHandler_extensionsMatched___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

- (void)extensionsNoLongerMatching:(id)a3
{
  id v4;
  EFLocked *remoteExtensions;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__EDMessageActionHandler_extensionsNoLongerMatching___block_invoke;
  v8[3] = &unk_1E949CE78;
  v7 = v4;
  v9 = v7;
  -[EFLocked performWhileLocked:](remoteExtensions, "performWhileLocked:", v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("EDMessageActionHandlerProvidersChanged"), 0);

}

uint64_t __53__EDMessageActionHandler_extensionsNoLongerMatching___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
}

- (NSArray)requiredHeaders
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[EDMessageActionHandler actionProviderInterfacesByExtensionID](self, "actionProviderInterfacesByExtensionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __41__EDMessageActionHandler_requiredHeaders__block_invoke;
        v13[3] = &unk_1E949CF38;
        v14 = v3;
        objc_msgSend(v10, "requiredHeadersWithCompletion:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

uint64_t __41__EDMessageActionHandler_requiredHeaders__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);
}

void __55__EDMessageActionHandler_initWithExtensionsController___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Failed to register for app extensions changes error:%@", a5, a6, a7, a8, 2u);
}

- (void)actionDecisionForMessage:(uint64_t)a3 usingMessageActionProvider:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Extension not found while attempting to find action: %{public}@", a5, a6, a7, a8, 2u);
}

@end
