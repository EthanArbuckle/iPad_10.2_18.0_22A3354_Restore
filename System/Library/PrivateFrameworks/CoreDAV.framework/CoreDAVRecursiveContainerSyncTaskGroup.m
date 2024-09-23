@implementation CoreDAVRecursiveContainerSyncTaskGroup

- (CoreDAVRecursiveContainerSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousPTag:(id)a5 previousSyncToken:(id)a6 actions:(id)a7 syncItemOrder:(BOOL)a8 context:(id)a9 accountInfoProvider:(id)a10 taskManager:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  CoreDAVRecursiveContainerSyncTaskGroup *v21;
  CoreDAVRecursiveContainerSyncTaskGroup *v22;
  NSMutableArray *v23;
  NSMutableArray *unsubmittedTasks;
  void *v26;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  if (-[CoreDAVRecursiveContainerSyncTaskGroup isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 65, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

  }
  v33.receiver = self;
  v33.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  v21 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v33, sel_initWithAccountInfoProvider_taskManager_, v19, v20);
  v22 = v21;
  if (v21)
  {
    -[CoreDAVTaskGroup setContext:](v21, "setContext:", v18);
    objc_storeStrong((id *)&v22->_folderURL, a3);
    objc_storeStrong((id *)&v22->_previousCTag, a4);
    objc_storeStrong((id *)&v22->_previousPTag, a5);
    objc_storeStrong((id *)&v22->_previousSyncToken, a6);
    objc_storeStrong((id *)&v22->_actions, a7);
    v22->_multiGetBatchSize = 50;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    unsubmittedTasks = v22->_unsubmittedTasks;
    v22->_unsubmittedTasks = v23;

    v22->_syncItemOrder = a8;
  }

  return v22;
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

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recursiveContainerSyncTask:completedFullSyncWithNewCTag:newPTag:newSyncToken:error:", self, 0, 0, 0, v4);

  v6.receiver = self;
  v6.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  -[CoreDAVTaskGroup taskGroupWillCancelWithError:](&v6, sel_taskGroupWillCancelWithError_, v4);

}

- (void)_tearDownAllUnsubmittedTasks
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_unsubmittedTasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "finishCoreDAVTaskWithError:", v3, (_QWORD)v10);
        objc_msgSend(v9, "setDelegate:", 0);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_unsubmittedTasks, "removeAllObjects");
}

- (void)_foundChildrenOrder:(id)a3 inFolderWithURL:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *folderURLToChildrenURLOrder;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  NSMutableDictionary *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSMutableDictionary *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  folderURLToChildrenURLOrder = self->_folderURLToChildrenURLOrder;
  if (!folderURLToChildrenURLOrder)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_folderURLToChildrenURLOrder;
    self->_folderURLToChildrenURLOrder = v9;

    folderURLToChildrenURLOrder = self->_folderURLToChildrenURLOrder;
  }
  -[NSMutableDictionary objectForKey:](folderURLToChildrenURLOrder, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v12, "logHandleForAccountInfoProvider:", WeakRetained);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = self->_folderURLToChildrenURLOrder;
      v16 = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_INFO, "Got children order %@ for folder with url %@, but I already knew about that (I had %@)", (uint8_t *)&v16, 0x20u);
    }

  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_folderURLToChildrenURLOrder, "setObject:forKey:", v6, v7);
  }

}

- (void)bailWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CoreDAVRecursiveContainerSyncTaskGroup _tearDownAllUnsubmittedTasks](self, "_tearDownAllUnsubmittedTasks");
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  -[CoreDAVTaskGroup bailWithError:](&v5, sel_bailWithError_, v4);

}

- (void)cancelTaskGroup
{
  objc_super v3;

  -[CoreDAVRecursiveContainerSyncTaskGroup _tearDownAllUnsubmittedTasks](self, "_tearDownAllUnsubmittedTasks");
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVRecursiveContainerSyncTaskGroup;
  -[CoreDAVTaskGroup cancelTaskGroup](&v3, sel_cancelTaskGroup);
}

- (unint64_t)_submitTasks
{
  unint64_t v2;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CoreDAVRecursiveContainerSyncTaskGroup *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (self->super._isCancelling)
    return 0;
  v4 = (void *)-[NSMutableArray copy](self->_unsubmittedTasks, "copy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v6)
  {
    v7 = v6;
    v2 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      v20 = v2;
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v10);
        -[NSMutableArray removeObject:](self->_unsubmittedTasks, "removeObject:", v10);
        WeakRetained = objc_loadWeakRetained((id *)&self->super._taskManager);
        objc_msgSend(WeakRetained, "submitQueuedCoreDAVTask:", v10);

      }
      v2 = v20 + v7;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v7);
  }
  else
  {
    v2 = 0;
  }

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v12, "logHandleForAccountInfoProvider:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSMutableSet count](self->super._outstandingTasks, "count");
      *(_DWORD *)buf = 138544130;
      v26 = v17;
      v27 = 2048;
      v28 = self;
      v29 = 2048;
      v30 = v2;
      v31 = 2048;
      v32 = v18;
      _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Submitted %lu queued tasks, %lu total tasks queued.", buf, 0x2Au);

    }
  }

  return v2;
}

