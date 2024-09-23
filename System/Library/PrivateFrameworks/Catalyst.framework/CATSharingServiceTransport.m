@implementation CATSharingServiceTransport

- (CATSharingServiceTransport)initWithConnection:(id)a3
{
  id v5;
  CATSharingServiceTransport *v6;
  uint64_t v7;
  CATOperationQueue *mCatalystQueue;
  void *v9;
  uint64_t v10;
  NSMutableArray *mReceivedMessages;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CATSharingServiceTransport;
  v6 = -[CATTransport init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    mCatalystQueue = v6->mCatalystQueue;
    v6->mCatalystQueue = (CATOperationQueue *)v7;

    CATGetCatalystQueue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setUnderlyingQueue:](v6->mCatalystQueue, "setUnderlyingQueue:", v9);

    v10 = objc_opt_new();
    mReceivedMessages = v6->mReceivedMessages;
    v6->mReceivedMessages = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v6->mConnection, a3);
    -[CATSharingConnection setDelegate:](v6->mConnection, "setDelegate:", v6);
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

  if (-[CATSharingConnection isClosed](self->mConnection, "isClosed"))
  {
    -[CATSharingConnection closedError](self->mConnection, "closedError");
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
    -[CATSharingServiceTransport processReceivedMessages](self, "processReceivedMessages");
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
  if (-[CATSharingConnection isClosed](self->mConnection, "isClosed"))
    -[CATSharingServiceTransport invalidateIfNeeded](self, "invalidateIfNeeded");
  else
    -[CATSharingConnection close](self->mConnection, "close");
}

- (id)operationToSendMessage:(id)a3
{
  id v4;
  CATSharingServiceTransportSendMessageOperation *v5;

  v4 = a3;
  v5 = -[CATSharingServiceTransportSendMessageOperation initWithConnection:message:]([CATSharingServiceTransportSendMessageOperation alloc], "initWithConnection:message:", self->mConnection, v4);

  return v5;
}

- (id)name
{
  void *v2;
  void *v3;
  void *v4;

  -[CATSharingConnection remoteDevice](self->mConnection, "remoteDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)connection:(id)a3 receivedData:(id)a4
{
  id v6;
  id v7;
  CATOperationQueue *mCatalystQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  mCatalystQueue = self->mCatalystQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__CATSharingServiceTransport_connection_receivedData___block_invoke;
  v10[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  -[CATOperationQueue addOperationWithBlock:](mCatalystQueue, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __54__CATSharingServiceTransport_connection_receivedData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BDD1620];
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 32);
    v11 = 0;
    objc_msgSend(v3, "cat_unarchiveObjectOfClass:withData:error:", v4, v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v7;
    if (v6)
    {
      objc_msgSend(WeakRetained[9], "addObject:", v6);
      objc_msgSend(WeakRetained, "processReceivedMessages");
    }
    else
    {
      v12 = *MEMORY[0x24BDD1398];
      v13[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(301, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "didInterruptWithError:", v10);

    }
  }

}

- (void)connectionClosed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_msgSend(v4, "closedError");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (self->mIsActive)
      -[CATTransport didInterruptWithError:](self, "didInterruptWithError:", v6);
  }
  else
  {
    -[CATSharingServiceTransport invalidateIfNeeded](self, "invalidateIfNeeded");
  }

}

- (void)processReceivedMessages
{
  NSObject *v3;
  id v4;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (self->mIsActive)
  {
    if (-[NSMutableArray count](self->mReceivedMessages, "count"))
    {
      -[NSMutableArray firstObject](self->mReceivedMessages, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->mReceivedMessages, "removeObjectAtIndex:", 0);
      -[CATTransport didReceiveMessage:](self, "didReceiveMessage:", v4);
      -[CATSharingServiceTransport processReceivedMessages](self, "processReceivedMessages");

    }
  }
}

- (void)invalidateIfNeeded
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (!self->mIsInvalidated)
  {
    self->mIsInvalidated = 1;
    -[CATTransport didInvalidate](self, "didInvalidate");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReceivedMessages, 0);
  objc_storeStrong((id *)&self->mCatalystQueue, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
}

@end
