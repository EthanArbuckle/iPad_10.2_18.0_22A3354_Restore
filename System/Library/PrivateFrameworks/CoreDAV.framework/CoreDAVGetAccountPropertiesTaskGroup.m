@implementation CoreDAVGetAccountPropertiesTaskGroup

- (CoreDAVGetAccountPropertiesTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  CoreDAVGetAccountPropertiesTaskGroup *v4;
  NSMutableSet *v5;
  NSMutableSet *redirectHistory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CoreDAVGetAccountPropertiesTaskGroup;
  v4 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v8, sel_initWithAccountInfoProvider_taskManager_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    redirectHistory = v4->_redirectHistory;
    v4->_redirectHistory = v5;

    v4->_fetchPrincipalSearchProperties = 0;
  }
  return v4;
}

- (NSString)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("CoreDAVGetAccountPropertiesTaskGroup:"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tPrincipal url: %@"), self->_principalURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDisplay name: %@"), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tResource ID: %@"), self->_resourceID);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tEmail addresses: %@"), self->_emailAddresses);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tCollections: %@"), self->_collections);
  return (NSString *)v3;
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4;
  CoreDAVGetAccountPropertiesTaskGroup *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = self;
  -[CoreDAVTaskGroup delegate](v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAccountPropertiesTask:completedWithError:", v5, v4);
  v7.receiver = v5;
  v7.super_class = (Class)CoreDAVGetAccountPropertiesTaskGroup;
  -[CoreDAVTaskGroup taskGroupWillCancelWithError:](&v7, sel_taskGroupWillCancelWithError_, v4);

}

- (id)_copyAccountPropertiesPropFindElements
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("principal-URL"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("displayname"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("resource-id"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address-set"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("principal-collection-set"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("supported-report-set"), objc_opt_class());
  return v2;
}

- (void)startTaskGroup
{
  CoreDAVPropFindTask *v3;
  id WeakRetained;
  void *v5;
  CoreDAVPropFindTask *v6;
  id v7;
  id v8;
  id v9;

  v9 = -[CoreDAVGetAccountPropertiesTaskGroup _copyAccountPropertiesPropFindElements](self, "_copyAccountPropertiesPropFindElements");
  v3 = [CoreDAVPropFindTask alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(WeakRetained, "principalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v3, "initWithPropertiesToFind:atURL:withDepth:", v9, v5, 2);

  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v6);
  -[CoreDAVTask setDelegate:](v6, "setDelegate:", self);
  v7 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVTask setAccountInfoProvider:](v6, "setAccountInfoProvider:", v7);

  -[CoreDAVTask setTimeoutInterval:](v6, "setTimeoutInterval:", self->super._timeoutInterval);
  v8 = objc_loadWeakRetained((id *)&self->super._taskManager);
  objc_msgSend(v8, "submitQueuedCoreDAVTask:", v6);

}

- (void)_setPropertiesFromParsedResponses:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *principalURL;
  void *v10;
  NSString *v11;
  NSString *displayName;
  void *v13;
  void *v14;
  NSURL *v15;
  NSURL *resourceID;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id obj;
  void *v34;
  uint64_t v35;
  CoreDAVGetAccountPropertiesTaskGroup *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = a3;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v45;
    v36 = self;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(obj);
        v39 = v4;
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v4), "successfulPropertiesToValues");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("principal-URL"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "href");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "payloadAsFullURL");
        v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
        principalURL = self->_principalURL;
        self->_principalURL = v8;

        objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("displayname"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "payloadAsString");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        displayName = self->_displayName;
        self->_displayName = v11;

        objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("resource-id"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "href");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "payloadAsFullURL");
        v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
        resourceID = self->_resourceID;
        self->_resourceID = v15;

        objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address-set"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v17, "emailAddresses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v41 != v22)
                objc_enumerationMutation(v18);
              v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              if (!v21)
              {
                v25 = objc_alloc(MEMORY[0x24BDBCEF0]);
                objc_msgSend(v17, "emailAddresses");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

              }
              objc_msgSend(v24, "payloadAsString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v27);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v20);
        }
        else
        {
          v21 = 0;
        }

        self = v36;
        objc_storeStrong((id *)&v36->_emailAddresses, v21);
        objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("principal-collection-set"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28
          && (objc_msgSend(v28, "hrefs"), v38 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v38, "count")))
        {
          objc_msgSend(v29, "hrefsAsFullURLs");
          v30 = 1;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v34;
        }
        else
        {
          v30 = 0;
          v31 = 0;
        }
        objc_storeStrong((id *)&v36->_collections, v31);
        if (v30)

        if (v29)
        objc_msgSend(v5, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("supported-report-set"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36->_isExpandPropertyReportSupported = objc_msgSend(v32, "supportsReportWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("expand-property"));

        v4 = v39 + 1;
      }
      while (v39 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v37);
  }

}

