@implementation HKAuthorizationStore

- (HKAuthorizationStore)initWithHealthStore:(id)a3
{
  id v4;
  HKAuthorizationStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKProxyProvider *readProxyProvider;
  HKTaskServerProxyProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HKProxyProvider *writeProxyProvider;
  HKTaskServerProxyProvider *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HKProxyProvider *resetProxyProvider;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HKAuthorizationStore;
  v5 = -[HKAuthorizationStore init](&v28, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "readTaskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKAuthorizationStoreClientInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKAuthorizationStoreReadServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:", v4, v7, v5, v8, v9, v10);
    readProxyProvider = v5->_readProxyProvider;
    v5->_readProxyProvider = (HKProxyProvider *)v11;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_readProxyProvider, "setShouldRetryOnInterruption:", 0);
    v13 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "writeTaskIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKAuthorizationStoreClientInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKAuthorizationStoreWriteServerInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](v13, "initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:", v4, v14, v5, v15, v16, v17);
    writeProxyProvider = v5->_writeProxyProvider;
    v5->_writeProxyProvider = (HKProxyProvider *)v18;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_writeProxyProvider, "setShouldRetryOnInterruption:", 0);
    v20 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "resetTaskIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKAuthorizationStoreClientInterface();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKAuthorizationStoreResetServerInterface();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](v20, "initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:", v4, v21, v5, v22, v23, v24);
    resetProxyProvider = v5->_resetProxyProvider;
    v5->_resetProxyProvider = (HKProxyProvider *)v25;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_resetProxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

+ (id)readTaskIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("read"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)writeTaskIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("write"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)resetTaskIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, CFSTR("reset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_fetchReadProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_readProxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_fetchSynchronousReadProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](self->_readProxyProvider, "getSynchronousProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_fetchWriteProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_writeProxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)_fetchResetProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_resetProxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)fetchAuthorizationRecordsForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_readProxyProvider, "clientQueueObjectHandlerWithCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke;
  v18[3] = &unk_1E37EB3D8;
  v19 = v7;
  v20 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v12 = v20;
  v13 = v7;
  -[HKAuthorizationStore _fetchReadProxyWithHandler:errorHandler:](self, "_fetchReadProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAuthorizationRecordsForSourceBundleIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __80__HKAuthorizationStore_fetchAuthorizationRecordsForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAuthorizationRecordsForType:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_readProxyProvider, "clientQueueObjectHandlerWithCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke;
  v18[3] = &unk_1E37EB3D8;
  v19 = v7;
  v20 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v12 = v20;
  v13 = v7;
  -[HKAuthorizationStore _fetchReadProxyWithHandler:errorHandler:](self, "_fetchReadProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAuthorizationRecordsForType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__HKAuthorizationStore_fetchAuthorizationRecordsForType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSourcesRequestingAuthorizationForTypes:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_readProxyProvider, "clientQueueObjectHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke;
  v16[3] = &unk_1E37EB3D8;
  v17 = v7;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v11 = v18;
  v12 = v7;
  -[HKAuthorizationStore _fetchReadProxyWithHandler:errorHandler:](self, "_fetchReadProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSourcesRequestingAuthorizationForTypes:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79__HKAuthorizationStore_fetchSourcesRequestingAuthorizationForTypes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (objc_msgSend(v13, "count"))
  {
    if (v14)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationModes != nil"));

    if (v15)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] > 0"));

  if (!v14)
    goto LABEL_6;
LABEL_3:
  if (!v15)
    goto LABEL_7;
LABEL_4:
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_writeProxyProvider, "clientQueueActionHandlerWithCompletion:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke;
  v28[3] = &unk_1E37EB400;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v33 = a6;
  v32 = v17;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke_2;
  v26[3] = &unk_1E37E6B38;
  v27 = v32;
  v19 = v32;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  -[HKAuthorizationStore _fetchWriteProxyWithHandler:errorHandler:](self, "_fetchWriteProxyWithHandler:errorHandler:", v28, v26);

}

uint64_t __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", a1[4], a1[5], a1[6], a1[8], a1[7]);
}

uint64_t __107__HKAuthorizationStore_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRequestedAuthorizationForBundleIdentifier:(id)a3 shareTypes:(id)a4 readTypes:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  if (!objc_msgSend(v12, "count") && !objc_msgSend(v13, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must request authorization for at least one data type"));
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_writeProxyProvider, "clientQueueActionHandlerWithCompletion:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke;
  v24[3] = &unk_1E37EB428;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v15;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke_2;
  v22[3] = &unk_1E37E6B38;
  v23 = v28;
  v17 = v28;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  -[HKAuthorizationStore _fetchWriteProxyWithHandler:errorHandler:](self, "_fetchWriteProxyWithHandler:errorHandler:", v24, v22);

}

uint64_t __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setRequestedAuthorizationForBundleIdentifier:shareTypes:readTypes:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __101__HKAuthorizationStore_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetAuthorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4
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
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_resetProxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E37EB450;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKAuthorizationStore _fetchResetProxyWithHandler:errorHandler:](self, "_fetchResetProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetAuthorizationStatusForBundleIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79__HKAuthorizationStore_resetAuthorizationStatusForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAuthorizationStatusesForDocumentType:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("documentType"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_readProxyProvider, "clientQueueObjectHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke;
  v22[3] = &unk_1E37EB478;
  v23 = v9;
  v24 = v10;
  v25 = v12;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v21 = v25;
  v14 = v25;
  v15 = v10;
  v16 = v9;
  -[HKAuthorizationStore _fetchReadProxyWithHandler:errorHandler:](self, "_fetchReadProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAuthorizationStatusesForDocumentType:sourceBundleIdentifier:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __94__HKAuthorizationStore_fetchAuthorizationStatusesForDocumentType_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAuthorizationStatusesForSample:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationStore.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_readProxyProvider, "clientQueueObjectHandlerWithCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke;
  v18[3] = &unk_1E37EB3D8;
  v19 = v7;
  v20 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v12 = v20;
  v13 = v7;
  -[HKAuthorizationStore _fetchReadProxyWithHandler:errorHandler:](self, "_fetchReadProxyWithHandler:errorHandler:", v18, v16);

}

void __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_fetchAuthorizationStatusesForSampleUUID:completion:", v5, *(_QWORD *)(a1 + 40));

}

uint64_t __71__HKAuthorizationStore_fetchAuthorizationStatusesForSample_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchAuthorizationContextForPromptSession:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke;
  v14[3] = &unk_1E37EB4C8;
  v8 = v6;
  v15 = v8;
  v16 = &v24;
  v17 = &v18;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_3;
  v13[3] = &unk_1E37E8B48;
  v13[4] = &v18;
  -[HKAuthorizationStore _fetchSynchronousReadProxyWithHandler:errorHandler:](self, "_fetchSynchronousReadProxyWithHandler:errorHandler:", v14, v13);
  v9 = (id)v19[5];
  v10 = v9;
  if (v9)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError(v9);
  }

  v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_2;
  v4[3] = &unk_1E37EB4A0;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_fetchAuthorizationContextForPromptSession:completion:", v2, v4);
}

