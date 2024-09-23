@implementation _CATIDSServiceTransportSendMessageOperation

- (_CATIDSServiceTransportSendMessageOperation)initWithConnection:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  _CATIDSServiceTransportSendMessageOperation *v9;
  _CATIDSServiceTransportSendMessageOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CATIDSServiceTransportSendMessageOperation;
  v9 = -[CATOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mConnection, a3);
    objc_storeStrong((id *)&v10->mMessage, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD v6[5];
  objc_super v7;
  _QWORD block[4];
  id v9;

  v7.receiver = self;
  v7.super_class = (Class)_CATIDSServiceTransportSendMessageOperation;
  -[_CATIDSServiceTransportSendMessageOperation cancel](&v7, sel_cancel);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53___CATIDSServiceTransportSendMessageOperation_cancel__block_invoke;
  v6[3] = &unk_24C1C5A60;
  v6[4] = self;
  v4 = v6;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_4;
  block[3] = &unk_24C1C5998;
  v9 = v4;
  dispatch_async(v5, block);

}

- (void)main
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[4];
  id v7;

  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51___CATIDSServiceTransportSendMessageOperation_main__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_4;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

- (void)sendData
{
  NSObject *v3;
  void *v4;
  CATIDSServiceConnection *mConnection;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (-[CATOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(MEMORY[0x24BDD1618], "cat_archivedDataWithRootObject:", self->mMessage);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_initWeak(&location, self);
      mConnection = self->mConnection;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke;
      v7[3] = &unk_24C1C5C28;
      objc_copyWeak(&v8, &location);
      -[CATIDSServiceConnection sendData:completion:](mConnection, "sendData:completion:", v4, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      CATErrorWithCodeAndUserInfo(301, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
  }
}

- (void)didSendDataWithError:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATOperation isExecuting](self, "isExecuting"))
  {
    if (v5)
      -[CATOperation endOperationWithError:](self, "endOperationWithError:", v5);
    else
      -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessage, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
  objc_storeStrong((id *)&self->mTransport, 0);
}

@end
