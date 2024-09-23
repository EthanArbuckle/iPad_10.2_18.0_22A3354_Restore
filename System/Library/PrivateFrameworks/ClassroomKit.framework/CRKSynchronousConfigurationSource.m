@implementation CRKSynchronousConfigurationSource

- (CRKSynchronousConfigurationSource)initWithConfigurationSource:(id)a3
{
  id v5;
  CRKSynchronousConfigurationSource *v6;
  CRKSynchronousConfigurationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKSynchronousConfigurationSource;
  v6 = -[CRKSynchronousConfigurationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mBaseSource, a3);

  return v7;
}

- (id)configurationWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  CRKConfigurationSource *mBaseSource;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
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

  v5 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  mBaseSource = self->mBaseSource;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__CRKSynchronousConfigurationSource_configurationWithError___block_invoke;
  v10[3] = &unk_24D9CA500;
  v12 = &v20;
  v13 = &v14;
  v7 = v5;
  v11 = v7;
  -[CRKConfigurationSource fetchConfiguration:](mBaseSource, "fetchConfiguration:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __60__CRKSynchronousConfigurationSource_configurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)setConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  CRKConfigurationSource *mBaseSource;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  mBaseSource = self->mBaseSource;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CRKSynchronousConfigurationSource_setConfiguration_error___block_invoke;
  v12[3] = &unk_24D9CA528;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  -[CRKConfigurationSource setConfiguration:completion:](mBaseSource, "setConfiguration:completion:", v6, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v10 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__CRKSynchronousConfigurationSource_setConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBaseSource, 0);
}

@end
