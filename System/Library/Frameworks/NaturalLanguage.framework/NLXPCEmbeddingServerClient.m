@implementation NLXPCEmbeddingServerClient

- (NLXPCEmbeddingServerClient)init
{
  NLXPCEmbeddingServerClient *v2;
  NLXPCEmbeddingServerClient *v3;
  NLXPCEmbeddingServerClient *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSXPCConnection *connection;
  NSXPCConnection *v16;
  NLXPCEmbeddingServerClient *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  NLXPCEmbeddingServerClient *v23;
  objc_super v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)NLXPCEmbeddingServerClient;
  v2 = -[NLXPCEmbeddingServerClient init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6CDD08);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel__xpc_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler_, 1, 1);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel__xpc_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler_, 1, 1);

    v12 = dispatch_queue_create("com.apple.nlcontextualembedding.xpc", 0);
    dispatch_get_global_queue(2, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v12, v13);

    v4->_valid = 1;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.naturallanguaged"), 0);
    connection = v4->_connection;
    v4->_connection = (NSXPCConnection *)v14;

    -[NSXPCConnection setRemoteObjectInterface:](v4->_connection, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection _setQueue:](v4->_connection, "_setQueue:", v12);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __34__NLXPCEmbeddingServerClient_init__block_invoke;
    v22 = &unk_1E4A3A680;
    v23 = v4;
    v16 = v4->_connection;
    v17 = v4;
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", &v19);
    -[NSXPCConnection resume](v4->_connection, "resume", v19, v20, v21, v22);

  }
  return v3;
}

uint64_t __34__NLXPCEmbeddingServerClient_init__block_invoke(uint64_t a1)
{
  NSLog(CFSTR("NLXPCEmbeddingServerClient connection invalidated"));
  return objc_msgSend(*(id *)(a1 + 32), "setValid:", 0);
}

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_0);
  return (id)sharedClient_sharedClient;
}

void __42__NLXPCEmbeddingServerClient_sharedClient__block_invoke()
{
  NLXPCEmbeddingServerClient *v0;
  void *v1;

  v0 = objc_alloc_init(NLXPCEmbeddingServerClient);
  v1 = (void *)sharedClient_sharedClient;
  sharedClient_sharedClient = (uint64_t)v0;

}

- (id)connection
{
  return self->_connection;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)dataFromTokenVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  connection = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke;
  v21[3] = &unk_1E4A3A6A8;
  v13 = v10;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2;
  v19[3] = &unk_1E4A3A6D0;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "_xpc_dataFromTokenVectorEmbeddingForString:language:identifier:completionHandler:", v16, v15, v14, v19);

}

void __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __106__NLXPCEmbeddingServerClient_dataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronousDataFromTokenVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  connection = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke;
  v21[3] = &unk_1E4A3A6A8;
  v13 = v10;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2;
  v19[3] = &unk_1E4A3A6D0;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "_xpc_dataFromTokenVectorEmbeddingForString:language:identifier:completionHandler:", v16, v15, v14, v19);

}

void __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __117__NLXPCEmbeddingServerClient_synchronousDataFromTokenVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)batchDataFromTokenVectorEmbeddingForStrings:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  connection = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke;
  v21[3] = &unk_1E4A3A6A8;
  v13 = v10;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2;
  v19[3] = &unk_1E4A3A6F8;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "_xpc_batchDataFromTokenVectorEmbeddingForStrings:language:identifier:completionHandler:", v16, v15, v14, v19);

}

void __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __112__NLXPCEmbeddingServerClient_batchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronousBatchDataFromTokenVectorEmbeddingForStrings:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  connection = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke;
  v21[3] = &unk_1E4A3A6A8;
  v13 = v10;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2;
  v19[3] = &unk_1E4A3A6F8;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "_xpc_batchDataFromTokenVectorEmbeddingForStrings:language:identifier:completionHandler:", v16, v15, v14, v19);

}

void __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __123__NLXPCEmbeddingServerClient_synchronousBatchDataFromTokenVectorEmbeddingForStrings_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dataFromSentenceVectorEmbeddingForString:(id)a3 language:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  connection = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke;
  v21[3] = &unk_1E4A3A6A8;
  v13 = v10;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2;
  v19[3] = &unk_1E4A3A720;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "_xpc_dataFromSentenceVectorEmbeddingForString:language:identifier:completionHandler:", v16, v15, v14, v19);

}

void __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __109__NLXPCEmbeddingServerClient_dataFromSentenceVectorEmbeddingForString_language_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadModelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
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
  connection = self->_connection;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E4A3A6A8;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4A3A748;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "_xpc_loadTokenVectorEmbeddingForIdentifier:timeout:completionHandler:", v10, v13, 0.0);

}

void __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __72__NLXPCEmbeddingServerClient_loadModelWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronousLoadModelWithIdentifier:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  connection = self->_connection;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke;
  v17[3] = &unk_1E4A3A6A8;
  v11 = v8;
  v18 = v11;
  v12 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke_2;
  v15[3] = &unk_1E4A3A748;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "_xpc_loadTokenVectorEmbeddingForIdentifier:timeout:completionHandler:", v12, v15, a4);

}

void __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __91__NLXPCEmbeddingServerClient_synchronousLoadModelWithIdentifier_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)compileModelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
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
  connection = self->_connection;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E4A3A6A8;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4A3A748;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "_xpc_compileEmbeddingForIdentifier:completionHandler:", v10, v13);

}

void __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  NSLog(CFSTR("NLXPCEmbeddingServerClient received connection error: %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __75__NLXPCEmbeddingServerClient_compileModelWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
