@implementation CNPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

- (CNFuture)future
{
  return (CNFuture *)objc_getProperty(self, a2, 8, 1);
}

- (CNPromise)init
{
  void *v3;
  CNPromise *v4;

  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPromise initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (CNPromise)initWithSchedulerProvider:(id)a3
{
  id v4;
  CNPromise *v5;
  CNFuture *v6;
  CNFuture *future;
  CNPromise *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPromise;
  v5 = -[CNPromise init](&v10, sel_init);
  if (v5)
  {
    v6 = -[CNFuture initWithSchedulerProvider:]([CNFuture alloc], "initWithSchedulerProvider:", v4);
    future = v5->_future;
    v5->_future = v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)finishWithError:(id)a3
{
  return -[CNFuture finishWithError:](self->_future, "finishWithError:", a3);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[CNFuture finishWithResult:](self->_future, "finishWithResult:", a3);
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return -[CNFuture finishWithResult:error:](self->_future, "finishWithResult:error:", a3, a4);
}

- (id)completionHandlerAdapterWithDefaultValue:(id)a3
{
  return CNPromiseCompletionHandlerWithDefaultValue(self, a3);
}

- (id)BOOLErrorCompletionHandlerAdapter
{
  return -[CNFuture BOOLErrorCompletionHandlerAdapter](self->_future, "BOOLErrorCompletionHandlerAdapter");
}

- (id)errorOnlyCompletionHandlerAdapter
{
  return -[CNFuture errorOnlyCompletionHandlerAdapter](self->_future, "errorOnlyCompletionHandlerAdapter");
}

@end
