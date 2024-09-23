@implementation CRKASMConcreteUserDirectoryIterator

- (CRKASMConcreteUserDirectoryIterator)initWithRequirements:(id)a3 query:(id)a4
{
  id v7;
  id v8;
  CRKASMConcreteUserDirectoryIterator *v9;
  CRKASMConcreteUserDirectoryIterator *v10;
  uint64_t v11;
  NSMutableArray *queryCompletionQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMConcreteUserDirectoryIterator;
  v9 = -[CRKASMConcreteUserDirectoryIterator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requirements, a3);
    objc_storeStrong((id *)&v10->_query, a4);
    v11 = objc_opt_new();
    queryCompletionQueue = v10->_queryCompletionQueue;
    v10->_queryCompletionQueue = (NSMutableArray *)v11;

  }
  return v10;
}

+ (id)iteratorWithRosterRequirements:(id)a3 queryGenerator:(id)a4
{
  id v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(void))a4;
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequirements:query:", v6, v8);
  objc_initWeak(&location, v9);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke;
  v11[3] = &unk_24D9C8830;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "setCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

void __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke_2;
  block[3] = &unk_24D9C8808;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "queryDidFinishExecutingWithResults:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)fetchNextUsersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__CRKASMConcreteUserDirectoryIterator_fetchNextUsersWithCompletion___block_invoke;
  v6[3] = &unk_24D9C6F90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __68__CRKASMConcreteUserDirectoryIterator_fetchNextUsersWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "queryCompletionQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x219A226E8](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "serviceQueryQueue");
}

- (void)serviceQueryQueue
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMConcreteUserDirectoryIterator.m"), 72, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (!-[CRKASMConcreteUserDirectoryIterator isExecuting](self, "isExecuting"))
  {
    -[CRKASMConcreteUserDirectoryIterator queryCompletionQueue](self, "queryCompletionQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[CRKASMConcreteUserDirectoryIterator setExecuting:](self, "setExecuting:", 1);
      -[CRKASMConcreteUserDirectoryIterator requirements](self, "requirements");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CRKASMConcreteUserDirectoryIterator query](self, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "executeQuery:", v6);

    }
  }
}

- (void)queryDidFinishExecutingWithResults:(id)a3 error:(id)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, id);

  v7 = (void *)MEMORY[0x24BDD17F0];
  v8 = a4;
  v9 = a3;
  if ((objc_msgSend(v7, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMConcreteUserDirectoryIterator.m"), 83, CFSTR("%@ must be called from the main thread"), v16);

  }
  -[CRKASMConcreteUserDirectoryIterator queryCompletionQueue](self, "queryCompletionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMConcreteUserDirectoryIterator.m"), 84, CFSTR("Should have at least one pending completion"));

  }
  -[CRKASMConcreteUserDirectoryIterator queryCompletionQueue](self, "queryCompletionQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v18 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();

  -[CRKASMConcreteUserDirectoryIterator queryCompletionQueue](self, "queryCompletionQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectAtIndex:", 0);

  objc_msgSend(v9, "crk_mapUsingBlock:", &__block_literal_global_46);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[2](v18, v14, v8);
  -[CRKASMConcreteUserDirectoryIterator setExecuting:](self, "setExecuting:", 0);
  -[CRKASMConcreteUserDirectoryIterator serviceQueryQueue](self, "serviceQueryQueue");

}

CRKASMConcreteUser *__80__CRKASMConcreteUserDirectoryIterator_queryDidFinishExecutingWithResults_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRKASMConcreteUser *v3;

  v2 = a2;
  v3 = -[CRKASMConcreteUser initWithBackingPerson:]([CRKASMConcreteUser alloc], "initWithBackingPerson:", v2);

  return v3;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (CRKClassKitQuery)query
{
  return self->_query;
}

- (NSMutableArray)queryCompletionQueue
{
  return self->_queryCompletionQueue;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCompletionQueue, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
}

@end
