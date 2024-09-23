@implementation CoreDAVContainerSyncTaskGroup

- (CoreDAVContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 syncItemOrder:(BOOL)a7 context:(id)a8 accountInfoProvider:(id)a9 taskManager:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  CoreDAVContainerSyncTaskGroup *v23;
  CoreDAVContainerSyncTaskGroup *v24;
  CoreDAVContainerSyncTaskGroup *v25;
  uint64_t v26;
  NSMutableArray *actions;
  NSMutableArray *v28;
  NSMutableArray *unsubmittedTasks;
  NSMutableSet *v30;
  NSMutableSet *locationChangedURLs;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v33 = a3;
  v35 = a4;
  v34 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (-[CoreDAVContainerSyncTaskGroup isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 64, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

    v23 = 0;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)CoreDAVContainerSyncTaskGroup;
    v24 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v36, sel_initWithAccountInfoProvider_taskManager_, v20, v21);
    v25 = v24;
    if (v24)
    {
      v24->_phase = 2;
      -[CoreDAVTaskGroup setContext:](v24, "setContext:", v19);
      objc_storeStrong((id *)&v25->_folderURL, a3);
      objc_storeStrong((id *)&v25->_previousCTag, a4);
      objc_storeStrong((id *)&v25->_previousSyncToken, a5);
      v26 = objc_msgSend(v18, "mutableCopy");
      actions = v25->_actions;
      v25->_actions = (NSMutableArray *)v26;

      v25->_multiGetBatchSize = 50;
      v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      unsubmittedTasks = v25->_unsubmittedTasks;
      v25->_unsubmittedTasks = v28;

      v25->_syncItemOrder = a7;
      v25->_useMultiGet = 1;
      v25->_useSyncCollection = -[NSString length](v25->_previousSyncToken, "length") != 0;
      v25->_maxIndependentTasks = 0;
      v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      locationChangedURLs = v25->_locationChangedURLs;
      v25->_locationChangedURLs = v30;

    }
    self = v25;
    v23 = self;
  }

  return v23;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: Phase %d Outstanding Tasks:\n%@"), v5, self, self->_phase, self->super._outstandingTasks);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyGetTaskWithURL:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v8 = v11;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_ERROR, "copyGetTaskWithURL: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

  return 0;
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v8 = v11;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_ERROR, "copyMultiGetTaskWithURLs: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

  return 0;
}

- (id)dataContentType
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "dataContentType to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }

  return 0;
}

- (Class)bulkChangeTaskClass
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "bulkChangeTaskClass to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }

  return 0;
}

- (id)copyAdditionalResourcePropertiesToFetch
{
  return 0;
}

- (BOOL)shouldFetchResourceWithEtag:(id)a3 propertiesToValues:(id)a4
{
  return 1;
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  os_log_type_t v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  CoreDAVContainerSyncTaskGroup *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  CoreDAVContainerSyncTaskGroup *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("CoreDAVErrorDomain")) & 1) == 0)
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 1)
  {
LABEL_6:
    v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_7;
  }
LABEL_4:
  v8 = OS_LOG_TYPE_INFO;
LABEL_7:
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11 && os_log_type_enabled(v11, v8))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_209602000, v11, v8, "Task group %@ will cancel with error %@", buf, 0x16u);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = self;
  -[CoreDAVTaskGroup delegate](v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerSyncTask:completedWithNewCTag:newSyncToken:addedOrModified:removed:error:", v12, 0, 0, 0, 0, v5);
  v14.receiver = v12;
  v14.super_class = (Class)CoreDAVContainerSyncTaskGroup;
  -[CoreDAVTaskGroup taskGroupWillCancelWithError:](&v14, sel_taskGroupWillCancelWithError_, v5);

}

- (void)_tearDownAllUnsubmittedTasks
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_unsubmittedTasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "finishEarlyWithError:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_unsubmittedTasks, "removeAllObjects");
}

- (void)bailWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CoreDAVContainerSyncTaskGroup _tearDownAllUnsubmittedTasks](self, "_tearDownAllUnsubmittedTasks");
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVContainerSyncTaskGroup;
  -[CoreDAVTaskGroup bailWithError:](&v5, sel_bailWithError_, v4);

}

- (void)cancelTaskGroup
{
  objc_super v3;

  -[CoreDAVContainerSyncTaskGroup _tearDownAllUnsubmittedTasks](self, "_tearDownAllUnsubmittedTasks");
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVContainerSyncTaskGroup;
  -[CoreDAVTaskGroup cancelTaskGroup](&v3, sel_cancelTaskGroup);
}

- (unint64_t)_submitTasks
{
  unint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSObject *v33;
  objc_class *v34;
  uint64_t v35;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  CoreDAVContainerSyncTaskGroup *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (self->super._isCancelling)
    return 0;
  v4 = 160;
  v5 = (void *)-[NSMutableArray copy](self->_unsubmittedTasks, "copy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  v7 = 0x2545A3000uLL;
  if (!v6)
  {
    v2 = 0;
    goto LABEL_22;
  }
  v8 = v6;
  v2 = 0;
  v9 = *(_QWORD *)v40;
  do
  {
    v10 = 0;
    v37 = v8;
    do
    {
      if (*(_QWORD *)v40 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
      v12 = *(int *)(v7 + 3200);
      if (!*(Class *)((char *)&self->super.super.isa + v12))
      {
        -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v10));
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "removeObject:", v11);
        WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
        objc_msgSend(v11, "submitWithTaskManager:", WeakRetained);
LABEL_13:

        ++v2;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((Class)-[NSMutableSet count](self->super._outstandingTasks, "count") >= *(Class *)((char *)&self->super.super.isa
                                                                                              + v12))
          goto LABEL_22;
        -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v11);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "removeObject:", v11);
        WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
        objc_msgSend(WeakRetained, "submitIndependentCoreDAVTask:", v11);
        goto LABEL_13;
      }
      v14 = v9;
      v15 = v2;
      v16 = v4;
      v17 = v7;
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v18, "logHandleForAccountInfoProvider:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v11;
        _os_log_impl(&dword_209602000, v20, OS_LOG_TYPE_ERROR, "Can't submit anything but CoreDAVTasks independently, %@", buf, 0xCu);
      }

      v7 = v17;
      v4 = v16;
      v2 = v15;
      v9 = v14;
      v8 = v37;
LABEL_18:
      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  }
  while (v8);
LABEL_22:

  v21 = *(uint64_t *)((char *)&self->super.super.isa + *(int *)(v7 + 3200));
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v22, "logHandleForAccountInfoProvider:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (v24)
    {
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[NSMutableSet count](self->super._outstandingTasks, "count");
        v29 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "count");
        *(_DWORD *)buf = 138544386;
        v44 = v27;
        v45 = 2048;
        v46 = self;
        v47 = 2048;
        v48 = v2;
        v49 = 2048;
        v50 = v28;
        v51 = 2048;
        v52 = v29;
        v30 = "<%{public}@: %p> Submitted %lu independent tasks, %lu active, %lu waiting.";
        v31 = v25;
        v32 = 52;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (v24)
  {
    v33 = v24;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[NSMutableSet count](self->super._outstandingTasks, "count");
      *(_DWORD *)buf = 138544130;
      v44 = v27;
      v45 = 2048;
      v46 = self;
      v47 = 2048;
      v48 = v2;
      v49 = 2048;
      v50 = v35;
      v30 = "<%{public}@: %p> Submitted %lu queued tasks, %lu total tasks queued.";
      v31 = v33;
      v32 = 42;
LABEL_29:
      _os_log_impl(&dword_209602000, v31, OS_LOG_TYPE_DEBUG, v30, buf, v32);

    }
LABEL_30:

  }
  return v2;
}

- (void)_getCTag
{
  CoreDAVItemParserMapping *v4;
  CoreDAVPropFindTask *v5;
  void *v6;
  CoreDAVPropFindTask *v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  CoreDAVItemParserMapping *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  CoreDAVContainerSyncTaskGroup *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_ensureUpdatedCTag)
  {
LABEL_2:
    self->_phase = 3;
    if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 212, CFSTR("We shouldn't start grabbing the cTag if we have outstanding tasks: %@"), self);

    }
    v13 = objc_alloc_init(CoreDAVItemParserMapping);
    -[CoreDAVItemParserMapping setNameSpace:](v13, "setNameSpace:", CFSTR("http://calendarserver.org/ns/"));
    -[CoreDAVItemParserMapping setName:](v13, "setName:", CFSTR("getctag"));
    -[CoreDAVItemParserMapping setParseClass:](v13, "setParseClass:", objc_opt_class());
    v4 = objc_alloc_init(CoreDAVItemParserMapping);
    -[CoreDAVItemParserMapping setNameSpace:](v4, "setNameSpace:", CFSTR("DAV:"));
    -[CoreDAVItemParserMapping setName:](v4, "setName:", CFSTR("sync-token"));
    -[CoreDAVItemParserMapping setParseClass:](v4, "setParseClass:", objc_opt_class());
    v5 = [CoreDAVPropFindTask alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v13, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v5, "initWithPropertiesToFind:atURL:withDepth:", v6, self->_folderURL, 2);

    -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v7);
    -[CoreDAVTask setDelegate:](v7, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVTask setAccountInfoProvider:](v7, "setAccountInfoProvider:", WeakRetained);

    -[CoreDAVTask setTimeoutInterval:](v7, "setTimeoutInterval:", self->super._timeoutInterval);
    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");

    return;
  }
  if (!self->_actionsOnly)
  {
    if (self->_useSyncCollection)
    {
      -[CoreDAVContainerSyncTaskGroup _getETags](self, "_getETags");
      return;
    }
    goto LABEL_2;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v9, "logHandleForAccountInfoProvider:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_DEBUG, "%@: _actionsOnly and actions are complete, so I'm outta here", buf, 0xCu);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__CoreDAVContainerSyncTaskGroup__getCTag__block_invoke;
  v14[3] = &unk_24C1D9A40;
  v14[4] = self;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v14);
}

