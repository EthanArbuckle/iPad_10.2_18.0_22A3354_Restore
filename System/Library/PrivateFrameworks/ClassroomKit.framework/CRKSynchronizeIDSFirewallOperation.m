@implementation CRKSynchronizeIDSFirewallOperation

- (CRKSynchronizeIDSFirewallOperation)initWithIDSPrimitives:(id)a3 localStorage:(id)a4 trustedRosterAppleIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKSynchronizeIDSFirewallOperation *v12;
  CRKSynchronizeIDSFirewallOperation *v13;
  uint64_t v14;
  NSSet *trustedRosterAppleIDs;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKSynchronizeIDSFirewallOperation;
  v12 = -[CRKSynchronizeIDSFirewallOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v13->_localStorage, a4);
    v14 = objc_msgSend(v11, "copy");
    trustedRosterAppleIDs = v13->_trustedRosterAppleIDs;
    v13->_trustedRosterAppleIDs = (NSSet *)v14;

  }
  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CRKSynchronizeIDSFirewallOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __42__CRKSynchronizeIDSFirewallOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKSynchronizeIDSFirewallOperation;
  -[CRKSynchronizeIDSFirewallOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CRKSynchronizeIDSFirewallOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__CRKSynchronizeIDSFirewallOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchAllowedAppleIDsOperation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "addAllowedAppleIDsOperation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "removeAllowedAppleIDsOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    v5 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v6);

  }
}

- (void)run
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 81, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (-[CRKSynchronizeIDSFirewallOperation isExecuting](self, "isExecuting"))
  {
    -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allowedAppleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[CRKSynchronizeIDSFirewallOperation computeChanges](self, "computeChanges");
    else
      -[CRKSynchronizeIDSFirewallOperation fetchAllowedAppleIDs](self, "fetchAllowedAppleIDs");
  }
}

- (void)fetchAllowedAppleIDs
{
  void *v3;
  id v4;

  -[CRKSynchronizeIDSFirewallOperation operationToFetchAllowedAppleIDs](self, "operationToFetchAllowedAppleIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKSynchronizeIDSFirewallOperation setFetchAllowedAppleIDsOperation:](self, "setFetchAllowedAppleIDsOperation:", v4);
  objc_msgSend(v4, "addTarget:selector:forOperationEvents:", self, sel_operationToFetchAppleIDsDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (void)operationToFetchAppleIDsDidFinish:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = -[CRKSynchronizeIDSFirewallOperation isExecuting](self, "isExecuting");
  v5 = v15;
  if (v4)
  {
    objc_msgSend(v15, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v15, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSynchronizeIDSFirewallOperation finishWithError:](self, "finishWithError:", v7);
    }
    else
    {
      objc_msgSend(v15, "resultObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKSynchronizeIDSFirewallOperation operationToFetchAppleIDsDidFinish:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 113, CFSTR("expected %@, got %@"), v12, v14);

      }
      -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowedAppleIDs:", v7);

      -[CRKSynchronizeIDSFirewallOperation computeChanges](self, "computeChanges");
    }

    v5 = v15;
  }

}

- (void)computeChanges
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 120, CFSTR("%@ must be called from the main thread"), v14);

  }
  -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedAppleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 121, CFSTR("Should have some locally stored AppleIDs"));

  }
  -[CRKSynchronizeIDSFirewallOperation trustedRosterAppleIDs](self, "trustedRosterAppleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v6, "mutableCopy");

  -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowedAppleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v8);

  -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allowedAppleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[CRKSynchronizeIDSFirewallOperation trustedRosterAppleIDs](self, "trustedRosterAppleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  -[CRKSynchronizeIDSFirewallOperation setAppleIDsToAdd:](self, "setAppleIDsToAdd:", v16);
  -[CRKSynchronizeIDSFirewallOperation setAppleIDsToRemove:](self, "setAppleIDsToRemove:", v11);
  -[CRKSynchronizeIDSFirewallOperation addAllowedAppleIDs](self, "addAllowedAppleIDs");

}

- (void)addAllowedAppleIDs
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CRKSynchronizeIDSFirewallOperation appleIDsToAdd](self, "appleIDsToAdd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 136, CFSTR("Should have computed a set of Apple Accounts to add"));

  }
  -[CRKSynchronizeIDSFirewallOperation appleIDsToAdd](self, "appleIDsToAdd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSynchronizeIDSFirewallOperation operationToAddAllowedAppleIDs:](self, "operationToAddAllowedAppleIDs:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CRKSynchronizeIDSFirewallOperation setAddAllowedAppleIDsOperation:](self, "setAddAllowedAppleIDsOperation:", v8);
  objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, sel_operationToAddAllowedAppleIDsDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v8);

}

- (void)operationToAddAllowedAppleIDsDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CRKSynchronizeIDSFirewallOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v6, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v6, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKSynchronizeIDSFirewallOperation finishWithError:](self, "finishWithError:", v5);

    }
    else
    {
      -[CRKSynchronizeIDSFirewallOperation removeAllowedAppleIDs](self, "removeAllowedAppleIDs");
    }
  }

}

