@implementation SWCollaborationCoordinator

- (void)applicationHasFinishedLaunching
{
  -[SWCollaborationCoordinator setApplicationIsReadyForActions:](self, "setApplicationIsReadyForActions:", 1);
}

- (void)setApplicationIsReadyForActions:(BOOL)a3
{
  if (self->_applicationIsReadyForActions != a3)
  {
    self->_applicationIsReadyForActions = a3;
    -[SWCollaborationCoordinator _sendUndeliveredActionsIfNecessary](self, "_sendUndeliveredActionsIfNecessary");
  }
}

+ (SWCollaborationCoordinator)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SWCollaborationCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_onceToken != -1)
    dispatch_once(&sharedCoordinator_onceToken, block);
  return (SWCollaborationCoordinator *)(id)sharedCoordinator_shared;
}

void __47__SWCollaborationCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCoordinator_shared;
  sharedCoordinator_shared = (uint64_t)v1;

}

- (void)_sendUndeliveredActionsIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SWCollaborationCoordinator cachedUUIDs](self, "cachedUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = -[SWCollaborationCoordinator applicationIsReadyForActions](self, "applicationIsReadyForActions");
      SWFrameworkLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          -[SWCollaborationCoordinator cachedUUIDs](self, "cachedUUIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v26 = "-[SWCollaborationCoordinator _sendUndeliveredActionsIfNecessary]";
          v27 = 2048;
          v28 = objc_msgSend(v10, "count");
          _os_log_impl(&dword_18B618000, v8, OS_LOG_TYPE_DEFAULT, "%s: We have %lu undelivered actions, and an action handler. Sending them now.", buf, 0x16u);

        }
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        -[SWCollaborationCoordinator cachedUUIDs](self, "cachedUUIDs", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
              -[SWCollaborationCoordinator actionCache](self, "actionCache");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              -[SWCollaborationCoordinator actionCache](self, "actionCache");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "removeObjectForKey:", v16);

              if (v18)
                -[SWCollaborationCoordinator _sendActionToApp:](self, "_sendActionToApp:", v18);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v13);
        }

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = objc_claimAutoreleasedReturnValue();
        -[SWCollaborationCoordinator setCachedUUIDs:](self, "setCachedUUIDs:", v8);
      }
      else if (v9)
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[SWCollaborationCoordinator _sendUndeliveredActionsIfNecessary]";
        _os_log_impl(&dword_18B618000, v8, OS_LOG_TYPE_DEFAULT, "%s: We have undelivered actions, and an action handler, but applicationIsReadyForActions=NO so the app must not have yet finished launching.", buf, 0xCu);
      }

    }
  }
}

- (SWCollaborationCoordinator)init
{
  SWCollaborationCoordinator *v2;
  NSCache *v3;
  NSCache *actionCache;
  uint64_t v5;
  NSMutableArray *cachedUUIDs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationCoordinator;
  v2 = -[SWCollaborationCoordinator init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    actionCache = v2->_actionCache;
    v2->_actionCache = v3;

    -[NSCache setCountLimit:](v2->_actionCache, "setCountLimit:", 10);
    -[NSCache setDelegate:](v2->_actionCache, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    cachedUUIDs = v2->_cachedUUIDs;
    v2->_cachedUUIDs = (NSMutableArray *)v5;

    v2->_applicationIsReadyForActions = 0;
  }
  return v2;
}

- (id)actionHandler
{
  return objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)actionHandler
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = actionHandler;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  if (WeakRetained != v4)
  {
    SWFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[SWCollaborationCoordinator setActionHandler:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_18B618000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_storeWeak((id *)&self->_actionHandler, v4);
    -[SWCollaborationCoordinator _sendUndeliveredActionsIfNecessary](self, "_sendUndeliveredActionsIfNecessary");
  }

}

- (void)processIncomingActions:(id)a3
{
  id v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[SWCollaborationCoordinator processIncomingAction:](self, "processIncomingAction:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)processIncomingAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SWCollaborationCoordinator _sendActionToApp:](self, "_sendActionToApp:", v5);
  else
    -[SWCollaborationCoordinator _cacheAction:](self, "_cacheAction:", v5);

}

- (void)_sendActionToApp:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SWCollaborationCoordinator _sendStartCollaborationAction:](self, "_sendStartCollaborationAction:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SWCollaborationCoordinator _sendUpdateCollaborationParticipantsAction:](self, "_sendUpdateCollaborationParticipantsAction:", v4);
  }

}

- (void)_sendStartCollaborationAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    SWFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18B618000, v7, OS_LOG_TYPE_DEFAULT, "_sendStartCollaborationAction: invoking the action handler", v10, 2u);
    }

    -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject collaborationCoordinator:handleStartCollaborationAction:](v8, "collaborationCoordinator:handleStartCollaborationAction:", self, v4);
LABEL_8:

    goto LABEL_9;
  }
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SWFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SWCollaborationCoordinator _sendStartCollaborationAction:].cold.1(v4);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_sendUpdateCollaborationParticipantsAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke;
    v9[3] = &unk_1E217B388;
    v9[4] = self;
    v10 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    -[SWCollaborationCoordinator actionHandler](self, "actionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      SWFrameworkLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SWCollaborationCoordinator _sendUpdateCollaborationParticipantsAction:].cold.1(v4);

    }
  }

}

void __73__SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  SWFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B618000, v2, OS_LOG_TYPE_DEFAULT, "_sendUpdateCollaborationParticipantsAction: invoking the action handler", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collaborationCoordinator:handleUpdateCollaborationParticipantsAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_cacheAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SWCollaborationCoordinator _cacheAction:]";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_18B618000, v5, OS_LOG_TYPE_DEFAULT, "[%s] action: %@ uuid: %@", (uint8_t *)&v11, 0x20u);

  }
  -[SWCollaborationCoordinator actionCache](self, "actionCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v4, v8);

  -[SWCollaborationCoordinator cachedUUIDs](self, "cachedUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SWCollaborationCoordinator actionCache](self, "actionCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v10 = v7;
      -[SWCollaborationCoordinator cachedUUIDs](self, "cachedUUIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", v12);

      SWFrameworkLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v10;
        v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_18B618000, v13, OS_LOG_TYPE_DEFAULT, "We're evicting a cached action not yet sent to app, which means this action will be dropped. action: %@ uuid: %@", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  else
  {

  }
}

- (NSCache)actionCache
{
  return self->_actionCache;
}

- (void)setActionCache:(id)a3
{
  objc_storeStrong((id *)&self->_actionCache, a3);
}

- (NSMutableArray)cachedUUIDs
{
  return self->_cachedUUIDs;
}

- (void)setCachedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedUUIDs, a3);
}

- (BOOL)applicationIsReadyForActions
{
  return self->_applicationIsReadyForActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUUIDs, 0);
  objc_storeStrong((id *)&self->_actionCache, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
}

void __74___SWCollaborationCoordinator__sendUpdateCollaborationParticipantsAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  SWFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B618000, v2, OS_LOG_TYPE_DEFAULT, "_sendUpdateCollaborationParticipantsAction: invoking the action handler", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleUpdateCollaborationParticipantsAction:", *(_QWORD *)(a1 + 40));

}

- (void)_sendStartCollaborationAction:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18B618000, v2, v3, "SWCollaborationCoordinator's actionHandler doesn't implement handleStartCollaborationAction. Dropping action: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_sendUpdateCollaborationParticipantsAction:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18B618000, v2, v3, "SWCollaborationCoordinator's actionHandler doesn't implement handleUpdateCollaborationParticipantsAction. Dropping action: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
