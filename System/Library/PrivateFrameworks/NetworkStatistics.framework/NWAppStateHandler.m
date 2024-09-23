@implementation NWAppStateHandler

- (BOOL)currentForegroundStateForProcessWithPid:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = self->_appBundlesMonitored;
  objc_sync_enter(v5);
  -[NWAppStateHandler trackerForPid:](self, "trackerForPid:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 != 0;

  objc_sync_exit(v5);
  return v3;
}

- (id)trackerForPid:(int)a3
{
  NSMutableDictionary *appBundlesMonitored;
  id v4;
  _QWORD v6[5];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  appBundlesMonitored = self->_appBundlesMonitored;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__NWAppStateHandler_trackerForPid___block_invoke;
  v6[3] = &unk_24CBD2758;
  v7 = a3;
  v6[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appBundlesMonitored, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)handleStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  NWAppStateTracker *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  NWAppStateTracker *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSMutableDictionary *obj;
  uint8_t buf[4];
  _BYTE v31[14];
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embeddedApplicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "xpcServiceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (!objc_msgSend(v7, "hasConsistentLaunchdJob")
        || (objc_msgSend(v7, "consistentJobLabel"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v7, "bundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  if (!-[NWAppStateHandler identifierShouldBeIgnored:](self, "identifierShouldBeIgnored:", v9))
  {
    if (!v9)
    {
      NStatGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = v7;
        _os_log_impl(&dword_211429000, v27, OS_LOG_TYPE_ERROR, "handleStateUpdate no identifier from process %@", buf, 0xCu);
      }

      NStatGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = v6;
        _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "handleStateUpdate failed identifier lookup was from update %@", buf, 0xCu);
      }
      goto LABEL_33;
    }
    v11 = objc_msgSend(v7, "pid");
    pid_to_uuid(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NWAppStateHandler rbsProcessStateToForeground:](self, "rbsProcessStateToForeground:", v13);

    obj = self->_appBundlesMonitored;
    objc_sync_enter(obj);
    -[NWAppStateHandler trackerForPid:](self, "trackerForPid:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (NWAppStateTracker *)v15;
    if (!v14)
    {
      if (v15)
        -[NWAppStateHandler _removeStateTracker:](self, "_removeStateTracker:", v15);
      goto LABEL_32;
    }
    objc_msgSend(v6, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "taskState");

    if (v18)
    {
      if (!v16)
      {
LABEL_16:
        v25 = objc_alloc_init(NWAppStateTracker);

        if (!v25)
        {
          v16 = 0;
          goto LABEL_32;
        }
        -[NWAppStateTracker setIdentifier:](v25, "setIdentifier:", v9);
        -[NWAppStateTracker setUuid:](v25, "setUuid:", v12);
        -[NWAppStateTracker setPid:](v25, "setPid:", v11);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appBundlesMonitored, "objectForKeyedSubscript:", v9);
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v26 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          -[NSMutableDictionary setObject:forKey:](self->_appBundlesMonitored, "setObject:forKey:", v26, v9);
        }
        -[NSObject addObject:](v26, "addObject:", v25);
        goto LABEL_31;
      }
      -[NWAppStateTracker uuid](v16, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v12);

      if ((v20 & 1) != 0)
      {
        -[NWAppStateTracker identifier](v16, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v9);

        if ((v22 & 1) != 0)
        {
LABEL_32:

          objc_sync_exit(obj);
LABEL_33:

          goto LABEL_34;
        }
        -[NWAppStateTracker identifier](v16, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NStatGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v31 = v11;
          *(_WORD *)&v31[4] = 2112;
          *(_QWORD *)&v31[6] = v9;
          v32 = 2112;
          v33 = v23;
          _os_log_impl(&dword_211429000, v24, OS_LOG_TYPE_DEFAULT, "State change notification for pid %d now has bundle %@, not matching previous %@", buf, 0x1Cu);
        }

        -[NWAppStateHandler _removeStateTracker:](self, "_removeStateTracker:", v16);
        goto LABEL_16;
      }
      NStatGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[NWAppStateTracker uuid](v16, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = v11;
        *(_WORD *)&v31[4] = 2112;
        *(_QWORD *)&v31[6] = v12;
        v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_211429000, v26, OS_LOG_TYPE_ERROR, "State change notification for pid %d has uuid %@, not matching previous %@", buf, 0x1Cu);

      }
    }
    else
    {
      NStatGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = v16;
        _os_log_impl(&dword_211429000, v26, OS_LOG_TYPE_ERROR, "Process state is unknown %@", buf, 0xCu);
      }
    }
    v25 = v16;
LABEL_31:

    v16 = v25;
    goto LABEL_32;
  }
LABEL_34:

}

void __35__NWAppStateHandler_trackerForPid___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "pid") == *(_DWORD *)(a1 + 40))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v11);
          *a4 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)rbsProcessStateToForeground:(id)a3
{
  id v3;
  int v4;
  void *v6;
  char v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "taskState");
  if (v4 == 4 || v4 == 2)
  {
    objc_msgSend(v3, "endowmentNamespaces");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)identifierShouldBeIgnored:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (identifierShouldBeIgnored__onceToken != -1)
  {
    dispatch_once(&identifierShouldBeIgnored__onceToken, &__block_literal_global_0);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend((id)identifierShouldBeIgnored__kIdentifiersToIgnore, "containsObject:", v4);
LABEL_6:

  return v5;
}

- (void)_removeStateTracker:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (!v4)
    -[NWAppStateHandler _removeStateTracker:].cold.1();
  v9 = v4;
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[NWAppStateHandler _removeStateTracker:].cold.2();
  v6 = (void *)v5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appBundlesMonitored, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    -[NWAppStateHandler _removeStateTracker:].cold.3();
  v8 = v7;
  objc_msgSend(v7, "removeObject:", v9);
  if (!objc_msgSend(v8, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_appBundlesMonitored, "removeObjectForKey:", v6);

}

void __47__NWAppStateHandler_identifierShouldBeIgnored___block_invoke()
{
  void *v0;

  v0 = (void *)identifierShouldBeIgnored__kIdentifiersToIgnore;
  identifierShouldBeIgnored__kIdentifiersToIgnore = (uint64_t)&unk_24CBE27B8;

}

- (NWAppStateHandler)init
{
  NWAppStateHandler *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *appBundlesMonitored;
  NSMutableDictionary *v5;
  NSMutableDictionary *appsWithStates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NWAppStateHandler;
  v2 = -[NWAppStateHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    appBundlesMonitored = v2->_appBundlesMonitored;
    v2->_appBundlesMonitored = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    appsWithStates = v2->_appsWithStates;
    v2->_appsWithStates = v5;

    if (!v2->_appBundlesMonitored || !v2->_appsWithStates)
    {

      v2 = 0;
    }
  }
  objc_storeStrong(&sharedInstance, v2);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsWithStates, 0);
  objc_storeStrong((id *)&self->_appBundlesMonitored, 0);
}

- (void)_removeStateTracker:.cold.1()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 84, "stateTracker != nil");
}

- (void)_removeStateTracker:.cold.2()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 86, "identifier != nil");
}

- (void)_removeStateTracker:.cold.3()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 95, "trackersForThisBundle");
}

@end
