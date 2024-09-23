@implementation CoreDAVUpdateACLTaskGroup

- (CoreDAVUpdateACLTaskGroup)initWithAccountInfoProvider:(id)a3 aceItems:(id)a4 url:(id)a5 taskManager:(id)a6
{
  id v11;
  id v12;
  CoreDAVUpdateACLTaskGroup *v13;
  CoreDAVUpdateACLTaskGroup *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVUpdateACLTaskGroup;
  v13 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v16, sel_initWithAccountInfoProvider_taskManager_, a3, a6);
  v14 = v13;
  if (v13)
  {
    v13->_state = 0;
    objc_storeStrong((id *)&v13->_aceItems, a4);
    objc_storeStrong((id *)&v14->_url, a5);
  }

  return v14;
}

- (void)_startGetACL
{
  void *v3;
  CoreDAVPropFindTask *v4;
  void *v5;
  CoreDAVPropFindTask *v6;
  NSMutableSet *outstandingTasks;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  CoreDAVItemParserMapping *v14;

  v14 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("acl"), objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CoreDAVPropFindTask alloc];
  -[CoreDAVUpdateACLTaskGroup url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v4, "initWithPropertiesToFind:atURL:withDepth:", v3, v5, 2);

  -[CoreDAVUpdateACLTaskGroup setFetchTask:](self, "setFetchTask:", v6);
  outstandingTasks = self->super._outstandingTasks;
  -[CoreDAVUpdateACLTaskGroup fetchTask](self, "fetchTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](outstandingTasks, "addObject:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVUpdateACLTaskGroup fetchTask](self, "fetchTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountInfoProvider:", WeakRetained);

  -[CoreDAVUpdateACLTaskGroup fetchTask](self, "fetchTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  v12 = objc_loadWeakRetained((id *)&self->super._taskManager);
  -[CoreDAVUpdateACLTaskGroup fetchTask](self, "fetchTask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitQueuedCoreDAVTask:", v13);

  -[CoreDAVUpdateACLTaskGroup setState:](self, "setState:", 1);
}

- (void)_startSetACLWithAccessControlEntities:(id)a3
{
  id v4;
  CoreDAVACLTask *v5;
  void *v6;
  id WeakRetained;
  id v8;
  CoreDAVACLTask *v9;

  v4 = a3;
  v5 = [CoreDAVACLTask alloc];
  -[CoreDAVUpdateACLTaskGroup url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CoreDAVACLTask initWithAccessControlEntities:atURL:](v5, "initWithAccessControlEntities:atURL:", v4, v6);

  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVTask setAccountInfoProvider:](v9, "setAccountInfoProvider:", WeakRetained);

  -[CoreDAVTask setDelegate:](v9, "setDelegate:", self);
  v8 = objc_loadWeakRetained((id *)&self->super._taskManager);
  objc_msgSend(v8, "submitQueuedCoreDAVTask:", v9);

  -[CoreDAVUpdateACLTaskGroup setState:](self, "setState:", 2);
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CoreDAVUpdateACLTaskGroup setState:](self, "setState:", v4);
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, 0);

}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSMutableSet *outstandingTasks;
  void *v10;
  CoreDAVUpdateACLTaskGroup *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[CoreDAVUpdateACLTaskGroup state](self, "state");
  if (v8 == 2)
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
    if (v7)
      v13 = 6;
    else
      v13 = 4;
    v11 = self;
    v12 = v7;
    goto LABEL_9;
  }
  if (v8 == 1)
  {
    outstandingTasks = self->super._outstandingTasks;
    -[CoreDAVUpdateACLTaskGroup fetchTask](self, "fetchTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](outstandingTasks, "removeObject:", v10);

    if (v7)
    {
      v11 = self;
      v12 = v7;
      v13 = 5;
LABEL_9:
      -[CoreDAVUpdateACLTaskGroup _finishWithError:state:](v11, "_finishWithError:state:", v12, v13);
      goto LABEL_10;
    }
    -[CoreDAVUpdateACLTaskGroup fetchTask](self, "fetchTask");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "successfulValueForNameSpace:elementName:", CFSTR("DAV:"), CFSTR("acl"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CoreDAVUpdateACLTaskGroup aceItems](self, "aceItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "notGrantedSubsetOfACEs:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "count"))
      {
        v18 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v17, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayWithArray:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v15, "liveACEs", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v27 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(v20, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v23);
        }

        -[CoreDAVUpdateACLTaskGroup _startSetACLWithAccessControlEntities:](self, "_startSetACLWithAccessControlEntities:", v20);
      }
      else
      {
        -[CoreDAVUpdateACLTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 3);
      }

    }
    else
    {
      -[CoreDAVUpdateACLTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 5);
    }

  }
LABEL_10:

}

- (void)taskGroupWillCancelWithError:(id)a3
{
  -[CoreDAVUpdateACLTaskGroup _finishWithError:state:](self, "_finishWithError:state:", a3, 7);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSSet)aceItems
{
  return self->_aceItems;
}

- (void)setAceItems:(id)a3
{
  objc_storeStrong((id *)&self->_aceItems, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (CoreDAVPropFindTask)fetchTask
{
  return self->_fetchTask;
}

- (void)setFetchTask:(id)a3
{
  objc_storeStrong((id *)&self->_fetchTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTask, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_aceItems, 0);
}

@end
