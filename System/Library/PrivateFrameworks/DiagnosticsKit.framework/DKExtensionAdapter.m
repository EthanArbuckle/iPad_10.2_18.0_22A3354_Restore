@implementation DKExtensionAdapter

- (DKExtensionAdapter)initWithExtensionAttributes:(id)a3
{
  id v5;
  DKExtensionAdapter *v6;
  DKExtensionAdapter *v7;
  uint64_t v8;
  NSMutableDictionary *requestLookup;
  uint64_t v10;
  NSMutableDictionary *extensionToRequestIdentifierLookup;
  dispatch_queue_t v12;
  OS_dispatch_queue *adapterQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *adapterConnectQueue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKExtensionAdapter;
  v6 = -[DKExtensionAdapter init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionAttributes, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    requestLookup = v7->_requestLookup;
    v7->_requestLookup = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    extensionToRequestIdentifierLookup = v7->_extensionToRequestIdentifierLookup;
    v7->_extensionToRequestIdentifierLookup = (NSMutableDictionary *)v10;

    v12 = dispatch_queue_create("com.apple.DiagnosticsKit.extensionAdapterQueue", 0);
    adapterQueue = v7->_adapterQueue;
    v7->_adapterQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.DiagnosticsKit.extensionAdapterConnectQueue", 0);
    adapterConnectQueue = v7->_adapterConnectQueue;
    v7->_adapterConnectQueue = (OS_dispatch_queue *)v14;

    -[DKExtensionAdapter _attachHandlersToExtension:](v7, "_attachHandlersToExtension:", v5);
  }

  return v7;
}

+ (id)extensionAdapterWithExtensionAttributes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtensionAttributes:", v4);

  return v5;
}

- (void)beginRequest:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v13);

  objc_sync_exit(v11);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v14, "setCompletion:", v15);

  objc_msgSend(v14, "setCompletionHandlerExecuted:", 0);
  objc_msgSend(v8, "setContext:", v14);
  objc_msgSend(v8, "setDelegate:", self);
  v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = __Block_byref_object_copy__1;
  v34[3] = __Block_byref_object_dispose__1;
  v35 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  -[DKExtensionAdapter adapterConnectQueue](self, "adapterConnectQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__DKExtensionAdapter_beginRequest_payload_completion___block_invoke;
  block[3] = &unk_24F99AEF0;
  v25 = &v27;
  v17 = v8;
  v24 = v17;
  v26 = &v33;
  dispatch_sync(v16, block);

  if (v28[5])
  {
    -[DKExtensionAdapter extensionToRequestIdentifierLookup](self, "extensionToRequestIdentifierLookup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v18);
    objc_msgSend(v17, "requestIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKExtensionAdapter extensionToRequestIdentifierLookup](self, "extensionToRequestIdentifierLookup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v28[5]);

    objc_sync_exit(v18);
    objc_msgSend(v17, "beginWithPayload:", v9);
  }
  else
  {
    DiagnosticsKitLogHandleForCategory(1);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "requestIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKExtensionAdapter beginRequest:payload:completion:].cold.1(v22, (uint64_t)v34, buf, v21);
    }

    +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 3, *(_QWORD *)(v34[0] + 40));
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

}

void __54__DKExtensionAdapter_beginRequest_payload_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "connectWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)cancelAll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_sync_exit(v3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cancel", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)request:(id)a3 didCompleteWithPayload:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "requestIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DiagnosticsKitLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v11;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_22DE4C000, v12, OS_LOG_TYPE_DEFAULT, "[RID: %@] request:didCompleteWithPayload: %@, error: %@", (uint8_t *)&v24, 0x20u);
  }

  objc_msgSend(v8, "extensionRequestIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DKExtensionAdapter extensionToRequestIdentifierLookup](self, "extensionToRequestIdentifierLookup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v14);
    -[DKExtensionAdapter extensionToRequestIdentifierLookup](self, "extensionToRequestIdentifierLookup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionRequestIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v16);

    objc_sync_exit(v14);
  }
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v11);

  objc_sync_exit(v17);
  objc_msgSend(v8, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "completion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_msgSend(v19, "completionHandlerExecuted");

    if ((v21 & 1) == 0)
    {
      DiagnosticsKitLogHandleForCategory(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412290;
        v25 = v11;
        _os_log_impl(&dword_22DE4C000, v22, OS_LOG_TYPE_DEFAULT, "[RID: %@] Calling final completion.", (uint8_t *)&v24, 0xCu);
      }

      objc_msgSend(v19, "completion");
      v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v23)[2](v23, v9, v10);

      objc_msgSend(v19, "setCompletion:", 0);
      objc_msgSend(v19, "setCompletionHandlerExecuted:", 1);
    }
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKExtensionAdapter extensionAttributes](self, "extensionAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; attributes: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_attachHandlersToExtension:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke;
  v13[3] = &unk_24F99AF18;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestCompletionBlock:", v13);

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2;
  v11[3] = &unk_24F99AF68;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequestCancellationBlock:", v11);

  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "extension", v5, 3221225472, __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_28, &unk_24F99AF90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestInterruptionBlock:", &v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "[ERID: %@] requestCompletionBlock", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "adapterQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_24;
    v7[3] = &unk_24F99ABB0;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteExtensionRequest:", *(_QWORD *)(a1 + 40));
}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "[ERID: %@] requestCancellationBlock", buf, 0xCu);
  }

  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 4, v6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "adapterQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_26;
    block[3] = &unk_24F99AF40;
    block[4] = WeakRetained;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCancelExtensionRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_28(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_28_cold_1();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKExtensionInterrupted"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 5, v6);

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "adapterQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_32;
    v8[3] = &unk_24F99ABB0;
    v8[4] = WeakRetained;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInterruptExtensionRequest:", *(_QWORD *)(a1 + 40));
}

