@implementation CATSharingServiceTransportSendMessageOperation

- (CATSharingServiceTransportSendMessageOperation)initWithConnection:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  CATSharingServiceTransportSendMessageOperation *v9;
  CATSharingServiceTransportSendMessageOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATSharingServiceTransportSendMessageOperation;
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
  v7.super_class = (Class)CATSharingServiceTransportSendMessageOperation;
  -[CATSharingServiceTransportSendMessageOperation cancel](&v7, sel_cancel);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__CATSharingServiceTransportSendMessageOperation_cancel__block_invoke;
  v6[3] = &unk_24C1C5A60;
  v6[4] = self;
  v4 = v6;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_17;
  block[3] = &unk_24C1C5998;
  v9 = v4;
  dispatch_async(v5, block);

}

void __56__CATSharingServiceTransportSendMessageOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(404, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v3);

  }
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
  v5[2] = __54__CATSharingServiceTransportSendMessageOperation_main__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_17;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __54__CATSharingServiceTransportSendMessageOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessage");
}

- (void)sendMessage
{
  NSObject *v3;
  void *v4;
  CATSharingConnection *mConnection;
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
      v7[2] = __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke;
      v7[3] = &unk_24C1C5C28;
      objc_copyWeak(&v8, &location);
      -[CATSharingConnection sendData:completion:](mConnection, "sendData:completion:", v4, v7);
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

void __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke_2;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_17;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __61__CATSharingServiceTransportSendMessageOperation_sendMessage__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didSendMessageWithError:", *(_QWORD *)(a1 + 32));

}

- (void)didSendMessageWithError:(id)a3
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
}

@end