void __41__CoreDAVContainerSyncTaskGroup__getCTag__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerSyncTask:completedWithNewCTag:newSyncToken:addedOrModified:removed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 0, 0, 0);

}

- (id)copyPutTaskWithPayloadItem:(id)a3 forAction:(id)a4
{
  id v6;
  id v7;
  CoreDAVPutTask *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CoreDAVPutTask *v13;

  v6 = a3;
  v7 = a4;
  v8 = [CoreDAVPutTask alloc];
  objc_msgSend(v6, "dataPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainerSyncTaskGroup dataContentType](self, "dataContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "action"))
  {
    objc_msgSend(v6, "syncKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v8, "initWithDataPayload:dataContentType:atURL:previousETag:", v9, v10, v11, v12);

  }
  else
  {
    v13 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v8, "initWithDataPayload:dataContentType:atURL:previousETag:", v9, v10, v11, 0);
  }

  -[CoreDAVActionBackedTask setBackingAction:](v13, "setBackingAction:", v7);
  -[CoreDAVTask setIgnoresGuardianRestrictions:](v13, "setIgnoresGuardianRestrictions:", objc_msgSend(v7, "ignoresGuardianRestrictions"));

  return v13;
}

- (id)copyPostTaskWithPayloadItem:(id)a3 forAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CoreDAVPostTask *v10;
  void *v11;
  void *v12;
  CoreDAVPostTask *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  -[CoreDAVContainerSyncTaskGroup addMemberURL](self, "addMemberURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[CoreDAVContainerSyncTaskGroup addMemberURL](self, "addMemberURL");
  else
    objc_msgSend(v6, "serverID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [CoreDAVPostTask alloc];
  objc_msgSend(v6, "dataPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainerSyncTaskGroup dataContentType](self, "dataContentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CoreDAVPostTask initWithDataPayload:dataContentType:atURL:previousETag:](v10, "initWithDataPayload:dataContentType:atURL:previousETag:", v11, v12, v9, 0);

  -[CoreDAVActionBackedTask setBackingAction:](v13, "setBackingAction:", v7);
  v14 = objc_msgSend(v7, "ignoresGuardianRestrictions");

  -[CoreDAVTask setIgnoresGuardianRestrictions:](v13, "setIgnoresGuardianRestrictions:", v14);
  return v13;
}

- (void)_pushActions
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *p_super;
  id v13;
  void *v14;
  int v15;
  CoreDAVDeleteTask *v16;
  id v17;
  void *v18;
  id v19;
  NSMutableArray *unsubmittedTasks;
  id v21;
  int v22;
  id v23;
  id WeakRetained;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  self->_phase = 2;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 265, CFSTR("We shouldn't start pushing actions if we have outstanding tasks: %@"), self);

  }
  v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = self->_actions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        switch(objc_msgSend(v9, "action"))
        {
          case 0u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVContainerSyncTaskGroup addMemberURL](self, "addMemberURL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v11)
            {
              v15 = 1;
              goto LABEL_23;
            }
            p_super = -[CoreDAVContainerSyncTaskGroup copyPostTaskWithPayloadItem:forAction:](self, "copyPostTaskWithPayloadItem:forAction:", v10, v9);
            -[NSObject setBackingAction:](p_super, "setBackingAction:", v9);
            if (self->_syncItemOrder)
            {
              v13 = v9;
              -[NSObject setAbsoluteOrder:](p_super, "setAbsoluteOrder:", objc_msgSend(v13, "absoluteOrder"));
              objc_msgSend(v13, "priorURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject setPriorOrderedURL:](p_super, "setPriorOrderedURL:", v14);
              v15 = 1;
              goto LABEL_25;
            }
            v15 = 1;
            goto LABEL_26;
          case 1u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 0;
LABEL_23:
            p_super = -[CoreDAVContainerSyncTaskGroup copyPutTaskWithPayloadItem:forAction:](self, "copyPutTaskWithPayloadItem:forAction:", v10, v9);
            -[NSObject setBackingAction:](p_super, "setBackingAction:", v9);
            if (self->_syncItemOrder)
            {
              v23 = v9;
              -[NSObject setAbsoluteOrder:](p_super, "setAbsoluteOrder:", objc_msgSend(v23, "absoluteOrder"));
              objc_msgSend(v23, "priorURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject setPriorOrderedURL:](p_super, "setPriorOrderedURL:", v14);
LABEL_25:

            }
LABEL_26:
            -[NSObject setDelegate:](p_super, "setDelegate:", self);
            WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[NSObject setAccountInfoProvider:](p_super, "setAccountInfoProvider:", WeakRetained);

            -[NSObject setTimeoutInterval:](p_super, "setTimeoutInterval:", self->super._timeoutInterval);
            if (v15)
              unsubmittedTasks = v28;
            else
              unsubmittedTasks = v27;
            goto LABEL_29;
          case 2u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[CoreDAVTask initWithURL:]([CoreDAVDeleteTask alloc], "initWithURL:", v10);
            p_super = &v16->super.super.super;
            goto LABEL_17;
          case 4u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            p_super = objc_msgSend(v10, "copyPropPatchTask");
            if (self->_syncItemOrder)
            {
              v17 = v9;
              -[NSObject setAbsoluteOrder:](p_super, "setAbsoluteOrder:", objc_msgSend(v17, "absoluteOrder"));
              objc_msgSend(v17, "priorURL");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject setPriorOrderedURL:](p_super, "setPriorOrderedURL:", v18);
            }
            v16 = (CoreDAVDeleteTask *)p_super;
LABEL_17:
            -[CoreDAVActionBackedTask setBackingAction:](v16, "setBackingAction:", v9);
            -[NSObject setDelegate:](p_super, "setDelegate:", self);
            v19 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[NSObject setAccountInfoProvider:](p_super, "setAccountInfoProvider:", v19);

            -[NSObject setTimeoutInterval:](p_super, "setTimeoutInterval:", self->super._timeoutInterval);
            unsubmittedTasks = self->_unsubmittedTasks;
LABEL_29:
            -[NSMutableArray addObject:](unsubmittedTasks, "addObject:", p_super);
            break;
          default:
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v10, "logHandleForAccountInfoProvider:", v21);
            p_super = objc_claimAutoreleasedReturnValue();

            if (p_super)
            {
              p_super = p_super;
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
              {
                v22 = objc_msgSend(v9, "action");
                *(_DWORD *)buf = 67109120;
                v34 = v22;
                _os_log_impl(&dword_209602000, p_super, OS_LOG_TYPE_DEFAULT, "Don't know how to perform action %d, skipping this action", buf, 8u);
              }

            }
            break;
        }

        ++v8;
      }
      while (v6 != v8);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      v6 = v25;
    }
    while (v25);
  }

  -[NSMutableArray addObjectsFromArray:](self->_unsubmittedTasks, "addObjectsFromArray:", v28);
  -[NSMutableArray addObjectsFromArray:](self->_unsubmittedTasks, "addObjectsFromArray:", v27);
  if (-[NSMutableArray count](self->_unsubmittedTasks, "count"))
    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
  else
    -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");

}

- (void)_sendNextBatch
{
  CoreDAVContainerSyncTaskGroup *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  char v17;
  NSMutableDictionary *remainingHREFsToModDeleteActions;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BOOL v31;
  id v32;
  void *v33;
  NSMutableDictionary *remainingUUIDsToAddActions;
  void *v35;
  objc_class *v36;
  void *v37;
  id WeakRetained;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  int v47;
  void *v48;
  int v49;
  NSMutableDictionary *v50;
  int v51;
  uint64_t v52;
  NSMutableDictionary *obj;
  id obja;
  uint64_t v55;
  int v56;
  unint64_t v57;
  unint64_t v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v2 = self;
  v75 = *MEMORY[0x24BDAC8D0];
  while (-[NSMutableDictionary count](v2->_remainingUUIDsToAddActions, "count")
       || -[NSMutableDictionary count](self->_remainingHREFsToModDeleteActions, "count"))
  {
    if (self->_phase == 1)
      v3 = CFSTR("crud");
    else
      v3 = CFSTR("simple");
    -[NSDictionary objectForKey:](self->_bulkRequests, "objectForKey:", v3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKey:", CFSTR("max-resources"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v4, "unsignedIntegerValue");

    objc_msgSend(v48, "objectForKey:", CFSTR("max-size"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v5, "unsignedIntegerValue");

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = self->_remainingHREFsToModDeleteActions;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v6)
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v55 = *(_QWORD *)v70;
      while (2)
      {
        v10 = 0;
        v47 = v8 + v6;
        v49 = v8;
        v51 = v8 + 1;
        do
        {
          if (*(_QWORD *)v70 != v55)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v10);
          -[NSMutableDictionary objectForKey:](self->_remainingHREFsToModDeleteActions, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "action") == 1)
          {
            objc_msgSend(v12, "context");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "dataPayload");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "length");

          }
          else
          {
            v15 = 100;
          }
          v7 += v15;
          if (v59 && v59 < (v51 + v10) || v57 && (float)v57 * 0.8 < (float)v7)
          {

            v47 = v49 + v10 + 1;
            v17 = 1;
            goto LABEL_26;
          }
          v16 = v9;
          if (!v9)
            v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v9 = v16;
          objc_msgSend(v16, "setObject:forKey:", v12, v11);

          ++v10;
        }
        while (v6 != v10);
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        v17 = 0;
        v8 = v47;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
      v7 = 0;
      v47 = 0;
      v9 = 0;
    }
