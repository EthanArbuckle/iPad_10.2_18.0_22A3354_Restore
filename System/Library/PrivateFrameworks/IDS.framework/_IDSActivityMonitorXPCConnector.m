@implementation _IDSActivityMonitorXPCConnector

+ (id)weakSharedInstance
{
  id v2;
  id WeakRetained;
  _IDSActivityMonitorXPCConnector *v4;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&qword_1EE1E1F40);

  if (WeakRetained)
  {
    v4 = (_IDSActivityMonitorXPCConnector *)objc_loadWeakRetained(&qword_1EE1E1F40);
  }
  else
  {
    v4 = objc_retainAutorelease(-[_IDSActivityMonitorXPCConnector initWithSyncDaemonControllerBuilder:daemonControllerBuilder:]([_IDSActivityMonitorXPCConnector alloc], "initWithSyncDaemonControllerBuilder:daemonControllerBuilder:", &unk_1E2C5FE90, &unk_1E2C5F210));
    objc_storeWeak(&qword_1EE1E1F40, v4);

  }
  objc_sync_exit(v2);

  return v4;
}

- (_IDSActivityMonitorXPCConnector)initWithSyncDaemonControllerBuilder:(id)a3 daemonControllerBuilder:(id)a4
{
  id v6;
  id v7;
  _IDSActivityMonitorXPCConnector *v8;
  uint64_t v9;
  id daemonControllerBuilder;
  uint64_t v11;
  id syncDaemonControllerBuilder;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_IDSActivityMonitorXPCConnector;
  v8 = -[_IDSActivityMonitorXPCConnector init](&v14, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x19400FE1C](v7);
    daemonControllerBuilder = v8->_daemonControllerBuilder;
    v8->_daemonControllerBuilder = (id)v9;

    v11 = MEMORY[0x19400FE1C](v6);
    syncDaemonControllerBuilder = v8->_syncDaemonControllerBuilder;
    v8->_syncDaemonControllerBuilder = (id)v11;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSXPCDaemonController removeInterruptionHandlerForTarget:](self->_daemonController, "removeInterruptionHandlerForTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)_IDSActivityMonitorXPCConnector;
  -[_IDSActivityMonitorXPCConnector dealloc](&v3, sel_dealloc);
}

- (void)performSyncAction:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  IDSXPCDaemonController *syncDaemonController;
  void (**syncDaemonControllerBuilder)(id, void *);
  void *v7;
  void *v8;
  IDSXPCDaemonController *v9;
  IDSXPCDaemonController *v10;
  void *v11;
  IDSXPCDaemonController *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v4 = (void (**)(id, void *, _QWORD))a3;
  syncDaemonController = self->_syncDaemonController;
  if (!syncDaemonController)
  {
    syncDaemonControllerBuilder = (void (**)(id, void *))self->_syncDaemonControllerBuilder;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    syncDaemonControllerBuilder[2](syncDaemonControllerBuilder, v8);
    v9 = (IDSXPCDaemonController *)objc_claimAutoreleasedReturnValue();
    v10 = self->_syncDaemonController;
    self->_syncDaemonController = v9;

    syncDaemonController = self->_syncDaemonController;
  }
  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x3032000000;
  v23[2] = sub_1906EE334;
  v23[3] = sub_1906EE16C;
  v24 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1907E0A90;
  v21[3] = &unk_1E2C61FD0;
  v21[4] = &v22;
  -[IDSXPCDaemonController activityMonitorCollaboratorWithErrorHandler:](syncDaemonController, "activityMonitorCollaboratorWithErrorHandler:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(v23[0] + 40))
  {
    v12 = self->_syncDaemonController;
    self->_syncDaemonController = 0;

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FEBE4((uint64_t)v23, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
    v20 = *(_QWORD *)(v23[0] + 40);
  }
  else
  {
    v20 = 0;
  }
  v4[2](v4, v11, v20);

  _Block_object_dispose(&v22, 8);
}

- (void)performAction:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  IDSXPCDaemonController *daemonController;
  uint64_t v9;
  void (**daemonControllerBuilder)(id, void *);
  void *v11;
  void *v12;
  IDSXPCDaemonController *v13;
  IDSXPCDaemonController *v14;
  IDSXPCDaemonController *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  daemonController = self->_daemonController;
  v9 = MEMORY[0x1E0C809B0];
  if (!daemonController)
  {
    daemonControllerBuilder = (void (**)(id, void *))self->_daemonControllerBuilder;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    daemonControllerBuilder[2](daemonControllerBuilder, v12);
    v13 = (IDSXPCDaemonController *)objc_claimAutoreleasedReturnValue();
    v14 = self->_daemonController;
    self->_daemonController = v13;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v15 = self->_daemonController;
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = sub_1907E0C34;
    v21[3] = &unk_1E2C60B88;
    objc_copyWeak(&v22, &location);
    -[IDSXPCDaemonController addInterruptionHandler:forTarget:](v15, "addInterruptionHandler:forTarget:", v21, self);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    daemonController = self->_daemonController;
  }
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = sub_1907E0C60;
  v18[3] = &unk_1E2C62DA8;
  v19 = v7;
  v20 = v6;
  v16 = v6;
  v17 = v7;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v18);

}

