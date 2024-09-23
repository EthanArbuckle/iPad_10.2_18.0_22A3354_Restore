@implementation CRKTaskClientBackedRequestPerformer

- (CRKTaskClientBackedRequestPerformer)initWithTaskClient:(id)a3
{
  id v5;
  CRKTaskClientBackedRequestPerformer *v6;
  CRKTaskClientBackedRequestPerformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKTaskClientBackedRequestPerformer;
  v6 = -[CRKTaskClientBackedRequestPerformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskClient, a3);

  return v7;
}

- (id)operationForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKTaskClientBackedRequestPerformer taskClient](self, "taskClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareTaskOperationForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CATTaskClient)taskClient
{
  return self->_taskClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskClient, 0);
}

@end
