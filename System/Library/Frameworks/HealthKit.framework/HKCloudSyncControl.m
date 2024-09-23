@implementation HKCloudSyncControl

- (HKCloudSyncControl)initWithHealthStore:(id)a3
{
  id v4;
  HKCloudSyncControl *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCloudSyncControl;
  v5 = -[HKCloudSyncControl init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

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

- (id)defaultChangesSyncRequestForWatch
{
  HKCloudSyncRequest *v2;
  HKChangesSyncRequest *v3;
  HKCloudSyncRequest *v4;

  v2 = [HKCloudSyncRequest alloc];
  v3 = -[HKChangesSyncRequest initWithPush:pull:lite:]([HKChangesSyncRequest alloc], "initWithPush:pull:lite:", 1, 0, 1);
  v4 = -[HKCloudSyncRequest initWithChangesSyncRequest:](v2, "initWithChangesSyncRequest:", v3);

  return v4;
}

- (void)syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke;
  v21[3] = &unk_1E37F1660;
  v22 = v9;
  v23 = v10;
  v24 = v12;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke_2;
  v19[3] = &unk_1E37E6B38;
  v20 = v24;
  v15 = v24;
  v16 = v10;
  v17 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v21, v19);

}

uint64_t __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_syncWithRequest:reason:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __56__HKCloudSyncControl_syncWithRequest_reason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  unint64_t v19;
  int64_t v20;

  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke;
  v17[3] = &unk_1E37F1688;
  v19 = a3;
  v20 = a4;
  v18 = v10;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v18;
  v13 = v18;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v15);

}

id __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke(_QWORD *a1, void *a2)
{
  return (id)objc_msgSend(a2, "remote_forceCloudSyncWithOptions:reason:completion:", a1[5], a1[6], a1[4]);
}

uint64_t __66__HKCloudSyncControl_forceCloudSyncWithOptions_reason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[HKCloudSyncControl forceCloudSyncWithOptions:reason:completion:](self, "forceCloudSyncWithOptions:reason:completion:", a3, 1, a4);
}

- (void)forceCloudSyncDataUploadForProfileWithCompletion:(id)a3
{
  id v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke;
  v13[3] = &unk_1E37F16B0;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

id __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "remote_forceCloudSyncDataUploadForProfileWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__HKCloudSyncControl_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCloudSyncRequiredWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HKCloudSyncControl_fetchCloudSyncRequiredWithCompletion___block_invoke;
  v6[3] = &unk_1E37F16D8;
  v7 = v4;
  v5 = v4;
  -[HKCloudSyncControl fetchCloudSyncStatusWithCompletion:](self, "fetchCloudSyncStatusWithCompletion:", v6);

}

void __59__HKCloudSyncControl_fetchCloudSyncRequiredWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a6;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);

  }
  if ((objc_msgSend(v10, "hk_isHealthKitErrorWithCode:", 701) & 1) != 0)
    v12 = 0;
  else
    v12 = v10;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchCloudSyncStatusWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37F1728;
  aBlock[4] = self;
  v16 = v5;
  v7 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_3;
  v13[3] = &unk_1E37F16B0;
  v14 = v7;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_4;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

void __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;
  char v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_2;
  block[3] = &unk_1E37F1700;
  v15 = *(id *)(a1 + 40);
  v24 = a2;
  v20 = v11;
  v21 = v12;
  v25 = a5;
  v22 = v13;
  v23 = v15;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(v14, block);

}

uint64_t __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 48));
}

uint64_t __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCloudSyncStatusWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__HKCloudSyncControl_fetchCloudSyncStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCloudSyncProgress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progressHandler != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](self->_proxyProvider, "clientQueueProgressHandlerWithHandler:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke;
  v20[3] = &unk_1E37F1750;
  v21 = v11;
  v22 = v10;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke_2;
  v18[3] = &unk_1E37E6B38;
  v19 = v21;
  v14 = v21;
  v15 = v10;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v20, v18);

}

void __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_fetchCloudSyncProgressWithCompletion:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

uint64_t __56__HKCloudSyncControl_fetchCloudSyncProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 progress:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKTaskServerProxyProvider *proxyProvider;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](self->_proxyProvider, "clientQueueProgressHandlerWithHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke;
  v20[3] = &unk_1E37F1778;
  v23 = a3;
  v21 = v12;
  v22 = v11;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke_2;
  v18[3] = &unk_1E37E6B38;
  v19 = v21;
  v15 = v21;
  v16 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v20, v18);

}

void __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_forceCloudSyncWithOptions:reason:completion:", a1[6], 1, a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(a1[5] + 16))();
    v3 = v4;
  }

}

uint64_t __68__HKCloudSyncControl_forceCloudSyncWithOptions_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceCloudResetWithProgress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](self->_proxyProvider, "clientQueueProgressHandlerWithHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke;
  v18[3] = &unk_1E37F1750;
  v19 = v10;
  v20 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v19;
  v13 = v19;
  v14 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_forceCloudResetWithCompletion:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

uint64_t __61__HKCloudSyncControl_forceCloudResetWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCloudDescriptionWithProgress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](self->_proxyProvider, "clientQueueProgressHandlerWithHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke;
  v18[3] = &unk_1E37F1750;
  v19 = v10;
  v20 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v19;
  v13 = v19;
  v14 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_fetchCloudDescriptionWithCompletion:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

uint64_t __67__HKCloudSyncControl_fetchCloudDescriptionWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableCloudSyncAndDeleteAllCloudDataWithProgress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueProgressHandlerWithHandler:](self->_proxyProvider, "clientQueueProgressHandlerWithHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke;
  v18[3] = &unk_1E37F1750;
  v19 = v10;
  v20 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v19;
  v13 = v19;
  v14 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

uint64_t __83__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableCloudSyncWithCompletion:(id)a3
{
  id v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke;
  v13[3] = &unk_1E37F16B0;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_disableCloudSyncWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__HKCloudSyncControl_disableCloudSyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableCloudSyncWithCompletion:(id)a3
{
  id v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke;
  v13[3] = &unk_1E37F16B0;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_enableCloudSyncWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__HKCloudSyncControl_enableCloudSyncWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3
{
  id v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke;
  v13[3] = &unk_1E37F16B0;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

id __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__HKCloudSyncControl_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accountConfigurationDidChangeWithCompletion:(id)a3
{
  id v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke;
  v13[3] = &unk_1E37F16B0;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_accountConfigurationDidChangeWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__HKCloudSyncControl_accountConfigurationDidChangeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)oldestSampleStartDateInHealthDatabaseWithCompletion:(id)a3
{
  id v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCloudSyncControl.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke;
  v13[3] = &unk_1E37F16B0;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_oldestSampleStartDateInHealthDatabaseWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__HKCloudSyncControl_oldestSampleStartDateInHealthDatabaseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestDataRefreshWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  HKCloudSyncControl *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke;
  v15[3] = &unk_1E37F16B0;
  v16 = v9;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2;
  v13[3] = &unk_1E37E69F8;
  v13[4] = self;
  v14 = v16;
  v12 = v16;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestDataRefreshWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __55__HKCloudSyncControl_requestDataRefreshWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call remote_requestDataRefreshWithCompletion, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