LABEL_26:

    remainingHREFsToModDeleteActions = self->_remainingHREFsToModDeleteActions;
    objc_msgSend(v9, "allKeys");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = v19;
    else
      v21 = MEMORY[0x24BDBD1A8];
    -[NSMutableDictionary removeObjectsForKeys:](remainingHREFsToModDeleteActions, "removeObjectsForKeys:", v21);

    if ((v17 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v50 = self->_remainingUUIDsToAddActions;
      v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      v24 = 0;
      if (v23)
      {
        obja = *(id *)v66;
        while (2)
        {
          v25 = 0;
          v56 = v47 + 1;
          v52 = v23;
          v47 += v23;
          do
          {
            if (*(id *)v66 != obja)
              objc_enumerationMutation(v50);
            v26 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v25);
            -[NSMutableDictionary objectForKey:](self->_remainingUUIDsToAddActions, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "context");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "dataPayload");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "length");

            v31 = v59 < (v56 + v25) && v59 != 0;
            if (v31 || (v7 += v30, v57) && (float)v57 * 0.8 < (float)v7)
            {

              goto LABEL_48;
            }
            v32 = v24;
            if (!v24)
              v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v24 = v32;
            objc_msgSend(v32, "setObject:forKey:", v27, v26);

            ++v25;
          }
          while (v52 != v25);
          v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
          if (v23)
            continue;
          break;
        }
      }
LABEL_48:

      v22 = v24;
    }
    v33 = v22;
    if (objc_msgSend(v22, "count"))
    {
      remainingUUIDsToAddActions = self->_remainingUUIDsToAddActions;
      objc_msgSend(v33, "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectsForKeys:](remainingUUIDsToAddActions, "removeObjectsForKeys:", v35);

    }
    v36 = -[CoreDAVContainerSyncTaskGroup bulkChangeTaskClass](self, "bulkChangeTaskClass");
    v37 = (void *)objc_msgSend([v36 alloc], "initWithURL:checkCTag:simple:returnChangedData:uuidsToAddActions:hrefsToModDeleteActions:", self->_folderURL, self->_bulkChangeCheckCTag, self->_phase != 1, 1, v33, v9);
    if (!v37)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 434, CFSTR("Couldn't create task of class %@, things will go poorly"), v36);

    }
    objc_msgSend(v37, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v37, "setAccountInfoProvider:", WeakRetained);

    objc_msgSend(v37, "setTimeoutInterval:", self->super._timeoutInterval);
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v9;
    if (v33)
    {
      objc_msgSend(v33, "allValues");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObjectsFromArray:", v41);

      v40 = v9;
    }
    if (v40)
    {
      objc_msgSend(v40, "allValues");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObjectsFromArray:", v42);

    }
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __47__CoreDAVContainerSyncTaskGroup__sendNextBatch__block_invoke;
    v60[3] = &unk_24C1D9A68;
    v60[4] = &v61;
    objc_msgSend(v39, "enumerateObjectsUsingBlock:", v60);
    objc_msgSend(v37, "setIgnoresGuardianRestrictions:", *((unsigned __int8 *)v62 + 24));
    -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v37);
    v43 = self->_bulkChangeCheckCTag == 0;

    _Block_object_dispose(&v61, 8);
    v2 = self;
    if (!v43)
      goto LABEL_60;
  }
  v2 = self;
LABEL_60:
  if (v2->_bulkChangeCheckCTag && (v45 = -[NSMutableArray count](v2->_unsubmittedTasks, "count"), v2 = self, v45))
    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
  else
    -[CoreDAVContainerSyncTaskGroup _pushActions](v2, "_pushActions");
}

uint64_t __47__CoreDAVContainerSyncTaskGroup__sendNextBatch__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "ignoresGuardianRestrictions");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_bulkChange
{
  __CFString **v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSMutableDictionary *remainingUUIDsToAddActions;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  char v25;
  NSMutableDictionary *remainingHREFsToModDeleteActions;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  id WeakRetained;
  void *v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 475, CFSTR("We shouldn't start bulk change if we have outstanding tasks: %@"), self);

  }
  if (self->_remainingUUIDsToAddActions)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 476, CFSTR("%s _remainingUUIDsToAddActions is not nil: %@"), "-[CoreDAVContainerSyncTaskGroup _bulkChange]", self);

  }
  if (self->_remainingHREFsToModDeleteActions)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 477, CFSTR("%s _remainingHREFsToModDeleteActions is not nil: %@"), "-[CoreDAVContainerSyncTaskGroup _bulkChange]", self);

  }
  if (self->_phase == 1)
    v4 = cdXMLMMeBulkCRUD;
  else
    v4 = cdXMLMMeBulkSimple;
  -[NSDictionary objectForKey:](self->_bulkRequests, "objectForKey:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableArray copy](self->_actions, "copy");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "action");
        switch(v13)
        {
          case 2:
            objc_msgSend(v5, "objectForKey:", CFSTR("delete"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "BOOLValue");

            if ((v25 & 1) == 0)
              continue;
            v23 = 1;
LABEL_26:
            if (self->_phase != 1)
              continue;
            remainingHREFsToModDeleteActions = self->_remainingHREFsToModDeleteActions;
            if (!remainingHREFsToModDeleteActions)
            {
              v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
              v28 = self->_remainingHREFsToModDeleteActions;
              self->_remainingHREFsToModDeleteActions = v27;

              remainingHREFsToModDeleteActions = self->_remainingHREFsToModDeleteActions;
            }
            objc_msgSend(v12, "context");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if ((v23 & 1) != 0)
            {
              -[NSMutableDictionary setObject:forKey:](remainingHREFsToModDeleteActions, "setObject:forKey:", v12, v29);
            }
            else
            {
              objc_msgSend(v29, "serverID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](remainingHREFsToModDeleteActions, "setObject:forKey:", v12, v36);

            }
LABEL_38:
            -[NSMutableArray removeObject:](self->_actions, "removeObject:", v12);
            continue;
          case 1:
            objc_msgSend(v5, "objectForKey:", CFSTR("update"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "BOOLValue");

            if (!v22)
              continue;
            v23 = 0;
            goto LABEL_26;
          case 0:
            objc_msgSend(v5, "objectForKey:", CFSTR("insert"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "BOOLValue");

            if (!v15)
              continue;
            remainingUUIDsToAddActions = self->_remainingUUIDsToAddActions;
            if (!remainingUUIDsToAddActions)
            {
              v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
              v18 = self->_remainingUUIDsToAddActions;
              self->_remainingUUIDsToAddActions = v17;

              remainingUUIDsToAddActions = self->_remainingUUIDsToAddActions;
            }
            objc_msgSend(v12, "context");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "syncKey");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](remainingUUIDsToAddActions, "setObject:forKey:", v12, v20);

            goto LABEL_38;
        }
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v31, "logHandleForAccountInfoProvider:", WeakRetained);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v34 = v33;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = objc_msgSend(v12, "action");
            *(_DWORD *)buf = 67109120;
            v45 = v35;
            _os_log_impl(&dword_209602000, v34, OS_LOG_TYPE_DEFAULT, "Don't know how to perform action %d, skipping this action", buf, 8u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v9);
  }

  -[CoreDAVContainerSyncTaskGroup _sendNextBatch](self, "_sendNextBatch");
}

- (id)copyGetEtagTaskWithPropertiesToFind:(id)a3
{
  CoreDAVSyncReportTask *v4;
  CoreDAVSyncReportTask *v5;

  if (self->_useSyncCollection)
    v4 = -[CoreDAVSyncReportTask initWithPropertiesToFind:atURL:withDepth:previousSyncToken:]([CoreDAVSyncReportTask alloc], "initWithPropertiesToFind:atURL:withDepth:previousSyncToken:", a3, self->_folderURL, 3, self->_previousSyncToken);
  else
    v4 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:]([CoreDAVPropFindTask alloc], "initWithPropertiesToFind:atURL:withDepth:", a3, self->_folderURL, 3);
  v5 = v4;

  return v5;
}

- (void)_getETags
{
  CoreDAVItemParserMapping *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id WeakRetained;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  self->_phase = 4;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 545, CFSTR("We shouldn't start grabbing eTags if we have outstanding tasks: %@"), self);

  }
  v4 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v4, "setNameSpace:", CFSTR("DAV:"));
  -[CoreDAVItemParserMapping setName:](v4, "setName:", CFSTR("getetag"));
  -[CoreDAVItemParserMapping setParseClass:](v4, "setParseClass:", objc_opt_class());
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v5, "addObject:", v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[CoreDAVContainerSyncTaskGroup copyAdditionalResourcePropertiesToFetch](self, "copyAdditionalResourcePropertiesToFetch");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = -[CoreDAVContainerSyncTaskGroup copyGetEtagTaskWithPropertiesToFind:](self, "copyGetEtagTaskWithPropertiesToFind:", v5);
  -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v11);
  objc_msgSend(v11, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v11, "setAccountInfoProvider:", WeakRetained);

  objc_msgSend(v11, "setTimeoutInterval:", self->super._timeoutInterval);
  -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");

}

