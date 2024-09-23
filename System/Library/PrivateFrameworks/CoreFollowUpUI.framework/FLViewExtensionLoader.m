@implementation FLViewExtensionLoader

- (id)remoteViewController
{
  UIViewController *extensionViewController;

  extensionViewController = self->_extensionViewController;
  if (!extensionViewController)
  {
    -[FLHeadlessExtensionLoader _loadExtension:](self, "_loadExtension:", 0);
    extensionViewController = self->_extensionViewController;
  }
  return extensionViewController;
}

- (BOOL)_setupSessionIfNeeded:(id *)a3
{
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  -[FLHeadlessExtensionLoader extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLHeadlessExtensionLoader sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v5)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v7 = dispatch_semaphore_create(0);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke;
    v15 = &unk_24D55C9F8;
    v17 = &v20;
    v18 = &v26;
    v19 = &v32;
    v8 = v7;
    v16 = v8;
    -[FLViewExtensionLoader _setupSessionWithExtension:completion:](self, "_setupSessionWithExtension:completion:", v5, &v12);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&self->_extensionViewController, (id)v27[5]);
    -[FLHeadlessExtensionLoader setSessionID:](self, "setSessionID:", v21[5], v12, v13, v14, v15);
    if (a3)
      *a3 = objc_retainAutorelease((id)v33[5]);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  -[FLHeadlessExtensionLoader sessionID](self, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

void __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke_cold_1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_21641D000, v11, OS_LOG_TYPE_DEFAULT, "Extension setup: %@ - %@", (uint8_t *)&v27, 0x16u);
  }

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v8;
  v20 = v8;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v7;
  v23 = v7;

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v9;
  v26 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setupSessionWithExtension:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke;
  v7[3] = &unk_24D55CA20;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", MEMORY[0x24BDBD1A8], 0, v7);

}

void __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);

  v5 = a4;
  if (v5)
  {
    _FLLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v13();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViewController, 0);
}

void __47__FLViewExtensionLoader__setupSessionIfNeeded___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21641D000, a2, a3, "Failed to setup extension with error: %@", a5, a6, a7, a8, 2u);
}

void __63__FLViewExtensionLoader__setupSessionWithExtension_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21641D000, a2, a3, "Failed to instantiate extension controller with error: %@", a5, a6, a7, a8, 2u);
}

@end
