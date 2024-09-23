@implementation CATSendDeviceSessionMessageOperation

- (CATSendDeviceSessionMessageOperation)initWithDeviceSession:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  CATSendDeviceSessionMessageOperation *v9;
  CATSendDeviceSessionMessageOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATSendDeviceSessionMessageOperation;
  v9 = -[CATOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mDeviceSession, a3);
    objc_storeStrong((id *)&v10->mMessage, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
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
  v5[2] = __44__CATSendDeviceSessionMessageOperation_main__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_0;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __44__CATSendDeviceSessionMessageOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessage");
}

- (void)sendMessage
{
  NSObject *v3;
  CATSharingDeviceSession *mDeviceSession;
  void *v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (-[CATSendDeviceSessionMessageOperation isCancelled](self, "isCancelled"))
  {
    CATErrorWithCodeAndUserInfo(404, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v6);

  }
  else
  {
    mDeviceSession = self->mDeviceSession;
    -[CATDictionaryCodable dictionaryValue](self->mMessage, "dictionaryValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATSharingDeviceSession sendMessage:](mDeviceSession, "sendMessage:", v5);

    -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessage, 0);
  objc_storeStrong((id *)&self->mDeviceSession, 0);
}

@end
