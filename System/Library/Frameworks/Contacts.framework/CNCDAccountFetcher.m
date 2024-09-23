@implementation CNCDAccountFetcher

+ (id)accountsForPredicate:(id)a3 inPersistenceStack:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0D13A18];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __68__CNCDAccountFetcher_accountsForPredicate_inPersistenceStack_error___block_invoke;
  v22 = &unk_1E29F97D0;
  v10 = v8;
  v23 = v10;
  v11 = v7;
  v24 = v11;
  objc_msgSend(v9, "eitherWithBlock:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(_QWORD, void *, uint64_t, uint64_t))(*MEMORY[0x1E0D13748] + 16))(*MEMORY[0x1E0D13748], v12, v13, v14))
  {
    objc_msgSend(v12, "left", v19, v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "right", v19, v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);

    v15 = 0;
  }

  return v15;
}

id __68__CNCDAccountFetcher_accountsForPredicate_inPersistenceStack_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  CNCDAccountFetcher *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "makePersistenceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNCDAccountFetcher initWithPredicate:persistenceContext:]([CNCDAccountFetcher alloc], "initWithPredicate:persistenceContext:", *(_QWORD *)(a1 + 40), v4);
  -[CNCDAccountFetcher fetchAccounts:](v5, "fetchAccounts:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNCDAccountFetcher)init
{
  CNCDAccountFetcher *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNCDAccountFetcher)initWithPredicate:(id)a3 persistenceContext:(id)a4
{
  id v7;
  id v8;
  CNCDAccountFetcher *v9;
  CNCDAccountFetcher *v10;
  CNCDAccountFetcher *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNCDAccountFetcher;
  v9 = -[CNCDAccountFetcher init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_persistenceContext, a4);
    v11 = v10;
  }

  return v10;
}

- (id)fetchAccounts:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNCDAccountFetcher predicate](self, "predicate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCDAccountFetcher persistenceContext](self, "persistenceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    -[CNCDAccountFetcher predicate](self, "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cn_map:", sABCDContainerToCNAccount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "_cn_map:", sABCDContainerToCNAccount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (CNCDPersistenceContext)persistenceContext
{
  return self->_persistenceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceContext, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