- (void)_getOrder
{
  id WeakRetained;
  void *v5;
  CoreDAVGetTask *v6;

  self->_phase = 5;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 571, CFSTR("We shouldn't start getting children order if we have outstanding tasks: %@"), self);

  }
  if (self->_localItemURLOrder || !self->_syncItemOrder)
  {
    -[CoreDAVContainerSyncTaskGroup _getDataPayloads](self, "_getDataPayloads");
  }
  else
  {
    v6 = -[CoreDAVTask initWithURL:]([CoreDAVGetTask alloc], "initWithURL:", self->_folderURL);
    -[CoreDAVTask setDelegate:](v6, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVTask setAccountInfoProvider:](v6, "setAccountInfoProvider:", WeakRetained);

    -[CoreDAVTask setTimeoutInterval:](v6, "setTimeoutInterval:", self->super._timeoutInterval);
    -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v6);
    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");

  }
}

- (void)_configureMultiGet:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__CoreDAVContainerSyncTaskGroup__configureMultiGet___block_invoke;
  v6[3] = &unk_24C1D9A90;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v4, "setCompletionBlock:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v4, "setAccountInfoProvider:", WeakRetained);

  objc_msgSend(v4, "setTimeoutInterval:", self->super._timeoutInterval);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __52__CoreDAVContainerSyncTaskGroup__configureMultiGet___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v3, "missingURLs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyMultiGetTaskWithURLs:", v5);
        objc_msgSend(*(id *)(a1 + 32), "_configureMultiGet:", v6);
        if (v6)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addObject:", v6);
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
          objc_msgSend(v7, "logHandleForAccountInfoProvider:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              v15 = 138412546;
              v16 = v6;
              v17 = 2048;
              v18 = objc_msgSend(v5, "count");
              _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_INFO, "%@ missed %lu items - resubmitting", (uint8_t *)&v15, 0x16u);
            }

          }
        }

      }
    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v3, "parsedContents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deletedURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_getTask:finishedWithParsedContents:deletedItems:error:", v3, v12, v13, v14);

  }
}

- (BOOL)shouldDownloadResource:(id)a3 localETag:(id)a4 serverETag:(id)a5
{
  return objc_msgSend(a4, "isEqualToString:", a5) ^ 1;
}

- (void)deleteResourceURLs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerSyncTask:retrievedAddedOrModifiedActions:removed:", self, 0, v4);

}

- (void)_getDataPayloads
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  id v44;
  id WeakRetained;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  NSMutableDictionary *obj;
  id obja;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[5];
  uint8_t v80[128];
  uint8_t buf[4];
  CoreDAVContainerSyncTaskGroup *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  self->_phase = 6;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 628, CFSTR("We shouldn't start getting vCards if we have outstanding tasks: %@"), self);

  }
  v56 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v60 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v54 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[CoreDAVTaskGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v5, "copyLocalETagsForURLToETagDict:inFolderWithURL:", self->_urlToETag, self->_folderURL);
  }
  else
  {
    -[NSMutableDictionary allKeys](self->_urlToETag, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyLocalETagsForURLs:inFolderWithURL:", v8, self->_folderURL);

  }
  if (!v7)
  {
    v20 = v54;
    objc_msgSend(v54, "minusSet:", self->_locationChangedURLs);
    goto LABEL_21;
  }
  v59 = v7;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = self->_urlToETag;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v76 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_urlToETag, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CoreDAVContainerSyncTaskGroup shouldDownloadResource:localETag:serverETag:](self, "shouldDownloadResource:localETag:serverETag:", v14, v16, v15);

        if (v17)
        {
          if (objc_msgSend(v60, "count") >= self->_multiGetBatchSize)
          {
            objc_msgSend(v56, "addObject:", v60);
            v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);

            v18 = v19;
          }
          else
          {
            v18 = v60;
          }
          v60 = v18;
          objc_msgSend(v18, "addObject:", v14);
          ++v11;
        }

      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v56, "addObject:", v60);
  if (!self->_useSyncCollection)
  {
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copyAllLocalURLsInFolderWithURL:", self->_folderURL);

    if (v24)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v72 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            -[NSMutableDictionary objectForKey:](self->_urlToETag, "objectForKey:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
              objc_msgSend(v54, "addObject:", v30);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        }
        while (v27);
      }

      v22 = v54;
      goto LABEL_36;
    }
    v20 = v54;
    objc_msgSend(v54, "minusSet:", self->_locationChangedURLs);
    v7 = v59;
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v21);

    goto LABEL_68;
  }
  v22 = v54;
  objc_msgSend(v54, "unionSet:", self->_syncReportDeletedURLs);
LABEL_36:
  objc_msgSend(v22, "minusSet:", self->_locationChangedURLs);
  if (objc_msgSend(v22, "count"))
    -[CoreDAVContainerSyncTaskGroup deleteResourceURLs:](self, "deleteResourceURLs:", v22);
  if (v11)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v32 = v56;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v66;
      v36 = 0x2545A3000uLL;
      v52 = *(_QWORD *)v66;
      v53 = v32;
      do
      {
        v37 = 0;
        v55 = v34;
        do
        {
          if (*(_QWORD *)v66 != v35)
            objc_enumerationMutation(v32);
          v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v37);
          if (objc_msgSend(v38, "count"))
          {
            if (*((_BYTE *)&self->super.super.isa + *(int *)(v36 + 3192)))
            {
              v39 = -[CoreDAVContainerSyncTaskGroup copyMultiGetTaskWithURLs:](self, "copyMultiGetTaskWithURLs:", v38);
              -[CoreDAVContainerSyncTaskGroup _configureMultiGet:](self, "_configureMultiGet:", v39);
              if (v39)
                -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v39);
            }
            else
            {
              obja = v37;
              v63 = 0u;
              v64 = 0u;
              v61 = 0u;
              v62 = 0u;
              v39 = v38;
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
              if (v40)
              {
                v41 = v40;
                v42 = *(_QWORD *)v62;
                do
                {
                  for (k = 0; k != v41; ++k)
                  {
                    if (*(_QWORD *)v62 != v42)
                      objc_enumerationMutation(v39);
                    v44 = -[CoreDAVContainerSyncTaskGroup copyGetTaskWithURL:](self, "copyGetTaskWithURL:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k));
                    if (!v44)
                    {
                      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerSyncTaskGroup.m"), 719, CFSTR("Couldn't create getTask, things will go poorly"));

                    }
                    objc_msgSend(v44, "setDelegate:", self);
                    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                    objc_msgSend(v44, "setAccountInfoProvider:", WeakRetained);

                    objc_msgSend(v44, "setTimeoutInterval:", self->super._timeoutInterval);
                    -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v44);

                  }
                  v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
                }
                while (v41);
                v35 = v52;
                v32 = v53;
                v34 = v55;
                v36 = 0x2545A3000;
              }
              v37 = obja;
            }

          }
          v37 = (char *)v37 + 1;
        }
        while (v37 != (id)v34);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
      }
      while (v34);
    }

    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
    v20 = v54;
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v47, "logHandleForAccountInfoProvider:", v48);
    v49 = objc_claimAutoreleasedReturnValue();

    if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v82 = self;
      _os_log_impl(&dword_209602000, v49, OS_LOG_TYPE_DEBUG, "%@: There are no server side items to grab, so I'm outta here", buf, 0xCu);
    }

    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __49__CoreDAVContainerSyncTaskGroup__getDataPayloads__block_invoke;
    v69[3] = &unk_24C1D9AB8;
    v69[4] = self;
    v20 = v54;
    v70 = v54;
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v69);

  }
  v7 = v59;
LABEL_68:

}

void __49__CoreDAVContainerSyncTaskGroup__getDataPayloads__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[14];
  if (!v4)
    v4 = v3[13];
  v5 = v3[17];
  if (!v5)
    v5 = v3[16];
  v6 = v2;
  objc_msgSend(v2, "containerSyncTask:completedWithNewCTag:newSyncToken:addedOrModified:removed:error:", v3, v4, v5, 0, *(_QWORD *)(a1 + 40), 0);

}

