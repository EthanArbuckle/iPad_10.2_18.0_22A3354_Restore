@implementation FBUIApplicationWorkspaceScene

- (void)_workspaceQueue_cancelWatchdogTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (-[NSMutableArray indexOfObjectIdenticalTo:](self->_watchdogStack, "indexOfObjectIdenticalTo:", v4) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectIdenticalTo:](self->_watchdogStack, "removeObjectIdenticalTo:", v6);
      if (-[NSMutableArray count](self->_watchdogStack, "count"))
      {
        -[NSMutableArray firstObject](self->_watchdogStack, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "activate");

      }
    }
    -[NSMutableSet removeObject:](self->_allWatchdogs, "removeObject:", v6);
    objc_msgSend(v6, "invalidate");
    v4 = v6;
  }

}

- (FBUIApplicationWorkspaceScene)initWithConnection:(id)a3 host:(id)a4 settings:(id)a5 clientSettings:(id)a6 fromRemnant:(BOOL)a7
{
  FBUIApplicationWorkspaceScene *v7;
  NSMutableArray *v8;
  NSMutableArray *watchdogStack;
  NSMutableSet *v10;
  NSMutableSet *allWatchdogs;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FBUIApplicationWorkspaceScene;
  v7 = -[FBWorkspaceScene initWithConnection:host:settings:clientSettings:fromRemnant:](&v13, sel_initWithConnection_host_settings_clientSettings_fromRemnant_, a3, a4, a5, a6, a7);
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    watchdogStack = v7->_watchdogStack;
    v7->_watchdogStack = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allWatchdogs = v7->_allWatchdogs;
    v7->_allWatchdogs = v10;

  }
  return v7;
}

- (void)_workspaceQueue_invalidate
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_allWatchdogs;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_allWatchdogs, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_watchdogStack, "removeAllObjects");
  v8.receiver = self;
  v8.super_class = (Class)FBUIApplicationWorkspaceScene;
  -[FBWorkspaceScene _workspaceQueue_invalidate](&v8, sel__workspaceQueue_invalidate);
}

- (id)_workspaceQueue_createWatchdogForProcess:(id)a3 sceneAction:(unsigned __int8)a4 transitionContext:(id)a5
{
  unsigned int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 sentSceneCreate;
  uint64_t v17;
  char v18;
  _QWORD v20[5];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[FBWorkspaceScene settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "watchdogTransitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "runIndependently");
  v13 = objc_msgSend(v11, "watchdogBehavior");
  if (v13)
  {
    if (v13 != 1)
    {
      v14 = 0;
      v15 = 0;
      self->_sentSceneCreate = 1;
      goto LABEL_17;
    }
  }
  else if (!_FBSceneActionIsSignificant(v6))
  {
    v18 = objc_msgSend(v10, "isForeground");
    sentSceneCreate = self->_sentSceneCreate;
    self->_sentSceneCreate = 1;
    if ((v18 & 1) != 0)
    {
      v14 = 0;
      v15 = 0;
      goto LABEL_17;
    }
    goto LABEL_6;
  }
  sentSceneCreate = self->_sentSceneCreate;
  self->_sentSceneCreate = 1;
LABEL_6:
  if (sentSceneCreate)
    v17 = 3;
  else
    v17 = 2;
  +[FBProcessWatchdogEventContext contextForEvent:settings:transitionContext:](FBProcessWatchdogEventContext, "contextForEvent:settings:transitionContext:", v17, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke;
    v20[3] = &unk_1E4A136F0;
    v20[4] = self;
    v14 = (void *)objc_msgSend(v8, "_newWatchdogForContext:completion:", v15, v20);
    if (v14)
    {
      -[NSMutableSet addObject:](self->_allWatchdogs, "addObject:", v14);
      if ((v12 & 1) != 0
        || (-[NSMutableArray addObject:](self->_watchdogStack, "addObject:", v14),
            -[NSMutableArray count](self->_watchdogStack, "count") == 1))
      {
        objc_msgSend(v14, "activate");
      }
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_17:

  return v14;
}

void __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 152);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke_2;
  v7[3] = &unk_1E4A11FD0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performAsync:", v7);

}

uint64_t __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_cancelWatchdogTimer:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogStack, 0);
  objc_storeStrong((id *)&self->_allWatchdogs, 0);
}

@end
