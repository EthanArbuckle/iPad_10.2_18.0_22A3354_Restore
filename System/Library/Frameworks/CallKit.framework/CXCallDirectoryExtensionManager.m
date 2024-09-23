@implementation CXCallDirectoryExtensionManager

- (CXCallDirectoryExtensionManager)init
{
  CXCallDirectoryExtensionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  CXCallDirectoryManager *v5;
  CXCallDirectoryManager *manager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXCallDirectoryExtensionManager;
  v2 = -[CXCallDirectoryExtensionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.calldirectoryextensionmanager", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(CXCallDirectoryManager);
    manager = v2->_manager;
    v2->_manager = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_storeExtensionsChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)CXCallDirectoryExtensionManager;
  -[CXCallDirectoryExtensionManager dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXCallDirectoryExtensionManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CXCallDirectoryExtensionManager_setDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

uint64_t __53__CXCallDirectoryExtensionManager_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
}

- (void)beginObservingExtensions
{
  NSObject *v3;
  _QWORD block[5];

  -[CXCallDirectoryExtensionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke(uint64_t a1)
{
  const char *v2;
  int *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = CXCallDirectoryStoreExtensionsChangedNotification;
  v3 = *(int **)(a1 + 32);
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke_2;
  v5[3] = &unk_1E4B89100;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v2, v3 + 2, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__CXCallDirectoryExtensionManager_beginObservingExtensions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_extensionsChanged");

}

- (void)extensionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryExtensionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E4B89520;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "getExtensionsWithCompletionHandler:", v3);

}

void __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2_cold_1((uint64_t)v6, v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_extensionsChanged
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[CXCallDirectoryExtensionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CXCallDirectoryExtensionManager delegateQueue](self, "delegateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CXCallDirectoryExtensionManager delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__CXCallDirectoryExtensionManager__extensionsChanged__block_invoke;
    block[3] = &unk_1E4B88AE8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __53__CXCallDirectoryExtensionManager__extensionsChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionsChangedForCallDirectoryExtensionManager:", *(_QWORD *)(a1 + 32));

}

- (void)setPrioritizedExtensionIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "prioritizedExtensionIdentifiers: %@", (uint8_t *)&v10, 0xCu);
  }

  -[CXCallDirectoryExtensionManager manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrioritizedExtensionIdentifiers:completionHandler:", v6, v7);

}

- (void)setEnabled:(BOOL)a3 forExtension:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, uint64_t);
  BOOL v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  switch(objc_msgSend(v8, "state"))
  {
    case 1:
    case 2:
      if (v6)
        goto LABEL_19;
      CXDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:].cold.1(v8);
      v11 = 6;
      goto LABEL_16;
    case 3:
      CXDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:].cold.2(v6, v8);
      v11 = 7;
      goto LABEL_16;
    case 4:
      if (!v6)
        goto LABEL_19;
      CXDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:].cold.3(v8);
      v11 = 101;
LABEL_16:

      objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        if (v9)
          v9[2](v9, v12);
      }
      else
      {
LABEL_19:
        CXDefaultLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          v22 = v6;
          v23 = 2112;
          v24 = v8;
          _os_log_impl(&dword_1A402D000, v14, OS_LOG_TYPE_DEFAULT, "Setting enabled to %d for extension %@", buf, 0x12u);
        }

        -[CXCallDirectoryExtensionManager manager](self, "manager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke;
        v17[3] = &unk_1E4B89548;
        v18 = v8;
        v20 = v6;
        v19 = v9;
        objc_msgSend(v15, "setEnabled:forExtensionWithIdentifier:completionHandler:", v6, v16, v17);

        v13 = 0;
      }

      return;
    case 5:
      CXDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryExtensionManager setEnabled:forExtension:completion:].cold.2(v6, v8);
      v11 = 102;
      goto LABEL_16;
    default:
      goto LABEL_19;
  }
}

void __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)getLastUpdatedCallDirectoryInfoWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "getLastUpdatedCallDirectoryInfoWithReply", v7, 2u);
  }

  -[CXCallDirectoryExtensionManager manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLastUpdatedCallDirectoryInfoWithCompletionHandler:", v4);

}

- (CXCallDirectoryManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CXCallDirectoryExtensionManagerDelegate)delegate
{
  return (CXCallDirectoryExtensionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (int)storeExtensionsChangedNotifyToken
{
  return self->_storeExtensionsChangedNotifyToken;
}

- (void)setStoreExtensionsChangedNotifyToken:(int)a3
{
  self->_storeExtensionsChangedNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __67__CXCallDirectoryExtensionManager_extensionsWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Error getting extensions: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setEnabled:(void *)a1 forExtension:completion:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "state");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1A402D000, v1, v2, "Not setting enabled to %d since state is %ld", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)setEnabled:(uint64_t)a1 forExtension:(void *)a2 completion:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1A402D000, v2, v3, "Not setting enabled to %d since state is %ld", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)setEnabled:(void *)a1 forExtension:completion:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "state");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1A402D000, v1, v2, "Not setting enabled to %d since state is %ld", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_2();
}

void __70__CXCallDirectoryExtensionManager_setEnabled_forExtension_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 48);
  v8 = 138412802;
  v9 = v6;
  v10 = 1024;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_1A402D000, a3, OS_LOG_TYPE_ERROR, "Error setting enabled of extension with identifier %@ to %d: %@", (uint8_t *)&v8, 0x1Cu);

}

@end
