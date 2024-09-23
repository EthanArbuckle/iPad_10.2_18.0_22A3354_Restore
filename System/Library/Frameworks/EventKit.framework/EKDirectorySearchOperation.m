@implementation EKDirectorySearchOperation

- (EKDirectorySearchOperation)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Please use the appropriate designated initializer for this class."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (EKDirectorySearchOperation)initWithSource:(id)a3 query:(id)a4 resultsBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKDirectorySearchOperation *v11;
  uint64_t v12;
  NSString *accountID;
  uint64_t v14;
  id resultsBlock;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EKDirectorySearchOperation;
  v11 = -[EKDirectorySearchOperation init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "externalID");
    v12 = objc_claimAutoreleasedReturnValue();
    accountID = v11->_accountID;
    v11->_accountID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_query, a4);
    v14 = objc_msgSend(v10, "copy");
    resultsBlock = v11->_resultsBlock;
    v11->_resultsBlock = (id)v14;

  }
  return v11;
}

- (void)start
{
  if ((-[EKDirectorySearchOperation isCancelled](self, "isCancelled") & 1) == 0
    && !-[EKDirectorySearchOperation isExecuting](self, "isExecuting")
    && !-[EKDirectorySearchOperation isFinished](self, "isFinished"))
  {
    -[EKDirectorySearchOperation main](self, "main");
  }
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id searchID;
  _QWORD v13[5];
  _QWORD v14[5];

  -[EKDirectorySearchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[EKDirectorySearchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[EKDirectorySearchOperation _recordTypes](self, "_recordTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    -[EKDirectorySearchQuery terms](self->_query, "terms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKDirectorySearchQuery resultLimit](self->_query, "resultLimit");
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __34__EKDirectorySearchOperation_main__block_invoke;
    v14[3] = &unk_1E4785F60;
    v14[4] = self;
    v8 = (void *)MEMORY[0x1A85849D4](v14);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __34__EKDirectorySearchOperation_main__block_invoke_2;
    v13[3] = &unk_1E4785F88;
    v13[4] = self;
    v9 = (void *)MEMORY[0x1A85849D4](v13);
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performCalendarDirectorySearchWithAccountID:terms:recordTypes:resultLimit:resultsBlock:completionBlock:", self->_accountID, v5, v4, v6, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    searchID = self->_searchID;
    self->_searchID = v11;

  }
  else
  {
    -[EKDirectorySearchOperation _finishWithError:](self, "_finishWithError:", 0);
  }

}

void __34__EKDirectorySearchOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_processResults:", v3);

}

void __34__EKDirectorySearchOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setNumberOfMatchesExceededLimit:", a3);
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v6);

}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDirectorySearchOperation;
  -[EKDirectorySearchOperation cancel](&v4, sel_cancel);
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelCalendarDirectorySearchWithID:", self->_searchID);

}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (id)_recordTypes
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[EKDirectorySearchQuery findGroups](self->_query, "findGroups"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D1C398]);
  if (-[EKDirectorySearchQuery findLocations](self->_query, "findLocations"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D1C3A0]);
  if (-[EKDirectorySearchQuery findResources](self->_query, "findResources"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D1C3A8]);
  if (-[EKDirectorySearchQuery findUsers](self->_query, "findUsers"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D1C3B0]);
  return v3;
}

- (void)_processResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKDirectorySearchResultSet *v13;

  if (self->_resultsBlock)
  {
    v4 = a3;
    v13 = objc_alloc_init(EKDirectorySearchResultSet);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C398]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchOperation _processResults:class:](self, "_processResults:class:", v5, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setGroups:](v13, "setGroups:", v6);

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C3A0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchOperation _processResults:class:](self, "_processResults:class:", v7, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setLocations:](v13, "setLocations:", v8);

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C3A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchOperation _processResults:class:](self, "_processResults:class:", v9, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setResources:](v13, "setResources:", v10);

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1C3B0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKDirectorySearchOperation _processResults:class:](self, "_processResults:class:", v11, objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDirectorySearchResultSet setPeople:](v13, "setPeople:", v12);

    if ((-[EKDirectorySearchOperation isCancelled](self, "isCancelled") & 1) == 0)
      (*((void (**)(void))self->_resultsBlock + 2))();

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
    v10[2] = __52__EKDirectorySearchOperation__processResults_class___block_invoke;
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

void __52__EKDirectorySearchOperation__processResults_class___block_invoke(uint64_t a1, uint64_t a2)
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
  if ((-[EKDirectorySearchOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[EKDirectorySearchOperation setError:](self, "setError:", v4);
  -[EKDirectorySearchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 0;
  -[EKDirectorySearchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[EKDirectorySearchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_isFinished = 1;
  -[EKDirectorySearchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));

}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)numberOfMatchesExceededLimit
{
  return self->_numberOfMatchesExceededLimit;
}

- (void)setNumberOfMatchesExceededLimit:(BOOL)a3
{
  self->_numberOfMatchesExceededLimit = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_searchID, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