- (void)_taskGroupSuccessfullyFinishedWithContents:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *nextCTag;
  NSString *nextPTag;
  void *v12;
  void *v13;
  NSString *previousCTag;
  NSString *previousPTag;
  NSString *nextSyncToken;
  uint8_t buf[4];
  CoreDAVRecursiveContainerSyncTaskGroup *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_INFO, "Task group %@ finished", buf, 0xCu);
  }

  -[CoreDAVTaskGroup delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  nextCTag = self->_nextCTag;
  if (!nextCTag)
    nextCTag = self->_previousCTag;
  nextPTag = self->_nextPTag;
  if (!nextPTag)
    nextPTag = self->_previousPTag;
  objc_msgSend(v8, "recursiveContainerSyncTask:completedSyncOfFolderWithURL:newCTag:newPTag:addedOrModified:removed:error:", self, self->_folderURL, nextCTag, nextPTag, v4, 0, 0);

  -[CoreDAVTaskGroup delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  previousCTag = self->_nextCTag;
  if (!previousCTag)
    previousCTag = self->_previousCTag;
  previousPTag = self->_nextPTag;
  if (!previousPTag)
    previousPTag = self->_previousPTag;
  nextSyncToken = self->_nextSyncToken;
  if (!nextSyncToken)
    nextSyncToken = self->_previousSyncToken;
  objc_msgSend(v12, "recursiveContainerSyncTask:completedFullSyncWithNewCTag:newPTag:newSyncToken:error:", self, previousCTag, previousPTag, nextSyncToken, 0);

}

- (void)_pushActions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CoreDAVDeleteTask *v11;
  CoreDAVPutTask *v12;
  void *v13;
  void *v14;
  void *v15;
  CoreDAVPutTask *v16;
  id v17;
  void *v18;
  id WeakRetained;
  id v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  CoreDAVMoveTask *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSArray *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  self->_phase = 0;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 170, CFSTR("We shouldn't start pushing actions if we have outstanding tasks: %@"), self);

  }
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_actions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v43;
    v39 = *(_QWORD *)v43;
    v37 = v4;
    do
    {
      v8 = 0;
      v40 = v6;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
        switch(objc_msgSend(v9, "action"))
        {
          case 0u:
          case 1u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dataPayload");
            v11 = (CoreDAVDeleteTask *)objc_claimAutoreleasedReturnValue();
            v12 = [CoreDAVPutTask alloc];
            -[CoreDAVRecursiveContainerSyncTaskGroup dataContentType](self, "dataContentType");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "serverID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "syncKey");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v12, "initWithDataPayload:dataContentType:atURL:previousETag:", v11, v13, v14, v15);

            -[CoreDAVActionBackedTask setBackingAction:](v16, "setBackingAction:", v9);
            if (self->_syncItemOrder)
            {
              v17 = v9;
              -[CoreDAVPostOrPutTask setAbsoluteOrder:](v16, "setAbsoluteOrder:", objc_msgSend(v17, "absoluteOrder"));
              objc_msgSend(v17, "priorURL");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              -[CoreDAVPostOrPutTask setPriorOrderedURL:](v16, "setPriorOrderedURL:", v18);
            }
            -[CoreDAVTask setDelegate:](v16, "setDelegate:", self);
            WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[CoreDAVTask setAccountInfoProvider:](v16, "setAccountInfoProvider:", WeakRetained);

            -[CoreDAVTask setTimeoutInterval:](v16, "setTimeoutInterval:", self->super._timeoutInterval);
            v4 = v37;
            objc_msgSend(v37, "addObject:", v16);

            v7 = v39;
            v6 = v40;
            break;
          case 2u:
          case 5u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[CoreDAVTask initWithURL:]([CoreDAVDeleteTask alloc], "initWithURL:", v10);
            -[CoreDAVActionBackedTask setBackingAction:](v11, "setBackingAction:", v9);
            -[CoreDAVTask setDelegate:](v11, "setDelegate:", self);
            v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[CoreDAVTask setAccountInfoProvider:](v11, "setAccountInfoProvider:", v20);

            -[CoreDAVTask setTimeoutInterval:](v11, "setTimeoutInterval:", self->super._timeoutInterval);
            v21 = v38;
            goto LABEL_22;
          case 3u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (CoreDAVDeleteTask *)objc_msgSend(v10, "copyMkcolTask");
            if (self->_syncItemOrder)
            {
              v24 = v9;
              -[CoreDAVDeleteTask setAbsoluteOrder:](v11, "setAbsoluteOrder:", objc_msgSend(v24, "absoluteOrder"));
              objc_msgSend(v24, "priorURL");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v40;
              -[CoreDAVDeleteTask setPriorOrderedURL:](v11, "setPriorOrderedURL:", v25);

            }
            goto LABEL_21;
          case 4u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (CoreDAVDeleteTask *)objc_msgSend(v10, "copyPropPatchTask");
            if (self->_syncItemOrder)
            {
              v26 = v9;
              -[CoreDAVDeleteTask setAbsoluteOrder:](v11, "setAbsoluteOrder:", objc_msgSend(v26, "absoluteOrder"));
              objc_msgSend(v26, "priorURL");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              -[CoreDAVDeleteTask setPriorOrderedURL:](v11, "setPriorOrderedURL:", v27);
              v6 = v40;
            }
LABEL_21:
            -[CoreDAVActionBackedTask setBackingAction:](v11, "setBackingAction:", v9);
            -[CoreDAVTask setDelegate:](v11, "setDelegate:", self);
            v28 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[CoreDAVTask setAccountInfoProvider:](v11, "setAccountInfoProvider:", v28);

            -[CoreDAVTask setTimeoutInterval:](v11, "setTimeoutInterval:", self->super._timeoutInterval);
            v21 = v4;
LABEL_22:
            objc_msgSend(v21, "addObject:", v11);
            break;
          case 6u:
            objc_msgSend(v9, "context");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = [CoreDAVMoveTask alloc];
            objc_msgSend(v10, "sourceURL");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "destinationURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[CoreDAVCopyOrMoveTask initWithSourceURL:destinationURL:andOverwrite:](v29, "initWithSourceURL:destinationURL:andOverwrite:", v30, v31, 1);

            if (self->_syncItemOrder)
            {
              objc_msgSend(v9, "priorURL");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVDeleteTask setPriorOrderedURL:](v11, "setPriorOrderedURL:", v32);

            }
            -[CoreDAVTask setDelegate:](v11, "setDelegate:", self);
            v33 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[CoreDAVTask setAccountInfoProvider:](v11, "setAccountInfoProvider:", v33);

            -[CoreDAVTask setTimeoutInterval:](v11, "setTimeoutInterval:", self->super._timeoutInterval);
            objc_msgSend(v36, "addObject:", v11);
            v7 = v39;
            break;
          default:
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v10, "logHandleForAccountInfoProvider:", v22);
            v11 = (CoreDAVDeleteTask *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              v11 = v11;
              if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_ERROR))
              {
                v23 = objc_msgSend(v9, "action");
                *(_DWORD *)buf = 67109120;
                v47 = v23;
                _os_log_impl(&dword_209602000, &v11->super.super.super, OS_LOG_TYPE_ERROR, "Don't know how to perform action %d, skipping this action", buf, 8u);
              }

            }
            break;
        }

        ++v8;
      }
      while (v6 != v8);
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      v6 = v34;
    }
    while (v34);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_6);
  -[NSMutableArray addObjectsFromArray:](self->_unsubmittedTasks, "addObjectsFromArray:", v38);
  -[NSMutableArray addObjectsFromArray:](self->_unsubmittedTasks, "addObjectsFromArray:", v4);
  -[NSMutableArray addObjectsFromArray:](self->_unsubmittedTasks, "addObjectsFromArray:", v36);
  -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");

}

uint64_t __54__CoreDAVRecursiveContainerSyncTaskGroup__pushActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v7, "pathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 >= v11)
  {
    if (v9 > v11)
    {
      v12 = 1;
    }
    else
    {
      v13 = objc_msgSend(v4, "absoluteOrder");
      v14 = objc_msgSend(v5, "absoluteOrder");
      if (v13 < v14)
        v12 = -1;
      else
        v12 = v13 > v14;
    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (void)_getTopFolderTags
{
  CoreDAVPropFindTask *v4;
  id WeakRetained;
  void *v6;
  id v7;

  if (self->_preflightCTag)
  {
    self->_phase = 1;
    if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 321, CFSTR("We shouldn't start grabbing the folder attributes if we have outstanding tasks: %@"), self);

    }
    v7 = -[CoreDAVRecursiveContainerSyncTaskGroup _copyContainerParserMappings](self, "_copyContainerParserMappings");
    v4 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:]([CoreDAVPropFindTask alloc], "initWithPropertiesToFind:atURL:withDepth:", v7, self->_folderURL, 2);
    -[CoreDAVTask setDelegate:](v4, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[CoreDAVTask setAccountInfoProvider:](v4, "setAccountInfoProvider:", WeakRetained);

    -[CoreDAVTask setTimeoutInterval:](v4, "setTimeoutInterval:", self->super._timeoutInterval);
    -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v4);
    -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");

  }
  else
  {
    -[CoreDAVRecursiveContainerSyncTaskGroup _getItemTags](self, "_getItemTags");
  }
}

