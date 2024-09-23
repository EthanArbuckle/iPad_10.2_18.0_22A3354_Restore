@implementation CGRemotePDFServiceProxy

- (CGRemotePDFServiceProxy)init
{
  objc_exception_throw(0);
}

- (CGRemotePDFServiceProxy)initWithConnection:(id)a3 error:(id *)a4
{
  id v7;
  CGRemotePDFServiceProxy *v8;
  CGRemotePDFServiceProxy *v9;
  void *v10;
  NSXPCConnection *connection;
  uint64_t v12;
  CGRemotePDFServiceProtocol *proxy;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  objc_super v22;

  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CGRemotePDFServiceProxy;
  v8 = -[CGRemotePDFServiceProxy init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    objc_msgSend((id)objc_opt_class(), "interface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9->_connection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](v9->_connection, "resume");
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__17200;
    v20 = __Block_byref_object_dispose__17201;
    v21 = 0;
    connection = v9->_connection;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__CGRemotePDFServiceProxy_initWithConnection_error___block_invoke;
    v15[3] = &unk_1E1660FD8;
    v15[4] = &v16;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    proxy = v9->_proxy;
    v9->_proxy = (CGRemotePDFServiceProtocol *)v12;

    if (!v9->_proxy)
    {

      v9 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v17[5]);
    }
    _Block_object_dispose(&v16, 8);

  }
  return v9;
}

- (CGRemotePDFServiceProxy)initWithCGPDFServiceConnection:(id *)a3
{
  void *v5;
  CGRemotePDFServiceProxy *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CoreGraphics.CGPDFService"));
  v6 = -[CGRemotePDFServiceProxy initWithConnection:error:](self, "initWithConnection:error:", v5, a3);

  return v6;
}

- (CGRemotePDFServiceProxy)initWithLoopbackListener:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CGRemotePDFServiceProxy *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__CGRemotePDFServiceProxy_initWithLoopbackListener_error___block_invoke;
  v14[3] = &unk_1E1661040;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "detachNewThreadWithBlock:", v14);
  objc_msgSend(v8, "listener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v10);
  v12 = -[CGRemotePDFServiceProxy initWithConnection:error:](self, "initWithConnection:error:", v11, a4);

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CGRemotePDFServiceProxy;
  -[CGRemotePDFServiceProxy dealloc](&v3, sel_dealloc);
}

- (void)newRemotePDFDocumentProxyWithData:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CGRemotePDFServiceProxy_newRemotePDFDocumentProxyWithData_withReply___block_invoke;
  v8[3] = &unk_1E1661068;
  v9 = v6;
  v7 = v6;
  -[CGRemotePDFServiceProxy newRemotePDFDocumentWithData:completion:](self, "newRemotePDFDocumentWithData:completion:", a3, v8);

}

- (void)newRemotePDFDocumentWithData:(id)a3 completion:(id)a4
{
  id v6;
  CGRemotePDFServiceProtocol *proxy;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  proxy = self->_proxy;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke;
  v15[3] = &unk_1E1661818;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[CGRemotePDFServiceProtocol remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke_2;
  v13[3] = &unk_1E1661090;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "newPDFDocumentWithData:withReply:", v10, v13);

}

- (id)newRemotePDFDocumentWithData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  CGRemotePDFServiceProtocol *proxy;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17200;
  v24 = __Block_byref_object_dispose__17201;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__17200;
  v18 = __Block_byref_object_dispose__17201;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  proxy = self->_proxy;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke;
  v13[3] = &unk_1E1660FD8;
  v13[4] = &v14;
  -[CGRemotePDFServiceProtocol synchronousRemoteObjectProxyWithErrorHandler:](proxy, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke_2;
  v12[3] = &unk_1E16610B8;
  v12[4] = &v20;
  objc_msgSend(v9, "newPDFDocumentWithData:withReply:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v3 = a2;
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFServiceProxy newRemotePDFDocumentWithData:error:]_block_invoke", v3);

}

void __62__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CGRemotePDFDocumentProxy *v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    v3 = a2;
    v4 = -[CGRemotePDFDocumentProxy initWithRemoteDocument:]([CGRemotePDFDocumentProxy alloc], "initWithRemoteDocument:", v3);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__CGRemotePDFServiceProxy_newRemotePDFDocumentWithData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CGRemotePDFDocumentProxy *v4;

  if (a2)
  {
    v3 = a2;
    v4 = -[CGRemotePDFDocumentProxy initWithRemoteDocument:]([CGRemotePDFDocumentProxy alloc], "initWithRemoteDocument:", v3);

  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __71__CGRemotePDFServiceProxy_newRemotePDFDocumentProxyWithData_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__CGRemotePDFServiceProxy_initWithLoopbackListener_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, &__block_literal_global_91_17208, 1000000.0);
  objc_msgSend(*(id *)(a1 + 32), "run");
  abort();
}

void __52__CGRemotePDFServiceProxy_initWithConnection_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  pdf_error("Error connecting to PDFService: %s", (const char *)objc_msgSend(v4, "UTF8String"));

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDD35F60);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDD35FC0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDD36020);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_drawWithBox_size_colorSpace_options_completion_, 2, 0);

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_drawWithBox_size_colorSpace_options_completion_, 3, 0);

  objc_msgSend(v21, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_getPageAtIndex_completion_, 0, 1);
  objc_msgSend(v22, "setInterface:forSelector:argumentIndex:ofReply:", v21, sel_newPDFDocumentWithData_withReply_, 0, 1);

  return v22;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_17215);
  return (id)sharedInstance_singleton;
}

void __41__CGRemotePDFServiceProxy_sharedInstance__block_invoke()
{
  CGRemotePDFServiceProxy *v0;
  void *v1;

  v0 = -[CGRemotePDFServiceProxy initWithCGPDFServiceConnection:]([CGRemotePDFServiceProxy alloc], "initWithCGPDFServiceConnection:", 0);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

@end