- (void)_taskCompleted:(id)a3 withError:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a4;
  if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__CoreDAVGetAccountPropertiesTaskGroup__taskCompleted_withError___block_invoke;
    v6[3] = &unk_24C1D9AB8;
    v6[4] = self;
    v7 = v5;
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v7, v6);

  }
}

void __65__CoreDAVGetAccountPropertiesTaskGroup__taskCompleted_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAccountPropertiesTask:completedWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)forceOptionsRequest
{
  return 0;
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  CoreDAVHeadTask *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v9;
    _os_log_impl(&dword_209602000, v13, OS_LOG_TYPE_INFO, "Responses are: %@", buf, 0xCu);
  }

  if (!v10)
  {
    v46 = v9;
    -[CoreDAVGetAccountPropertiesTaskGroup _setPropertiesFromParsedResponses:](self, "_setPropertiesFromParsedResponses:", v9);
    -[CoreDAVGetAccountPropertiesTaskGroup homeSet](self, "homeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CDVServerURL");
    v19 = (CoreDAVHeadTask *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "CDVServerURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v20;
    if ((-[CoreDAVHeadTask isEqual:](v19, "isEqual:", v20) & 1) != 0
      || -[CoreDAVGetAccountPropertiesTaskGroup shouldIgnoreHomeSetOnDifferentHost](self, "shouldIgnoreHomeSetOnDifferentHost"))
    {
      goto LABEL_33;
    }
    objc_msgSend(v20, "scheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVHeadTask scheme](v19, "scheme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", v22))
    {

    }
    else
    {
      objc_msgSend(v20, "scheme");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v28, "isEqualToString:", CFSTR("https"));

      v20 = v47;
      if (!v45)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v40, "logHandleForAccountInfoProvider:", v41);
        v42 = objc_claimAutoreleasedReturnValue();

        if (v42 && os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v47;
          _os_log_impl(&dword_209602000, v42, OS_LOG_TYPE_DEFAULT, "Ignoring host change to: %@ because it sends it to an insecure URL.", buf, 0xCu);
        }

LABEL_32:
LABEL_33:
        objc_msgSend(v8, "responseHeaders");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CoreDAVGetAccountPropertiesTaskGroup forceOptionsRequest](self, "forceOptionsRequest")
          || (objc_msgSend(v43, "CDVObjectForKeyCaseInsensitive:", CFSTR("DAV")),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              v44,
              !v44))
        {
          if (-[CoreDAVGetAccountPropertiesTaskGroup forceOptionsRequest](self, "forceOptionsRequest")
            || -[CoreDAVGetAccountPropertiesTaskGroup fetchPrincipalSearchProperties](self, "fetchPrincipalSearchProperties"))
          {
            -[CoreDAVGetAccountPropertiesTaskGroup coaxServerForPrincipalHeaders](self, "coaxServerForPrincipalHeaders");
          }
        }
        else
        {
          -[CoreDAVGetAccountPropertiesTaskGroup processPrincipalHeaders:](self, "processPrincipalHeaders:", v43);
        }

        v9 = v46;
        goto LABEL_40;
      }
    }
    objc_msgSend(v20, "host");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVHeadTask host](v19, "host");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToString:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_33;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v32, "logHandleForAccountInfoProvider:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = v34;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        -[CoreDAVHeadTask host](v19, "host");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "host");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v36;
        v50 = 2112;
        v51 = v37;
        _os_log_impl(&dword_209602000, v35, OS_LOG_TYPE_DEFAULT, "HomeSet is in another castle.  Was %@, is now %@", buf, 0x16u);

      }
    }

    objc_msgSend(v8, "accountInfoProvider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_respondsToSelector();

    if ((v39 & 1) == 0)
      goto LABEL_33;
    objc_msgSend(v8, "accountInfoProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "noteHomeSetOnDifferentHost:", v47);
    goto LABEL_32;
  }
  objc_msgSend(v10, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
    v15 = objc_msgSend(v10, "code") == 405;
  else
    v15 = 0;

  objc_msgSend(v8, "lastRedirectURL");
  v23 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v23;
  if (v15 && v23)
  {
    if ((-[NSMutableSet containsObject:](self->_redirectHistory, "containsObject:", v23) & 1) != 0)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v19 = (CoreDAVHeadTask *)objc_claimAutoreleasedReturnValue();
      v24 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      -[CoreDAVHeadTask logHandleForAccountInfoProvider:](v19, "logHandleForAccountInfoProvider:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v17;
        _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_DEFAULT, "Received a cyclical redirect from a PROPFIND and HEAD:%@", buf, 0xCu);
      }

    }
    else
    {
      v19 = -[CoreDAVTask initWithURL:]([CoreDAVHeadTask alloc], "initWithURL:", v17);
      -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v19);
      -[CoreDAVTask setDelegate:](v19, "setDelegate:", self);
      v26 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      -[CoreDAVTask setAccountInfoProvider:](v19, "setAccountInfoProvider:", v26);

      -[CoreDAVTask setTimeoutInterval:](v19, "setTimeoutInterval:", self->super._timeoutInterval);
      v27 = objc_loadWeakRetained((id *)&self->super._taskManager);
      objc_msgSend(v27, "submitQueuedCoreDAVTask:", v19);

      -[NSMutableSet addObject:](self->_redirectHistory, "addObject:", v17);
    }
