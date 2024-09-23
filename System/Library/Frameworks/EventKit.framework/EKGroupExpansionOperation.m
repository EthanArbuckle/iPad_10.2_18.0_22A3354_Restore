@implementation EKGroupExpansionOperation

- (EKGroupExpansionOperation)initWithSource:(id)a3 group:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKGroupExpansionOperation *v11;
  uint64_t v12;
  NSString *accountID;
  uint64_t v14;
  id completionBlock;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EKGroupExpansionOperation;
  v11 = -[EKGroupExpansionOperation init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "externalID");
    v12 = objc_claimAutoreleasedReturnValue();
    accountID = v11->_accountID;
    v11->_accountID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_group, a4);
    v14 = objc_msgSend(v10, "copy");
    completionBlock = v11->_completionBlock;
    v11->_completionBlock = (id)v14;

  }
  return v11;
}

- (void)start
{
  if ((-[EKGroupExpansionOperation isCancelled](self, "isCancelled") & 1) == 0
    && !-[EKGroupExpansionOperation isExecuting](self, "isExecuting")
    && !-[EKGroupExpansionOperation isFinished](self, "isFinished"))
  {
    -[EKGroupExpansionOperation main](self, "main");
  }
}

- (void)main
{
  void *v3;
  void *v4;
  NSString *accountID;
  void *v6;
  _QWORD v7[5];

  -[EKGroupExpansionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[EKGroupExpansionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__EKGroupExpansionOperation_main__block_invoke;
  v7[3] = &unk_1E4786D20;
  v7[4] = self;
  v3 = (void *)MEMORY[0x1A85849D4](v7);
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accountID = self->_accountID;
  -[EKDirectoryRecord principalPath](self->_group, "principalPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performGroupExpansionWithAccountID:principalPath:completionBlock:", accountID, v6, v3);

}

void __33__EKGroupExpansionOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_processResults:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v5);

}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)_processResults:(id)a3
{
  id v4;
  EKDirectorySearchResultSet *v5;
  EKDirectorySearchResultSet *resultsSet;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_completionBlock)
  {
    v4 = a3;
    v5 = objc_alloc_init(EKDirectorySearchResultSet);
    resultsSet = self->_resultsSet;
    self->_resultsSet = v5;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C398]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKGroupExpansionOperation _processResults:class:](self, "_processResults:class:", v7, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setGroups:](self->_resultsSet, "setGroups:", v8);

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C3A0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKGroupExpansionOperation _processResults:class:](self, "_processResults:class:", v9, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setLocations:](self->_resultsSet, "setLocations:", v10);

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C3A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKGroupExpansionOperation _processResults:class:](self, "_processResults:class:", v11, objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setResources:](self->_resultsSet, "setResources:", v12);

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C3B0]);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[EKGroupExpansionOperation _processResults:class:](self, "_processResults:class:", v14, objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setPeople:](self->_resultsSet, "setPeople:", v13);

  }
}

- (id)_processResults:(id)a3 class:(Class)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  Class v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v6);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__EKGroupExpansionOperation__processResults_class___block_invoke;
    v10[3] = &unk_1E4785FB0;
    v12 = a4;
    v8 = v7;
    v11 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __51__EKGroupExpansionOperation__processResults_class___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "recordFromSearchResult:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)_finishWithError:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[EKGroupExpansionOperation isCancelled](self, "isCancelled") & 1) == 0)
    (*((void (**)(void))self->_completionBlock + 2))();
  -[EKGroupExpansionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 0;
  -[EKGroupExpansionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[EKGroupExpansionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_isFinished = 1;
  -[EKGroupExpansionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsSet, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
