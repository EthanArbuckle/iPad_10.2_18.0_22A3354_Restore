@implementation HMDeviceSetupOperation

- (HMDeviceSetupOperation)init
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

- (HMDeviceSetupOperation)initWithSession:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDeviceSetupOperation *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDeviceSetupOperation initWithSession:sessionIdentifier:](self, "initWithSession:sessionIdentifier:", v5, v6);

  return v7;
}

- (HMDeviceSetupOperation)initWithSession:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  HMDeviceSetupOperation *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__HMDeviceSetupOperation_initWithSession_sessionIdentifier___block_invoke;
  v10[3] = &unk_1E3AB0DA8;
  v11 = v6;
  v7 = v6;
  v8 = -[HMDeviceSetupOperation initWithSession:setupSessionFactory:](self, "initWithSession:setupSessionFactory:", a3, v10);

  return v8;
}

- (HMDeviceSetupOperation)initWithSession:(id)a3 setupSessionFactory:(id)a4
{
  id v6;
  id v7;
  HMTRSession *v8;
  HMDeviceSetupOperation *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v8 = -[HMTRSession initWithSession:]([HMTRSession alloc], "initWithSession:", v7);

  v11.receiver = self;
  v11.super_class = (Class)HMDeviceSetupOperation;
  v9 = -[HMDeviceSetupOperationBase initWithSessionTransport:setupSessionFactory:](&v11, sel_initWithSessionTransport_setupSessionFactory_, v8, v6);

  if (v9)
    objc_storeStrong((id *)&v9->_trSession, v8);

  return v9;
}

- (TRSession)session
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDeviceSetupOperation;
  -[HMDeviceSetupOperationBase sessionTransport](&v7, sel_sessionTransport);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (TRSession *)v5;
}

- (HMTRSession)trSession
{
  return (HMTRSession *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trSession, 0);
}

HMDeviceSetupSession *__60__HMDeviceSetupOperation_initWithSession_sessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDeviceSetupSession *v4;

  v3 = a2;
  v4 = -[HMDeviceSetupSession initWithRole:identifier:delegate:]([HMDeviceSetupSession alloc], "initWithRole:identifier:delegate:", 0, *(_QWORD *)(a1 + 32), v3);

  return v4;
}

@end
