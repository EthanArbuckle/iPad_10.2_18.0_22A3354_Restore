@implementation CalDAVGetDelegatesBaseTaskGroup

- (CalDAVGetDelegatesBaseTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  id v8;
  CalDAVGetDelegatesBaseTaskGroup *v9;
  CalDAVGetDelegatesBaseTaskGroup *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CalDAVGetDelegatesBaseTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v16, sel_initWithAccountInfoProvider_taskManager_, a3, a5);
  v10 = v9;
  if (v9)
  {
    -[CalDAVGetDelegatesBaseTaskGroup setPrincipalURL:](v9, "setPrincipalURL:", v8);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetDelegatesBaseTaskGroup setReadDetails:](v10, "setReadDetails:", v11);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetDelegatesBaseTaskGroup setWriteDetails:](v10, "setWriteDetails:", v12);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetDelegatesBaseTaskGroup setReadPrincipalURLs:](v10, "setReadPrincipalURLs:", v13);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetDelegatesBaseTaskGroup setWritePrincipalURLs:](v10, "setWritePrincipalURLs:", v14);

  }
  return v10;
}

- (id)_mappingsForPrincipalDetails
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__CalDAVGetDelegatesBaseTaskGroup__mappingsForPrincipalDetails__block_invoke;
  v10[3] = &unk_24C1FB5C0;
  v3 = v2;
  v11 = v3;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD12C84](v10);
  v5 = objc_opt_class();
  v4[2](v4, 3, v5);
  v6 = objc_opt_class();
  v4[2](v4, 6, v6);
  v7 = objc_opt_class();
  v4[2](v4, 4, v7);
  v8 = v3;

  return v8;
}

void __63__CalDAVGetDelegatesBaseTaskGroup__mappingsForPrincipalDetails__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (void)_processDetailsFromMultiStatus:(id)a3 allowWrite:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
    -[CalDAVGetDelegatesBaseTaskGroup writeDetails](self, "writeDetails");
  else
    -[CalDAVGetDelegatesBaseTaskGroup readDetails](self, "readDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "responses", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        +[CalDAVPrincipalEmailDetailsResult resultFromResponseItem:](CalDAVPrincipalEmailDetailsResult, "resultFromResponseItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addresses");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
          objc_msgSend(v7, "addObject:", v11);
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);

  }
}

- (void)_getPrincipalDetailsForURL:(id)a3
{
  id v4;
  CalDAVGetPrincipalEmailDetailsTaskGroup *v5;
  void *v6;
  void *v7;
  CalDAVGetPrincipalEmailDetailsTaskGroup *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = [CalDAVGetPrincipalEmailDetailsTaskGroup alloc];
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CalDAVGetPrincipalEmailDetailsTaskGroup initWithAccountInfoProvider:principalURL:taskManager:](v5, "initWithAccountInfoProvider:principalURL:taskManager:", v6, v4, v7);

  -[CalDAVGetDelegatesBaseTaskGroup setGetPrincipalEmailDetailsTaskGroup:](self, "setGetPrincipalEmailDetailsTaskGroup:", v8);
  -[CalDAVGetDelegatesBaseTaskGroup getPrincipalEmailDetailsTaskGroup](self, "getPrincipalEmailDetailsTaskGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[CalDAVGetDelegatesBaseTaskGroup getPrincipalEmailDetailsTaskGroup](self, "getPrincipalEmailDetailsTaskGroup");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTaskGroup");

}

- (id)_popFromArray:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLastObject");

  return v4;
}

- (void)bailWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[CalDAVGetDelegatesBaseTaskGroup getPrincipalEmailDetailsTaskGroup](self, "getPrincipalEmailDetailsTaskGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CalDAVGetDelegatesBaseTaskGroup getPrincipalEmailDetailsTaskGroup](self, "getPrincipalEmailDetailsTaskGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bailWithError:", v4);

    -[CalDAVGetDelegatesBaseTaskGroup setGetPrincipalEmailDetailsTaskGroup:](self, "setGetPrincipalEmailDetailsTaskGroup:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)CalDAVGetDelegatesBaseTaskGroup;
  -[CoreDAVTaskGroup bailWithError:](&v7, sel_bailWithError_, v4);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVGetDelegatesBaseTaskGroup.m"), 113, CFSTR("Must implement task:didFinishWithError: in subclass"));

}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVGetDelegatesBaseTaskGroup.m"), 117, CFSTR("Must implement taskGroup:didFinishWithError: in subclass"));

}

- (NSSet)readOnlyPrincipalDetails
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[CalDAVGetDelegatesBaseTaskGroup readDetails](self, "readDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)readWritePrincipalDetails
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[CalDAVGetDelegatesBaseTaskGroup writeDetails](self, "writeDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)serverSupportsExpandPropertyReport
{
  return self->_serverSupportsExpandPropertyReport;
}

- (void)setServerSupportsExpandPropertyReport:(BOOL)a3
{
  self->_serverSupportsExpandPropertyReport = a3;
}

- (CalDAVGetPrincipalEmailDetailsTaskGroup)getPrincipalEmailDetailsTaskGroup
{
  return self->_getPrincipalEmailDetailsTaskGroup;
}

- (void)setGetPrincipalEmailDetailsTaskGroup:(id)a3
{
  objc_storeStrong((id *)&self->_getPrincipalEmailDetailsTaskGroup, a3);
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
  objc_storeStrong((id *)&self->_principalURL, a3);
}

- (NSMutableArray)readPrincipalURLs
{
  return self->_readPrincipalURLs;
}

- (void)setReadPrincipalURLs:(id)a3
{
  objc_storeStrong((id *)&self->_readPrincipalURLs, a3);
}

- (NSMutableArray)writePrincipalURLs
{
  return self->_writePrincipalURLs;
}

- (void)setWritePrincipalURLs:(id)a3
{
  objc_storeStrong((id *)&self->_writePrincipalURLs, a3);
}

- (NSMutableSet)writeDetails
{
  return self->_writeDetails;
}

- (void)setWriteDetails:(id)a3
{
  objc_storeStrong((id *)&self->_writeDetails, a3);
}

- (NSMutableSet)readDetails
{
  return self->_readDetails;
}

- (void)setReadDetails:(id)a3
{
  objc_storeStrong((id *)&self->_readDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readDetails, 0);
  objc_storeStrong((id *)&self->_writeDetails, 0);
  objc_storeStrong((id *)&self->_writePrincipalURLs, 0);
  objc_storeStrong((id *)&self->_readPrincipalURLs, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_getPrincipalEmailDetailsTaskGroup, 0);
}

@end
