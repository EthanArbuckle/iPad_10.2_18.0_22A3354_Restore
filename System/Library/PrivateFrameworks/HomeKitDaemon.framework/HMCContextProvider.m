@implementation HMCContextProvider

- (HMCContextProvider)initWithContext:(id)a3
{
  id v5;
  HMCContextProvider *v6;
  HMCContextProvider *v7;
  uint64_t v8;
  NSMutableArray *redirections;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMCContextProvider;
  v6 = -[HMCContextProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    redirections = v7->_redirections;
    v7->_redirections = (NSMutableArray *)v8;

  }
  return v7;
}

- (HMCContext)context
{
  return self->_context;
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[HMCContextProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__HMCContextProvider_performBlock___block_invoke;
  v8[3] = &unk_24E79C2B8;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)unsafeSynchronousBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[HMCContextProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HMCContextProvider_unsafeSynchronousBlock___block_invoke;
  v8[3] = &unk_24E79C2B8;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v8);

}

- (id)futureInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[HMCContextProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE3F180];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__HMCContextProvider_futureInContext___block_invoke;
  v11[3] = &unk_24E793588;
  v12 = v5;
  v13 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "inContext:perform:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)registerForChangesOfDatabaseModels:(id)a3 orWithModelIDs:(id)a4 changeMask:(unint64_t)a5 selector:(SEL)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v11 = (id)MEMORY[0x24BDBD1A8];
  if (a3)
    v12 = a3;
  else
    v12 = (id)MEMORY[0x24BDBD1A8];
  if (a4)
    v11 = a4;
  v13 = v11;
  v14 = v12;
  v15 = a4;
  v21 = a3;
  -[HMCContextProvider redirections](self, "redirections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCContextProvider context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "partition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "redirections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:selector:changeMask:forChangesOfObjectsWithModelType:forChangesOfObjectsWithModelID:", self, a6, a5, v14, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObject:", v20);
}

- (void)removeAllRegistrations
{
  void *v3;
  id v4;

  -[HMCContextProvider redirections](self, "redirections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &__block_literal_global_212861);

  -[HMCContextProvider redirections](self, "redirections");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (NSMutableArray)redirections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirections, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __44__HMCContextProvider_removeAllRegistrations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

uint64_t __38__HMCContextProvider_futureInContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __45__HMCContextProvider_unsafeSynchronousBlock___block_invoke(uint64_t a1)
{
  _HMFThreadLocalAsyncContextPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _HMFThreadLocalAsyncContextPop();
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __35__HMCContextProvider_performBlock___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

@end
