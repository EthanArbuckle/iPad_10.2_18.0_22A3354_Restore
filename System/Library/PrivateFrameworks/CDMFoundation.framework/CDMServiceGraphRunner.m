@implementation CDMServiceGraphRunner

- (CDMServiceGraphRunner)initWithMaxConcurrentCount:(int)a3
{
  CDMServiceGraphRunner *v4;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  NSMutableDictionary *v7;
  NSMutableDictionary *callbackMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *operationMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *operationMapWithNodeName;
  NSMutableDictionary *v13;
  NSMutableDictionary *handlerMap;
  NSMutableDictionary *v15;
  NSMutableDictionary *handlerSkipMap;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)CDMServiceGraphRunner;
  v4 = -[CDMServiceGraphRunner init](&v19, sel_init);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v4->_queue;
    v4->_queue = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    callbackMap = v4->_callbackMap;
    v4->_callbackMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    operationMap = v4->_operationMap;
    v4->_operationMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    operationMapWithNodeName = v4->_operationMapWithNodeName;
    v4->_operationMapWithNodeName = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    handlerMap = v4->_handlerMap;
    v4->_handlerMap = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    handlerSkipMap = v4->_handlerSkipMap;
    v4->_handlerSkipMap = v15;

    -[NSOperationQueue setQualityOfService:](v4->_queue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_queue, "setMaxConcurrentOperationCount:", a3);
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CDMServiceGraphRunner initWithMaxConcurrentCount:]";
      v22 = 1024;
      v23 = a3;
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s initWithMaxConcurrentCount=%d", buf, 0x12u);
    }

    -[NSOperationQueue setSuspended:](v4->_queue, "setSuspended:", 1);
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  void *v24;
  CDMServiceGraphRunner *v25;
  id *p_isa;
  void *v27;
  NSObject *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v41 = a4;
  v39 = a5;
  CDMOSLoggerForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
    v51 = 2112;
    v52 = (uint64_t)v40;
    v53 = 2112;
    v54 = v41;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s %@ observed from %@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v40, "isEqualToString:", CFSTR("isFinished")) ^ 1;
    if (a6 != &kQueueOperationsChanged)
      LOBYTE(v11) = 1;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v41, "getHandlerId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMServiceGraphRunner finishHandlerById:](self, "finishHandlerById:", v12);

      goto LABEL_41;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v40, "isEqualToString:", CFSTR("error")) ^ 1;
    if (a6 != &kQueueOperationsChanged)
      LOBYTE(v13) = 1;
    if ((v13 & 1) == 0)
    {
      objc_msgSend(v41, "getHandlerId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMServiceGraphRunner cancelHandlerById:causeByError:](self, "cancelHandlerById:causeByError:", v14, 1);

      goto LABEL_41;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v40, "isEqualToString:", CFSTR("systemState")))
  {
    v15 = v41;
    v16 = objc_msgSend(v15, "systemState");
    CDMOSLoggerForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16 == 3)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
        v20 = "%s System is ready, resume queue";
        v21 = v17;
        v22 = 12;
        goto LABEL_43;
      }
    }
    else if (v18)
    {
      v19 = objc_msgSend(v15, "systemState");
      *(_DWORD *)buf = 136315394;
      v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
      v51 = 2048;
      v52 = v19;
      v20 = "%s System is not ready, suspend queue. Current state:%zd";
      v21 = v17;
      v22 = 22;
LABEL_43:
      _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, v20, buf, v22);
    }

    -[NSOperationQueue setSuspended:](self->_queue, "setSuspended:", v16 != 3);
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_32;
  v23 = objc_msgSend(v40, "isEqualToString:", CFSTR("isFinished")) ^ 1;
  if (a6 != &kQueueSkipNode)
    LOBYTE(v23) = 1;
  if ((v23 & 1) != 0)
  {
LABEL_32:
    v43.receiver = self;
    v43.super_class = (Class)CDMServiceGraphRunner;
    -[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:](&v43, sel_observeValueForKeyPath_ofObject_change_context_, v40, v41, v39, a6);
  }
  else
  {
    v38 = v41;
    objc_msgSend(v38, "getNodeName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "getHandlerId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = self;
    objc_sync_enter(v25);
    p_isa = (id *)&v25->super.isa;
    -[NSMutableDictionary objectForKey:](v25->_handlerSkipMap, "objectForKey:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = v27 == 0;

    if ((_DWORD)v25)
    {
      CDMOSLoggerForCategory(2);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
        v51 = 2112;
        v52 = (uint64_t)v24;
        _os_log_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: Handler ID %@ not found for skip", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(p_isa[6], "objectForKeyedSubscript:", v24);
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v28, "objectForKey:", v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == 0;

      if (v30)
      {
        CDMOSLoggerForCategory(2);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[CDMServiceGraphRunner observeValueForKeyPath:ofObject:change:context:]";
          v51 = 2112;
          v52 = (uint64_t)v42;
          _os_log_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_INFO, "%s [WARN]: Node %@ not found for checking skip", buf, 0x16u);
        }
      }
      else
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v42);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v45 != v33)
                objc_enumerationMutation(v31);
              v35 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v42);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(p_isa, "skipNode:forCondition:withHandlerId:", v35, v37, v24);

            }
            v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v32);
        }
      }

    }
    objc_sync_exit(p_isa);

  }
