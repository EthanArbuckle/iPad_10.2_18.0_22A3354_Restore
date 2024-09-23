@implementation HKStaticSyncControl

- (HKStaticSyncControl)initWithHealthStore:(id)a3
{
  id v4;
  HKStaticSyncControl *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKStaticSyncControl;
  v5 = -[HKStaticSyncControl init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)runStaticSyncExportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 batchSize:(unint64_t)a6 progressHandler:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  HKProxyProvider *proxyProvider;
  id v17;
  void *v18;
  void *v19;
  HKProxyProvider *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  unint64_t v34;

  v14 = a4;
  v15 = a5;
  proxyProvider = self->_proxyProvider;
  v17 = a8;
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](proxyProvider, "clientQueueProgressHandlerWithHandler:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = self->_proxyProvider;
  v21 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke;
  v28[3] = &unk_1E37EE328;
  v29 = v14;
  v30 = v15;
  v33 = a3;
  v34 = a6;
  v31 = v19;
  v32 = v18;
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke_2;
  v26[3] = &unk_1E37E6B38;
  v27 = v31;
  v22 = v31;
  v23 = v18;
  v24 = v15;
  v25 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v20, "fetchProxyWithHandler:errorHandler:", v28, v26);

}

void __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_runStaticSyncExportWithOptions:storeIdentifier:URL:batchSize:completion:", a1[8], a1[4], a1[5], a1[9], a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(a1[7] + 16))();
    v3 = v4;
  }

}

uint64_t __111__HKStaticSyncControl_runStaticSyncExportWithOptions_storeIdentifier_URL_batchSize_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runStaticSyncImportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 progressHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  HKProxyProvider *proxyProvider;
  id v15;
  void *v16;
  void *v17;
  HKProxyProvider *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  v12 = a4;
  v13 = a5;
  proxyProvider = self->_proxyProvider;
  v15 = a7;
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](proxyProvider, "clientQueueProgressHandlerWithHandler:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = self->_proxyProvider;
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke;
  v26[3] = &unk_1E37EE350;
  v31 = a3;
  v27 = v12;
  v28 = v13;
  v29 = v17;
  v30 = v16;
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke_2;
  v24[3] = &unk_1E37E6B38;
  v25 = v29;
  v20 = v29;
  v21 = v16;
  v22 = v13;
  v23 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v18, "fetchProxyWithHandler:errorHandler:", v26, v24);

}

void __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_runStaticSyncImportWithOptions:storeIdentifier:URL:completion:", a1[8], a1[4], a1[5], a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(a1[7] + 16))();
    v3 = v4;
  }

}

uint64_t __101__HKStaticSyncControl_runStaticSyncImportWithOptions_storeIdentifier_URL_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
