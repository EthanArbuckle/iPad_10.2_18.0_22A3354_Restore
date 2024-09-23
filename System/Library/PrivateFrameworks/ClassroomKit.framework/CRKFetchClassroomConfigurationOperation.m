@implementation CRKFetchClassroomConfigurationOperation

+ (id)defaultSourcesByTypeWithStudentDaemonProxy:(id)a3
{
  id v3;
  CRKCurrentPlatformProfileConfigurationSource *v4;
  CRKCurrentPlatformProfileConfigurationSource *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_24DA08090;
  v3 = a3;
  v4 = [CRKCurrentPlatformProfileConfigurationSource alloc];
  v5 = -[CRKCurrentPlatformProfileConfigurationSource initWithStudentDaemonProxy:callbackQueue:](v4, "initWithStudentDaemonProxy:callbackQueue:", v3, MEMORY[0x24BDAC9B8]);

  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CRKFetchClassroomConfigurationOperation)init
{
  return -[CRKFetchClassroomConfigurationOperation initWithStudentDaemonProxy:](self, "initWithStudentDaemonProxy:", 0);
}

- (CRKFetchClassroomConfigurationOperation)initWithStudentDaemonProxy:(id)a3
{
  return -[CRKFetchClassroomConfigurationOperation initWithStudentDaemonProxy:sourcesByType:](self, "initWithStudentDaemonProxy:sourcesByType:", a3, 0);
}

- (CRKFetchClassroomConfigurationOperation)initWithStudentDaemonProxy:(id)a3 sourcesByType:(id)a4
{
  id v6;
  id v7;
  CRKFetchClassroomConfigurationOperation *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CRKFeatureFlags *featureFlags;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKFetchClassroomConfigurationOperation;
  v8 = -[CRKFetchClassroomConfigurationOperation init](&v16, sel_init);
  if (v8)
  {
    v9 = v6;
    if (!v6)
      v9 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v8->mStudentDaemonProxy, v9);
    if (!v6)

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "makeFeatureFlags");
    v11 = objc_claimAutoreleasedReturnValue();
    featureFlags = v8->_featureFlags;
    v8->_featureFlags = (CRKFeatureFlags *)v11;

    v13 = (void *)objc_msgSend(v7, "copy");
    v14 = v13;
    if (!v13)
    {
      objc_msgSend((id)objc_opt_class(), "defaultSourcesByTypeWithStudentDaemonProxy:", v8->mStudentDaemonProxy);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->mSourcesByType, v14);
    if (!v13)

  }
  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __49__CRKFetchClassroomConfigurationOperation_cancel__block_invoke;
  v2[3] = &unk_24D9C7020;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v2);
}

uint64_t __49__CRKFetchClassroomConfigurationOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "cancel");
}

- (void)main
{
  -[CRKFetchClassroomConfigurationOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", &sel_run, 0, 0);
}

- (void)fetchConfiguration
{
  void *v3;
  dispatch_group_t v4;
  NSDictionary *mSourcesByType;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  v18 = 0;
  v3 = (void *)objc_opt_new();
  v4 = dispatch_group_create();
  mSourcesByType = self->mSourcesByType;
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke;
  v13[3] = &unk_24D9C9DB8;
  v7 = v4;
  v14 = v7;
  v16 = v17;
  v8 = v3;
  v15 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](mSourcesByType, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_4;
  v10[3] = &unk_24D9C9DE0;
  v11 = v8;
  v12 = v17;
  v10[4] = self;
  v9 = v8;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], v10);

  _Block_object_dispose(v17, 8);
}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v7 = a3;
  dispatch_group_enter(v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_2;
  v10[3] = &unk_24D9C9D90;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v11 = v8;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v7, "fetchConfiguration:", v10);

}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_3;
  v10[3] = &unk_24D9C9D68;
  v7 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v16 = v7;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v2);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __61__CRKFetchClassroomConfigurationOperation_fetchConfiguration__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:");
  }
  else
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v1, "endOperationWithResultObject:", v2);

  }
}

- (CRKFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->mFetchConfigurationOperation, 0);
  objc_storeStrong((id *)&self->mSourcesByType, 0);
  objc_storeStrong((id *)&self->mStudentDaemonProxy, 0);
}

@end