LABEL_41:

}

- (CDMServiceGraphRunner)init
{
  return -[CDMServiceGraphRunner initWithMaxConcurrentCount:](self, "initWithMaxConcurrentCount:", +[CDMUserDefaultsUtils readGraphRunnerMaxConcurrentCount](CDMUserDefaultsUtils, "readGraphRunnerMaxConcurrentCount"));
}

- (void)dealloc
{
  CDMServiceGraphRunner *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  id obj;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableDictionary allKeys](v2->_handlerMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v6)
  {
    v27 = *(_QWORD *)v35;
    *(_QWORD *)&v7 = 136315394;
    v24 = v7;
    do
    {
      v28 = v6;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v2->_handlerMap, "objectForKey:", v9, v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "getHandlerState") == 1)
        {
          CDMOSLoggerForCategory(2);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "handlerId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v40 = "-[CDMServiceGraphRunner dealloc]";
            v41 = 2112;
            v42 = v23;
            _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDMServiceGraphRunner: dealloc. Removing observers for running handler with id:%@ .", buf, 0x16u);

          }
          objc_msgSend(v11, "getServiceGraph");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "getEndNode");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "removeObserver:forKeyPath:", v2, CFSTR("isFinished"));
          objc_msgSend(v11, "getServiceGraph");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObserver:forKeyPath:", v2, CFSTR("error"));

          objc_msgSend(v11, "getServiceGraph");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "getNodesWithName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          -[NSMutableDictionary objectForKeyedSubscript:](v2->_handlerSkipMap, "objectForKeyedSubscript:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v31 != v19)
                  objc_enumerationMutation(v17);
                objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (v21)
                  objc_msgSend(v21, "removeObserver:forKeyPath:", v2, CFSTR("isFinished"));

              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v18);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v6);
  }

  objc_sync_exit(v2);
  v29.receiver = v2;
  v29.super_class = (Class)CDMServiceGraphRunner;
  -[CDMServiceGraphRunner dealloc](&v29, sel_dealloc);
}

- (void)suspend
{
  -[NSOperationQueue setSuspended:](self->_queue, "setSuspended:", 1);
}

- (void)resume
{
  -[NSOperationQueue setSuspended:](self->_queue, "setSuspended:", 0);
}