void __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __72__HKAuthorizationStore_fetchAuthorizationContextForPromptSession_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_writeProxyProvider, "clientQueueActionHandlerWithCompletion:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke;
  v25[3] = &unk_1E37EB4F0;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke_2;
  v23[3] = &unk_1E37E6B38;
  v24 = v30;
  v18 = v30;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  -[HKAuthorizationStore _fetchWriteProxyWithHandler:errorHandler:](self, "_fetchWriteProxyWithHandler:errorHandler:", v25, v23);

}

uint64_t __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setObjectAuthorizationStatuses:objectType:bundleIdentifier:sessionIdentifier:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

uint64_t __115__HKAuthorizationStore_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetAuthorizationStatusesForObjects:(id)a3 completion:(id)a4
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
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_resetProxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke;
  v13[3] = &unk_1E37EB450;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKAuthorizationStore _fetchResetProxyWithHandler:errorHandler:](self, "_fetchResetProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetAuthorizationStatusesForObjects:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HKAuthorizationStore_resetAuthorizationStatusesForObjects_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetAllObjectAuthorizationStatusForBundleIdentifier:(id)a3 objectType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_resetProxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke;
  v17[3] = &unk_1E37EB518;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKAuthorizationStore _fetchResetProxyWithHandler:errorHandler:](self, "_fetchResetProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetObjectAuthorizationStatusForBundleIdentifier:objectType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __99__HKAuthorizationStore_resetAllObjectAuthorizationStatusForBundleIdentifier_objectType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)validateRecalibrateEstimatesRequestRecord:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke;
  v14[3] = &unk_1E37EB4C8;
  v8 = v6;
  v15 = v8;
  v16 = &v24;
  v17 = &v18;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_3;
  v13[3] = &unk_1E37E8B48;
  v13[4] = &v18;
  -[HKAuthorizationStore _fetchSynchronousReadProxyWithHandler:errorHandler:](self, "_fetchSynchronousReadProxyWithHandler:errorHandler:", v14, v13);
  v9 = (id)v19[5];
  v10 = v9;
  if (v9)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError(v9);
  }

  v11 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_2;
  v4[3] = &unk_1E37E9020;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_validateRecalibrateEstimatesRequestRecord:completion:", v2, v4);
}

void __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __72__HKAuthorizationStore_validateRecalibrateEstimatesRequestRecord_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)recalibrateEstimatesForSampleType:(id)a3 effectiveDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_resetProxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke;
  v17[3] = &unk_1E37EB518;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKAuthorizationStore _fetchResetProxyWithHandler:errorHandler:](self, "_fetchResetProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_recalibrateEstimatesForSampleType:effectiveDate:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKAuthorizationStore_recalibrateEstimatesForSampleType_effectiveDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetProxyProvider, 0);
  objc_storeStrong((id *)&self->_writeProxyProvider, 0);
  objc_storeStrong((id *)&self->_readProxyProvider, 0);
}

@end
