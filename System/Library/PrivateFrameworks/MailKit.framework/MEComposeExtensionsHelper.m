@implementation MEComposeExtensionsHelper

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MEComposeExtensionsHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

void __32__MEComposeExtensionsHelper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (MEComposeExtensionsHelper)initWithComposeSession:(id)a3 extensionsController:(id)a4 iconReloader:(id)a5
{
  id v9;
  id v10;
  id v11;
  MEComposeExtensionsHelper *v12;
  MEComposeExtensionsHelper *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *extensionRequestDispatcherQueue;
  id v23;
  id v24;
  uint64_t v25;
  EFLocked *remoteExtensions;
  EFCancelationToken *v27;
  EFCancelationToken *extensionsObserverCancelable;
  id v29;
  void *v30;
  uint64_t v31;
  EFLocked *shouldPerformSendValidationMap;
  MEAppExtensionsController *extensionsController;
  void *v34;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)MEComposeExtensionsHelper;
  v12 = -[MEComposeExtensionsHelper init](&v39, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composeSession, a3);
    objc_storeStrong((id *)&v13->_extensionsController, a4);
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[MEComposeSession sessionID](v13->_composeSession, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("com.apple.email.composeextensionrequests.%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v18, v20);
    extensionRequestDispatcherQueue = v13->_extensionRequestDispatcherQueue;
    v13->_extensionRequestDispatcherQueue = (OS_dispatch_queue *)v21;

    v23 = objc_alloc(MEMORY[0x24BE2E658]);
    v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = objc_msgSend(v23, "initWithObject:", v24);
    remoteExtensions = v13->_remoteExtensions;
    v13->_remoteExtensions = (EFLocked *)v25;

    v27 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x24BE2E638]);
    extensionsObserverCancelable = v13->_extensionsObserverCancelable;
    v13->_extensionsObserverCancelable = v27;

    objc_storeWeak((id *)&v13->_extensionDelegate, v11);
    v29 = objc_alloc(MEMORY[0x24BE2E658]);
    v30 = (void *)objc_opt_new();
    v31 = objc_msgSend(v29, "initWithObject:", v30);
    shouldPerformSendValidationMap = v13->_shouldPerformSendValidationMap;
    v13->_shouldPerformSendValidationMap = (EFLocked *)v31;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    extensionsController = v13->_extensionsController;
    v40[0] = CFSTR("MEComposeSessionHandler");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke;
    v36[3] = &unk_24C4D2758;
    objc_copyWeak(&v37, &location);
    -[MEAppExtensionsController registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:](extensionsController, "registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:", v13, v34, 0, v36);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id *WeakRetained;
  id *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_cold_1((uint64_t)v10, v13);

    }
    else
    {
      v14 = WeakRetained[3];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_9;
      v16[3] = &unk_24C4D2730;
      v15 = v9;
      v17 = v15;
      objc_msgSend(v14, "performWhileLocked:", v16);
      objc_msgSend(v12, "_dispatchMailComposeSessionDidBeginForExtensions:", v15);
      objc_msgSend(v12[4], "addCancelable:", v8);

    }
  }

}

uint64_t __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[EFLocked getObject](self->_remoteExtensions, "getObject");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "composeSessionInterface");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "mailComposeSessionDidEnd:", self->_composeSession);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  -[EFCancelationToken cancel](self->_extensionsObserverCancelable, "cancel");
  v8.receiver = self;
  v8.super_class = (Class)MEComposeExtensionsHelper;
  -[MEComposeExtensionsHelper dealloc](&v8, sel_dealloc);
}

- (void)extensionsMatched:(id)a3
{
  id v4;
  EFLocked *remoteExtensions;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__MEComposeExtensionsHelper_extensionsMatched___block_invoke;
  v7[3] = &unk_24C4D2730;
  v6 = v4;
  v8 = v6;
  -[EFLocked performWhileLocked:](remoteExtensions, "performWhileLocked:", v7);
  -[MEComposeExtensionsHelper _dispatchMailComposeSessionDidBeginForExtensions:](self, "_dispatchMailComposeSessionDidBeginForExtensions:", v6);

}

