@implementation ASDLazyPromise

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v7;
  id v8;
  ASDLazyPromise *v9;
  uint64_t v10;
  id executor;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASDLazyPromise;
  v9 = -[ASDPromise init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    executor = v9->_executor;
    v9->_executor = (id)v10;

    objc_storeStrong((id *)&v9->_scheduler, a3);
  }

  return v9;
}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  NSRecursiveLock *stateLock;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[5];

  stateLock = self->super._stateLock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__ASDLazyPromise_thenPerform_orCatchError_onScheduler___block_invoke;
  v13[3] = &unk_1E37BDD60;
  v13[4] = self;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  ASDWithLock(stateLock, v13);
  v12.receiver = self;
  v12.super_class = (Class)ASDLazyPromise;
  -[ASDPromise thenPerform:orCatchError:onScheduler:](&v12, sel_thenPerform_orCatchError_onScheduler_, v11, v10, v9);

}

void __55__ASDLazyPromise_thenPerform_orCatchError_onScheduler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    -[ASDPromise _invokeExecutor:onScheduler:](v2, v3, *(void **)(v2 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

- (id)joinWithPromise:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  ASDLazyPromise *v14;
  id v15;

  v4 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __34__ASDLazyPromise_joinWithPromise___block_invoke;
  v13 = &unk_1E37BFCC8;
  v14 = self;
  v15 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x19AEC5B88](&v10);
  +[ASDSyncTaskScheduler sharedInstance]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDPromise onScheduler:usingBlock:](ASDLazyPromise, "onScheduler:usingBlock:", v7, v6, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __34__ASDLazyPromise_joinWithPromise___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_2;
  v14[3] = &unk_1E37BFCA0;
  v8 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = v5;
  v17 = v6;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_5;
  v12[3] = &unk_1E37BDB60;
  v13 = v17;
  v9 = v17;
  v10 = v5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v8, "thenPerform:orCatchError:onScheduler:", v14, v12, v11);

}

void __34__ASDLazyPromise_joinWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_3;
  v11[3] = &unk_1E37BF7E0;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = v6;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __34__ASDLazyPromise_joinWithPromise___block_invoke_4;
  v9[3] = &unk_1E37BDB60;
  v10 = *(id *)(a1 + 48);
  v7 = v3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "thenPerform:orCatchError:onScheduler:", v11, v9, v8);

}

void __34__ASDLazyPromise_joinWithPromise___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v6[1] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

uint64_t __34__ASDLazyPromise_joinWithPromise___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__ASDLazyPromise_joinWithPromise___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_executor, 0);
}

@end
