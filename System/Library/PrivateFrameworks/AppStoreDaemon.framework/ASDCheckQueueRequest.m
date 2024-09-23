@implementation ASDCheckQueueRequest

- (ASDCheckQueueRequest)initWithOptions:(id)a3
{
  id v4;
  ASDCheckQueueRequest *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *calloutQueue;
  uint64_t v10;
  ASDCheckQueueRequestOptions *options;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDCheckQueueRequest;
  v5 = -[ASDCheckQueueRequest init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDCheckQueueRequest.access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDCheckQueueRequest.callout", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ASDCheckQueueRequestOptions *)v10;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ASDCheckQueueRequest;
  -[ASDCheckQueueRequest dealloc](&v3, sel_dealloc);
}

- (void)sendRequestCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke;
    v7[3] = &unk_1E37BE278;
    v7[4] = self;
    v8 = v5;
    dispatch_async(accessQueue, v7);

  }
}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (!v3)
  {
    if (-[ASDBaseClient _clientHasEntitlement:](*(_QWORD *)(a1 + 32), CFSTR("com.apple.appstored.private"))
      || -[ASDBaseClient _clientHasEntitlement:](v2, CFSTR("com.apple.appstored.install-apps"))
      || -[ASDBaseClient _clientHasASDEntitlement:](v2, CFSTR("Queue")))
    {
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = (id)objc_opt_class();
      v9 = v15;
      _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@]: Treating as legacy client", buf, 0xCu);

    }
    if (-[ASDBaseClient _clientHasEntitlement:](v2, CFSTR("com.apple.itunesstored.private")))
    {
LABEL_8:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appstored.xpc.storequeue"), 0);
      v5 = *(void **)(v2 + 24);
      *(_QWORD *)(v2 + 24) = v4;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE391EF0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 24), "setRemoteObjectInterface:", v6);
      objc_msgSend(*(id *)(v2 + 24), "setInvalidationHandler:", &__block_literal_global_2);
      objc_msgSend(*(id *)(v2 + 24), "setInterruptionHandler:", &__block_literal_global_70);
      objc_msgSend(*(id *)(v2 + 24), "_setQueue:", *(_QWORD *)(v2 + 8));
      objc_msgSend(*(id *)(v2 + 24), "resume");

    }
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 24);
  }
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_2;
  v12[3] = &unk_1E37BE228;
  v12[4] = v2;
  v13 = *(id *)(a1 + 40);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_5;
  v10[3] = &unk_1E37BE250;
  v8 = *(id *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  objc_msgSend((id)v2, "_call:run:error:", v3, v12, v10);

}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_3;
  v7[3] = &unk_1E37BE200;
  v7[1] = 3221225472;
  v6 = v4;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(a2, "checkQueueWithOptions:completionBlock:", v5, v7);

}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E37BDF60;
    v10 = v6;
    v9 = v5;
    v11 = a2;
    dispatch_async(v7, block);

  }
}

uint64_t __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v3 = 0;
  else
    v3 = *(unsigned __int8 *)(a1 + 48) != 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, v3);
}

void __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __56__ASDCheckQueueRequest__sendRequestWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __40__ASDCheckQueueRequest__setupConnection__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __40__ASDCheckQueueRequest__setupConnection__block_invoke_69()
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