- (void)_getItemTags
{
  CoreDAVItemParserMapping *v4;
  CoreDAVItemParserMapping *v5;
  id v6;
  CoreDAVSyncReportTask *v7;
  id WeakRetained;
  void *v9;
  CoreDAVItemParserMapping *v10;

  self->_phase = 2;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 341, CFSTR("We shouldn't start grabbing eTags if we have outstanding tasks: %@"), self);

  }
  v10 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v10, "setNameSpace:", CFSTR("DAV:"));
  -[CoreDAVItemParserMapping setName:](v10, "setName:", CFSTR("getetag"));
  -[CoreDAVItemParserMapping setParseClass:](v10, "setParseClass:", objc_opt_class());
  v4 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v4, "setNameSpace:", CFSTR("urn:mobileme:davservices"));
  -[CoreDAVItemParserMapping setName:](v4, "setName:", CFSTR("propertytag"));
  -[CoreDAVItemParserMapping setParseClass:](v4, "setParseClass:", objc_opt_class());
  v5 = objc_alloc_init(CoreDAVItemParserMapping);
  -[CoreDAVItemParserMapping setNameSpace:](v5, "setNameSpace:", CFSTR("DAV:"));
  -[CoreDAVItemParserMapping setName:](v5, "setName:", CFSTR("resourcetype"));
  -[CoreDAVItemParserMapping setParseClass:](v5, "setParseClass:", objc_opt_class());
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v6, "addObject:", v10);
  objc_msgSend(v6, "addObject:", v5);
  objc_msgSend(v6, "addObject:", v4);
  v7 = -[CoreDAVSyncReportTask initWithPropertiesToFind:atURL:withDepth:previousSyncToken:]([CoreDAVSyncReportTask alloc], "initWithPropertiesToFind:atURL:withDepth:previousSyncToken:", v6, self->_folderURL, 1, self->_previousSyncToken);
  -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v7);
  -[CoreDAVTask setDelegate:](v7, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVTask setAccountInfoProvider:](v7, "setAccountInfoProvider:", WeakRetained);

  -[CoreDAVTask setTimeoutInterval:](v7, "setTimeoutInterval:", self->super._timeoutInterval);
  -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");

}