- (void)addListener:(id)a3 forTopic:(id)a4
{
  id v6;
  NSMutableDictionary *listenersByActivity;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  listenersByActivity = self->_listenersByActivity;
  if (!listenersByActivity)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_listenersByActivity;
    self->_listenersByActivity = v8;

    listenersByActivity = self->_listenersByActivity;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](listenersByActivity, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = self->_listenersByActivity;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v12);
  if (objc_msgSend(v10, "count") == 1)
    -[_IDSActivityMonitorXPCConnector _updateActivity:isSupported:](self, "_updateActivity:isSupported:", v6, 1);

}

- (void)removeListener:(id)a3 forTopic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *listenersByActivity;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_listenersByActivity, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "containsObject:", v10))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_listenersByActivity, "setObject:forKeyedSubscript:", 0, v6);
      -[_IDSActivityMonitorXPCConnector _updateActivity:isSupported:](self, "_updateActivity:isSupported:", v6, 0);
    }
    else
    {
      objc_msgSend(v8, "removeObject:", v10);
    }
    if (!-[NSMutableDictionary count](self->_listenersByActivity, "count"))
    {
      listenersByActivity = self->_listenersByActivity;
      self->_listenersByActivity = 0;

    }
  }

}

- (void)_handleInterruption
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_listenersByActivity;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[_IDSActivityMonitorXPCConnector _updateActivity:isSupported:](self, "_updateActivity:isSupported:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 1, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateActivity:(id)a3 isSupported:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907E10E4;
  v8[3] = &unk_1E2C652B0;
  objc_copyWeak(&v10, &location);
  v11 = a4;
  v7 = v6;
  v9 = v7;
  -[_IDSActivityMonitorXPCConnector performAction:errorHandler:](self, "performAction:errorHandler:", v8, &unk_1E2C60010);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)handleIncomingUpdate:(id)a3 onActivity:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  dispatch_block_t block;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v8 = a4;
  block = a5;
  -[_IDSActivityMonitorXPCConnector listenersByActivity](self, "listenersByActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = dispatch_group_create();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v18);
        dispatch_group_enter(v12);
        v24[0] = v17;
        v24[1] = 3221225472;
        v24[2] = sub_1907E1348;
        v24[3] = &unk_1E2C60550;
        v25 = v12;
        objc_msgSend(v19, "handleIncomingUpdate:onActivity:completion:", v23, v8, v24);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v12, v21, block);

}

- (NSMutableDictionary)listenersByActivity
{
  return self->_listenersByActivity;
}

- (void)setListenersByActivity:(id)a3
{
  objc_storeStrong((id *)&self->_listenersByActivity, a3);
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (IDSXPCDaemonController)syncDaemonController
{
  return self->_syncDaemonController;
}

- (void)setSyncDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_syncDaemonController, a3);
}

- (id)syncDaemonControllerBuilder
{
  return self->_syncDaemonControllerBuilder;
}

- (void)setSyncDaemonControllerBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)daemonControllerBuilder
{
  return self->_daemonControllerBuilder;
}

- (void)setDaemonControllerBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_daemonControllerBuilder, 0);
  objc_storeStrong(&self->_syncDaemonControllerBuilder, 0);
  objc_storeStrong((id *)&self->_syncDaemonController, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_listenersByActivity, 0);
}

@end