- (void)runHandlerAsync:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CDMServiceGraphRunner *v15;
  CDMServiceGraphRunner *v16;
  NSMutableDictionary *callbackMap;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id aBlock;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  aBlock = a4;
  v23 = v6;
  if (objc_msgSend(v6, "getHandlerState"))
  {
    CDMOSLoggerForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "handlerId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "-[CDMServiceGraphRunner runHandlerAsync:withCompletion:]";
      v31 = 2112;
      v32 = v8;
      v33 = 2048;
      v34 = objc_msgSend(v6, "getHandlerState");
      _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Skip running handler %@ with invalid state %zu", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v6, "getServiceGraph");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject getNodes](v7, "getNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject getNodesWithName](v7, "getNodesWithName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handlerId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject getEndNode](v7, "getEndNode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject getSkippedNodes](v7, "getSkippedNodes");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 0, &kQueueSkipNode);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v15 = self;
    objc_sync_enter(v15);
    -[NSMutableDictionary setValue:forKey:](v15->_handlerSkipMap, "setValue:forKey:", v10, v21);
    objc_sync_exit(v15);

    -[NSObject addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", v15, CFSTR("error"), 0, &kQueueOperationsChanged);
    v16 = v15;
    objc_sync_enter(v16);
    callbackMap = v16->_callbackMap;
    v18 = _Block_copy(aBlock);
    -[NSMutableDictionary setValue:forKey:](callbackMap, "setValue:forKey:", v18, v21);

    -[NSMutableDictionary setValue:forKey:](v16->_operationMap, "setValue:forKey:", v20, v21);
    -[NSMutableDictionary setValue:forKey:](v16->_operationMapWithNodeName, "setValue:forKey:", v9, v21);
    -[NSMutableDictionary setValue:forKey:](v16->_handlerMap, "setValue:forKey:", v23, v21);
    objc_sync_exit(v16);

    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", v16, CFSTR("isFinished"), 0, &kQueueOperationsChanged);
    objc_msgSend(v23, "setHandlerState:", 1);
    -[NSOperationQueue addOperations:waitUntilFinished:](v16->_queue, "addOperations:waitUntilFinished:", v20, 0);

  }
}

- (void)cancelAllHandlers
{
  NSObject *v3;
  CDMServiceGraphRunner *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMServiceGraphRunner cancelAllHandlers]";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Cancel all handlers", buf, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableDictionary allKeys](v4->_handlerMap, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        -[CDMServiceGraphRunner cancelHandlerById:](v4, "cancelHandlerById:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_sync_exit(v4);
}

- (void)cancelHandler:(id)a3
{
  id v4;

  objc_msgSend(a3, "handlerId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraphRunner cancelHandlerById:](self, "cancelHandlerById:", v4);

}

- (void)cancelHandlerById:(id)a3
{
  -[CDMServiceGraphRunner cancelHandlerById:causeByError:](self, "cancelHandlerById:causeByError:", a3, 0);
}

- (void)cancelHandlerById:(id)a3 causeByError:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CDMServiceGraphRunner *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v32 = v6;
  -[NSMutableDictionary objectForKey:](v7->_handlerMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    CDMOSLoggerForCategory(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[CDMServiceGraphRunner cancelHandlerById:causeByError:]";
      v45 = 2112;
      v46 = v6;
      _os_log_error_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: Handler with ID %@ is not found", buf, 0x16u);
    }
    goto LABEL_28;
  }
  if (objc_msgSend(v8, "getHandlerState") != 1)
  {
    CDMOSLoggerForCategory(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "handlerId");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v44 = "-[CDMServiceGraphRunner cancelHandlerById:causeByError:]";
      v45 = 2112;
      v46 = v29;
      v47 = 2048;
      v48 = objc_msgSend(v9, "getHandlerState");
      _os_log_error_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: Skip cancel handler %@ with invalid state %zu", buf, 0x20u);

    }
LABEL_28:

    objc_sync_exit(v7);
    goto LABEL_29;
  }
  if (v4)
    v10 = 3;
  else
    v10 = 4;
  objc_msgSend(v9, "setHandlerState:", v10);
  -[NSMutableDictionary objectForKey:](v7->_operationMap, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSOperationQueue isSuspended](v7->_queue, "isSuspended");
  -[NSOperationQueue setSuspended:](v7->_queue, "setSuspended:", 1);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "cancel");
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v14);
  }

  -[NSOperationQueue setSuspended:](v7->_queue, "setSuspended:", v12);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_callbackMap, "objectForKeyedSubscript:", v32);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    (*(void (**)(uint64_t))(v17 + 16))(v17);
  v30 = v18;
  objc_msgSend(v9, "getServiceGraph");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getEndNode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "removeObserver:forKeyPath:", v7, CFSTR("isFinished"));
  objc_msgSend(v9, "getServiceGraph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObserver:forKeyPath:", v7, CFSTR("error"));

  objc_msgSend(v9, "getServiceGraph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getNodesWithName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_handlerSkipMap, "objectForKeyedSubscript:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeObserver:forKeyPath:", v7, CFSTR("isFinished"));

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v24);
  }

  -[NSMutableDictionary removeObjectForKey:](v7->_handlerSkipMap, "removeObjectForKey:", v32);
  -[NSMutableDictionary removeObjectForKey:](v7->_callbackMap, "removeObjectForKey:", v32);
  -[NSMutableDictionary removeObjectForKey:](v7->_operationMap, "removeObjectForKey:", v32);
  -[NSMutableDictionary removeObjectForKey:](v7->_operationMapWithNodeName, "removeObjectForKey:", v32);
  -[NSMutableDictionary removeObjectForKey:](v7->_handlerMap, "removeObjectForKey:", v32);

  objc_sync_exit(v7);
  CDMOSLoggerForCategory(2);
  v7 = (CDMServiceGraphRunner *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[CDMServiceGraphRunner cancelHandlerById:causeByError:]";
    v45 = 2112;
    v46 = v32;
    _os_log_debug_impl(&dword_21A2A0000, &v7->super, OS_LOG_TYPE_DEBUG, "%s %@ cancelled", buf, 0x16u);
  }
