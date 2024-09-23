@implementation MSVArtworkService

- (MSVArtworkService)init
{
  MSVArtworkService *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSVArtworkService;
  v2 = -[MSVArtworkService init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[MSVArtworkService setServiceThrottlingOperationQueue:](v2, "setServiceThrottlingOperationQueue:", v3);

    -[MSVArtworkService serviceThrottlingOperationQueue](v2, "serviceThrottlingOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 5);

    v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[MSVArtworkService setServiceColorAnalysisOperationQueue:](v2, "setServiceColorAnalysisOperationQueue:", v5);

    -[MSVArtworkService serviceColorAnalysisOperationQueue](v2, "serviceColorAnalysisOperationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaxConcurrentOperationCount:", 5);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaartworkd.xpc"), 0);
    -[MSVArtworkService setServerConnection:](v2, "setServerConnection:", v7);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5B79A0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_processArtworkColorAnalysisRequest_withReply_, 0, 1);

    -[MSVArtworkService serverConnection](v2, "serverConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v8);

    -[MSVArtworkService serverConnection](v2, "serverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MSVArtworkService serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MSVArtworkService;
  -[MSVArtworkService dealloc](&v4, sel_dealloc);
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  MSVAsyncBlockOperation *v8;
  id v9;
  id v10;
  MSVAsyncBlockOperation *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [MSVAsyncBlockOperation alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__MSVArtworkService_sendRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E43E9458;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = -[MSVAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v13);
  -[MSVArtworkService serviceThrottlingOperationQueue](self, "serviceThrottlingOperationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MSVAsyncBlockOperation *v8;
  id v9;
  id v10;
  MSVAsyncBlockOperation *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [MSVAsyncBlockOperation alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__MSVArtworkService_sendRequest_completion___block_invoke;
  v13[3] = &unk_1E43E9458;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = -[MSVAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v13);
  -[MSVArtworkService serviceColorAnalysisOperationQueue](self, "serviceColorAnalysisOperationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

}

- (NSOperationQueue)serviceThrottlingOperationQueue
{
  return self->_serviceThrottlingOperationQueue;
}

- (void)setServiceThrottlingOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceThrottlingOperationQueue, a3);
}

- (NSOperationQueue)serviceColorAnalysisOperationQueue
{
  return self->_serviceColorAnalysisOperationQueue;
}

- (void)setServiceColorAnalysisOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceColorAnalysisOperationQueue, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_serviceColorAnalysisOperationQueue, 0);
  objc_storeStrong((id *)&self->_serviceThrottlingOperationQueue, 0);
}

void __44__MSVArtworkService_sendRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__MSVArtworkService_sendRequest_completion___block_invoke_2;
  v14[3] = &unk_1E43E9430;
  v16 = *(id *)(a1 + 48);
  v6 = v3;
  v15 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __44__MSVArtworkService_sendRequest_completion___block_invoke_3;
  v11[3] = &unk_1E43E9480;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v9;
  v10 = v6;
  objc_msgSend(v7, "processArtworkColorAnalysisRequest:withReply:", v8, v11);

}

void __44__MSVArtworkService_sendRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
    v3 = v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

void __44__MSVArtworkService_sendRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __51__MSVArtworkService_sendRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E43E9430;
  v16 = *(id *)(a1 + 48);
  v6 = v3;
  v15 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_3;
  v11[3] = &unk_1E43E9430;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v9;
  v10 = v6;
  objc_msgSend(v7, "processArtworkRequest:completionHandler:", v8, v11);

}

void __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

void __51__MSVArtworkService_sendRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_2911);
  return (id)sharedService___sharedService;
}

void __34__MSVArtworkService_sharedService__block_invoke()
{
  MSVArtworkService *v0;
  void *v1;

  v0 = objc_alloc_init(MSVArtworkService);
  v1 = (void *)sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;

}

@end
