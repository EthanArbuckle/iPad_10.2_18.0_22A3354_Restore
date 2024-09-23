@implementation HMCUMessageSessionDeviceSetupOperation

- (HMCUMessageSessionDeviceSetupOperation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMCUMessageSessionDeviceSetupOperation)initWithSession:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  HMCUMessageSessionDeviceSetupOperation *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HMCUMessageSessionDeviceSetupOperation_initWithSession_sessionIdentifier___block_invoke;
  v10[3] = &unk_1E3AB0DA8;
  v11 = v6;
  v7 = v6;
  v8 = -[HMCUMessageSessionDeviceSetupOperation initWithSession:setupSessionFactory:](self, "initWithSession:setupSessionFactory:", a3, v10);

  return v8;
}

- (HMCUMessageSessionDeviceSetupOperation)initWithSession:(id)a3 setupSessionFactory:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMCUMessageSessionDeviceSetupOperation;
  return -[HMDeviceSetupOperationBase initWithSessionTransport:setupSessionFactory:](&v5, sel_initWithSessionTransport_setupSessionFactory_, a3, a4);
}

- (CUMessageSession)session
{
  void *v2;
  void *v3;
  CUMessageSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCUMessageSessionDeviceSetupOperation;
  -[HMDeviceSetupOperationBase sessionTransport](&v6, sel_sessionTransport);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

HMDeviceSetupSession *__76__HMCUMessageSessionDeviceSetupOperation_initWithSession_sessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDeviceSetupSession *v4;

  v3 = a2;
  v4 = -[HMDeviceSetupSession initWithRole:identifier:delegate:]([HMDeviceSetupSession alloc], "initWithRole:identifier:delegate:", 0, *(_QWORD *)(a1 + 32), v3);

  return v4;
}

@end
