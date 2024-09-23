@implementation CATRemoteTaskOperation

+ (id)invalidRemoteTaskWithRequest:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  CATRemoteTaskOperation *v7;
  CATRemoteTaskOperation *v8;
  CATRemoteTaskOperation *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = [CATRemoteTaskOperation alloc];
  v8 = v7;
  if (v6)
  {
    v9 = -[CATRemoteTaskOperation initWithRequest:clientError:](v7, "initWithRequest:clientError:", v5, v6);
  }
  else
  {
    CATErrorWithCodeAndUserInfo(501, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CATRemoteTaskOperation initWithRequest:clientError:](v8, "initWithRequest:clientError:", v5, v10);

  }
  return v9;
}

- (CATRemoteTaskOperation)initWithRequest:(id)a3 client:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CATRemoteTaskOperation *v10;
  CATRemoteTaskOperation *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTaskOperation.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTaskOperation.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CATRemoteTaskOperation;
  v10 = -[CATTaskOperation initWithRequest:](&v15, sel_initWithRequest_, v7);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_client, a4);

  return v11;
}

- (CATRemoteTaskOperation)initWithRequest:(id)a3 clientError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CATRemoteTaskOperation *v10;
  CATRemoteTaskOperation *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTaskOperation.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTaskOperation.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CATRemoteTaskOperation;
  v10 = -[CATTaskOperation initWithRequest:](&v15, sel_initWithRequest_, v7);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->mClientError, a4);

  return v11;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (BOOL)isCancelable
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
  v7.super_class = (Class)CATRemoteTaskOperation;
  -[CATRemoteTaskOperation cancel](&v7, sel_cancel);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__CATRemoteTaskOperation_cancel__block_invoke;
  v6[3] = &unk_24C1C5A60;
  v6[4] = self;
  v4 = v6;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_24C1C5998;
  v9 = v4;
  dispatch_async(v5, block);

}

uint64_t __32__CATRemoteTaskOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelOperationIfNeeded");
}

- (void)cancelOperationIfNeeded
{
  NSObject *v3;
  CATTaskMessageCancel *v4;
  void *v5;
  void *v6;
  CATTaskMessageCancel *v7;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (-[CATOperation isExecuting](self, "isExecuting"))
  {
    v4 = [CATTaskMessageCancel alloc];
    -[CATOperation UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CATTaskMessage initWithTaskUUID:](v4, "initWithTaskUUID:", v5);

    -[CATRemoteTaskOperation client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTaskOperation:preparedMessage:", self, v7);

  }
}

- (void)operationWillFinish
{
  CATTaskClient *client;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CATRemoteTaskOperation;
  -[CATOperation operationWillFinish](&v4, sel_operationWillFinish);
  client = self->_client;
  self->_client = 0;

}

- (void)main
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;

  -[CATTaskOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTaskOperation.m"), 109, CFSTR("Request must set before the remote task operation can be run"));

  }
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__CATRemoteTaskOperation_main__block_invoke;
  v9[3] = &unk_24C1C5A60;
  v9[4] = self;
  v6 = v9;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_24C1C5998;
  v11 = v6;
  dispatch_async(v7, block);

}

void __30__CATRemoteTaskOperation_main__block_invoke(uint64_t a1)
{
  CATTaskMessageStart *v2;
  void *v3;
  void *v4;
  CATTaskMessageStart *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 400))
    {
      v10.receiver = *(id *)(a1 + 32);
      v10.super_class = (Class)CATRemoteTaskOperation;
      objc_msgSendSuper2(&v10, sel_endOperationWithError_);
    }
    else
    {
      v2 = [CATTaskMessageStart alloc];
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CATTaskMessageStart initWithTaskUUID:request:](v2, "initWithTaskUUID:request:", v3, v4);

      objc_msgSend(*(id *)(a1 + 32), "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteTaskOperation:preparedMessage:", *(_QWORD *)(a1 + 32), v5);

      if (!v5)
      {
        v7 = *(void **)(a1 + 32);
        CATErrorWithCodeAndUserInfo(402, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9.receiver = v7;
        v9.super_class = (Class)CATRemoteTaskOperation;
        objc_msgSendSuper2(&v9, sel_endOperationWithError_, v8);

      }
    }
  }
}

- (void)processNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (-[CATTaskOperation canSendNotificationWithName:userInfo:](self, "canSendNotificationWithName:userInfo:", v6, v7))
  {
    -[CATTaskOperation notificationDelegate](self, "notificationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_5:

      goto LABEL_10;
    }
    v9 = -[CATTaskOperation canSendNotificationWithName:userInfo:](self, "canSendNotificationWithName:userInfo:", v6, v7);

    if (v9)
    {
      -[CATTaskOperation notificationDelegate](self, "notificationDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "taskOperation:didPostNotificationWithName:userInfo:", self, v6, v7);
      goto LABEL_5;
    }
  }
  else
  {
    if (_CATLogGeneral_onceToken_6 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_6, &__block_literal_global_10);
    v10 = _CATLogGeneral_logObj_6;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_6, OS_LOG_TYPE_ERROR))
      -[CATRemoteTaskOperation processNotificationWithName:userInfo:].cold.1((uint64_t)self, (uint64_t)v6, v10);
  }
