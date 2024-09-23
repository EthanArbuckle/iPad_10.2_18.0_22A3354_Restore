@implementation HDBackgroundObservationServerExtension

- (HDBackgroundObservationServerExtension)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)_initWithExtension:(id)a3
{
  id v5;
  HDBackgroundObservationServerExtension *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  OS_dispatch_queue *clientQueue;
  uint64_t v14;
  NSString *extensionIdentifier;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *appIdentifier;
  void *v21;
  NSObject *v23;
  void *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDBackgroundObservationServerExtension;
  v6 = -[HDBackgroundObservationServerExtension init](&v26, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("extension.%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_extension, a3);
    objc_msgSend(v5, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v6->_extensionIdentifier;
    v6->_extensionIdentifier = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v6->_extensionIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "containingBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      appIdentifier = v6->_appIdentifier;
      v6->_appIdentifier = (NSString *)v19;

    }
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_DEBUG))
    {
      v23 = v21;
      objc_msgSend(v5, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extensionPointIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v24;
      v29 = 2114;
      v30 = v25;
      _os_log_debug_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEBUG, "Initialized app extension server with extension ID: %{public}@ for extension point ID: %{public}@", buf, 0x16u);

    }
  }

  return v6;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E6CED3F8;
  aBlock[4] = self;
  v12 = v4;
  v6 = _Block_copy(aBlock);
  queue = self->_queue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E6CE9C08;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

void __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6CEBC78;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  os_log_t v15;
  _BOOL4 v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0);
    return;
  }
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5288];
  v3 = *MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v29 = v4;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_INFO, "Connecting to app extension: %{public}@", buf, 0xCu);
  }
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v27 = 0;
  objc_msgSend(v5, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_extensionContextForUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_auxiliaryConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("[%@] app extension failed to get extension context for sessionUUID: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v8);
      v13 = objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v14 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        v30 = 2114;
        v31 = v13;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to connect to app extension: %{public}@ with error: %{public}@", buf, 0x16u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = (id)v13;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v8);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v9);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_198;
      v26[3] = &unk_1E6CE8030;
      v26[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 48);
      *(_QWORD *)(v22 + 48) = v21;

      (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) != 0, v7);
    }

    goto LABEL_20;
  }
  _HKInitializeLogging();
  v15 = *v2;
  v16 = os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v16)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      v30 = 2114;
      v31 = (uint64_t)v7;
      v18 = "Failed to activate app extension: %{public}@ with error: %{public}@";
      v19 = v15;
      v20 = 22;
LABEL_22:
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
  }
  else if (v16)
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    *(_DWORD *)buf = 138543362;
    v29 = v25;
    v18 = "Failed to activate app extension: %{public}@";
    v19 = v15;
    v20 = 12;
    goto LABEL_22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_20:

}

void __71__HDBackgroundObservationServerExtension_connectWithCompletionHandler___block_invoke_198(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Failed to connect to app extension: %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)disconnect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDBackgroundObservationServerExtension_disconnect__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__HDBackgroundObservationServerExtension_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 32))
  {
    objc_msgSend(*(id *)(v1 + 48), "performCleanup");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "Disconnected from app extension: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)notifyExtensionOfUpdateForSampleType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6CED3F8;
  aBlock[4] = self;
  v17 = v7;
  v9 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_3;
  block[3] = &unk_1E6CECC58;
  v14 = v6;
  v15 = v9;
  block[4] = self;
  v11 = v6;
  v12 = v9;
  dispatch_async(queue, block);

}

void __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_2;
  block[3] = &unk_1E6CEBC78;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) && (v3 = *(void **)(v2 + 48)) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_202;
    v8[3] = &unk_1E6CE7DE0;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "didReceiveUpdateForSampleType:completionHandler:", v4, v8);
    v5 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("app extension has no active connection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "No active app extension was found for %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __97__HDBackgroundObservationServerExtension_notifyExtensionOfUpdateForSampleType_completionHandler___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)notifyExtensionOfUpcomingTimeout
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HDBackgroundObservationServerExtension_notifyExtensionOfUpcomingTimeout__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __74__HDBackgroundObservationServerExtension_notifyExtensionOfUpcomingTimeout__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) && (v3 = *(void **)(v2 + 48)) != 0)
  {
    objc_msgSend(v3, "backgroundObservationExtensionTimeWillExpire");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  }
  else
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v6 = 138543362;
      v7 = v5;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "No active app extension was found for %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: <%p> Extension ID: %@, App Bundle ID: %@"), v5, self, self->_extensionIdentifier, self->_appIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unitTest_sessionUUID
{
  return self->_sessionUUID;
}

- (id)unitTest_extensionContext
{
  return self->_extensionContext;
}

- (id)unitTest_extensionHostContext
{
  return self->_extensionHostContext;
}

- (id)unitTest_queue
{
  return self->_queue;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (BOOL)unitTest_notifiedExtensionDueToTimeout
{
  return self->_unitTest_notifiedExtensionDueToTimeout;
}

- (void)setUnitTest_notifiedExtensionDueToTimeout:(BOOL)a3
{
  self->_unitTest_notifiedExtensionDueToTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