- (void)removeAllowedAppleIDs
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CRKSynchronizeIDSFirewallOperation appleIDsToRemove](self, "appleIDsToRemove");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 158, CFSTR("Should have computed a set of Apple Accounts to remove"));

  }
  -[CRKSynchronizeIDSFirewallOperation appleIDsToRemove](self, "appleIDsToRemove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKSynchronizeIDSFirewallOperation operationToRemoveAllowedAppleIDs:](self, "operationToRemoveAllowedAppleIDs:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CRKSynchronizeIDSFirewallOperation setRemoveAllowedAppleIDsOperation:](self, "setRemoveAllowedAppleIDsOperation:", v8);
  objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, sel_operationToRemoveAllowedAppleIDsDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v8);

}

- (void)operationToRemoveAllowedAppleIDsDidFinish:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CRKSynchronizeIDSFirewallOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v5, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKSynchronizeIDSFirewallOperation finishWithError:](self, "finishWithError:", v4);

  }
}

- (void)finishWithError:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSynchronizeIDSFirewallOperation.m"), 175, CFSTR("%@ must be called from the main thread"), v9);

  }
  if (v10)
  {
    -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowedAppleIDs:", 0);

    -[CRKSynchronizeIDSFirewallOperation endOperationWithError:](self, "endOperationWithError:", v10);
  }
  else
  {
    -[CRKSynchronizeIDSFirewallOperation trustedRosterAppleIDs](self, "trustedRosterAppleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKSynchronizeIDSFirewallOperation localStorage](self, "localStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowedAppleIDs:", v6);

    -[CRKSynchronizeIDSFirewallOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }

}

- (id)operationToFetchAllowedAppleIDs
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[CRKSynchronizeIDSFirewallOperation IDSPrimitives](self, "IDSPrimitives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke;
  v6[3] = &unk_24D9C7070;
  v7 = v2;
  v3 = v2;
  +[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke_2;
  v10[3] = &unk_24D9C7048;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "fetchFirewallAllowedAppleIDs:", v10);

}

uint64_t __69__CRKSynchronizeIDSFirewallOperation_operationToFetchAllowedAppleIDs__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)operationToAddAllowedAppleIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[CRKSynchronizeIDSFirewallOperation IDSPrimitives](self, "IDSPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke;
  v10[3] = &unk_24D9C70C0;
  v11 = v4;
  v12 = v5;
  v6 = v5;
  v7 = v4;
  +[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _CRKLogASM_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "crk_stableDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Adding %{public}@ to IDS firewall.", buf, 0xCu);

    }
    v11 = a1 + 32;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v11 + 8);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke_27;
    v12[3] = &unk_24D9C7098;
    v13 = v6;
    v14 = v5;
    objc_msgSend(v10, "addAllowedAppleIDsToFirewall:completion:", v9, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

uint64_t __68__CRKSynchronizeIDSFirewallOperation_operationToAddAllowedAppleIDs___block_invoke_27(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)operationToRemoveAllowedAppleIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[CRKSynchronizeIDSFirewallOperation IDSPrimitives](self, "IDSPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke;
  v10[3] = &unk_24D9C70C0;
  v11 = v4;
  v12 = v5;
  v6 = v5;
  v7 = v4;
  +[CRKBlockOperation blockOperationWithBlock:](CRKBlockOperation, "blockOperationWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _CRKLogASM_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "crk_stableDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Removing %{public}@ from IDS firewall.", buf, 0xCu);

    }
    v11 = a1 + 32;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v11 + 8);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke_29;
    v12[3] = &unk_24D9C7098;
    v13 = v6;
    v14 = v5;
    objc_msgSend(v10, "removeAllowedAppleIDsFromFirewall:completion:", v9, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

uint64_t __71__CRKSynchronizeIDSFirewallOperation_operationToRemoveAllowedAppleIDs___block_invoke_29(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (CRKIDSLocalFirewallStorage)localStorage
{
  return self->_localStorage;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (NSSet)trustedRosterAppleIDs
{
  return self->_trustedRosterAppleIDs;
}

- (NSSet)appleIDsToAdd
{
  return self->_appleIDsToAdd;
}

- (void)setAppleIDsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSSet)appleIDsToRemove
{
  return self->_appleIDsToRemove;
}

- (void)setAppleIDsToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (CATOperation)fetchAllowedAppleIDsOperation
{
  return self->_fetchAllowedAppleIDsOperation;
}

- (void)setFetchAllowedAppleIDsOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchAllowedAppleIDsOperation, a3);
}

- (CATOperation)addAllowedAppleIDsOperation
{
  return self->_addAllowedAppleIDsOperation;
}

- (void)setAddAllowedAppleIDsOperation:(id)a3
{
  objc_storeStrong((id *)&self->_addAllowedAppleIDsOperation, a3);
}

- (CATOperation)removeAllowedAppleIDsOperation
{
  return self->_removeAllowedAppleIDsOperation;
}

- (void)setRemoveAllowedAppleIDsOperation:(id)a3
{
  objc_storeStrong((id *)&self->_removeAllowedAppleIDsOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeAllowedAppleIDsOperation, 0);
  objc_storeStrong((id *)&self->_addAllowedAppleIDsOperation, 0);
  objc_storeStrong((id *)&self->_fetchAllowedAppleIDsOperation, 0);
  objc_storeStrong((id *)&self->_appleIDsToRemove, 0);
  objc_storeStrong((id *)&self->_appleIDsToAdd, 0);
  objc_storeStrong((id *)&self->_trustedRosterAppleIDs, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end