LABEL_10:

}

- (void)fetchProgress
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
  v5[2] = __39__CATRemoteTaskOperation_fetchProgress__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

void __39__CATRemoteTaskOperation_fetchProgress__block_invoke(uint64_t a1)
{
  CATTaskMessageFetchProgress *v2;
  void *v3;
  void *v4;
  CATTaskMessageFetchProgress *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = [CATTaskMessageFetchProgress alloc];
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CATTaskMessage initWithTaskUUID:](v2, "initWithTaskUUID:", v3);

    objc_msgSend(*(id *)(a1 + 32), "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteTaskOperation:preparedMessage:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__CATRemoteTaskOperation_postNotificationWithName_userInfo___block_invoke;
  v14[3] = &unk_24C1C5A10;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v9 = v14;
  v10 = v7;
  v11 = v6;
  CATGetCatalystQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v9;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_24C1C5998;
  v18 = v13;
  dispatch_async(v12, block);

}

void __60__CATRemoteTaskOperation_postNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  CATNotificationMessage *v2;
  void *v3;
  void *v4;
  CATNotificationMessage *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = [CATNotificationMessage alloc];
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CATNotificationMessage initWithTaskUUID:name:userInfo:](v2, "initWithTaskUUID:name:userInfo:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteTaskOperation:preparedMessage:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (void)processMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "progress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATRemoteTaskOperation updateProgressWithRemoteProgress:](self, "updateProgressWithRemoteProgress:", v5);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v12;
      v7 = objc_msgSend(v6, "completedUnitCount");
      v8 = objc_msgSend(v6, "totalUnitCount");

      -[CATRemoteTaskOperation updateCompletedUnitCount:andTotalUnitCount:](self, "updateCompletedUnitCount:andTotalUnitCount:", v7, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v12;
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[CATRemoteTaskOperation processNotificationWithName:userInfo:](self, "processNotificationWithName:userInfo:", v10, v11);
      }
    }
  }

}

- (void)clientFailedWithError:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTaskOperation.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__CATRemoteTaskOperation_clientFailedWithError___block_invoke;
  v12[3] = &unk_24C1C5C00;
  v12[4] = self;
  v13 = v5;
  v7 = v12;
  v8 = v5;
  CATGetCatalystQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v7;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_6;
  block[3] = &unk_24C1C5998;
  v15 = v10;
  dispatch_async(v9, block);

}

void __48__CATRemoteTaskOperation_clientFailedWithError___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", *(_QWORD *)(a1 + 40));
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 400), *(id *)(a1 + 40));
}

- (void)updateCompletedUnitCount:(int64_t)a3 andTotalUnitCount:(int64_t)a4
{
  NSObject *v7;

  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  if (-[CATOperation totalUnitCount](self, "totalUnitCount") != a4)
    -[CATOperation setTotalUnitCount:](self, "setTotalUnitCount:", a4);
  if (-[CATOperation completedUnitCount](self, "completedUnitCount") != a3)
    -[CATOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", a3);
}

- (void)updateProgressWithRemoteProgress:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATOperation isExecuting](self, "isExecuting"))
  {
    -[CATRemoteTaskOperation remotePhase](self, "remotePhase");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          v7 = objc_msgSend(v14, "phase"),
          -[CATRemoteTaskOperation remotePhase](self, "remotePhase"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "unsignedIntegerValue"),
          v8,
          v6,
          v7 != v9))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "phase"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATRemoteTaskOperation setRemotePhase:](self, "setRemotePhase:", v10);

    }
    v11 = objc_msgSend(v14, "completedUnitCount");
    if (v11 != -[CATOperation completedUnitCount](self, "completedUnitCount"))
      -[CATOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v14, "completedUnitCount"));
    v12 = objc_msgSend(v14, "totalUnitCount");
    if (v12 != -[CATOperation totalUnitCount](self, "totalUnitCount"))
      -[CATOperation setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v14, "totalUnitCount"));
    if (objc_msgSend(v14, "state") == 1)
    {
      objc_msgSend(v14, "resultObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v13);
LABEL_13:

      goto LABEL_14;
    }
    if (objc_msgSend(v14, "state") == 2)
    {
      objc_msgSend(v14, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperation endOperationWithError:](self, "endOperationWithError:", v13);
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (CATTaskClient)client
{
  return self->_client;
}

- (NSNumber)remotePhase
{
  return self->_remotePhase;
}

- (void)setRemotePhase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePhase, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->mClientError, 0);
}

- (void)processNotificationWithName:(os_log_t)log userInfo:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_209592000, log, OS_LOG_TYPE_ERROR, "%@ dropping notification '%@', either the client didn't expect it, or it wasn't allowlisted", (uint8_t *)&v3, 0x16u);
}

@end