LABEL_29:

}

- (void)finishHandlerById:(id)a3
{
  id v4;
  CDMServiceGraphRunner *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_handlerMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    CDMOSLoggerForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[CDMServiceGraphRunner finishHandlerById:]";
      v30 = 2112;
      v31 = v4;
      _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Handler with ID %@ is not found", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "getHandlerState") != 2)
  {
    CDMOSLoggerForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "handlerId");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v29 = "-[CDMServiceGraphRunner finishHandlerById:]";
      v30 = 2112;
      v31 = v20;
      v32 = 2048;
      v33 = objc_msgSend(v7, "getHandlerState");
      _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Skip finish handler %@ with invalid state %zu", buf, 0x20u);

    }
LABEL_18:

    objc_sync_exit(v5);
    goto LABEL_19;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_callbackMap, "objectForKeyedSubscript:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  objc_msgSend(v7, "getServiceGraph", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getEndNode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "removeObserver:forKeyPath:", v5, CFSTR("isFinished"));
  objc_msgSend(v7, "getServiceGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:forKeyPath:", v5, CFSTR("error"));

  objc_msgSend(v7, "getServiceGraph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getNodesWithName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_handlerSkipMap, "objectForKeyedSubscript:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObserver:forKeyPath:", v5, CFSTR("isFinished"));

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  -[NSMutableDictionary removeObjectForKey:](v5->_handlerSkipMap, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](v5->_callbackMap, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](v5->_operationMap, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](v5->_operationMapWithNodeName, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](v5->_handlerMap, "removeObjectForKey:", v4);

  objc_sync_exit(v5);
  CDMOSLoggerForCategory(2);
  v5 = (CDMServiceGraphRunner *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[CDMServiceGraphRunner finishHandlerById:]";
    v30 = 2112;
    v31 = v4;
    _os_log_debug_impl(&dword_21A2A0000, &v5->super, OS_LOG_TYPE_DEBUG, "%s %@ finished", buf, 0x16u);
  }
LABEL_19:

}

