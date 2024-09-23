@implementation HDHealthRecordsLegacyIngestionServiceClient

- (HDHealthRecordsLegacyIngestionServiceClient)init
{
  return -[HDHealthRecordsLegacyIngestionServiceClient initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (HDHealthRecordsLegacyIngestionServiceClient)initWithListenerEndpoint:(id)a3
{
  id v4;
  HDHealthRecordsLegacyIngestionServiceClient *v5;
  uint64_t v6;
  OS_dispatch_queue *clientQueue;
  id v8;
  uint64_t v9;
  _HKXPCConnection *connection;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsLegacyIngestionServiceClient;
  v5 = -[HDHealthRecordsLegacyIngestionServiceClient init](&v12, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc(MEMORY[0x24BDD4260]);
    if (v4)
      v9 = objc_msgSend(v8, "initWithListenerEndpoint:", v4);
    else
      v9 = objc_msgSend(v8, "initWithServiceName:", CFSTR("com.apple.health.records.legacy-ingestion"));
    connection = v5->_connection;
    v5->_connection = (_HKXPCConnection *)v9;

    -[_HKXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    -[_HKXPCConnection resume](v5->_connection, "resume");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_HKXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHealthRecordsLegacyIngestionServiceClient;
  -[HDHealthRecordsLegacyIngestionServiceClient dealloc](&v3, sel_dealloc);
}

- (void)pingWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HDHealthRecordsLegacyIngestionServiceClient _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke;
  v9[3] = &unk_24D549498;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HDHealthRecordsLegacyIngestionServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v9, v7);

}

uint64_t __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__HDHealthRecordsLegacyIngestionServiceClient_pingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performDownloadRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HDHealthRecordsLegacyIngestionServiceClient _objectReturnOnClientQueue:](self, "_objectReturnOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke;
  v13[3] = &unk_24D5494C0;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HDHealthRecordsLegacyIngestionServiceClient _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performDownloadRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __81__HDHealthRecordsLegacyIngestionServiceClient_performDownloadRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  HKFHIRResourceDownloadRequestResult *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[HKFHIRResourceDownloadRequestResult initWithError:]([HKFHIRResourceDownloadRequestResult alloc], "initWithError:", v3);

  (*(void (**)(uint64_t, HKFHIRResourceDownloadRequestResult *))(v2 + 16))(v2, v4);
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[_HKXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7[2](v7, v6);

}

- (id)_objectReturnOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke;
  v8[3] = &unk_24D549510;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke(uint64_t a1, void *a2)
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
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke_2;
  v7[3] = &unk_24D5494E8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __74__HDHealthRecordsLegacyIngestionServiceClient__objectReturnOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_24D549560;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_24D549538;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __78__HDHealthRecordsLegacyIngestionServiceClient__objectCompletionOnClientQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
