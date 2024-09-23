@implementation CoreDAVContainerInfoSyncTaskGroup

- (CoreDAVContainerInfoSyncTaskGroup)initWithContainerURL:(id)a3 previousSyncToken:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6
{
  id v11;
  id v12;
  CoreDAVContainerInfoSyncTaskGroup *v13;
  CoreDAVContainerInfoSyncTaskGroup *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVContainerInfoSyncTaskGroup;
  v13 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v16, sel_initWithAccountInfoProvider_taskManager_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_previousSyncToken, a4);
    objc_storeStrong((id *)&v14->_containerURL, a3);
  }

  return v14;
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreDAVContainerInfoSyncTaskGroup;
  -[CoreDAVTaskGroup setDelegate:](&v3, sel_setDelegate_, a3);
}

- (CoreDAVContainerInfoSyncProvider)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreDAVContainerInfoSyncTaskGroup;
  -[CoreDAVTaskGroup delegate](&v3, sel_delegate);
  return (CoreDAVContainerInfoSyncProvider *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: URL %@"), v5, self, self->_containerURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)startTaskGroup
{
  id v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  NSURL *containerURL;
  CoreDAVSyncReportTask *v8;
  id v9;
  id v10;
  int v11;
  NSURL *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[CoreDAVContainerInfoSyncTaskGroup copyContainerParserMappings](self, "copyContainerParserMappings");
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    containerURL = self->_containerURL;
    v11 = 138412290;
    v12 = containerURL;
    _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_INFO, "Sending out a container info sync task to %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = -[CoreDAVSyncReportTask initWithPropertiesToFind:atURL:withDepth:previousSyncToken:]([CoreDAVSyncReportTask alloc], "initWithPropertiesToFind:atURL:withDepth:previousSyncToken:", v3, self->_containerURL, 3, self->_previousSyncToken);
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v8);
  -[CoreDAVTask setDelegate:](v8, "setDelegate:", self);
  v9 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVTask setAccountInfoProvider:](v8, "setAccountInfoProvider:", v9);

  -[CoreDAVTask setTimeoutInterval:](v8, "setTimeoutInterval:", self->super._timeoutInterval);
  v10 = objc_loadWeakRetained((id *)&self->super._taskManager);
  objc_msgSend(v10, "submitQueuedCoreDAVTask:", v8);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id WeakRetained;
  NSObject *v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSString *v33;
  NSString *previousSyncToken;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id obj;
  _QWORD v40[5];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    v36 = v6;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = v6;
    objc_msgSend(v37, "multiStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "responses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    v35 = v7;
    if (v10)
    {
      v11 = v10;
      v38 = 0;
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v14, "firstHref", v35);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "payloadAsFullURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v14, "successfulPropertiesToValues");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(objc_alloc(-[CoreDAVContainerInfoSyncTaskGroup containerItemClass](self, "containerItemClass")), "initWithURL:andProperties:", v16, v17);
            if (-[NSObject isUnauthenticated](v18, "isUnauthenticated"))
            {
              +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              objc_msgSend(v19, "logHandleForAccountInfoProvider:", WeakRetained);
              v21 = objc_claimAutoreleasedReturnValue();

              if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_209602000, v21, OS_LOG_TYPE_DEFAULT, "Not authenticated to get Collection", buf, 2u);
              }

            }
            else
            {
              objc_msgSend(v37, "notFoundHREFs");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "containsObject:", v16);

              if ((v24 & 1) == 0)
              {
                v25 = v38;
                if (!v38)
                  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v38 = v25;
                objc_msgSend(v25, "addObject:", v18);
              }
            }
          }
          else
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v17, "logHandleForAccountInfoProvider:", v22);
            v18 = objc_claimAutoreleasedReturnValue();

            if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v14;
              _os_log_impl(&dword_209602000, v18, OS_LOG_TYPE_DEFAULT, "Could not find the first HREF's URL. Response is %@", buf, 0xCu);
            }
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v11);
    }
    else
    {
      v38 = 0;
    }

    -[CoreDAVContainerInfoSyncTaskGroup delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "notFoundHREFs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "containerInfoSyncTask:retrievedAddedOrModifiedContainers:removedContainerURLs:", self, v38, v28);

    if (objc_msgSend(v37, "moreToSync"))
    {
      objc_msgSend(v37, "nextSyncToken");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v30, "logHandleForAccountInfoProvider:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209602000, v32, OS_LOG_TYPE_INFO, "Server told us there was more container info data to fetch, so syncing again", buf, 2u);
        }

        objc_msgSend(v37, "nextSyncToken");
        v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        previousSyncToken = self->_previousSyncToken;
        self->_previousSyncToken = v33;
      }
      else
      {
        if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209602000, v32, OS_LOG_TYPE_DEFAULT, "Was told to sync more items, but got no new sync token.  Starting from scratch", buf, 2u);
        }

        previousSyncToken = self->_previousSyncToken;
        self->_previousSyncToken = 0;
      }

      -[CoreDAVContainerInfoSyncTaskGroup startTaskGroup](self, "startTaskGroup");
      v7 = v35;
      v6 = v36;
    }
    else
    {
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __61__CoreDAVContainerInfoSyncTaskGroup_task_didFinishWithError___block_invoke;
      v40[3] = &unk_24C1D9AE0;
      v40[4] = self;
      v41 = v37;
      v7 = v35;
      v42 = v35;
      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v40);

      v6 = v36;
    }

  }
}

void __61__CoreDAVContainerInfoSyncTaskGroup_task_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "nextSyncToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerInfoSyncTask:completedWithNewSyncToken:error:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (Class)containerItemClass
{
  return (Class)objc_opt_class();
}

- (id)copyContainerParserMappings
{
  return +[CoreDAVContainer copyPropertyMappingsForParser](CoreDAVContainer, "copyPropertyMappingsForParser");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
}

@end
