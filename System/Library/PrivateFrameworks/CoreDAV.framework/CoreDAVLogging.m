@implementation CoreDAVLogging

+ (id)sharedLogging
{
  if (sharedLogging_onceToken != -1)
    dispatch_once(&sharedLogging_onceToken, &__block_literal_global);
  return (id)sharedLogging___sharedLogging;
}

void __31__CoreDAVLogging_sharedLogging__block_invoke()
{
  CoreDAVLogging *v0;
  void *v1;

  v0 = objc_alloc_init(CoreDAVLogging);
  v1 = (void *)sharedLogging___sharedLogging;
  sharedLogging___sharedLogging = (uint64_t)v0;

}

- (CoreDAVLogging)init
{
  CoreDAVLogging *v2;
  uint64_t v3;
  NSMutableDictionary *logDelegates;
  uint64_t v5;
  NSMapTable *primaryLogDelegate;
  dispatch_queue_t v7;
  OS_dispatch_queue *delegateMuckingQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CoreDAVLogging;
  v2 = -[CoreDAVLogging init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    logDelegates = v2->_logDelegates;
    v2->_logDelegates = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    primaryLogDelegate = v2->_primaryLogDelegate;
    v2->_primaryLogDelegate = (NSMapTable *)v5;

    v7 = dispatch_queue_create("com.apple.coredav.logdelegate", 0);
    delegateMuckingQueue = v2->_delegateMuckingQueue;
    v2->_delegateMuckingQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)addLogDelegate:(id)a3 forAccountInfoProvider:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *delegateMuckingQueue;
  id v12;
  __CFString *v13;
  _QWORD block[5];
  __CFString *v15;
  id v16;

  v6 = a3;
  objc_msgSend(a4, "accountID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("GenericDelegate");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  if ((objc_opt_respondsToSelector() & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[CoreDAVLogging addLogDelegate:forAccountInfoProvider:].cold.1();
  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CoreDAVLogging_addLogDelegate_forAccountInfoProvider___block_invoke;
  block[3] = &unk_24C1D9AE0;
  block[4] = self;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  dispatch_sync(delegateMuckingQueue, block);

}

void __56__CoreDAVLogging_addLogDelegate_forAccountInfoProvider___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", v4, a1[5]);
    v2 = v4;
  }
  v5 = v2;
  objc_msgSend(v2, "addObject:", a1[6]);
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[6], a1[5]);
  }

}

- (void)removeLogDelegate:(id)a3 forAccountInfoProvider:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *delegateMuckingQueue;
  id v12;
  __CFString *v13;
  _QWORD block[5];
  __CFString *v15;
  id v16;

  v6 = a3;
  objc_msgSend(a4, "accountID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("GenericDelegate");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CoreDAVLogging_removeLogDelegate_forAccountInfoProvider___block_invoke;
  block[3] = &unk_24C1D9AE0;
  block[4] = self;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  dispatch_sync(delegateMuckingQueue, block);

}

void __59__CoreDAVLogging_removeLogDelegate_forAccountInfoProvider___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "removeObject:", a1[6]);
    if (!objc_msgSend(v3, "count"))
      objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  }
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[6];

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", v11, a1[5], (_QWORD)v12);
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

- (id)_delegatesToLogForProvider:(id)a3
{
  id v4;
  NSObject *delegateMuckingQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CoreDAVLogging *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CoreDAVLogging__delegatesToLogForProvider___block_invoke;
  block[3] = &unk_24C1D9BB8;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(delegateMuckingQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __45__CoreDAVLogging__delegatesToLogForProvider___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(void **)(v3 + 8);
  if (!v2)
  {
    v10 = *(void **)(v3 + 8);
LABEL_6:
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("GenericDelegate"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    return;
  }
  objc_msgSend(v2, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    v10 = *(void **)(a1[5] + 8);
    goto LABEL_6;
  }
}

- (BOOL)shouldLogAtLevel:(int64_t)a3 forAccountInfoProvider:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVLogging _delegatesToLogForProvider:](self, "_delegatesToLogForProvider:", a4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "coreDAVLogLevel", (_QWORD)v13) >= a3)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)_shouldOutputAtLevel:(int64_t)a3 forAccountInfoProvider:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVLogging _delegatesToLogForProvider:](self, "_delegatesToLogForProvider:", a4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "coreDAVOutputLevel", (_QWORD)v13) >= a3)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)delegatesToLogTransmittedDataForAccountInfoProvider:(id)a3
{
  id v4;
  NSObject *delegateMuckingQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CoreDAVLogging *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__CoreDAVLogging_delegatesToLogTransmittedDataForAccountInfoProvider___block_invoke;
  block[3] = &unk_24C1D9BB8;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(delegateMuckingQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __70__CoreDAVLogging_delegatesToLogTransmittedDataForAccountInfoProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "accountID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v11 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRepresentation");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GenericDelegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRepresentation");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

}

- (id)logHandleForAccountInfoProvider:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *delegateMuckingQueue;
  __CFString *v10;
  void *v11;
  _QWORD block[5];
  __CFString *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  objc_msgSend(v4, "accountID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("GenericDelegate");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  delegateMuckingQueue = self->_delegateMuckingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CoreDAVLogging_logHandleForAccountInfoProvider___block_invoke;
  block[3] = &unk_24C1D9BE0;
  v15 = &v16;
  block[4] = self;
  v10 = v8;
  v14 = v10;
  dispatch_sync(delegateMuckingQueue, block);
  objc_msgSend((id)v17[5], "logHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __50__CoreDAVLogging_logHandleForAccountInfoProvider___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "logHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", CFSTR("GenericDelegate"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)logDiagnosticForProvider:(id)a3 withLevel:(int64_t)a4 format:(id)a5 args:(char *)a6
{
  id v10;
  id v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = -[CoreDAVLogging shouldLogAtLevel:forAccountInfoProvider:](self, "shouldLogAtLevel:forAccountInfoProvider:", a4, v10);
  v13 = -[CoreDAVLogging _shouldOutputAtLevel:forAccountInfoProvider:](self, "_shouldOutputAtLevel:forAccountInfoProvider:", a4, v10);
  v14 = v13;
  if (v12 || v13)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, a6);
    v16 = (void *)v15;
    if (v14)
      NSLog(CFSTR("%@"), v15);
    if (v12)
    {
      v25 = v11;
      v26 = v10;
      -[CoreDAVLogging _delegatesToLogForProvider:](self, "_delegatesToLogForProvider:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v22, "coreDAVLogDiagnosticMessage:atLevel:", v16, a4);
            }
            else if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v22, "logHandle");
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = oldLevelToOSLogLevel[a4];
              if (os_log_type_enabled(v23, v24))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v16;
                _os_log_impl(&dword_209602000, v23, v24, "%@", buf, 0xCu);
              }

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v19);
      }

      v11 = v25;
      v10 = v26;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMuckingQueue, 0);
  objc_storeStrong((id *)&self->_primaryLogDelegate, 0);
  objc_storeStrong((id *)&self->_logDelegates, 0);
}

- (void)addLogDelegate:forAccountInfoProvider:.cold.1()
{
  objc_class *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_209602000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Added a logging delegate (type %{public}@) that doesn't implement -logHandle. This will degrade performance and result in completely useless, entirely redacted logs. Please migrate to os_log.", (uint8_t *)&v2, 0xCu);

}

@end
