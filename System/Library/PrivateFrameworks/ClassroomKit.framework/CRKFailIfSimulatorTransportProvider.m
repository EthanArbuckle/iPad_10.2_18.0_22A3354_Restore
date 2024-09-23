@implementation CRKFailIfSimulatorTransportProvider

- (CRKFailIfSimulatorTransportProvider)initWithTransportProvider:(id)a3
{
  id v4;
  void *v5;
  CRKFailIfSimulatorTransportProvider *v6;

  v4 = a3;
  CRKErrorWithCodeAndUserInfo(31, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKFailIfSimulatorTransportProvider initWithTransportProvider:failureError:](self, "initWithTransportProvider:failureError:", v4, v5);

  return v6;
}

- (CRKFailIfSimulatorTransportProvider)initWithTransportProvider:(id)a3 failureError:(id)a4
{
  id v7;
  id v8;
  CRKFailIfSimulatorTransportProvider *v9;
  CRKFailIfSimulatorTransportProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFailIfSimulatorTransportProvider;
  v9 = -[CRKFailIfSimulatorTransportProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseProvider, a3);
    objc_storeStrong((id *)&v10->_failureError, a4);
  }

  return v10;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;

  v4 = (void (**)(id, _QWORD))a3;
  if (CRKIsSimulator())
  {
    -[CRKFailIfSimulatorTransportProvider failureError](self, "failureError");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);
  }
  else
  {
    -[CRKFailIfSimulatorTransportProvider baseProvider](self, "baseProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchTransportWithCompletion:", v4);
  }

}

- (CRKTransportProviding)baseProvider
{
  return self->_baseProvider;
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureError, 0);
  objc_storeStrong((id *)&self->_baseProvider, 0);
}

@end
