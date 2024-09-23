@implementation CXCallDirectoryExtensionHostContext

- (CXCallDirectoryExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  CXCallDirectoryExtensionHostContext *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CXCallDirectoryExtensionHostContext;
  v5 = -[CXCallDirectoryExtensionHostContext initWithInputItems:listenerEndpoint:contextUUID:](&v10, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
  {
    dispatch_queue_attr_make_initially_inactive(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.callkit.calldirectoryextensionhostcontext", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

  }
  return v5;
}

- (void)activate
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  CXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v4);

}

- (void)dealloc
{
  objc_super v3;

  -[CXCallDirectoryExtensionHostContext activate](self, "activate");
  v3.receiver = self;
  v3.super_class = (Class)CXCallDirectoryExtensionHostContext;
  -[CXCallDirectoryExtensionHostContext dealloc](&v3, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CXCallDirectoryExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)requestFailedWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke;
  v10[3] = &unk_1E4B89080;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[CXCallDirectoryExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestFailedWithError:reply:", v8, v7);

}

void __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isIncrementalLoadingAllowed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CXCallDirectoryExtensionHostContext_isIncrementalLoadingAllowed___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__CXCallDirectoryExtensionHostContext_isIncrementalLoadingAllowed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isIncrementalLoadingAllowed:", *(_QWORD *)(a1 + 40));

}

- (void)addBlockingEntriesWithData:(id)a3 reply:(id)a4
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
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CXCallDirectoryExtensionHostContext_addBlockingEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __72__CXCallDirectoryExtensionHostContext_addBlockingEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addBlockingEntriesWithData:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeBlockingEntriesWithData:(id)a3 reply:(id)a4
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
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CXCallDirectoryExtensionHostContext_removeBlockingEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __75__CXCallDirectoryExtensionHostContext_removeBlockingEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBlockingEntriesWithData:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeAllBlockingEntriesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__CXCallDirectoryExtensionHostContext_removeAllBlockingEntriesWithReply___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __73__CXCallDirectoryExtensionHostContext_removeAllBlockingEntriesWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllBlockingEntriesWithReply:", *(_QWORD *)(a1 + 40));

}

- (void)addIdentificationEntriesWithData:(id)a3 reply:(id)a4
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
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CXCallDirectoryExtensionHostContext_addIdentificationEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __78__CXCallDirectoryExtensionHostContext_addIdentificationEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIdentificationEntriesWithData:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeIdentificationEntriesWithData:(id)a3 reply:(id)a4
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
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CXCallDirectoryExtensionHostContext_removeIdentificationEntriesWithData_reply___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __81__CXCallDirectoryExtensionHostContext_removeIdentificationEntriesWithData_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeIdentificationEntriesWithData:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeAllIdentificationEntriesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__CXCallDirectoryExtensionHostContext_removeAllIdentificationEntriesWithReply___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __79__CXCallDirectoryExtensionHostContext_removeAllIdentificationEntriesWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllIdentificationEntriesWithReply:", *(_QWORD *)(a1 + 40));

}

- (void)completeRequestWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryExtensionHostContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CXCallDirectoryExtensionHostContext_completeRequestWithReply___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__CXCallDirectoryExtensionHostContext_completeRequestWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeRequestWithReply:", *(_QWORD *)(a1 + 40));

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_6);
  return (id)_extensionAuxiliaryVendorProtocol_interface_0;
}

void __72__CXCallDirectoryExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callDirectoryProviderVendorInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;
  _extensionAuxiliaryVendorProtocol_interface_0 = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_5_0);
  return (id)_extensionAuxiliaryHostProtocol_interface_0;
}

void __70__CXCallDirectoryExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callDirectoryProviderHostInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_0;
  _extensionAuxiliaryHostProtocol_interface_0 = v0;

}

- (CXCallDirectoryProviderHostProtocol)delegate
{
  return (CXCallDirectoryProviderHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __73__CXCallDirectoryExtensionHostContext_requestFailedWithError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "error: %@", (uint8_t *)&v2, 0xCu);
}

@end