- (void)startTaskGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[NSMutableArray count](self->_actions, "count"))
  {
    -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
    return;
  }
  -[NSDictionary objectForKey:](self->_bulkRequests, "objectForKey:", CFSTR("crud"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("max-resources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    self->_phase = 1;
LABEL_7:
    -[CoreDAVContainerSyncTaskGroup _bulkChange](self, "_bulkChange");
    return;
  }
  -[NSDictionary objectForKey:](self->_bulkRequests, "objectForKey:", CFSTR("simple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("max-resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self->_phase = 0;
    goto LABEL_7;
  }
  -[CoreDAVContainerSyncTaskGroup _pushActions](self, "_pushActions");
}

- (BOOL)isWhitelistedError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain"));

  v6 = v5 && objc_msgSend(v3, "code") >= 400 && objc_msgSend(v3, "code") < 500;
  return v6;
}

- (void)putTask:(id)a3 completedWithNewETag:(id)a4 error:(id)a5
{
  id v8;
  NSMutableSet *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id WeakRetained;
  id v21;
  void *v22;
  id v23;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  char v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  id v43;
  __int16 v44;
  NSMutableSet *v45;
  __int16 v46;
  NSMutableArray *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSMutableSet *)a4;
  v10 = (NSMutableArray *)a5;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
    v11 = v10;
    v10 = v11;
    if (v11)
    {
      -[NSMutableArray domain](v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")) & 1) != 0)
      {
        v13 = -[NSMutableArray code](v10, "code");

        if (v13 == 507)
        {
          -[CoreDAVTaskGroup delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            -[CoreDAVTaskGroup delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleInsufficientStorageForTask:inFolderWithURL:", v8, self->_folderURL);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v17, "context");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[CoreDAVContainerSyncTaskGroup copyPutTaskWithPayloadItem:forAction:](self, "copyPutTaskWithPayloadItem:forAction:", v18, v17);

              -[NSObject setDelegate:](v19, "setDelegate:", self);
              WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              -[NSObject setAccountInfoProvider:](v19, "setAccountInfoProvider:", WeakRetained);

              -[NSObject setTimeoutInterval:](v19, "setTimeoutInterval:", self->super._timeoutInterval);
              if (self->_syncItemOrder)
              {
                v21 = v17;
                -[NSObject setAbsoluteOrder:](v19, "setAbsoluteOrder:", objc_msgSend(v21, "absoluteOrder"));
                objc_msgSend(v21, "priorURL");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSObject setPriorOrderedURL:](v19, "setPriorOrderedURL:", v22);
              }
              -[NSMutableArray insertObject:atIndex:](self->_unsubmittedTasks, "insertObject:atIndex:", v19, 0);
              -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
LABEL_14:

              goto LABEL_40;
            }
          }
        }
      }
      else
      {

      }
    }
    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
    if (!-[NSMutableSet count](self->super._outstandingTasks, "count") && !self->super._isCancelling)
      -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_respondsToSelector();

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if ((v27 & 1) != 0)
    {
      v30 = objc_msgSend(v28, "syncPutTask:completedWithNewETag:parentTaskGroup:error:", v8, v9, self, v10);
    }
    else
    {
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) == 0)
        goto LABEL_28;
      -[CoreDAVTaskGroup delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "syncPutTask:completedWithNewETag:error:", v8, v9, v10);
    }
    v32 = v30;

    if ((v32 & 1) != 0)
    {

      v10 = 0;
      if (!-[CoreDAVContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", 0))
      {
LABEL_35:
        -[CoreDAVTaskGroup delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_opt_respondsToSelector();

        if ((v37 & 1) != 0)
        {
          -[CoreDAVTaskGroup delegate](self, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "url");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v38, "setLocalETag:forItemWithURL:inFolderWithURL:", v9, v39, self->_folderURL);

          if ((v40 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v41);

          }
          -[CoreDAVContainerSyncTaskGroup applyAdditionalPropertiesFromPutTask:](self, "applyAdditionalPropertiesFromPutTask:", v8);
        }
        v10 = 0;
        goto LABEL_40;
      }
LABEL_29:
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v33, "logHandleForAccountInfoProvider:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v42 = 138412802;
        v43 = v8;
        v44 = 2114;
        v45 = v9;
        v46 = 2112;
        v47 = v10;
        _os_log_impl(&dword_209602000, v35, OS_LOG_TYPE_DEFAULT, "putTask:%@ completedWithNewETag:%{public}@ error:%@ Ignoring", (uint8_t *)&v42, 0x20u);
      }

      v10 = 0;
      v9 = 0;
      goto LABEL_40;
    }
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
LABEL_28:
    if (!-[CoreDAVContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v10))
    {
      if (v10)
      {
        -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
        goto LABEL_40;
      }
      goto LABEL_35;
    }
    goto LABEL_29;
  }
  if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v8) & 1) == 0)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v17, "logHandleForAccountInfoProvider:", v23);
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      v42 = 138412802;
      v43 = v8;
      v44 = 2112;
      v45 = outstandingTasks;
      v46 = 2112;
      v47 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_DEFAULT, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v42, 0x20u);
    }
    goto LABEL_14;
  }
LABEL_40:

}

- (void)_postTask:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  NSMutableSet *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  char v18;
  void *v19;
  char v20;
  void *v21;
  id WeakRetained;
  NSObject *v23;
  int v24;
  id v25;
  __int16 v26;
  NSMutableSet *v27;
  __int16 v28;
  NSMutableArray *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSMutableSet *)a4;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
    if (!-[NSMutableSet count](self->super._outstandingTasks, "count") && !self->super._isCancelling)
      -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      v12 = objc_msgSend(v10, "syncPostTask:postedData:parentTaskGroup:error:", v6, 0, self, v7);

      if (v12)
        goto LABEL_22;
    }
    else
    {
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
        if (-[CoreDAVContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v7))
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v21, "logHandleForAccountInfoProvider:", WeakRetained);
          v23 = objc_claimAutoreleasedReturnValue();

          if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = 138412546;
            v25 = v6;
            v26 = 2112;
            v27 = v7;
            _os_log_impl(&dword_209602000, v23, OS_LOG_TYPE_ERROR, "postTask:%@ error:%@ Ignoring", (uint8_t *)&v24, 0x16u);
          }

          goto LABEL_22;
        }
        goto LABEL_24;
      }
      -[CoreDAVTaskGroup delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "syncPostTask:data:error:", v6, 0, v7);

      if ((v20 & 1) != 0)
      {
LABEL_22:

LABEL_23:
        -[CoreDAVContainerSyncTaskGroup applyAdditionalPropertiesFromPostTask:](self, "applyAdditionalPropertiesFromPostTask:", v6);
        v7 = 0;
        goto LABEL_26;
      }
    }
    if (v7)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
LABEL_24:
    if (!v7)
      goto LABEL_23;
LABEL_25:
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
    goto LABEL_26;
  }
  if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v6) & 1) == 0)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v13, "logHandleForAccountInfoProvider:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      v24 = 138412802;
      v25 = v6;
      v26 = 2112;
      v27 = outstandingTasks;
      v28 = 2112;
      v29 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_DEFAULT, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v24, 0x20u);
    }

  }
LABEL_26:

}