uint64_t __47__MEComposeExtensionsHelper_extensionsMatched___block_invoke(uint64_t a1, void *a2)
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
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__MEComposeExtensionsHelper_extensionsNoLongerMatching___block_invoke;
  v8[3] = &unk_24C4D2730;
  v7 = v4;
  v9 = v7;
  -[EFLocked performWhileLocked:](remoteExtensions, "performWhileLocked:", v8);
  -[MEComposeExtensionsHelper extensionDelegate](self, "extensionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadEmailAddressTokenIcons");

}

uint64_t __56__MEComposeExtensionsHelper_extensionsNoLongerMatching___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
}

- (void)_dispatchMailComposeSessionDidBeginForExtensions:(id)a3
{
  id v4;
  NSObject *extensionRequestDispatcherQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  extensionRequestDispatcherQueue = self->_extensionRequestDispatcherQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke;
  block[3] = &unk_24C4D26E0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(extensionRequestDispatcherQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[5];
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v14;
      v5 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v14 != v4)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v7, "interfaceForExtensionCapability:", CFSTR("MEComposeSessionHandler"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = v5;
          v12[1] = 3221225472;
          v12[2] = __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_2;
          v12[3] = &unk_24C4D2780;
          v12[4] = WeakRetained;
          v12[5] = v7;
          objc_msgSend(v8, "addSuccessBlock:", v12);

          objc_msgSend(v7, "interfaceForExtensionCapability:", CFSTR("MEComposeSessionHandler"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11[0] = v5;
          v11[1] = 3221225472;
          v11[2] = __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15;
          v11[3] = &unk_24C4D27A8;
          v11[4] = WeakRetained;
          objc_msgSend(v9, "addFailureBlock:", v11);

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v3);
    }

  }
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_20BB85000, v4, OS_LOG_TYPE_DEFAULT, "ComposeSession:%@ Dispatchin mailComposeSessionDidBegin for extension %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v3, "mailComposeSessionDidBegin:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "extensionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadEmailAddressTokenIcons");

  objc_msgSend(*(id *)(a1 + 40), "extensionHostContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setComposeExtensionHostDelegate:", *(_QWORD *)(a1 + 32));

}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15_cold_1(a1, (uint64_t)v3, v4);

}

- (void)dispatchEmailAddressTokenIconRequestsForMailMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *extensionRequestDispatcherQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  extensionRequestDispatcherQueue = self->_extensionRequestDispatcherQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke;
  block[3] = &unk_24C4D2820;
  objc_copyWeak(&v17, &location);
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  dispatch_async(extensionRequestDispatcherQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id obj;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "getObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[1], "setMailMessage:", *(_QWORD *)(a1 + 32));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v17;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v24 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE2E680], "promise");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "synchronousComposeSessionInterface");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v3[1];
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_2;
          v20[3] = &unk_24C4D27F8;
          v20[4] = v7;
          v21 = *(id *)(a1 + 40);
          v11 = v8;
          v22 = v11;
          objc_msgSend(v9, "session:annotateAddressesWithCompletionHandler:", v10, v20);

          objc_msgSend(v11, "future");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          v13 = (id)objc_msgSend(v12, "resultWithTimeout:error:", &v19, 3.0);
          v14 = v19;

          if (v14)
          {
            +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = v3[1];
              *(_DWORD *)buf = 138412546;
              v28 = v7;
              v29 = 2112;
              v30 = v16;
              _os_log_error_impl(&dword_20BB85000, v15, OS_LOG_TYPE_ERROR, "Extension:%@ timeout when requesting address annotations for session %@", buf, 0x16u);
            }

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v4);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_3;
  v17[3] = &unk_24C4D27D0;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "ef_mapValues:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v9 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }

  v11 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishWithResult:", v12);

}

id __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginatorExtensionDisplayName:", v4);

  return v3;
}