- (void)_getDataPayloads
{
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *childCollectionURL;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  uint64_t v55;
  void *v56;
  void *v57;
  id WeakRetained;
  NSObject *v59;
  NSMutableDictionary *leafURLToETag;
  NSMutableArray *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t jj;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  SEL v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  NSMutableArray *obj;
  id obja;
  id objb;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  uint8_t v136[128];
  uint8_t buf[4];
  NSMutableDictionary *v138;
  __int16 v139;
  NSMutableArray *v140;
  __int16 v141;
  id v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  self->_phase = 3;
  if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 375, CFSTR("We shouldn't start getting vCards if we have outstanding tasks: %@"), self);

  }
  v89 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v5 = 0x24BDBC000uLL;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v102 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[CoreDAVTaskGroup delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_leafURLToETag, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "copyLocalETagsForURLs:", v9);

  v99 = (void *)v10;
  if (v10)
  {
    v85 = a2;
    v90 = v6;
    if (-[NSMutableArray count](self->_childCollectionURL, "count"))
    {
      v86 = v4;
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v131 = 0u;
      v132 = 0u;
      v133 = 0u;
      v134 = 0u;
      obj = self->_childCollectionURL;
      v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
      if (v100)
      {
        v95 = *(_QWORD *)v132;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v132 != v95)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
            v14 = (void *)MEMORY[0x20BD1136C]();
            objc_msgSend(v13, "pathComponents");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");
            while (1)
            {

              if (objc_msgSend(v11, "count") > v16)
                break;
              v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v11, "addObject:", v15);
            }
            objc_msgSend(v11, "objectAtIndex:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v13);

            objc_autoreleasePoolPop(v14);
          }
          v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
        }
        while (v100);
      }

      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      childCollectionURL = self->_childCollectionURL;
      self->_childCollectionURL = v18;

      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v20 = v11;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v128;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v128 != v23)
              objc_enumerationMutation(v20);
            -[NSMutableArray addObjectsFromArray:](self->_childCollectionURL, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * j));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
        }
        while (v22);
      }
      v96 = v20;

      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v25 = self->_childCollectionURL;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
      if (v26)
      {
        v27 = v26;
        v101 = 0;
        v28 = *(_QWORD *)v124;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v124 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * k);
            if (objc_msgSend(v102, "count") >= self->_multiGetBatchSize)
            {
              objc_msgSend(v90, "addObject:", v102);
              v32 = objc_alloc_init(MEMORY[0x24BDBCEF0]);

              v31 = v32;
            }
            else
            {
              v31 = v102;
            }
            v102 = v31;
            objc_msgSend(v31, "addObject:", v30);
            v5 = 0x24BDBC000;
          }
          v101 += v27;
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
        }
        while (v27);
      }
      else
      {
        v101 = 0;
      }

      v4 = v86;
      v6 = v90;
    }
    else
    {
      v101 = 0;
    }
    objc_msgSend(v6, "addObject:", v102);
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    -[NSMutableDictionary allKeys](self->_leafURLToETag, "allKeys");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v119, v145, 16);
    if (v34)
    {
      v35 = v34;
      v97 = *(_QWORD *)v120;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          v37 = v4;
          if (*(_QWORD *)v120 != v97)
            objc_enumerationMutation(obja);
          v38 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * m);
          -[NSMutableDictionary objectForKey:](self->_leafURLToETag, "objectForKey:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "objectForKey:", v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "isEqualToString:", v39);

          if ((v41 & 1) != 0)
          {
            v4 = v37;
            v5 = 0x24BDBC000;
          }
          else
          {
            v4 = v37;
            if (objc_msgSend(v37, "count") >= self->_multiGetBatchSize)
            {
              objc_msgSend(v89, "addObject:", v37);
              v42 = objc_alloc_init(MEMORY[0x24BDBCEF0]);

              v4 = v42;
            }
            v5 = 0x24BDBC000uLL;
            objc_msgSend(v4, "addObject:", v38);
            ++v101;
          }

        }
        v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v119, v145, 16);
      }
      while (v35);
    }

    v87 = v4;
    objc_msgSend(v89, "addObject:", v4);
    objc_msgSend(v7, "unionSet:", self->_syncReportDeletedURLs);
    -[CoreDAVRecursiveContainerSyncTaskGroup previousSyncToken](self, "previousSyncToken");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      v44 = objc_alloc_init(*(Class *)(v5 + 3768));
      objc_msgSend(v44, "addObject:", self->_folderURL);
      objc_msgSend(v44, "addObjectsFromArray:", self->_childCollectionURL);
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->_childCollectionURL);
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v88 = v44;
      objb = (id)objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v115, v144, 16);
      if (objb)
      {
        v91 = *(_QWORD *)v116;
        do
        {
          v46 = 0;
          do
          {
            if (*(_QWORD *)v116 != v91)
              objc_enumerationMutation(v88);
            v98 = v46;
            v47 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v46);
            -[CoreDAVTaskGroup delegate](self, "delegate");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend(v48, "copyAllLocalURLsInFolderWithURL:", v47);

            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v50 = v49;
            v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v111, v143, 16);
            if (v51)
            {
              v52 = v51;
              v53 = *(_QWORD *)v112;
              do
              {
                for (n = 0; n != v52; ++n)
                {
                  if (*(_QWORD *)v112 != v53)
                    objc_enumerationMutation(v50);
                  v55 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * n);
                  if ((objc_msgSend(v45, "containsObject:", v55) & 1) == 0)
                  {
                    -[NSMutableDictionary objectForKey:](self->_leafURLToETag, "objectForKey:", v55);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v56)
                      objc_msgSend(v7, "addObject:", v55);
                  }
                }
                v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v111, v143, 16);
              }
              while (v52);
            }

            v46 = v98 + 1;
          }
          while ((id)(v98 + 1) != objb);
          objb = (id)objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v115, v144, 16);
        }
        while (objb);
      }

    }
    v6 = v90;
    if (objc_msgSend(v7, "count"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v57, "logHandleForAccountInfoProvider:", WeakRetained);
      v59 = objc_claimAutoreleasedReturnValue();

      if (v59 && os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        leafURLToETag = self->_leafURLToETag;
        v61 = self->_childCollectionURL;
        *(_DWORD *)buf = 138412802;
        v138 = leafURLToETag;
        v139 = 2112;
        v140 = v61;
        v141 = 2112;
        v142 = v7;
        _os_log_impl(&dword_209602000, v59, OS_LOG_TYPE_INFO, "_leafURLToETag is %@, _childCollectionURL is %@, and the db said it has these extras %@", buf, 0x20u);
      }

      -[CoreDAVTaskGroup delegate](self, "delegate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "recursiveContainerSyncTask:retrievedAddedOrModifiedActions:removed:", self, 0, v7);

    }
    if (v101)
    {
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v63 = v90;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v108;
        do
        {
          for (ii = 0; ii != v65; ++ii)
          {
            if (*(_QWORD *)v108 != v66)
              objc_enumerationMutation(v63);
            v68 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * ii);
            if (objc_msgSend(v68, "count"))
            {
              v69 = -[CoreDAVRecursiveContainerSyncTaskGroup copyFolderMultiGetTaskWithURLs:](self, "copyFolderMultiGetTaskWithURLs:", v68);
              if (!v69)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", v85, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 494, CFSTR("Couldn't create folderMultiGetTask, things will go poorly"));

              }
              objc_msgSend(v69, "setDelegate:", self);
              v70 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              objc_msgSend(v69, "setAccountInfoProvider:", v70);

              objc_msgSend(v69, "setTimeoutInterval:", self->super._timeoutInterval);
              -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v69);

            }
          }
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v107, v136, 16);
        }
        while (v65);
      }

      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v72 = v89;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v104;
        do
        {
          for (jj = 0; jj != v74; ++jj)
          {
            if (*(_QWORD *)v104 != v75)
              objc_enumerationMutation(v72);
            v77 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * jj);
            if (objc_msgSend(v77, "count"))
            {
              v78 = -[CoreDAVRecursiveContainerSyncTaskGroup copyMultiGetTaskWithURLs:](self, "copyMultiGetTaskWithURLs:", v77);
              if (!v78)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", v85, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 504, CFSTR("Couldn't create multiGetTask, things will go poorly"));

              }
              objc_msgSend(v78, "setDelegate:", self);
              v79 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              objc_msgSend(v78, "setAccountInfoProvider:", v79);

              objc_msgSend(v78, "setTimeoutInterval:", self->super._timeoutInterval);
              -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v78);

            }
          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v103, v135, 16);
        }
        while (v74);
      }

      -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
      v4 = v87;
      v6 = v90;
    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v81, "logHandleForAccountInfoProvider:", v82);
      v83 = objc_claimAutoreleasedReturnValue();

      if (v83 && os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209602000, v83, OS_LOG_TYPE_DEBUG, "There are no server side items to grab, so I'm outta here", buf, 2u);
      }

      -[CoreDAVRecursiveContainerSyncTaskGroup _taskGroupSuccessfullyFinishedWithContents:](self, "_taskGroupSuccessfullyFinishedWithContents:", 0);
      v4 = v87;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v33);

  }
}

- (void)startTaskGroup
{
  if (-[NSArray count](self->_actions, "count"))
    -[CoreDAVRecursiveContainerSyncTaskGroup _pushActions](self, "_pushActions");
  else
    -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
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
  id WeakRetained;
  NSObject *v13;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int phase;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  id v32;
  __int16 v33;
  NSMutableSet *v34;
  __int16 v35;
  NSMutableArray *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSMutableSet *)a4;
  v10 = (NSMutableArray *)a5;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
  {
    if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v8) & 1) != 0)
      goto LABEL_31;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    -[NSMutableArray logHandleForAccountInfoProvider:](v11, "logHandleForAccountInfoProvider:", WeakRetained);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      v31 = 138412802;
      v32 = v8;
      v33 = 2112;
      v34 = outstandingTasks;
      v35 = 2112;
      v36 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v13, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v31, 0x20u);
    }

LABEL_30:
    goto LABEL_31;
  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  if (!self->_phase)
  {
    v11 = v10;
    if (-[CoreDAVRecursiveContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v11))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138412802;
        v32 = v8;
        v33 = 2114;
        v34 = v9;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_209602000, v18, OS_LOG_TYPE_DEFAULT, "putTask:%@ completedWithNewETag:%{public}@ error:%@ Ignoring", (uint8_t *)&v31, 0x20u);
      }

      v10 = 0;
      v9 = 0;
      if (!v11)
        goto LABEL_23;
    }
    else
    {
      v10 = v11;
      if (!v11)
        goto LABEL_23;
    }
    if (!v10)
    {
      -[CoreDAVTaskGroup delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "url");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestDataPayload");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "notePutToURL:withDataPayload:finishedWithIgnoredError:", v25, v26, v11);

      goto LABEL_25;
    }