- (void)_syncReportTask:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  unint64_t v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *urlToETag;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  NSObject *v47;
  char v48;
  void *v49;
  NSMutableSet *syncReportDeletedURLs;
  NSMutableSet *v51;
  NSMutableSet *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  NSString *nextSyncToken;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  NSMutableArray *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    if (self->_phase == 4)
    {
      if (objc_msgSend(v6, "wasInvalidSyncToken"))
      {
        -[CoreDAVContainerSyncTaskGroup setPreviousSyncToken:](self, "setPreviousSyncToken:", 0);
        -[CoreDAVContainerSyncTaskGroup setUseSyncCollection:](self, "setUseSyncCollection:", 0);
        -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
      }
      else if (objc_msgSend(v6, "hadUnexpectedChangeOfSyncTokenWithZeroResponses")
             && (v13 = -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount"), v13 < -[CoreDAVContainerSyncTaskGroup maxRetryOnUnexpectedSyncTokenChange](self, "maxRetryOnUnexpectedSyncTokenChange")))
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
        v16 = objc_claimAutoreleasedReturnValue();

        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_INFO, "Retrying a sync-report after unexpectedly receiving a new sync token but no new content", buf, 2u);
        }

        -[CoreDAVTaskGroup delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_respondsToSelector();

        if ((v18 & 1) != 0)
        {
          -[CoreDAVTaskGroup delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logRetryAfterEmptyResponseContainerSyncTask:retryCount:", self, -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount"));

        }
        -[CoreDAVContainerSyncTaskGroup setUnexpectedEmptySyncReportResponseRetryAttemptCount:](self, "setUnexpectedEmptySyncReportResponseRetryAttemptCount:", -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount")+ 1);
        -[CoreDAVContainerSyncTaskGroup _getETags](self, "_getETags");
      }
      else if (v7)
      {
        -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
      }
      else
      {
        if (!self->_urlToETag)
        {
          v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          urlToETag = self->_urlToETag;
          self->_urlToETag = v20;

        }
        if (objc_msgSend(v6, "hadUnexpectedChangeOfSyncTokenWithZeroResponses"))
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v22, "logHandleForAccountInfoProvider:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v25 = v24;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v6, "nextSyncToken");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v70 = v26;
              v71 = 2048;
              v72 = -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount");
              _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_ERROR, "Accepting a new sync token: %{public}@ despite zero responses, after retrying the original sync-report %lu additional times.", buf, 0x16u);

            }
          }

          -[CoreDAVTaskGroup delegate](self, "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_opt_respondsToSelector();

          if ((v28 & 1) != 0)
          {
            -[CoreDAVTaskGroup delegate](self, "delegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "logGaveUpAcceptedEmptyResponseContainerSyncTask:retryCount:", self, -[CoreDAVContainerSyncTaskGroup unexpectedEmptySyncReportResponseRetryAttemptCount](self, "unexpectedEmptySyncReportResponseRetryAttemptCount"));

          }
        }
        v62 = v6;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v6, "multiStatus", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "responses");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v31;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        if (v32)
        {
          v33 = v32;
          v64 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v66 != v64)
                objc_enumerationMutation(obj);
              v35 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              objc_msgSend(v35, "successfulPropertiesToValues");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("getetag"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "payloadAsString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "firstHref");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "payloadAsFullURL");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v39) = -[CoreDAVContainerSyncTaskGroup shouldFetchResourceWithEtag:propertiesToValues:](self, "shouldFetchResourceWithEtag:propertiesToValues:", v38, v36);
              -[CoreDAVContainerSyncTaskGroup receivedPropertiesToValues:forURL:](self, "receivedPropertiesToValues:forURL:", v36, v40);
              if ((_DWORD)v39)
              {
                if (v38)
                  v41 = v40 == 0;
                else
                  v41 = 1;
                if (v41)
                {
                  objc_msgSend(v35, "status");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "payloadAsString");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v43, "CDVIsHTTPStatusLineWithStatusCode:", 404);

                  if ((v44 & 1) == 0)
                  {
                    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                    objc_msgSend(v45, "logHandleForAccountInfoProvider:", v46);
                    v47 = objc_claimAutoreleasedReturnValue();

                    if (v47 && os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v70 = v38;
                      v71 = 2112;
                      v72 = (unint64_t)v40;
                      _os_log_impl(&dword_209602000, v47, OS_LOG_TYPE_DEFAULT, "Found an eTag without one or both of eTag (%{public}@) or url (%@). Dropping it on the floor", buf, 0x16u);
                    }

                  }
                }
                else
                {
                  v48 = objc_msgSend(v40, "isEqual:", self->_folderURL);
                  if ((v48 & 1) == 0)
                    -[NSMutableDictionary setObject:forKey:](self->_urlToETag, "setObject:forKey:", v38, v40);
                }
              }

            }
            v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
          }
          while (v33);
        }

        v6 = v62;
        objc_msgSend(v62, "notFoundHREFs");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v61;
        if (objc_msgSend(v49, "count"))
        {
          syncReportDeletedURLs = self->_syncReportDeletedURLs;
          if (!syncReportDeletedURLs)
          {
            v51 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v52 = self->_syncReportDeletedURLs;
            self->_syncReportDeletedURLs = v51;

            syncReportDeletedURLs = self->_syncReportDeletedURLs;
          }
          -[NSMutableSet unionSet:](syncReportDeletedURLs, "unionSet:", v49);
        }
        v53 = objc_msgSend(v62, "moreToSync");
        objc_msgSend(v62, "nextSyncToken");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54;
        if (v53)
        {

          if (v55)
          {
            objc_msgSend(v62, "nextSyncToken");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVContainerSyncTaskGroup setPreviousSyncToken:](self, "setPreviousSyncToken:", v56);

          }
          else
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v58, "logHandleForAccountInfoProvider:", v59);
            v60 = objc_claimAutoreleasedReturnValue();

            if (v60 && os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209602000, v60, OS_LOG_TYPE_DEFAULT, "Was told to sync more items, but got no new sync token.  Starting from scatch", buf, 2u);
            }

            -[CoreDAVContainerSyncTaskGroup setPreviousSyncToken:](self, "setPreviousSyncToken:", 0);
            -[CoreDAVContainerSyncTaskGroup setUseSyncCollection:](self, "setUseSyncCollection:", 0);
            -[NSMutableDictionary removeAllObjects](self->_urlToETag, "removeAllObjects");
            -[NSMutableSet removeAllObjects](self->_syncReportDeletedURLs, "removeAllObjects");
          }
          -[CoreDAVContainerSyncTaskGroup _getETags](self, "_getETags");
        }
        else
        {
          nextSyncToken = self->_nextSyncToken;
          self->_nextSyncToken = (NSString *)v54;

          -[CoreDAVContainerSyncTaskGroup _getOrder](self, "_getOrder");
        }

      }
    }
  }
  else if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v6) & 1) == 0)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v8, "logHandleForAccountInfoProvider:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      v70 = v6;
      v71 = 2112;
      v72 = (unint64_t)outstandingTasks;
      v73 = 2112;
      v74 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

  }
}

- (void)_bulkChangeTask:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  char v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  id WeakRetained;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  NSMutableSet *v30;
  __int16 v31;
  NSMutableArray *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    if (!self->_bulkChangeCheckCTag)
    {
      -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
      if (!-[NSMutableSet count](self->super._outstandingTasks, "count") && !self->super._isCancelling)
        -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
    }
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      v12 = objc_msgSend(v10, "syncBulkChangeTask:parentTaskGroup:completedWithError:", v6, self, v7);

      if (v12)
      {
LABEL_8:

LABEL_26:
        if (self->_bulkChangeCheckCTag)
        {
          objc_msgSend(v6, "nextCTag");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVContainerSyncTaskGroup setBulkChangeCheckCTag:](self, "setBulkChangeCheckCTag:", v26);

          -[CoreDAVContainerSyncTaskGroup _sendNextBatch](self, "_sendNextBatch");
        }
        v7 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
      {
        if (objc_msgSend(v7, "code") == 412)
        {
          objc_msgSend(v7, "domain");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain"));

          if (v22)
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v23, "logHandleForAccountInfoProvider:", WeakRetained);
            v25 = objc_claimAutoreleasedReturnValue();

            if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              LOWORD(v27) = 0;
              _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_INFO, "BulkChangeTask told that our ctag was out of date.  Bailing on the group", (uint8_t *)&v27, 2u);
            }

          }
        }
        goto LABEL_24;
      }
      -[CoreDAVTaskGroup delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "syncBulkChangeTask:error:", v6, v7);

      if ((v20 & 1) != 0)
        goto LABEL_8;
    }
    if (v7)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
    if (!v7)
      goto LABEL_26;
LABEL_25:
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
    goto LABEL_29;
  }
  if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v6) & 1) == 0)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v13, "logHandleForAccountInfoProvider:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      v27 = 138412802;
      v28 = v6;
      v29 = 2112;
      v30 = outstandingTasks;
      v31 = 2112;
      v32 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v27, 0x20u);
    }

  }
LABEL_29:

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CoreDAVContainerSyncTaskGroup _postTask:didFinishWithError:](self, "_postTask:didFinishWithError:", v6, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CoreDAVContainerSyncTaskGroup _syncReportTask:didFinishWithError:](self, "_syncReportTask:didFinishWithError:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CoreDAVContainerSyncTaskGroup _bulkChangeTask:didFinishWithError:](self, "_bulkChangeTask:didFinishWithError:", v6, v7);
      }
      else
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412290;
          v12 = v6;
          _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_ERROR, "Got a task completion invocation for a task I don't grok, %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
  }

}

- (void)deleteTask:(id)a3 completedWithError:(id)a4
{
  id v6;
  NSMutableSet *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;
  NSObject *v15;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  char v18;
  char v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  NSMutableSet *v26;
  __int16 v27;
  NSMutableArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSMutableSet *)a4;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v6) & 1) == 0)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v13, "logHandleForAccountInfoProvider:", WeakRetained);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        outstandingTasks = self->super._outstandingTasks;
        unsubmittedTasks = self->_unsubmittedTasks;
        v23 = 138412802;
        v24 = v6;
        v25 = 2112;
        v26 = outstandingTasks;
        v27 = 2112;
        v28 = unsubmittedTasks;
        _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v23, 0x20u);
      }

    }
    goto LABEL_26;
  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
  -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
  if (!-[NSMutableSet count](self->super._outstandingTasks, "count") && !self->super._isCancelling)
    -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[CoreDAVTaskGroup delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    v12 = objc_msgSend(v10, "syncDeleteTask:parentTaskGroup:completedWithError:", v6, self, v7);
LABEL_14:
    v19 = v12;

    if ((v19 & 1) != 0)
    {

      v7 = 0;
      if (!-[CoreDAVContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", 0))
        goto LABEL_26;
      goto LABEL_20;
    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "syncDeleteTask:error:", v6, v7);
    goto LABEL_14;
  }
LABEL_19:
  if (-[CoreDAVContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v7))
  {
LABEL_20:
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v20, "logHandleForAccountInfoProvider:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_209602000, v22, OS_LOG_TYPE_DEFAULT, "deleteTask:%@ completedWithError:%@ Ignoring", (uint8_t *)&v23, 0x16u);
    }

    v7 = 0;
    goto LABEL_26;
  }
  if (v7)
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
LABEL_26:

}

