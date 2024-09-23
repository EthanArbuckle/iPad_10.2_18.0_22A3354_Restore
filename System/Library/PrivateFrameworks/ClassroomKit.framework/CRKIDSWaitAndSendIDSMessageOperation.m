@implementation CRKIDSWaitAndSendIDSMessageOperation

- (CRKIDSWaitAndSendIDSMessageOperation)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4 message:(id)a5 destinationAddress:(id)a6 sourceAppleID:(id)a7 options:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CRKIDSWaitAndSendIDSMessageOperation *v21;
  CRKIDSWaitAndSendIDSMessageOperation *v22;
  uint64_t v23;
  NSDictionary *message;
  uint64_t v25;
  NSString *destinationAddress;
  uint64_t v27;
  NSString *sourceAppleID;
  uint64_t v29;
  CRKIDSMessageOptions *options;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CRKIDSWaitAndSendIDSMessageOperation;
  v21 = -[CRKIDSWaitAndSendIDSMessageOperation init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_IDSLocalPrimitives, a3);
    objc_storeStrong((id *)&v22->_readinessEvaluator, a4);
    v23 = objc_msgSend(v17, "copy");
    message = v22->_message;
    v22->_message = (NSDictionary *)v23;

    v25 = objc_msgSend(v18, "copy");
    destinationAddress = v22->_destinationAddress;
    v22->_destinationAddress = (NSString *)v25;

    v27 = objc_msgSend(v19, "copy");
    sourceAppleID = v22->_sourceAppleID;
    v22->_sourceAppleID = (NSString *)v27;

    v29 = objc_msgSend(v20, "copy");
    options = v22->_options;
    v22->_options = (CRKIDSMessageOptions *)v29;

  }
  return v22;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKIDSWaitAndSendIDSMessageOperation;
  -[CRKIDSWaitAndSendIDSMessageOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CRKIDSWaitAndSendIDSMessageOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__CRKIDSWaitAndSendIDSMessageOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "evaluateReadinessOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "sendMessageOperation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CRKIDSWaitAndSendIDSMessageOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __44__CRKIDSWaitAndSendIDSMessageOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[CRKIDSWaitAndSendIDSMessageOperation isCanceled](self, "isCanceled"))
  {
    CATErrorWithCodeAndUserInfo();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKIDSWaitAndSendIDSMessageOperation endOperationWithError:](self, "endOperationWithError:");
  }
  else
  {
    -[CRKIDSWaitAndSendIDSMessageOperation readinessEvaluator](self, "readinessEvaluator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operationToEvaluateIDSReadiness");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKIDSWaitAndSendIDSMessageOperation setEvaluateReadinessOperation:](self, "setEvaluateReadinessOperation:", v4);

    -[CRKIDSWaitAndSendIDSMessageOperation evaluateReadinessOperation](self, "evaluateReadinessOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTarget:selector:forOperationEvents:", self, sel_evaluateReadinessOperationDidFinish_, 6);

    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKIDSWaitAndSendIDSMessageOperation evaluateReadinessOperation](self, "evaluateReadinessOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperation:", v6);

  }
}

- (void)evaluateReadinessOperationDidFinish:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CRKIDSWaitAndSendIDSMessageOperation isCanceled](self, "isCanceled"))
  {
    CATErrorWithCodeAndUserInfo();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CRKIDSWaitAndSendIDSMessageOperation sendMessage](self, "sendMessage");
      goto LABEL_7;
    }
    objc_msgSend(v7, "error");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  -[CRKIDSWaitAndSendIDSMessageOperation endOperationWithError:](self, "endOperationWithError:", v4);

LABEL_7:
}

- (void)sendMessage
{
  CRKIDSSendMessageOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRKIDSSendMessageOperation *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = [CRKIDSSendMessageOperation alloc];
  -[CRKIDSWaitAndSendIDSMessageOperation IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSWaitAndSendIDSMessageOperation message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSWaitAndSendIDSMessageOperation destinationAddress](self, "destinationAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSWaitAndSendIDSMessageOperation sourceAppleID](self, "sourceAppleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKIDSWaitAndSendIDSMessageOperation options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRKIDSSendMessageOperation initWithIDSLocalPrimitives:message:destinationAddress:sourceAppleID:options:](v3, "initWithIDSLocalPrimitives:message:destinationAddress:sourceAppleID:options:", v4, v5, v6, v7, v8);
  -[CRKIDSWaitAndSendIDSMessageOperation setSendMessageOperation:](self, "setSendMessageOperation:", v9);

  -[CRKIDSWaitAndSendIDSMessageOperation sendMessageOperation](self, "sendMessageOperation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:selector:forOperationEvents:", self, sel_sendMessageOperationDidFinish_, 6);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKIDSWaitAndSendIDSMessageOperation sendMessageOperation](self, "sendMessageOperation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

}

- (void)sendMessageOperationDidFinish:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CRKIDSWaitAndSendIDSMessageOperation isCanceled](self, "isCanceled"))
  {
    CATErrorWithCodeAndUserInfo();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CRKIDSWaitAndSendIDSMessageOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
      goto LABEL_7;
    }
    objc_msgSend(v7, "error");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  -[CRKIDSWaitAndSendIDSMessageOperation endOperationWithError:](self, "endOperationWithError:", v4);

LABEL_7:
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (CRKIDSReadinessEvaluating)readinessEvaluator
{
  return self->_readinessEvaluator;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (CRKIDSMessageOptions)options
{
  return self->_options;
}

- (CATOperation)evaluateReadinessOperation
{
  return self->_evaluateReadinessOperation;
}

- (void)setEvaluateReadinessOperation:(id)a3
{
  objc_storeStrong((id *)&self->_evaluateReadinessOperation, a3);
}

- (CATOperation)sendMessageOperation
{
  return self->_sendMessageOperation;
}

- (void)setSendMessageOperation:(id)a3
{
  objc_storeStrong((id *)&self->_sendMessageOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMessageOperation, 0);
  objc_storeStrong((id *)&self->_evaluateReadinessOperation, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_readinessEvaluator, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
}

@end