LABEL_23:
    if (v10)
    {
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
LABEL_27:
      if (!self->super._isCancelling)
      {
        -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
        if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
          -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
      }
      goto LABEL_30;
    }
LABEL_25:
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "url");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "setLocalETag:forItemWithURL:", v9, v28);

    if ((v29 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 1, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v30);

    }
    goto LABEL_27;
  }
  if (v10)
  {
    -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v19, "logHandleForAccountInfoProvider:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      phase = self->_phase;
      v31 = 67109120;
      LODWORD(v32) = phase;
      _os_log_impl(&dword_209602000, v21, OS_LOG_TYPE_ERROR, "Got a successful put task response, but I'm in phase %d.  What gives?", (uint8_t *)&v31, 8u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v23);

    v10 = 0;
  }
LABEL_31:

}

- (void)_postTask:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  NSMutableSet *v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  int phase;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  NSMutableSet *v24;
  __int16 v25;
  NSMutableArray *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSMutableSet *)a4;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    if (self->_phase)
    {
      if (!v7)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          phase = self->_phase;
          v21 = 67109120;
          LODWORD(v22) = phase;
          _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_ERROR, "Got a successful put task response, but I'm in phase %d.  What gives?", (uint8_t *)&v21, 8u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v12);

LABEL_22:
        v7 = 0;
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    if (-[CoreDAVRecursiveContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v7))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v18, "logHandleForAccountInfoProvider:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v6;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_209602000, v20, OS_LOG_TYPE_DEFAULT, "postTask:%@ error:%@ Ignoring", (uint8_t *)&v21, 0x16u);
      }

    }
    else if (v7)
    {
LABEL_19:
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
      goto LABEL_23;
    }
    -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
    if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
      -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
    goto LABEL_22;
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
      v21 = 138412802;
      v22 = v6;
      v23 = 2112;
      v24 = outstandingTasks;
      v25 = 2112;
      v26 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v21, 0x20u);
    }

  }
LABEL_23:

}

- (void)_folderModTask:(id)a3 parsedPropStats:(id)a4 error:(id)a5
{
  id v7;
  NSMutableSet *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v14;
  uint64_t v15;
  void *v16;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id WeakRetained;
  NSObject *v25;
  int phase;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  int v38;
  id v39;
  __int16 v40;
  NSMutableSet *v41;
  __int16 v42;
  NSMutableArray *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (NSMutableSet *)a5;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v7))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v7);
    if (self->_phase)
    {
      if (v8)
      {
LABEL_4:
        -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v8);
        goto LABEL_42;
      }
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v23, "logHandleForAccountInfoProvider:", WeakRetained);
      v25 = objc_claimAutoreleasedReturnValue();

      if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        phase = self->_phase;
        v38 = 67109120;
        LODWORD(v39) = phase;
        _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_ERROR, "Got a successful put task response, but I'm in phase %d.  What gives?", (uint8_t *)&v38, 8u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v27);

LABEL_41:
      v8 = 0;
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableSet domain](v8, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")) & 1) != 0)
      {
        v15 = -[NSMutableSet code](v8, "code");

        if (v15 == 404)
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          p_accountInfoProvider = &self->super._accountInfoProvider;
          v18 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v16, "logHandleForAccountInfoProvider:", v18);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v38 = 138412290;
            v39 = v7;
            _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_INFO, "Got a 404 on a proppatch, replaying as mkcol.  Proppatch task was %@", (uint8_t *)&v38, 0xCu);
          }

          objc_msgSend(v7, "backingAction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "copyMkcolTask");
LABEL_29:
          v33 = v22;
          if (self->_syncItemOrder)
          {
            v34 = v20;
            -[NSObject setAbsoluteOrder:](v33, "setAbsoluteOrder:", objc_msgSend(v34, "absoluteOrder"));
            objc_msgSend(v34, "priorURL");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject setPriorOrderedURL:](v33, "setPriorOrderedURL:", v35);
          }
          -[NSObject setBackingAction:](v33, "setBackingAction:", v20);
          -[NSObject setDelegate:](v33, "setDelegate:", self);
          v36 = objc_loadWeakRetained((id *)p_accountInfoProvider);
          -[NSObject setAccountInfoProvider:](v33, "setAccountInfoProvider:", v36);

          -[NSObject setTimeoutInterval:](v33, "setTimeoutInterval:", self->super._timeoutInterval);
          -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v33);

          goto LABEL_38;
        }
      }
      else
      {

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableSet domain](v8, "domain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")) & 1) != 0)
      {
        v29 = -[NSMutableSet code](v8, "code");

        if (v29 == 405)
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          p_accountInfoProvider = &self->super._accountInfoProvider;
          v31 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v30, "logHandleForAccountInfoProvider:", v31);
          v32 = objc_claimAutoreleasedReturnValue();

          if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v38 = 138412290;
            v39 = v7;
            _os_log_impl(&dword_209602000, v32, OS_LOG_TYPE_INFO, "Got a 405 on a mkcol, replaying as proppatch.  Mkcol task was %@", (uint8_t *)&v38, 0xCu);
          }

          objc_msgSend(v7, "backingAction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "copyPropPatchTask");
          goto LABEL_29;
        }
      }
      else
      {

      }
    }
    if (!-[CoreDAVRecursiveContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v8))
    {
      if (v8)
        goto LABEL_4;
      goto LABEL_39;
    }
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v21, "logHandleForAccountInfoProvider:", v37);
    v33 = objc_claimAutoreleasedReturnValue();

    if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412546;
      v39 = v7;
      v40 = 2112;
      v41 = v8;
      _os_log_impl(&dword_209602000, v33, OS_LOG_TYPE_DEFAULT, "folderModTask:%@ error:%@ Ignoring", (uint8_t *)&v38, 0x16u);
    }
    v20 = v8;
LABEL_38:

LABEL_39:
    -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
    if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
      -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
    goto LABEL_41;
  }
  if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v7) & 1) == 0)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v9, "logHandleForAccountInfoProvider:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      v38 = 138412802;
      v39 = v7;
      v40 = 2112;
      v41 = outstandingTasks;
      v42 = 2112;
      v43 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v38, 0x20u);
    }

  }
LABEL_42:

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CoreDAVRecursiveContainerSyncTaskGroup _postTask:didFinishWithError:](self, "_postTask:didFinishWithError:", v6, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CoreDAVRecursiveContainerSyncTaskGroup _syncReportTask:didFinishWithError:](self, "_syncReportTask:didFinishWithError:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "parsedContents");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deletedURLs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVRecursiveContainerSyncTaskGroup _getTask:finishedWithParsedContents:deletedItems:error:](self, "_getTask:finishedWithParsedContents:deletedItems:error:", v6, v8, v9, v7);

      }
      else
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
        v11 = objc_claimAutoreleasedReturnValue();

        if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = 138412290;
          v13 = v6;
          _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_ERROR, "Got a task completion invocation for a task I don't grok, %@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
  }

}