- (BOOL)shouldFetchMoreETags
{
  return 0;
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  CoreDAVContainerSyncTaskGroup *v8;
  CoreDAVContainerSyncTaskGroup *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  int phase;
  CoreDAVContainerSyncTaskGroup *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CoreDAVContainerSyncTaskGroup *v28;
  id v29;
  void *v30;
  CoreDAVContainerSyncTaskGroup *v31;
  id WeakRetained;
  NSObject *v33;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v36;
  NSMutableDictionary *v37;
  NSMutableDictionary *urlToETag;
  NSMutableArray *v39;
  NSMutableArray *localItemURLOrder;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  CoreDAVContainerSyncTaskGroup *v50;
  _BOOL4 v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  const __CFString *v67;
  void *v68;
  id v69;
  NSObject *v70;
  NSString *previousCTag;
  const __CFString *v72;
  CoreDAVContainerSyncTaskGroup *v73;
  CoreDAVContainerSyncTaskGroup *v74;
  CoreDAVContainerSyncTaskGroup *v75;
  CoreDAVContainerSyncTaskGroup *v76;
  id v77;
  CoreDAVContainerSyncTaskGroup *v78;
  CoreDAVContainerSyncTaskGroup *v79;
  uint64_t v80;
  CoreDAVContainerSyncTaskGroup *obj;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  _QWORD v87[5];
  __CFString *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  CoreDAVContainerSyncTaskGroup *v94;
  __int16 v95;
  NSString *p_isa;
  __int16 v97;
  NSMutableArray *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v8 = (CoreDAVContainerSyncTaskGroup *)a3;
  v9 = (CoreDAVContainerSyncTaskGroup *)a4;
  v10 = a5;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
  {
    if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v8) & 1) == 0)
    {
      v28 = self;
      v29 = v10;
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v28;
      WeakRetained = objc_loadWeakRetained((id *)&v28->super._accountInfoProvider);
      objc_msgSend(v30, "logHandleForAccountInfoProvider:", WeakRetained);
      v33 = objc_claimAutoreleasedReturnValue();

      if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        outstandingTasks = v31->super._outstandingTasks;
        unsubmittedTasks = v31->_unsubmittedTasks;
        *(_DWORD *)buf = 138412802;
        v94 = v8;
        v95 = 2112;
        p_isa = (NSString *)&outstandingTasks->super.super.isa;
        v97 = 2112;
        v98 = unsubmittedTasks;
        _os_log_impl(&dword_209602000, v33, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
      }

      v10 = v29;
    }
    goto LABEL_81;
  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CoreDAVErrorDomain")) & 1) == 0)
    {

LABEL_28:
      -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
      goto LABEL_81;
    }
    v12 = v10;
    v13 = objc_msgSend(v10, "code");

    v14 = v13 == 2;
    v10 = v12;
    if (!v14)
      goto LABEL_28;
  }
  phase = self->_phase;
  if (phase == 4)
  {
    -[CoreDAVContainerSyncTaskGroup multiStatus](v8, "multiStatus");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v59 = v10;
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v60, "logHandleForAccountInfoProvider:", v61);
      v62 = objc_claimAutoreleasedReturnValue();

      if (v62 && os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209602000, v62, OS_LOG_TYPE_DEFAULT, "No responses when fetching current etags. Giving up.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 8, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v63);

      v10 = v59;
      goto LABEL_81;
    }
    if (!self->_urlToETag)
    {
      v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      urlToETag = self->_urlToETag;
      self->_urlToETag = v37;

    }
    v76 = v8;
    v77 = v10;
    if (!self->_localItemURLOrder)
    {
      v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      localItemURLOrder = self->_localItemURLOrder;
      self->_localItemURLOrder = v39;

    }
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v9;
    v41 = -[CoreDAVContainerSyncTaskGroup countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v83;
      v79 = self;
      do
      {
        v44 = 0;
        v80 = v42;
        do
        {
          if (*(_QWORD *)v83 != v43)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v44);
          objc_msgSend(v45, "firstHref");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "payloadAsFullURL");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v47, "isEqual:", self->_folderURL) & 1) == 0)
          {
            objc_msgSend(v45, "successfulPropertiesToValues");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("getetag"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "payloadAsString");
            v50 = (CoreDAVContainerSyncTaskGroup *)objc_claimAutoreleasedReturnValue();
            if (v47)
              -[NSMutableArray addObject:](self->_localItemURLOrder, "addObject:", v47);
            v51 = -[CoreDAVContainerSyncTaskGroup shouldFetchResourceWithEtag:propertiesToValues:](self, "shouldFetchResourceWithEtag:propertiesToValues:", v50, v48);
            -[CoreDAVContainerSyncTaskGroup receivedPropertiesToValues:forURL:](self, "receivedPropertiesToValues:forURL:", v48, v47);
            if (v51)
            {
              if (v47 && v50)
              {
                if ((objc_msgSend(v47, "isEqual:", self->_folderURL) & 1) == 0)
                  -[NSMutableDictionary setObject:forKey:](self->_urlToETag, "setObject:forKey:", v50, v47);
              }
              else
              {
                +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                objc_msgSend(v52, "logHandleForAccountInfoProvider:", v53);
                v54 = objc_claimAutoreleasedReturnValue();

                if (v54 && os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v94 = v50;
                  v95 = 2112;
                  p_isa = (NSString *)v47;
                  _os_log_impl(&dword_209602000, v54, OS_LOG_TYPE_DEFAULT, "Found an eTag without one or both of eTag (%{public}@) or url (%@). Dropping it on the floor", buf, 0x16u);
                }

                self = v79;
              }
            }

            v42 = v80;
          }

          ++v44;
        }
        while (v42 != v44);
        v42 = -[CoreDAVContainerSyncTaskGroup countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
      }
      while (v42);
    }

    if (-[CoreDAVContainerSyncTaskGroup shouldFetchMoreETags](self, "shouldFetchMoreETags"))
      -[CoreDAVContainerSyncTaskGroup _getETags](self, "_getETags");
    else
      -[CoreDAVContainerSyncTaskGroup _getOrder](self, "_getOrder");
    v8 = v76;
LABEL_66:
    v10 = v77;
    goto LABEL_81;
  }
  if (phase != 3)
    goto LABEL_81;
  v77 = v10;
  if (!-[CoreDAVContainerSyncTaskGroup count](v9, "count"))
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v55, "logHandleForAccountInfoProvider:", v56);
    v57 = objc_claimAutoreleasedReturnValue();

    if (v57 && os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v9;
      _os_log_impl(&dword_209602000, v57, OS_LOG_TYPE_DEFAULT, "We need exactly one ctag per container.  We got %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 8, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v58);

    goto LABEL_66;
  }
  v78 = self;
  v74 = v9;
  v75 = v8;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v16 = v9;
  v17 = -[CoreDAVContainerSyncTaskGroup countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  if (!v17)
  {
    v19 = 0;
    v20 = 0;
    goto LABEL_68;
  }
  v18 = v17;
  v19 = 0;
  v20 = 0;
  v21 = *(_QWORD *)v90;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v90 != v21)
        objc_enumerationMutation(v16);
      objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v22), "successfulPropertiesToValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v20)
      {
        if (v19)
          goto LABEL_16;
      }
      else
      {
        objc_msgSend(v23, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("getctag"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "payloadAsString");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v19)
          goto LABEL_16;
      }
      objc_msgSend(v24, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("sync-token"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "payloadAsString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      ++v22;
    }
    while (v18 != v22);
    v27 = -[CoreDAVContainerSyncTaskGroup countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    v18 = v27;
  }
  while (v27);
LABEL_68:

  if (v78->_actionsOnly)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_loadWeakRetained((id *)&v78->super._accountInfoProvider);
    objc_msgSend(v64, "logHandleForAccountInfoProvider:", v65);
    v66 = objc_claimAutoreleasedReturnValue();

    v8 = v75;
    if (v66 && os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v78;
      _os_log_impl(&dword_209602000, v66, OS_LOG_TYPE_DEBUG, "%@: _actionsOnly and actions are complete, so I'm outta here", buf, 0xCu);
    }

    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke;
    v87[3] = &unk_24C1D9AB8;
    v87[4] = v78;
    v88 = v20;
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](v78, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v87);

LABEL_78:
    v9 = v74;
LABEL_79:
    v10 = v77;
  }
  else
  {
    v8 = v75;
    if (v78->_useSyncCollection)
    {
      if (v20)
        v67 = v20;
      else
        v67 = CFSTR("ServerDoesNotSupportCTags");
      -[CoreDAVContainerSyncTaskGroup setNextCTag:](v78, "setNextCTag:", v67);
      -[CoreDAVContainerSyncTaskGroup _getETags](v78, "_getETags");
      goto LABEL_78;
    }
    objc_storeStrong((id *)&v78->_nextSyncToken, v19);
    v9 = v74;
    v10 = v77;
    if (v20)
    {
      if (-[__CFString isEqualToString:](v20, "isEqualToString:", v78->_previousCTag))
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_loadWeakRetained((id *)&v78->super._accountInfoProvider);
        objc_msgSend(v68, "logHandleForAccountInfoProvider:", v69);
        v70 = objc_claimAutoreleasedReturnValue();

        if (v70 && os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          previousCTag = v78->_previousCTag;
          *(_DWORD *)buf = 138412546;
          v94 = v78;
          v95 = 2114;
          p_isa = previousCTag;
          _os_log_impl(&dword_209602000, v70, OS_LOG_TYPE_INFO, "%@: Finishing container sync early, as our cTag of %{public}@ says we're up to date", buf, 0x16u);
        }

        v86[0] = MEMORY[0x24BDAC760];
        v86[1] = 3221225472;
        v86[2] = __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke_81;
        v86[3] = &unk_24C1D9A40;
        v86[4] = v78;
        -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](v78, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v86);
        goto LABEL_79;
      }
      v73 = v78;
      v72 = v20;
    }
    else
    {
      v72 = CFSTR("ServerDoesNotSupportCTags");
      v73 = v78;
    }
    -[CoreDAVContainerSyncTaskGroup setNextCTag:](v73, "setNextCTag:", v72);
    -[CoreDAVContainerSyncTaskGroup _getETags](v78, "_getETags");
  }

LABEL_81:
}

