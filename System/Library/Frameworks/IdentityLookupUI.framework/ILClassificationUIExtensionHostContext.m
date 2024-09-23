@implementation ILClassificationUIExtensionHostContext

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;

  v6 = a4;
  -[ILClassificationUIExtensionHostContext setDelegate:](self, "setDelegate:", a3);
  -[ILClassificationUIExtensionHostContext setDelegateQueue:](self, "setDelegateQueue:", v6);

}

- (void)prepareForClassificationRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ILClassificationUIExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForClassificationRequest:", v4);

}

void __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  ILDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)classificationResponseForRequest:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke;
  v14[3] = &unk_24F1A2848;
  v14[4] = self;
  v15 = v6;
  v8 = v6;
  v9 = a3;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_3;
  v12[3] = &unk_24F1A2870;
  v13 = (id)MEMORY[0x22E2C0064](v14);
  v10 = v13;
  -[ILClassificationUIExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "classificationResponseForRequest:completion:", v9, v10);

}

void __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_2;
  block[3] = &unk_24F1A2820;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __86__ILClassificationUIExtensionHostContext_classificationResponseForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setReadyForClassificationResponse:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  ILDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_228FAC000, v5, OS_LOG_TYPE_DEFAULT, "setReadyForClassificationResponse: %d", buf, 8u);
  }

  -[ILClassificationUIExtensionHostContext delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ILClassificationUIExtensionHostContext delegateQueue](self, "delegateQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ILClassificationUIExtensionHostContext delegateQueue](self, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __76__ILClassificationUIExtensionHostContext_setReadyForClassificationResponse___block_invoke;
      v10[3] = &unk_24F1A2898;
      v10[4] = self;
      v11 = v3;
      dispatch_async(v9, v10);

    }
  }
}

void __76__ILClassificationUIExtensionHostContext_setReadyForClassificationResponse___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context:didBecomeReadyForClassificationResponse:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ILClassificationUIExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "il_classificationUIExtensionVendorInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "il_classificationUIExtensionHostInterface");
}

- (ILClassificationUIExtensionHostContextDelegate)delegate
{
  return (ILClassificationUIExtensionHostContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __74__ILClassificationUIExtensionHostContext_prepareForClassificationRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228FAC000, a2, a3, "error: %@", a5, a6, a7, a8, 2u);
}

@end