- (void)moveTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v7))
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v7);
  v9 = v8;
  v10 = v9;
  if (-[CoreDAVRecursiveContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v9))
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "code");
        objc_msgSend(v7, "url");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v56 = v7;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v59 = v15;
        v60 = 2048;
        v61 = v16;
        v62 = 2112;
        v63 = v18;
        _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_ERROR, "Received a Whitelisted Error [Domain:%@ Code:%ld] For Move task %@ completion. Not a Fatal Error", buf, 0x20u);

        v7 = v56;
      }

    }
    v10 = 0;
  }
  if (v9 && !v10)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v19, "logHandleForAccountInfoProvider:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "url");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v9;
        v60 = 2112;
        v61 = (uint64_t)v24;
        _os_log_impl(&dword_209602000, v22, OS_LOG_TYPE_INFO, "Received a Whitelisted Error [%@] For Move task %@ completion .Calling delegate method with original error", buf, 0x16u);

      }
    }

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0)
      goto LABEL_31;
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destinationURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v31 = v28;
    v32 = v29;
    v33 = v9;
LABEL_17:
    objc_msgSend(v30, "moveTaskFromURL:toURL:finishedWithIgnoredError:", v31, v32, v33);

LABEL_31:
    if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v50, "logHandleForAccountInfoProvider:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        v53 = v52;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "url");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "lastPathComponent");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v59 = v55;
          _os_log_impl(&dword_209602000, v53, OS_LOG_TYPE_INFO, "Move Task For ServerID %@", buf, 0xCu);

        }
      }

      -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
    }
    goto LABEL_37;
  }
  if (!v10)
  {
    if (v9)
      goto LABEL_31;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v42, "logHandleForAccountInfoProvider:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = v44;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "url");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v47;
        _os_log_impl(&dword_209602000, v45, OS_LOG_TYPE_INFO, "Move Task For ServerID %@", buf, 0xCu);

      }
    }

    -[CoreDAVTaskGroup delegate](self, "delegate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_opt_respondsToSelector();

    if ((v49 & 1) == 0)
      goto LABEL_31;
    -[CoreDAVTaskGroup delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destinationURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v31 = v28;
    v32 = v29;
    v33 = 0;
    goto LABEL_17;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v34, "logHandleForAccountInfoProvider:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = v36;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "domain");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v9, "code");
      objc_msgSend(v7, "url");
      v57 = v7;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastPathComponent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v59 = v38;
      v60 = 2048;
      v61 = v39;
      v62 = 2112;
      v63 = v41;
      _os_log_impl(&dword_209602000, v37, OS_LOG_TYPE_ERROR, "Received a Fatal Error [Domain:%@ Code:%ld] For Move task %@ completion. Bailing task-group with FatalError", buf, 0x20u);

      v7 = v57;
    }

  }
  -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
LABEL_37:

}

- (void)deleteTask:(id)a3 completedWithError:(id)a4
{
  id v6;
  NSMutableSet *v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v16;
  id v17;
  NSObject *v18;
  int phase;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  NSMutableSet *v24;
  __int16 v25;
  NSMutableArray *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSMutableSet *)a4;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    if (-[CoreDAVRecursiveContainerSyncTaskGroup isWhitelistedError:](self, "isWhitelistedError:", v7))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v6;
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_DEFAULT, "deleteTask:%@ completedWithError:%@ Ignoring", (uint8_t *)&v21, 0x16u);
      }

    }
    else if (v7)
    {
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
      goto LABEL_22;
    }
    if (self->_phase)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        phase = self->_phase;
        v21 = 67109120;
        LODWORD(v22) = phase;
        _os_log_impl(&dword_209602000, v18, OS_LOG_TYPE_ERROR, "Got a successful delete task response, but I'm in phase %d.  What gives?", (uint8_t *)&v21, 8u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v20);

    }
    else
    {
      -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
      if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
        -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
    }
    v7 = 0;
  }
  else if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v6) & 1) == 0)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v11, "logHandleForAccountInfoProvider:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      v21 = 138412802;
      v22 = v6;
      v23 = 2112;
      v24 = outstandingTasks;
      v25 = 2112;
      v26 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v13, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", (uint8_t *)&v21, 0x20u);
    }

  }
