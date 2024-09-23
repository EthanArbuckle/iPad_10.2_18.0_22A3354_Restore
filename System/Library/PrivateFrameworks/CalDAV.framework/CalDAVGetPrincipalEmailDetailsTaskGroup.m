@implementation CalDAVGetPrincipalEmailDetailsTaskGroup

- (CalDAVGetPrincipalEmailDetailsTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  id v8;
  CalDAVGetPrincipalEmailDetailsTaskGroup *v9;
  CalDAVGetPrincipalEmailDetailsTaskGroup *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalDAVGetPrincipalEmailDetailsTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v12, sel_initWithAccountInfoProvider_taskManager_, a3, a5);
  v10 = v9;
  if (v9)
    -[CalDAVGetPrincipalEmailDetailsTaskGroup setPrincipalURL:](v9, "setPrincipalURL:", v8);

  return v10;
}

- (void)startTaskGroup
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__CalDAVGetPrincipalEmailDetailsTaskGroup_startTaskGroup__block_invoke;
  v15[3] = &unk_24C1FB5C0;
  v16 = v3;
  v4 = v3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD12C84](v15);
  v6 = objc_opt_class();
  v5[2](v5, 3, v6);
  v7 = objc_opt_class();
  v5[2](v5, 6, v7);
  v8 = objc_opt_class();
  v5[2](v5, 4, v8);
  v9 = objc_alloc(MEMORY[0x24BE1ABA0]);
  -[CalDAVGetPrincipalEmailDetailsTaskGroup principalURL](self, "principalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithPropertiesToFind:atURL:withDepth:", v4, v10, 2);

  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountInfoProvider:", v13);

  objc_msgSend(v11, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitQueuedCoreDAVTask:", v11);

}

void __57__CalDAVGetPrincipalEmailDetailsTaskGroup_startTaskGroup__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  +[CalDAVPrincipalSearchSupport namespaceForWellKnownType:](CalDAVPrincipalSearchSupport, "namespaceForWellKnownType:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[CalDAVPrincipalSearchSupport nameForWellKnownType:](CalDAVPrincipalSearchSupport, "nameForWellKnownType:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB20]), "initWithNameSpace:name:parseClass:", v8, v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (void)_finishWithError:(id)a3
{
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", a3, 0);
}

- (void)_processPropFind:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "multiStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[CalDAVPrincipalEmailDetailsResult resultFromResponseItem:](CalDAVPrincipalEmailDetailsResult, "resultFromResponseItem:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetPrincipalEmailDetailsTaskGroup setPrincipalResult:](self, "setPrincipalResult:", v6);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v10, "getTotalFailureError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      -[CalDAVGetPrincipalEmailDetailsTaskGroup _processPropFind:](self, "_processPropFind:", v10);
  }
  -[CalDAVGetPrincipalEmailDetailsTaskGroup _finishWithError:](self, "_finishWithError:", v8);
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v10);

}

- (NSSet)addresses
{
  void *v2;
  void *v3;

  -[CalDAVGetPrincipalEmailDetailsTaskGroup principalResult](self, "principalResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[CalDAVGetPrincipalEmailDetailsTaskGroup principalResult](self, "principalResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
  objc_storeStrong((id *)&self->_principalURL, a3);
}

- (CalDAVPrincipalEmailDetailsResult)principalResult
{
  return self->_principalResult;
}

- (void)setPrincipalResult:(id)a3
{
  objc_storeStrong((id *)&self->_principalResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalResult, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
}

@end
