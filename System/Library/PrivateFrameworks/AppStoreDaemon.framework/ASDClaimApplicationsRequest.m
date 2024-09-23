@implementation ASDClaimApplicationsRequest

- (ASDClaimApplicationsRequest)initWithOptions:(id)a3
{
  id v4;
  ASDClaimApplicationsRequest *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *calloutQueue;
  uint64_t v10;
  ASDClaimApplicationsRequestOptions *options;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDClaimApplicationsRequest;
  v5 = -[ASDClaimApplicationsRequest init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDClaimApplicationsRequest.access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDClaimApplicationsRequest.callout", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ASDClaimApplicationsRequestOptions *)v10;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ASDClaimApplicationsRequest;
  -[ASDClaimApplicationsRequest dealloc](&v3, sel_dealloc);
}

- (void)sendRequestWithCompletionBlock:(id)a3
{
  ASDClaimApplicationsRequestOptions *v5;
  id v6;
  NSObject *accessQueue;
  ASDClaimApplicationsRequestOptions *v8;
  id v9;
  _QWORD block[5];
  ASDClaimApplicationsRequestOptions *v11;
  id v12;

  v5 = self->_options;
  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  dispatch_async(accessQueue, block);

}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (!v3)
  {
    if (-[ASDBaseClient _clientHasEntitlement:](*(_QWORD *)(a1 + 32), CFSTR("com.apple.appstored.private"))
      || -[ASDBaseClient _clientHasEntitlement:](v2, CFSTR("com.apple.appstored.install-apps")))
    {
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = (id)objc_opt_class();
      v10 = v18;
      _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@]: Treating as legacy client", buf, 0xCu);

    }
    if (-[ASDBaseClient _clientHasEntitlement:](v2, CFSTR("com.apple.itunesstored.private")))
    {
LABEL_7:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appstored.xpc.storequeue"), 0);
      v5 = *(void **)(v2 + 24);
      *(_QWORD *)(v2 + 24) = v4;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE391EF0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 24), "setRemoteObjectInterface:", v6);
      objc_msgSend(*(id *)(v2 + 24), "setInvalidationHandler:", &__block_literal_global_3);
      objc_msgSend(*(id *)(v2 + 24), "setInterruptionHandler:", &__block_literal_global_68);
      objc_msgSend(*(id *)(v2 + 24), "_setQueue:", *(_QWORD *)(v2 + 8));
      objc_msgSend(*(id *)(v2 + 24), "resume");

    }
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 24);
  }
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_2;
  v13[3] = &unk_1E37BE3B0;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_6;
  v11[3] = &unk_1E37BDEE8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  objc_msgSend((id)v2, "_call:run:error:", v3, v13, v11);

}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_3;
  v4[3] = &unk_1E37BE388;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "claimApplicationsWithOptions:completionBlock:", v3, v4);

}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD block[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_4;
    block[3] = &unk_1E37BDCC0;
    v11 = &v20;
    v20 = v9;
    v12 = &v19;
    v19 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_5;
    v13[3] = &unk_1E37BE360;
    v11 = &v16;
    v16 = v9;
    v17 = a2;
    v12 = &v14;
    v14 = v7;
    v15 = 0;
    dispatch_async(v10, v13);

  }
}

uint64_t __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

uint64_t __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_7;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __71__ASDClaimApplicationsRequest__sendRequestWithOptions_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __47__ASDClaimApplicationsRequest__setupConnection__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __47__ASDClaimApplicationsRequest__setupConnection__block_invoke_67()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Interrupt", v0, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