- (void)skipNode:(id)a3 forCondition:(id)a4 withHandlerId:(id)a5
{
  unsigned int (**v8)(_QWORD);
  _BOOL4 v9;
  CDMServiceGraphRunner *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  CDMServiceGraphRunner *obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v8 = (unsigned int (**)(_QWORD))a4;
  v24 = a5;
  v9 = +[CDMUserDefaultsUtils isSkipNodeEnabled](CDMUserDefaultsUtils, "isSkipNodeEnabled");
  if (v8 && v9 && v8[2](v8))
  {
    v10 = self;
    objc_sync_enter(v10);
    obj = v10;
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_operationMapWithNodeName, "objectForKeyedSubscript:", v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if ((objc_msgSend(v12, "isFinished") & 1) != 0 || (objc_msgSend(v12, "isCancelled") & 1) != 0)
        goto LABEL_24;
      CDMOSLoggerForCategory(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[CDMServiceGraphRunner skipNode:forCondition:withHandlerId:]";
        v33 = 2112;
        v34 = v25;
        v35 = 2112;
        v36 = v24;
        _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Skip node %@ in handler %@", buf, 0x20u);
      }

      objc_msgSend(v12, "cancel");
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v12, "getSuccessors");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v18, "getNodeName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("metricsNode"));

            if ((v20 & 1) == 0)
            {
              CDMOSLoggerForCategory(2);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v18, "getNodeName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v32 = "-[CDMServiceGraphRunner skipNode:forCondition:withHandlerId:]";
                v33 = 2112;
                v34 = v22;
                v35 = 2112;
                v36 = v25;
                _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Remove dependency: %@ ==> %@", buf, 0x20u);

              }
              objc_msgSend(v18, "removeDependency:", v12);
            }
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }
    }
    else
    {
      CDMOSLoggerForCategory(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[CDMServiceGraphRunner skipNode:forCondition:withHandlerId:]";
        v33 = 2112;
        v34 = v25;
        _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Node %@ not found for skip", buf, 0x16u);
      }
    }

LABEL_24:
    objc_sync_exit(obj);

  }
}

- (void)waitAll
{
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_queue, "waitUntilAllOperationsAreFinished");
}

- (id)getOperationState:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isExecuting") & 1) != 0)
  {
    v4 = CFSTR("executing");
  }
  else if ((objc_msgSend(v3, "isFinished") & 1) != 0)
  {
    v4 = CFSTR("finished");
  }
  else if (objc_msgSend(v3, "isCancelled"))
  {
    v4 = CFSTR("cancelled");
  }
  else
  {
    v4 = CFSTR("default");
  }

  return (id)v4;
}

- (void)dumpServiceGraphNodeQueue
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CDMServiceGraphRunner *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSMutableDictionary *v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  void *v30;
  uint64_t i;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  -[CDMServiceGraphRunner getServiceGraphNodeQueue](self, "getServiceGraphNodeQueue");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v41;
    v5 = CFSTR("\nQueue:\n");
    do
    {
      v6 = 0;
      v7 = v5;
      do
      {
        if (*(_QWORD *)v41 != v4)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * v6);
        -[CDMServiceGraphRunner getOperationState:](self, "getOperationState:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "getNodeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("{%@,%@},"), v10, v9);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v6;
        v7 = v5;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v3);
  }
  else
  {
    v5 = CFSTR("\nQueue:\n");
  }

  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("\nHandlers:\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = self;
  objc_sync_enter(v12);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v26 = v12->_operationMap;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v13)
  {
    v27 = *(_QWORD *)v37;
    v28 = v13;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v26);
        v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v12->_handlerMap, "objectForKeyedSubscript:", v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("{%@, %lu, ["), v14, objc_msgSend(v30, "getHandlerState"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](v12->_operationMap, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v33;
          do
          {
            v20 = 0;
            v21 = v15;
            do
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
              -[CDMServiceGraphRunner getOperationState:](v12, "getOperationState:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "getNodeName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("{%@,%@},"), v24, v23);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              ++v20;
              v21 = v15;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
          }
          while (v18);
        }

        objc_msgSend(v15, "stringByAppendingString:", CFSTR("]}\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v28);
  }

  objc_sync_exit(v12);
  CDMOSLoggerForCategory(2);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[CDMServiceGraphRunner dumpServiceGraphNodeQueue]";
    v46 = 2112;
    v47 = v11;
    _os_log_debug_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

}

- (id)getServiceGraphNodeQueue
{
  return -[NSOperationQueue operations](self->_queue, "operations");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerSkipMap, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_operationMapWithNodeName, 0);
  objc_storeStrong((id *)&self->_operationMap, 0);
  objc_storeStrong((id *)&self->_callbackMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
