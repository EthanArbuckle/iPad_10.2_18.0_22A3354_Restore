@implementation CRKSingleConnectionAttemptStudentDaemonProxy

- (void)dealloc
{
  objc_super v3;

  -[CATTaskClient invalidate](self->mTaskClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKSingleConnectionAttemptStudentDaemonProxy;
  -[CRKSingleConnectionAttemptStudentDaemonProxy dealloc](&v3, sel_dealloc);
}

- (CRKSingleConnectionAttemptStudentDaemonProxy)init
{
  void *v3;
  CRKSingleConnectionAttemptStudentDaemonProxy *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKSingleConnectionAttemptStudentDaemonProxy initWithTransportProvider:](self, "initWithTransportProvider:", v3);

  return v4;
}

- (CRKSingleConnectionAttemptStudentDaemonProxy)initWithTransportProvider:(id)a3
{
  id v5;
  CRKSingleConnectionAttemptStudentDaemonProxy *v6;
  CRKSingleConnectionAttemptStudentDaemonProxy *v7;
  uint64_t v8;
  CATTaskClient *mTaskClient;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKSingleConnectionAttemptStudentDaemonProxy;
  v6 = -[CRKSingleConnectionAttemptStudentDaemonProxy init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTransportProvider, a3);
    v8 = objc_opt_new();
    mTaskClient = v7->mTaskClient;
    v7->mTaskClient = (CATTaskClient *)v8;

    -[CATTaskClient setDelegate:](v7->mTaskClient, "setDelegate:", v7);
  }

  return v7;
}

- (void)connectIfNeeded
{
  if (!self->mDidAttemptToConnect)
  {
    self->mDidAttemptToConnect = 1;
    -[CRKSingleConnectionAttemptStudentDaemonProxy connect](self, "connect");
  }
}

- (void)connect
{
  CRKTransportProviding *mTransportProvider;
  _QWORD v3[5];

  mTransportProvider = self->mTransportProvider;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__CRKSingleConnectionAttemptStudentDaemonProxy_connect__block_invoke;
  v3[3] = &unk_24D9CA780;
  v3[4] = self;
  -[CRKTransportProviding fetchTransportWithCompletion:](mTransportProvider, "fetchTransportWithCompletion:", v3);
}

uint64_t __55__CRKSingleConnectionAttemptStudentDaemonProxy_connect__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v3;

  v3 = *(id **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "failWithError:");
  else
    return objc_msgSend(v3[2], "connectWithTransport:", a2);
}

- (void)failWithError:(id)a3
{
  NSError *v5;
  NSError *mError;
  void *v7;
  NSError *v8;

  v5 = (NSError *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSingleConnectionAttemptStudentDaemonProxy.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  mError = self->mError;
  self->mError = v5;
  v8 = v5;

  -[CATTaskClient invalidateWithError:](self->mTaskClient, "invalidateWithError:", v8);
}

- (id)operationForRequest:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSingleConnectionAttemptStudentDaemonProxy.m"), 71, CFSTR("%@ must be called from the main thread"), v9);

  }
  -[CRKSingleConnectionAttemptStudentDaemonProxy connectIfNeeded](self, "connectIfNeeded");
  if (self->mError)
    objc_msgSend(MEMORY[0x24BE2C770], "invalidRemoteTaskWithRequest:error:", v5);
  else
    -[CATTaskClient prepareTaskOperationForRequest:](self->mTaskClient, "prepareTaskOperationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  -[CRKSingleConnectionAttemptStudentDaemonProxy failWithError:](self, "failWithError:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mTaskClient, 0);
  objc_storeStrong((id *)&self->mTransportProvider, 0);
}

@end