void __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_QWORD *)(a1 + 40))
    v3 = *(const __CFString **)(a1 + 40);
  else
    v3 = CFSTR("ServerDoesNotSupportCTags");
  objc_msgSend(v2, "containerSyncTask:completedWithNewCTag:newSyncToken:addedOrModified:removed:error:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 0, 0, 0);

}

void __68__CoreDAVContainerSyncTaskGroup_propFindTask_parsedResponses_error___block_invoke_81(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerSyncTask:completedWithNewCTag:newSyncToken:addedOrModified:removed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), 0, 0, 0);

}

- (void)getTask:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  int phase;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  NSMutableArray *v24;
  NSMutableArray *localItemURLOrder;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  NSMutableSet *v44;
  __int16 v45;
  NSMutableArray *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  phase = self->_phase;
  if (phase == 6)
  {
    v12 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(v8, "appSpecificDataItemResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, 0);

    -[CoreDAVContainerSyncTaskGroup _getTask:finishedWithParsedContents:deletedItems:error:](self, "_getTask:finishedWithParsedContents:deletedItems:error:", v8, v14, 0, v10);
LABEL_16:

    goto LABEL_17;
  }
  if (phase != 5)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16 || !os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v17 = self->_phase;
    *(_DWORD *)buf = 67109120;
    LODWORD(v42) = v17;
    v18 = "CoreDAVGetTask finished in unexpected phase %d";
    v19 = v16;
    v20 = 8;
LABEL_14:
    _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
LABEL_15:

    goto LABEL_16;
  }
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
  {
    if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v8) & 1) != 0)
      goto LABEL_17;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v14, "logHandleForAccountInfoProvider:", v21);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16 || !os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    outstandingTasks = self->super._outstandingTasks;
    unsubmittedTasks = self->_unsubmittedTasks;
    *(_DWORD *)buf = 138412802;
    v42 = v8;
    v43 = 2112;
    v44 = outstandingTasks;
    v45 = 2112;
    v46 = unsubmittedTasks;
    v18 = "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@";
    v19 = v16;
    v20 = 32;
    goto LABEL_14;
  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  if (v10)
  {
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
  }
  else
  {
    v36 = v8;
    if (!self->_localItemURLOrder)
    {
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      localItemURLOrder = self->_localItemURLOrder;
      self->_localItemURLOrder = v24;

    }
    v35 = v9;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
    objc_msgSend(v34, "componentsSeparatedByString:", CFSTR(","));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          v31 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_msgSend(v31, "hasSuffix:", CFSTR("xbel")) & 1) == 0)
          {
            objc_msgSend(v31, "CDVStringByAppendingSlashIfNeeded");
            v32 = objc_claimAutoreleasedReturnValue();

            v31 = (id)v32;
          }
          -[NSURL CDVfixedURLByAppendingPathComponent:](self->_folderURL, "CDVfixedURLByAppendingPathComponent:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_localItemURLOrder, "addObject:", v33);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v28);
    }
    -[CoreDAVContainerSyncTaskGroup _getDataPayloads](self, "_getDataPayloads");

    v9 = v35;
    v8 = v36;
    v10 = 0;
  }
LABEL_17:

}

- (void)_getTask:(id)a3 finishedWithParsedContents:(id)a4 deletedItems:(id)a5 error:(id)a6
{
  CoreDAVContainerSyncTaskGroup *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  CoreDAVContainerSyncTaskGroup *v26;
  __int16 v27;
  NSMutableSet *v28;
  __int16 v29;
  NSMutableArray *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = (CoreDAVContainerSyncTaskGroup *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v10))
  {
    if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v10) & 1) != 0)
      goto LABEL_12;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      v26 = v10;
      v27 = 2112;
      v28 = outstandingTasks;
      v29 = 2112;
      v30 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

LABEL_11:
    goto LABEL_12;
  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v10);
  if (v13)
  {
    -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v13);
    goto LABEL_12;
  }
  -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containerSyncTask:retrievedAddedOrModifiedActions:removed:", self, v11, v12);
    goto LABEL_11;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v19, "logHandleForAccountInfoProvider:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_209602000, v21, OS_LOG_TYPE_INFO, "CoreDAVContainerSyncTaskGroup %@ finished its get task with no more outstanding tasks", buf, 0xCu);
  }

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __88__CoreDAVContainerSyncTaskGroup__getTask_finishedWithParsedContents_deletedItems_error___block_invoke;
  v22[3] = &unk_24C1D9AE0;
  v22[4] = self;
  v23 = v11;
  v24 = v12;
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v22);

LABEL_12:
}

void __88__CoreDAVContainerSyncTaskGroup__getTask_finishedWithParsedContents_deletedItems_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerSyncTask:completedWithNewCTag:newSyncToken:addedOrModified:removed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  id WeakRetained;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
    goto LABEL_15;
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  -[CoreDAVContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
  if (!-[NSMutableSet count](self->super._outstandingTasks, "count") && !self->super._isCancelling)
    -[CoreDAVContainerSyncTaskGroup _getCTag](self, "_getCTag");
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "syncPropPatchTask:parsedResponses:parentTaskGroup:completedWithError:", v8, v9, self, v10);

    if (v14)
    {

      v10 = 0;
      goto LABEL_15;
    }
    if (v10)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v10)
    goto LABEL_15;
LABEL_11:
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v15, "logHandleForAccountInfoProvider:", WeakRetained);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_209602000, v17, OS_LOG_TYPE_ERROR, "propPatchTask: %@ error: %@", (uint8_t *)&v18, 0x16u);
  }

  -[CoreDAVContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
LABEL_15:

}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSString)previousCTag
{
  return self->_previousCTag;
}

- (void)setPreviousCTag:(id)a3
{
  objc_storeStrong((id *)&self->_previousCTag, a3);
}

- (NSString)previousSyncToken
{
  return self->_previousSyncToken;
}

- (void)setPreviousSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_previousSyncToken, a3);
}

- (BOOL)useSyncCollection
{
  return self->_useSyncCollection;
}

- (void)setUseSyncCollection:(BOOL)a3
{
  self->_useSyncCollection = a3;
}

- (unint64_t)multiGetBatchSize
{
  return self->_multiGetBatchSize;
}

- (void)setMultiGetBatchSize:(unint64_t)a3
{
  self->_multiGetBatchSize = a3;
}

- (BOOL)useMultiGet
{
  return self->_useMultiGet;
}

- (void)setUseMultiGet:(BOOL)a3
{
  self->_useMultiGet = a3;
}

- (unint64_t)maxIndependentTasks
{
  return self->_maxIndependentTasks;
}

- (void)setMaxIndependentTasks:(unint64_t)a3
{
  self->_maxIndependentTasks = a3;
}

- (NSURL)addMemberURL
{
  return self->_addMemberURL;
}

- (void)setAddMemberURL:(id)a3
{
  objc_storeStrong((id *)&self->_addMemberURL, a3);
}

- (NSDictionary)bulkRequests
{
  return self->_bulkRequests;
}

- (void)setBulkRequests:(id)a3
{
  objc_storeStrong((id *)&self->_bulkRequests, a3);
}

- (NSString)bulkChangeCheckCTag
{
  return self->_bulkChangeCheckCTag;
}

- (void)setBulkChangeCheckCTag:(id)a3
{
  objc_storeStrong((id *)&self->_bulkChangeCheckCTag, a3);
}

- (BOOL)actionsOnly
{
  return self->_actionsOnly;
}

- (void)setActionsOnly:(BOOL)a3
{
  self->_actionsOnly = a3;
}

- (NSArray)localItemURLOrder
{
  return &self->_localItemURLOrder->super;
}

- (BOOL)ensureUpdatedCTag
{
  return self->_ensureUpdatedCTag;
}

- (void)setEnsureUpdatedCTag:(BOOL)a3
{
  self->_ensureUpdatedCTag = a3;
}

- (unint64_t)maxRetryOnUnexpectedSyncTokenChange
{
  return self->_maxRetryOnUnexpectedSyncTokenChange;
}

- (void)setMaxRetryOnUnexpectedSyncTokenChange:(unint64_t)a3
{
  self->_maxRetryOnUnexpectedSyncTokenChange = a3;
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (void)setNextCTag:(id)a3
{
  objc_storeStrong((id *)&self->_nextCTag, a3);
}

- (unint64_t)unexpectedEmptySyncReportResponseRetryAttemptCount
{
  return self->_unexpectedEmptySyncReportResponseRetryAttemptCount;
}

- (void)setUnexpectedEmptySyncReportResponseRetryAttemptCount:(unint64_t)a3
{
  self->_unexpectedEmptySyncReportResponseRetryAttemptCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationChangedURLs, 0);
  objc_storeStrong((id *)&self->_remainingHREFsToModDeleteActions, 0);
  objc_storeStrong((id *)&self->_remainingUUIDsToAddActions, 0);
  objc_storeStrong((id *)&self->_localItemURLOrder, 0);
  objc_storeStrong((id *)&self->_urlToETag, 0);
  objc_storeStrong((id *)&self->_syncReportDeletedURLs, 0);
  objc_storeStrong((id *)&self->_bulkChangeCheckCTag, 0);
  objc_storeStrong((id *)&self->_bulkRequests, 0);
  objc_storeStrong((id *)&self->_addMemberURL, 0);
  objc_storeStrong((id *)&self->_unsubmittedTasks, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_previousCTag, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end