- (void)regenerateEmailAddressTokenChangesForSession:(id)a3 forContextUUID:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MEComposeExtensionsHelper *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MEComposeExtensionsHelper extensionDelegate](self, "extensionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_20BB85000, v5, OS_LOG_TYPE_DEFAULT, "MEMailComposeExtensionsHelper[%@]: Ivoking %@ to reload address token icons.", (uint8_t *)&v8, 0x16u);

  }
  -[MEComposeExtensionsHelper extensionDelegate](self, "extensionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadEmailAddressTokenIcons");

}

- (void)regenerateSecurityStatusInformationForSession:(id)a3 forContextUUID:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MEComposeExtensionsHelper *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MEComposeExtensionsHelper extensionDelegate](self, "extensionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_20BB85000, v5, OS_LOG_TYPE_DEFAULT, "MEMailComposeExtensionsHelper[%@]: Ivoking %@ to reload message security status information.", (uint8_t *)&v8, 0x16u);

  }
  -[MEComposeExtensionsHelper extensionDelegate](self, "extensionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadCanSignAndEncryptControls");

}

- (void)performSendValidationForMessage:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (BOOL)shouldPerformSendValidation
{
  return 0;
}

- (void)getAdditionalHeadersForMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *extensionRequestDispatcherQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  extensionRequestDispatcherQueue = self->_extensionRequestDispatcherQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke;
  block[3] = &unk_24C4D2820;
  objc_copyWeak(&v17, &location);
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  dispatch_async(extensionRequestDispatcherQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id obj;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "getObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[1], "setMailMessage:", *(_QWORD *)(a1 + 32));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v17;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v24 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE2E680], "promise");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "synchronousComposeSessionInterface");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v3[1];
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke_2;
          v20[3] = &unk_24C4D2848;
          v21 = *(id *)(a1 + 40);
          v11 = v8;
          v22 = v11;
          objc_msgSend(v9, "session:getAdditionalHeadersWithCompletion:", v10, v20);

          objc_msgSend(v11, "future");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          v13 = (id)objc_msgSend(v12, "resultWithTimeout:error:", &v19, 3.0);
          v14 = v19;

          if (v14)
          {
            +[MEComposeExtensionsHelper log](MEComposeExtensionsHelper, "log");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = v3[1];
              *(_DWORD *)buf = 138412546;
              v28 = v7;
              v29 = 2112;
              v30 = v16;
              _os_log_error_impl(&dword_20BB85000, v15, OS_LOG_TYPE_ERROR, "Extension:%@ timeout when fetching additional headers for session %@", buf, 0x16u);
            }

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v4);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

}

- (void)appExtensionViewControllerForExtensionIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MEComposeSession *composeSession;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[EFLocked getObject](self->_remoteExtensions, "getObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_24C4D2698;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "ef_firstObjectPassingTest:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  composeSession = self->_composeSession;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke_2;
  v14[3] = &unk_24C4D2870;
  v13 = v7;
  v15 = v13;
  objc_msgSend(v11, "getMailComposeExtensionViewControllerForSession:hostDelegate:completionHandler:", composeSession, self, v14);

}

uint64_t __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (MEMailComposeExtensionDelegate)extensionDelegate
{
  return (MEMailComposeExtensionDelegate *)objc_loadWeakRetained((id *)&self->_extensionDelegate);
}

- (void)setExtensionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_extensionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionDelegate);
  objc_storeStrong((id *)&self->_shouldPerformSendValidationMap, 0);
  objc_storeStrong((id *)&self->_extensionRequestDispatcherQueue, 0);
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);
  objc_storeStrong((id *)&self->_composeSession, 0);
}

void __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20BB85000, a2, OS_LOG_TYPE_ERROR, "Failed to register for app extensions changes error:%@", (uint8_t *)&v2, 0xCu);
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20BB85000, log, OS_LOG_TYPE_ERROR, "ComposeSession:%@ Failed to fetch the compose session interface due to %@", (uint8_t *)&v4, 0x16u);
}

@end
