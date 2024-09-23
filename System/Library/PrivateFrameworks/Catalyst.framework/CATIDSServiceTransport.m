@implementation CATIDSServiceTransport

- (CATIDSServiceTransport)initWithConnection:(id)a3
{
  id v5;
  CATIDSServiceTransport *v6;
  uint64_t v7;
  NSMutableArray *mReceiveQueue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATIDSServiceTransport;
  v6 = -[CATTransport init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    mReceiveQueue = v6->mReceiveQueue;
    v6->mReceiveQueue = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->mConnection, a3);
    -[CATIDSServiceConnection setDelegate:](v6->mConnection, "setDelegate:", v6);
  }

  return v6;
}

- (void)resumeConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (-[CATIDSServiceConnection isClosed](self->mConnection, "isClosed"))
  {
    -[CATIDSServiceConnection closedError](self->mConnection, "closedError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      CATErrorWithCodeAndUserInfo(100, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    -[CATTransport didInterruptWithError:](self, "didInterruptWithError:", v7);
  }
  else
  {
    self->mIsActive = 1;
    -[CATIDSServiceTransport serviceReceiveQueue](self, "serviceReceiveQueue");
  }
}

- (void)suspendConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  self->mIsActive = 0;
}

- (void)invalidateConnection
{
  if (-[CATIDSServiceConnection isClosed](self->mConnection, "isClosed"))
    -[CATIDSServiceTransport tryReportingInvalidation](self, "tryReportingInvalidation");
  else
    -[CATIDSServiceConnection close](self->mConnection, "close");
}

- (id)operationToSendMessage:(id)a3
{
  id v4;
  _CATIDSServiceTransportSendMessageOperation *v5;

  v4 = a3;
  v5 = -[_CATIDSServiceTransportSendMessageOperation initWithConnection:message:]([_CATIDSServiceTransportSendMessageOperation alloc], "initWithConnection:message:", self->mConnection, v4);

  return v5;
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CATIDSServiceConnection metadata](self->mConnection, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnection metadata](self->mConnection, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationAppleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)connection:(id)a3 receivedData:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  v9 = v8;
  if (v7)
  {
    -[NSMutableArray addObject:](self->mReceiveQueue, "addObject:", v7);
    -[CATIDSServiceTransport serviceReceiveQueue](self, "serviceReceiveQueue");
  }
  else
  {
    v13 = *MEMORY[0x24BDD1398];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(301, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTransport didInterruptWithError:](self, "didInterruptWithError:", v11);

  }
}

- (void)connectionClosed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_msgSend(v7, "closedError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self->mIsActive)
    {
      objc_msgSend(v7, "closedError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATTransport didInterruptWithError:](self, "didInterruptWithError:", v6);

    }
  }
  else
  {
    -[CATIDSServiceTransport tryReportingInvalidation](self, "tryReportingInvalidation");
  }

}

- (void)tryReportingInvalidation
{
  if (!self->mDidDelegateInvalidation)
  {
    self->mDidDelegateInvalidation = 1;
    -[CATTransport didInvalidate](self, "didInvalidate");
  }
}

- (void)serviceReceiveQueue
{
  NSObject *v3;
  id v4;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (self->mIsActive)
  {
    if (-[NSMutableArray count](self->mReceiveQueue, "count"))
    {
      -[NSMutableArray firstObject](self->mReceiveQueue, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->mReceiveQueue, "removeObjectAtIndex:", 0);
      -[CATTransport didReceiveMessage:](self, "didReceiveMessage:", v4);
      -[CATIDSServiceTransport serviceReceiveQueue](self, "serviceReceiveQueue");

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReceiveQueue, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
}

@end
