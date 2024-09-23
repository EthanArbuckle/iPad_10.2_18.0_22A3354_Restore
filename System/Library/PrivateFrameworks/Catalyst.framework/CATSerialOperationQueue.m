@implementation CATSerialOperationQueue

- (CATSerialOperationQueue)init
{
  CATSerialOperationQueue *v2;
  CATSerialOperationQueue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CATSerialOperationQueue;
  v2 = -[CATSerialOperationQueue init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CATSerialOperationQueue setMaxConcurrentOperationCount:](v2, "setMaxConcurrentOperationCount:", 1);
  return v3;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v10.receiver = self;
  v10.super_class = (Class)CATSerialOperationQueue;
  -[CATOperationQueue description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CATSerialOperationQueue isSuspended](self, "isSuspended"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nSuspended: %@"), v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATSerialOperationQueue operationCount](self, "operationCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nOperation Count: %@"), v7);

  -[CATSerialOperationQueue operations](self, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nOperations: %@"), v8);

  return v5;
}

- (void)addOperation:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mLastOperation);
  if (WeakRetained)
    objc_msgSend(v4, "addDependency:", WeakRetained);
  objc_storeWeak((id *)&self->mLastOperation, v4);
  v6.receiver = self;
  v6.super_class = (Class)CATSerialOperationQueue;
  -[CATOperationQueue addOperation:](&v6, sel_addOperation_, v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mLastOperation);
}

@end
