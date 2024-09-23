@implementation CNContactStoreFetchExecutor

- (CNContactStoreFetchExecutor)initWithContactStore:(id)a3
{
  id v5;
  CNContactStoreFetchExecutor *v6;
  CNContactStoreFetchExecutor *v7;
  CNResult *v8;
  CNContactStoreFetchExecutor *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNContactStoreFetchExecutor;
  v6 = -[CNContactStoreFetchExecutor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = v7->_result;
    v7->_result = 0;

    v9 = v7;
  }

  return v7;
}

- (id)executeFetchRequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "acceptVisitor:", self);
  -[CNContactStoreFetchExecutor result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0D13B60];
    -[CNContactStoreFetchExecutor store](self, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failureWithError:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)visitContactFetchRequest:(id)a3
{
  id v4;
  CNAPITriageSession *v5;
  CNContactFetchExecutor *v6;
  void *v7;
  CNContactFetchExecutor *v8;
  void *v9;
  id v10;
  CNResult *v11;
  CNResult *result;
  void *v13;
  id v14;

  v4 = a3;
  v5 = -[CNAPITriageSession initWithRequest:]([CNAPITriageSession alloc], "initWithRequest:", v4);
  -[CNAPITriageSession open](v5, "open");
  v6 = [CNContactFetchExecutor alloc];
  -[CNContactStoreFetchExecutor store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactFetchExecutor initWithRequest:store:](v6, "initWithRequest:store:", v4, v7);

  v14 = 0;
  -[CNContactFetchExecutor run:](v8, "run:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithValue:orError:", v9, v10);
  v11 = (CNResult *)objc_claimAutoreleasedReturnValue();
  result = self->_result;
  self->_result = v11;

  objc_msgSend(v9, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAPITriageSession closeWithContacts:orError:](v5, "closeWithContacts:orError:", v13, v10);

}

- (CNContactStore)store
{
  return (CNContactStore *)objc_getProperty(self, a2, 8, 1);
}

- (CNResult)result
{
  return (CNResult *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (CNContactStoreFetchExecutor)init
{
  CNContactStoreFetchExecutor *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)countForFetchRequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "acceptVisitor:", self);
  -[CNContactStoreFetchExecutor result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0D13B60];
    -[CNContactStoreFetchExecutor store](self, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorObject:doesNotImplementSelector:](CNErrorFactory, "errorObject:doesNotImplementSelector:", v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failureWithError:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)visitChangeHistoryFetchRequest:(id)a3
{
  id v4;
  CNChangeHistoryFetchExecutor *v5;
  void *v6;
  CNChangeHistoryFetchExecutor *v7;
  void *v8;
  id v9;
  CNResult *v10;
  CNResult *result;
  id v12;

  v4 = a3;
  v5 = [CNChangeHistoryFetchExecutor alloc];
  -[CNContactStoreFetchExecutor store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNChangeHistoryFetchExecutor initWithRequest:store:](v5, "initWithRequest:store:", v4, v6);

  v12 = 0;
  -[CNChangeHistoryFetchExecutor run:](v7, "run:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithValue:orError:", v8, v9);
  v10 = (CNResult *)objc_claimAutoreleasedReturnValue();
  result = self->_result;
  self->_result = v10;

}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