- (id)_requestForExtensionRequestIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DKExtensionAdapter extensionToRequestIdentifierLookup](self, "extensionToRequestIdentifierLookup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "[RID: %@] [ERID: %@] Looking up request identifier", (uint8_t *)&v13, 0x16u);
  }

  if (v7)
  {
    -[DKExtensionAdapter requestLookup](self, "requestLookup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    -[DKExtensionAdapter requestLookup](self, "requestLookup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_didCompleteExtensionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[DKExtensionAdapter _requestForExtensionRequestIdentifier:](self, "_requestForExtensionRequestIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "complete");
  }
  else
  {
    DiagnosticsKitLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DKExtensionAdapter _didCompleteExtensionRequest:].cold.1();

  }
}

- (void)_didCancelExtensionRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[DKExtensionAdapter _requestForExtensionRequestIdentifier:](self, "_requestForExtensionRequestIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cancelWithError:", v7);
  }
  else
  {
    DiagnosticsKitLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DKExtensionAdapter _didCancelExtensionRequest:error:].cold.1();

  }
}

- (void)_didInterruptExtensionRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  -[DKExtensionAdapter _requestForExtensionRequestIdentifier:](self, "_requestForExtensionRequestIdentifier:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[DKExtensionAdapter requestLookup](self, "requestLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v4);
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v24)
  {
    if (v9)
      -[DKExtensionAdapter _didInterruptExtensionRequest:].cold.2(v24, v8);
  }
  else if (v9)
  {
    -[DKExtensionAdapter _didInterruptExtensionRequest:].cold.1();
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        DiagnosticsKitLogHandleForCategory(1);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "requestIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v16;
          _os_log_impl(&dword_22DE4C000, v15, OS_LOG_TYPE_DEFAULT, "[RID: %@] Calling interrupt", buf, 0xCu);

        }
        objc_msgSend(v14, "interrupt");
        objc_msgSend(v14, "extensionRequestIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          DiagnosticsKitLogHandleForCategory(1);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "requestIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v30 = v19;
            _os_log_impl(&dword_22DE4C000, v18, OS_LOG_TYPE_DEFAULT, "[RID: %@] Cancelling extension request", buf, 0xCu);

          }
          -[DKExtensionAdapter extensionAttributes](self, "extensionAttributes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "extension");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "extensionRequestIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cancelExtensionRequestWithIdentifier:", v22);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v11);
  }

}

- (DKExtensionAttributes)extensionAttributes
{
  return self->_extensionAttributes;
}

- (NSMutableDictionary)requestLookup
{
  return self->_requestLookup;
}

- (void)setRequestLookup:(id)a3
{
  objc_storeStrong((id *)&self->_requestLookup, a3);
}

- (NSMutableDictionary)extensionToRequestIdentifierLookup
{
  return self->_extensionToRequestIdentifierLookup;
}

- (void)setExtensionToRequestIdentifierLookup:(id)a3
{
  objc_storeStrong((id *)&self->_extensionToRequestIdentifierLookup, a3);
}

- (OS_dispatch_queue)adapterQueue
{
  return self->_adapterQueue;
}

- (void)setAdapterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_adapterQueue, a3);
}

- (OS_dispatch_queue)adapterConnectQueue
{
  return self->_adapterConnectQueue;
}

- (void)setAdapterConnectQueue:(id)a3
{
  objc_storeStrong((id *)&self->_adapterConnectQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterConnectQueue, 0);
  objc_storeStrong((id *)&self->_adapterQueue, 0);
  objc_storeStrong((id *)&self->_extensionToRequestIdentifierLookup, 0);
  objc_storeStrong((id *)&self->_requestLookup, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
}

- (void)beginRequest:(uint8_t *)buf payload:(os_log_t)log completion:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_error_impl(&dword_22DE4C000, log, OS_LOG_TYPE_ERROR, "[RID: %@] Did not get extension request identifier, error: %@", buf, 0x16u);

}

void __49__DKExtensionAdapter__attachHandlersToExtension___block_invoke_2_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_22DE4C000, v0, v1, "[ERID: %@] requestInterruptionBlock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didCompleteExtensionRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_22DE4C000, v0, v1, "[ERID: %@] Received completion for an unknown request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didCancelExtensionRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_22DE4C000, v0, v1, "[ERID: %@] Received cancellation for an unknown request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didInterruptExtensionRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_22DE4C000, v0, v1, "[ERID: %@] Received interruption for an unknown request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_didInterruptExtensionRequest:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22DE4C000, a2, OS_LOG_TYPE_ERROR, "[RID: %@] Received interruption for active request.", v4, 0xCu);

}

@end
