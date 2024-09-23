@implementation CHCallInteractionManager

- (CHCallInteractionManager)init
{
  CHCallInteractionInProcessDataSource *v3;
  CHCallInteractionManager *v4;

  v3 = objc_alloc_init(CHCallInteractionInProcessDataSource);
  v4 = -[CHCallInteractionManager initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (CHCallInteractionManager)initWithDataSource:(id)a3
{
  id v5;
  CHCallInteractionManager *v6;
  CHCallInteractionManager *v7;
  CHDelegateController *v8;
  CHDelegateController *delegateController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHCallInteractionManager;
  v6 = -[CHCallInteractionManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    -[CHCallInteractionDataSource setDelegate:](v7->_dataSource, "setDelegate:", v7);
    v8 = objc_alloc_init(CHDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = v8;

  }
  return v7;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CHCallInteractionManager delegateController](self, "delegateController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:queue:", v7, v6);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CHCallInteractionManager delegateController](self, "delegateController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", v4);

}

- (void)callInteractionsDidChangeForDataSource:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CHCallInteractionManager delegateController](self, "delegateController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke;
  v5[3] = &unk_1E6746CB0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateDelegatesUsingBlock:", v5);

}

void __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke_2;
    v9[3] = &unk_1E6746520;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    dispatch_async(v6, v9);

  }
}

uint64_t __67__CHCallInteractionManager_callInteractionsDidChangeForDataSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callInteractionsDidChangeForManager:", *(_QWORD *)(a1 + 40));
}

- (CHCallInteractionDataSource)dataSource
{
  return self->_dataSource;
}

- (CHDelegateController)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