LABEL_40:

  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  -[CoreDAVGetAccountPropertiesTaskGroup _taskCompleted:withError:](self, "_taskCompleted:withError:", v8, v10);

}

- (void)coaxServerForPrincipalHeaders
{
  void *v3;
  CoreDAVOptionsTask *v4;
  void *v5;
  CoreDAVOptionsTask *v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;
  id location;

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CoreDAVOptionsTask alloc];
  objc_msgSend(v3, "principalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CoreDAVTask initWithURL:](v4, "initWithURL:", v5);

  -[CoreDAVTask setAccountInfoProvider:](v6, "setAccountInfoProvider:", v3);
  -[CoreDAVTaskGroup timeoutInterval](self, "timeoutInterval");
  -[CoreDAVTask setTimeoutInterval:](v6, "setTimeoutInterval:");
  objc_initWeak(&location, v6);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CoreDAVGetAccountPropertiesTaskGroup_coaxServerForPrincipalHeaders__block_invoke;
  v8[3] = &unk_24C1D9A90;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[CoreDAVTask setCompletionBlock:](v6, "setCompletionBlock:", v8);
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
  objc_msgSend(WeakRetained, "submitQueuedCoreDAVTask:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __69__CoreDAVGetAccountPropertiesTaskGroup_coaxServerForPrincipalHeaders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "responseHeaders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processPrincipalHeaders:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", v7);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_taskCompleted:withError:", v7, v6);

    WeakRetained = v7;
  }

}

