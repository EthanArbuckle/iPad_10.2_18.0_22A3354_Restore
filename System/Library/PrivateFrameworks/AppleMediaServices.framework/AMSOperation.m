@implementation AMSOperation

- (AMSOperation)init
{
  AMSOperation *v2;
  AMSMutableBinaryPromise *v3;
  AMSMutableBinaryPromise *promise;
  NSMutableSet *v5;
  NSMutableSet *subOperations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSOperation;
  v2 = -[AMSOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSMutableBinaryPromise);
    promise = v2->_promise;
    v2->_promise = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    subOperations = v2->_subOperations;
    v2->_subOperations = v5;

  }
  return v2;
}

- (void)main
{
  void *v3;
  AMSMutableBinaryPromise *promise;
  id v5;

  -[AMSOperation run](self, "run");
  -[AMSOperation error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  promise = self->_promise;
  if (v3)
  {
    -[AMSOperation error](self, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSMutableBinaryPromise finishWithError:](promise, "finishWithError:", v5);

  }
  else
  {
    -[AMSMutableBinaryPromise finishWithSuccess](self->_promise, "finishWithSuccess");
    self->_success = 1;
  }
}

- (void)cancel
{
  id v3;

  -[AMSOperation lock](self, "lock");
  self->_cancelled = 1;
  v3 = (id)-[NSMutableSet copy](self->_subOperations, "copy");
  -[AMSOperation unlock](self, "unlock");
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

}

- (BOOL)isCancelled
{
  _BOOL4 cancelled;
  id WeakRetained;
  int v6;

  -[AMSOperation lock](self, "lock");
  cancelled = self->_cancelled;
  -[AMSOperation unlock](self, "unlock");
  if (cancelled)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentOperation);
  v6 = objc_msgSend(WeakRetained, "isCancelled");

  return v6;
}

- (void)runSubOperation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3828];
  v5 = a3;
  objc_msgSend(v4, "currentQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSOperation runSubOperation:onQueue:](self, "runSubOperation:onQueue:", v5, v6);

}

- (void)runSubOperation:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AMSOperation lock](self, "lock");
  -[NSMutableSet addObject:](self->_subOperations, "addObject:", v6);
  objc_msgSend(v6, "setParentOperation:", self);
  -[AMSOperation unlock](self, "unlock");
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    objc_msgSend(v6, "start");
  }
  else
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperations:waitUntilFinished:", v9, 1);

  }
  -[AMSOperation lock](self, "lock");
  objc_msgSend(v6, "setParentOperation:", 0);
  -[NSMutableSet removeObject:](self->_subOperations, "removeObject:", v6);
  -[AMSOperation unlock](self, "unlock");

}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (AMSOperation)parentOperation
{
  return (AMSOperation *)objc_loadWeakRetained((id *)&self->_parentOperation);
}

- (void)setParentOperation:(id)a3
{
  objc_storeWeak((id *)&self->_parentOperation, a3);
}

- (AMSMutableBinaryPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
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
  objc_storeStrong((id *)&self->_promise, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