LABEL_22:

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
  NSMutableDictionary *v13;
  NSMutableDictionary *leafURLToETag;
  NSMutableArray *v15;
  NSMutableArray *childCollectionURL;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSMutableSet *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  id WeakRetained;
  NSObject *v39;
  void *v40;
  NSMutableSet *syncReportDeletedURLs;
  NSMutableSet *v42;
  NSMutableSet *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  CoreDAVRecursiveContainerSyncTaskGroup *v48;
  NSString *nextSyncToken;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  CoreDAVRecursiveContainerSyncTaskGroup *v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  NSMutableSet *v66;
  __int16 v67;
  NSMutableArray *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v55 = self;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    if (self->_phase == 2)
    {
      if (objc_msgSend(v6, "wasInvalidSyncToken"))
      {
        -[CoreDAVRecursiveContainerSyncTaskGroup setPreviousSyncToken:](self, "setPreviousSyncToken:", 0);
        -[CoreDAVRecursiveContainerSyncTaskGroup _getTopFolderTags](self, "_getTopFolderTags");
      }
      else if (v7)
      {
        -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v7);
      }
      else
      {
        if (!self->_leafURLToETag)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          leafURLToETag = self->_leafURLToETag;
          self->_leafURLToETag = v13;

        }
        if (!self->_childCollectionURL)
        {
          v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
          childCollectionURL = self->_childCollectionURL;
          self->_childCollectionURL = v15;

        }
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v54 = v6;
        objc_msgSend(v6, "multiStatus", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "responses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v18;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v60;
          v22 = CFSTR("DAV:");
          v56 = *(_QWORD *)v60;
          do
          {
            v23 = 0;
            v57 = v20;
            do
            {
              if (*(_QWORD *)v60 != v21)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v23);
              objc_msgSend(v24, "firstHref");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "payloadAsFullURL");
              v26 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "successfulPropertiesToValues");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "CDVObjectForKeyWithNameSpace:andName:", v22, CFSTR("resourcetype"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "collection");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                if (-[CoreDAVRecursiveContainerSyncTaskGroup shouldSyncChildWithResourceType:](self, "shouldSyncChildWithResourceType:", v28))
                {
                  -[NSMutableArray addObject:](self->_childCollectionURL, "addObject:", v26);
                }
              }
              else
              {
                v30 = v22;
                objc_msgSend(v27, "CDVObjectForKeyWithNameSpace:andName:", v22, CFSTR("getetag"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "payloadAsString");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                  v33 = v26 == 0;
                else
                  v33 = 1;
                if (v33)
                {
                  objc_msgSend(v24, "status");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "payloadAsString");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v35, "CDVIsHTTPStatusLineWithStatusCode:", 404);

                  self = v55;
                  if ((v36 & 1) == 0)
                  {
                    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    WeakRetained = objc_loadWeakRetained((id *)&v55->super._accountInfoProvider);
                    objc_msgSend(v37, "logHandleForAccountInfoProvider:", WeakRetained);
                    v39 = objc_claimAutoreleasedReturnValue();

                    if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v64 = v32;
                      v65 = 2112;
                      v66 = v26;
                      _os_log_impl(&dword_209602000, v39, OS_LOG_TYPE_DEFAULT, "Found an eTag without one or both of eTag (%{public}@) or url (%@). Dropping it on the floor", buf, 0x16u);
                    }

                    self = v55;
                  }
                }
                else
                {
                  -[NSMutableDictionary setObject:forKey:](self->_leafURLToETag, "setObject:forKey:", v32, v26);
                }

                v22 = v30;
                v21 = v56;
                v20 = v57;
              }

              ++v23;
            }
            while (v20 != v23);
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          }
          while (v20);
        }

        v6 = v54;
        objc_msgSend(v54, "notFoundHREFs");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v53;
        if (objc_msgSend(v40, "count"))
        {
          syncReportDeletedURLs = self->_syncReportDeletedURLs;
          if (!syncReportDeletedURLs)
          {
            v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
            v43 = self->_syncReportDeletedURLs;
            self->_syncReportDeletedURLs = v42;

            syncReportDeletedURLs = self->_syncReportDeletedURLs;
          }
          -[NSMutableSet unionSet:](syncReportDeletedURLs, "unionSet:", v40);
        }
        v44 = objc_msgSend(v54, "moreToSync");
        objc_msgSend(v54, "nextSyncToken");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v44)
        {

          if (v46)
          {
            objc_msgSend(v54, "nextSyncToken");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVRecursiveContainerSyncTaskGroup setPreviousSyncToken:](self, "setPreviousSyncToken:", v47);

            v48 = self;
          }
          else
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v50, "logHandleForAccountInfoProvider:", v51);
            v52 = objc_claimAutoreleasedReturnValue();

            if (v52 && os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209602000, v52, OS_LOG_TYPE_DEFAULT, "Was told to sync more items, but got no new sync token.  Starting from scatch", buf, 2u);
            }

            -[CoreDAVRecursiveContainerSyncTaskGroup setPreviousSyncToken:](v55, "setPreviousSyncToken:", 0);
            -[NSMutableDictionary removeAllObjects](v55->_leafURLToETag, "removeAllObjects");
            -[NSMutableArray removeAllObjects](v55->_childCollectionURL, "removeAllObjects");
            -[NSMutableSet removeAllObjects](v55->_syncReportDeletedURLs, "removeAllObjects");
            v48 = v55;
          }
          -[CoreDAVRecursiveContainerSyncTaskGroup _getItemTags](v48, "_getItemTags");
        }
        else
        {
          nextSyncToken = self->_nextSyncToken;
          self->_nextSyncToken = (NSString *)v45;

          -[CoreDAVRecursiveContainerSyncTaskGroup _getDataPayloads](self, "_getDataPayloads");
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
      outstandingTasks = v55->super._outstandingTasks;
      unsubmittedTasks = v55->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      v64 = v6;
      v65 = 2112;
      v66 = outstandingTasks;
      v67 = 2112;
      v68 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

  }
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id WeakRetained;
  NSObject *v29;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  void *v32;
  id v33;
  NSObject *v34;
  int phase;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  const __CFString *v41;
  __CFString *v42;
  NSString *nextPTag;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  NSMutableSet *v54;
  __int16 v55;
  NSMutableArray *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
  {
    if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v8) & 1) != 0)
      goto LABEL_39;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v27, "logHandleForAccountInfoProvider:", WeakRetained);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      outstandingTasks = self->super._outstandingTasks;
      unsubmittedTasks = self->_unsubmittedTasks;
      *(_DWORD *)buf = 138412802;
      v52 = v8;
      v53 = 2112;
      v54 = outstandingTasks;
      v55 = 2112;
      v56 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v29, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

LABEL_38:
    goto LABEL_39;
  }
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CoreDAVErrorDomain")) & 1) != 0)
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == 2)
        goto LABEL_5;
    }
    else
    {

    }
    -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v10);
    goto LABEL_39;
  }
LABEL_5:
  if (self->_phase != 1)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v32, "logHandleForAccountInfoProvider:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      phase = self->_phase;
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = phase;
      _os_log_impl(&dword_209602000, v34, OS_LOG_TYPE_ERROR, "Got a propfind response in unexpected state %d", buf, 8u);
    }

    v36 = (void *)MEMORY[0x24BDD1540];
    v37 = 6;
    goto LABEL_37;
  }
  if (!objc_msgSend(v9, "count"))
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v38, "logHandleForAccountInfoProvider:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    if (v40 && os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v9;
      _os_log_impl(&dword_209602000, v40, OS_LOG_TYPE_DEFAULT, "We need exactly one ctag per container.  We got %@", buf, 0xCu);
    }

    v36 = (void *)MEMORY[0x24BDD1540];
    v37 = 8;
LABEL_37:
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), v37, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v27);
    goto LABEL_38;
  }
  v44 = v10;
  v45 = v9;
  v46 = v8;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v48;
    while (1)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v20), "successfulPropertiesToValues");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v18)
        {
          if (!v16)
            goto LABEL_18;
        }
        else
        {
          objc_msgSend(v21, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("getctag"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "payloadAsString");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
LABEL_18:
            objc_msgSend(v22, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("sync-token"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "payloadAsString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
              goto LABEL_15;
            goto LABEL_19;
          }
        }
        if (v17)
          goto LABEL_15;
LABEL_19:
        objc_msgSend(v22, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://me.com/_namespace/"), CFSTR("propertytag"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "payloadAsString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        ++v20;
      }
      while (v15 != v20);
      v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      v15 = v26;
      if (!v26)
        goto LABEL_41;
    }
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_41:

  objc_storeStrong((id *)&self->_nextSyncToken, v16);
  if (v18)
    v41 = v18;
  else
    v41 = CFSTR("ServerDoesNotSupportCTags");
  -[CoreDAVRecursiveContainerSyncTaskGroup setNextCTag:](self, "setNextCTag:", v41);
  if (v17)
    v42 = v17;
  else
    v42 = CFSTR("ServerDoesNotSupportPTags");
  v10 = v44;
  nextPTag = self->_nextPTag;
  self->_nextPTag = &v42->isa;

  -[CoreDAVRecursiveContainerSyncTaskGroup _getItemTags](self, "_getItemTags");
  v9 = v45;
  v8 = v46;
LABEL_39:

}

