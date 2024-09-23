@implementation CPLInMemoryResourceDownloadTask

- (CPLInMemoryResourceDownloadTask)initWithResource:(id)a3 taskIdentifier:(id)a4 launchHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  CPLInMemoryResourceDownloadTask *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  id launchHandler;
  uint64_t v18;
  id completionHandler;
  objc_super v21;

  v10 = a5;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CPLInMemoryResourceDownloadTask;
  v12 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](&v21, sel_initWithResource_taskIdentifier_, a3, a4);
  if (v12)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.cpl.inmemorydownloadtask", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_msgSend(v10, "copy");
    launchHandler = v12->_launchHandler;
    v12->_launchHandler = (id)v16;

    v18 = objc_msgSend(v11, "copy");
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v18;

  }
  return v12;
}

- (void)associateCloudResource:(id)a3 ofRecord:(id)a4
{
  CPLResource *v6;
  CPLPlaceholderRecord *v7;
  CPLResource *cloudResource;
  CPLPlaceholderRecord *cloudRecord;
  CPLResource *v10;

  v6 = (CPLResource *)a3;
  v7 = (CPLPlaceholderRecord *)a4;
  cloudResource = self->_cloudResource;
  self->_cloudResource = v6;
  v10 = v6;

  cloudRecord = self->_cloudRecord;
  self->_cloudRecord = v7;

}

- (void)launch
{
  (*((void (**)(void))self->_launchHandler + 2))();
}

- (void)cancelTask
{
  NSObject *queue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLInMemoryResourceDownloadTask;
  -[CPLResourceTransferTask cancelTask](&v5, sel_cancelTask);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CPLInMemoryResourceDownloadTask_cancelTask__block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)finishWithData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__CPLInMemoryResourceDownloadTask_finishWithData_error___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12510;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)launchTransportTask:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CPLInMemoryResourceDownloadTask_launchTransportTask___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12510;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (CPLResource)cloudResource
{
  return self->_cloudResource;
}

- (CPLPlaceholderRecord)cloudRecord
{
  return self->_cloudRecord;
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_launchHandler, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_cloudResource, 0);
  objc_storeStrong((id *)&self->_transportTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __55__CPLInMemoryResourceDownloadTask_launchTransportTask___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "runWithNoSyncSession");
  }
  return result;
}

void __56__CPLInMemoryResourceDownloadTask_finishWithData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

}

void __45__CPLInMemoryResourceDownloadTask_cancelTask__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[7];
  if (v2)
  {
    objc_msgSend(v2, "cancel");
  }
  else
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "finishWithData:error:", 0, v3);

  }
}

+ (id)failedTaskForResource:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CPLInMemoryResourceDownloadTask_failedTaskForResource_error_completionHandler___block_invoke;
  v17[3] = &unk_1E60DA9C0;
  v18 = v8;
  v14 = v8;
  v15 = (void *)objc_msgSend(v11, "initWithResource:taskIdentifier:launchHandler:completionHandler:", v10, v13, v17, v9);

  return v15;
}

uint64_t __81__CPLInMemoryResourceDownloadTask_failedTaskForResource_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithData:error:", 0, *(_QWORD *)(a1 + 32));
}

@end
