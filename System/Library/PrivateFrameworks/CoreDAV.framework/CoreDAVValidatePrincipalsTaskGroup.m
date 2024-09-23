@implementation CoreDAVValidatePrincipalsTaskGroup

- (CoreDAVValidatePrincipalsTaskGroup)initWithAccountInfoProvider:(id)a3 urls:(id)a4 taskManager:(id)a5
{
  id v8;
  CoreDAVValidatePrincipalsTaskGroup *v9;
  uint64_t v10;
  NSMutableSet *urlsToExamine;
  NSMutableSet *v12;
  NSMutableSet *principalURLs;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVValidatePrincipalsTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v15, sel_initWithAccountInfoProvider_taskManager_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v8);
    urlsToExamine = v9->_urlsToExamine;
    v9->_urlsToExamine = (NSMutableSet *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    principalURLs = v9->_principalURLs;
    v9->_principalURLs = v12;

  }
  return v9;
}

- (NSSet)resultPrincipalURLs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[CoreDAVValidatePrincipalsTaskGroup principalURLs](self, "principalURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)_finishWithError:(id)a3
{
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", a3, 0);
}

- (void)_fetchNextURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CoreDAVPropFindTask *v11;
  void *v12;
  CoreDAVPropFindTask *v13;
  void *v14;
  void *v15;
  CoreDAVItemParserMapping *v16;

  -[CoreDAVValidatePrincipalsTaskGroup urlsToExamine](self, "urlsToExamine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v16 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("principal-URL"), objc_opt_class());
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVValidatePrincipalsTaskGroup urlsToExamine](self, "urlsToExamine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVValidatePrincipalsTaskGroup setUrlBeingExamined:](self, "setUrlBeingExamined:", v7);

    -[CoreDAVValidatePrincipalsTaskGroup urlBeingExamined](self, "urlBeingExamined");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CoreDAVValidatePrincipalsTaskGroup urlsToExamine](self, "urlsToExamine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVValidatePrincipalsTaskGroup urlBeingExamined](self, "urlBeingExamined");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v10);

    }
    v11 = [CoreDAVPropFindTask alloc];
    -[CoreDAVValidatePrincipalsTaskGroup urlBeingExamined](self, "urlBeingExamined");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v11, "initWithPropertiesToFind:atURL:withDepth:", v5, v12, 2);

    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask setAccountInfoProvider:](v13, "setAccountInfoProvider:", v14);

    -[CoreDAVTask setDelegate:](v13, "setDelegate:", self);
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitQueuedCoreDAVTask:", v13);

    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v13);
  }
  else
  {
    -[CoreDAVValidatePrincipalsTaskGroup _finishWithError:](self, "_finishWithError:", 0);
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
  if (v7)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[CoreDAVValidatePrincipalsTaskGroup urlBeingExamined](self, "urlBeingExamined");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v12;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_DEFAULT, "Error accessing: %@, error: %@", (uint8_t *)&v21, 0x16u);

      }
    }

    if (objc_msgSend(v7, "code") == 401)
      self->_authError = 1;
  }
  else
  {
    objc_msgSend(v6, "successfulValueForNameSpace:elementName:", CFSTR("DAV:"), CFSTR("principal-URL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "href");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "payloadAsFullURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CoreDAVValidatePrincipalsTaskGroup principalURLs](self, "principalURLs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v15);
    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = v18;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[CoreDAVValidatePrincipalsTaskGroup urlBeingExamined](self, "urlBeingExamined");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412290;
          v22 = v20;
          _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_DEFAULT, "Failed to find a principal-URL for: %@", (uint8_t *)&v21, 0xCu);

        }
      }

    }
  }
  -[CoreDAVValidatePrincipalsTaskGroup _fetchNextURL](self, "_fetchNextURL");

}

- (void)cancelTaskGroup
{
  objc_super v3;

  -[CoreDAVValidatePrincipalsTaskGroup setUrlsToExamine:](self, "setUrlsToExamine:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVValidatePrincipalsTaskGroup;
  -[CoreDAVTaskGroup cancelTaskGroup](&v3, sel_cancelTaskGroup);
}

- (NSMutableSet)urlsToExamine
{
  return self->_urlsToExamine;
}

- (void)setUrlsToExamine:(id)a3
{
  objc_storeStrong((id *)&self->_urlsToExamine, a3);
}

- (NSMutableSet)principalURLs
{
  return self->_principalURLs;
}

- (void)setPrincipalURLs:(id)a3
{
  objc_storeStrong((id *)&self->_principalURLs, a3);
}

- (NSURL)urlBeingExamined
{
  return self->_urlBeingExamined;
}

- (void)setUrlBeingExamined:(id)a3
{
  objc_storeStrong((id *)&self->_urlBeingExamined, a3);
}

- (BOOL)didReceiveAuthenticationError
{
  return self->_authError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBeingExamined, 0);
  objc_storeStrong((id *)&self->_principalURLs, 0);
  objc_storeStrong((id *)&self->_urlsToExamine, 0);
}

@end