- (void)_getTask:(id)a3 finishedWithParsedContents:(id)a4 deletedItems:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSMutableSet *outstandingTasks;
  NSMutableArray *unsubmittedTasks;
  char isKindOfClass;
  char v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  NSMutableArray *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v10))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v10);
    if (v12)
    {
      -[CoreDAVRecursiveContainerSyncTaskGroup bailWithError:](self, "bailWithError:", v12);
      goto LABEL_46;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();
    v20 = v19;
    if ((isKindOfClass & 1) != 0 || (v19 & 1) != 0)
    {
      objc_msgSend(v10, "missingURLs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count"))
      {
        v49 = v10;
        if ((isKindOfClass & 1) != 0)
          v35 = -[CoreDAVRecursiveContainerSyncTaskGroup copyFolderMultiGetTaskWithURLs:](self, "copyFolderMultiGetTaskWithURLs:", v34);
        else
          v35 = -[CoreDAVRecursiveContainerSyncTaskGroup copyMultiGetTaskWithURLs:](self, "copyMultiGetTaskWithURLs:", v34);
        v36 = v35;
        v47 = v11;
        if (!v35)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVRecursiveContainerSyncTaskGroup.m"), 970, CFSTR("Couldn't create multiget task, things will go poorly"));

        }
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        p_accountInfoProvider = &self->super._accountInfoProvider;
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v37, "logHandleForAccountInfoProvider:", WeakRetained);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v41 = v40;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v55 = v36;
            v56 = 2048;
            v57 = objc_msgSend(v34, "count");
            _os_log_impl(&dword_209602000, v41, OS_LOG_TYPE_INFO, "%@ missed %lu items - resubmitting", buf, 0x16u);
          }

          p_accountInfoProvider = &self->super._accountInfoProvider;
        }

        objc_msgSend(v36, "setDelegate:", self);
        v42 = objc_loadWeakRetained((id *)p_accountInfoProvider);
        objc_msgSend(v36, "setAccountInfoProvider:", v42);

        objc_msgSend(v36, "setTimeoutInterval:", self->super._timeoutInterval);
        -[NSMutableArray addObject:](self->_unsubmittedTasks, "addObject:", v36);

        v11 = v47;
        v10 = v49;
      }

      v12 = 0;
      if ((isKindOfClass & 1) != 0)
        goto LABEL_12;
    }
    else if ((isKindOfClass & 1) != 0)
    {
LABEL_12:
      v46 = v11;
      v48 = v10;
      objc_msgSend(v11, "allObjects", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_53);
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v51 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            if (objc_msgSend(v28, "isUnauthenticated"))
            {
              +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              objc_msgSend(v29, "logHandleForAccountInfoProvider:", v30);
              v31 = objc_claimAutoreleasedReturnValue();

              if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v28;
                _os_log_impl(&dword_209602000, v31, OS_LOG_TYPE_DEFAULT, "Not authenticated to get Folder Info for item %@", buf, 0xCu);
              }

            }
            else
            {
              -[CoreDAVTaskGroup delegate](self, "delegate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "recursiveContainerSyncTask:receivedAddedOrModifiedFolder:", self, v28);
            }

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v28, "childrenOrder");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "serverID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVRecursiveContainerSyncTaskGroup _foundChildrenOrder:inFolderWithURL:](self, "_foundChildrenOrder:inFolderWithURL:", v32, v33);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        }
        while (v25);
      }

      -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
      if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
        -[CoreDAVRecursiveContainerSyncTaskGroup _taskGroupSuccessfullyFinishedWithContents:](self, "_taskGroupSuccessfullyFinishedWithContents:", 0);

      v11 = v46;
      v10 = v48;
      v12 = v45;
      goto LABEL_46;
    }
    if ((v20 & 1) != 0)
    {
      -[CoreDAVRecursiveContainerSyncTaskGroup _submitTasks](self, "_submitTasks");
      if (-[NSMutableSet count](self->super._outstandingTasks, "count"))
      {
        -[CoreDAVTaskGroup delegate](self, "delegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "recursiveContainerSyncTask:retrievedAddedOrModifiedActions:removed:", self, v11, 0);

      }
      else
      {
        -[CoreDAVRecursiveContainerSyncTaskGroup _taskGroupSuccessfullyFinishedWithContents:](self, "_taskGroupSuccessfullyFinishedWithContents:", v11);
      }
    }
  }
  else if ((-[NSMutableArray containsObject:](self->_unsubmittedTasks, "containsObject:", v10) & 1) == 0)
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
      *(_DWORD *)buf = 138412802;
      v55 = v10;
      v56 = 2112;
      v57 = (uint64_t)outstandingTasks;
      v58 = 2112;
      v59 = unsubmittedTasks;
      _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_ERROR, "Received callback for an unexpected task %@, outstandingTasks %@, unsubmittedTasks %@", buf, 0x20u);
    }

  }
LABEL_46:

}

uint64_t __97__CoreDAVRecursiveContainerSyncTaskGroup__getTask_finishedWithParsedContents_deletedItems_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v4, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

- (id)_copyContainerParserMappings
{
  return (id)-[objc_class copyPropertyMappingsForParser](self->_appSpecificContainerItemClass, "copyPropertyMappingsForParser");
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

- (id)copyFolderMultiGetTaskWithURLs:(id)a3
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
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_ERROR, "copyFolderMultiGetTaskWithURLs: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);

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

- (BOOL)shouldSyncChildWithResourceType:(id)a3
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
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_ERROR, "shouldSyncChildWithResourceType: to be implemented by subclass %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

  return 0;
}

- (unint64_t)multiGetBatchSize
{
  return self->_multiGetBatchSize;
}

- (void)setMultiGetBatchSize:(unint64_t)a3
{
  self->_multiGetBatchSize = a3;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (NSString)previousCTag
{
  return self->_previousCTag;
}

- (BOOL)preflightCTag
{
  return self->_preflightCTag;
}

- (void)setPreflightCTag:(BOOL)a3
{
  self->_preflightCTag = a3;
}

- (NSString)previousSyncToken
{
  return self->_previousSyncToken;
}

- (void)setPreviousSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_previousSyncToken, a3);
}

- (NSDictionary)folderURLToChildrenURLOrder
{
  return &self->_folderURLToChildrenURLOrder->super;
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (void)setNextCTag:(id)a3
{
  objc_storeStrong((id *)&self->_nextCTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderURLToChildrenURLOrder, 0);
  objc_storeStrong((id *)&self->_childCollectionURL, 0);
  objc_storeStrong((id *)&self->_leafURLToETag, 0);
  objc_storeStrong((id *)&self->_syncReportDeletedURLs, 0);
  objc_storeStrong((id *)&self->_addMemberURL, 0);
  objc_storeStrong((id *)&self->_unsubmittedTasks, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_nextPTag, 0);
  objc_storeStrong((id *)&self->_previousPTag, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_previousCTag, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end