- (void)processPrincipalHeaders:(id)a3
{
  void *v4;
  uint64_t v5;
  CoreDAVPrincipalSearchPropertySetTask *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  CoreDAVPrincipalSearchPropertySetTask *v11;

  if (-[CoreDAVGetAccountPropertiesTaskGroup fetchPrincipalSearchProperties](self, "fetchPrincipalSearchProperties", a3))
  {
    -[CoreDAVGetAccountPropertiesTaskGroup collections](self, "collections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = [CoreDAVPrincipalSearchPropertySetTask alloc];
      -[CoreDAVGetAccountPropertiesTaskGroup collections](self, "collections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CoreDAVPrincipalSearchPropertySetTask initWithURL:](v6, "initWithURL:", v8);

      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      -[CoreDAVTask setAccountInfoProvider:](v11, "setAccountInfoProvider:", WeakRetained);

      -[CoreDAVTask setTimeoutInterval:](v11, "setTimeoutInterval:", self->super._timeoutInterval);
      -[CoreDAVTask setDelegate:](v11, "setDelegate:", self);
      -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v11);
      v10 = objc_loadWeakRetained((id *)&self->super._taskManager);
      objc_msgSend(v10, "submitQueuedCoreDAVTask:", v11);

    }
  }
}

- (void)searchPropertySetTask:(id)a3 completetWithPropertySearchSet:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v12, "logHandleForAccountInfoProvider:", WeakRetained);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v9;
    _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_INFO, "PrincipalSearchProperties are: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_storeStrong((id *)&self->_principalSearchProperties, a4);
  if (v10)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v15, "logHandleForAccountInfoProvider:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_209602000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring error looking up PrincipalSearchPropertySet", (uint8_t *)&v18, 2u);
    }

  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v11);
  -[CoreDAVGetAccountPropertiesTaskGroup _taskCompleted:withError:](self, "_taskCompleted:withError:", v11, 0);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  CoreDAVPropFindTask *v8;
  void *v9;
  CoreDAVPropFindTask *v10;
  id WeakRetained;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[CoreDAVGetAccountPropertiesTaskGroup _copyAccountPropertiesPropFindElements](self, "_copyAccountPropertiesPropFindElements");
    v8 = [CoreDAVPropFindTask alloc];
    objc_msgSend(v13, "lastRedirectURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v8, "initWithPropertiesToFind:atURL:withDepth:", v7, v9, 2);

    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVTask setAccountInfoProvider:](v10, "setAccountInfoProvider:", WeakRetained);

    -[CoreDAVTask setTimeoutInterval:](v10, "setTimeoutInterval:", self->super._timeoutInterval);
    -[CoreDAVTask setDelegate:](v10, "setDelegate:", self);
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v10);
    v12 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v12, "submitQueuedCoreDAVTask:", v10);

    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v13);
    -[CoreDAVGetAccountPropertiesTaskGroup _taskCompleted:withError:](self, "_taskCompleted:withError:", v13, v6);

  }
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)resourceID
{
  return self->_resourceID;
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (NSSet)collections
{
  return self->_collections;
}

- (BOOL)isExpandPropertyReportSupported
{
  return self->_isExpandPropertyReportSupported;
}

- (BOOL)fetchPrincipalSearchProperties
{
  return self->_fetchPrincipalSearchProperties;
}

- (void)setFetchPrincipalSearchProperties:(BOOL)a3
{
  self->_fetchPrincipalSearchProperties = a3;
}

- (NSSet)principalSearchProperties
{
  return self->_principalSearchProperties;
}

- (BOOL)shouldIgnoreHomeSetOnDifferentHost
{
  return self->_shouldIgnoreHomeSetOnDifferentHost;
}

- (void)setShouldIgnoreHomeSetOnDifferentHost:(BOOL)a3
{
  self->_shouldIgnoreHomeSetOnDifferentHost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectHistory, 0);
  objc_storeStrong((id *)&self->_principalSearchProperties, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
}

@end
