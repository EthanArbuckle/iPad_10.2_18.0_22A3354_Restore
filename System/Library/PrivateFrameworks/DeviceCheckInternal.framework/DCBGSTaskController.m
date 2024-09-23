@implementation DCBGSTaskController

- (NSMutableArray)tasks
{
  NSMutableArray *tasks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  tasks = self->_tasks;
  if (!tasks)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_tasks;
    self->_tasks = v4;

    tasks = self->_tasks;
  }
  return tasks;
}

- (NSUserDefaults)defaultsSuite
{
  NSUserDefaults *defaultsSuite;
  NSUserDefaults *v4;
  NSUserDefaults *v5;

  defaultsSuite = self->_defaultsSuite;
  if (!defaultsSuite)
  {
    v4 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
    v5 = self->_defaultsSuite;
    self->_defaultsSuite = v4;

    defaultsSuite = self->_defaultsSuite;
  }
  return defaultsSuite;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__DCBGSTaskController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_taskController;
}

void __37__DCBGSTaskController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_taskController;
  sharedInstance_taskController = (uint64_t)v1;

}

- (BOOL)registerForTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];

  v4 = a3;
  -[DCBGSTaskController tasks](self, "tasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__DCBGSTaskController_registerForTask___block_invoke;
  v13[3] = &unk_24ED11668;
  v13[4] = self;
  v8 = objc_msgSend(v6, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v7, 0, v13);

  -[DCBGSTaskController defaultsSuite](self, "defaultsSuite");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "observerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v10, 1, 0);

  _DCLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCBGSTaskController registerForTask:].cold.1(v4, v8, v11);

  return v8;
}

void __39__DCBGSTaskController_registerForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _DCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __39__DCBGSTaskController_registerForTask___block_invoke_cold_1(v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "handleTask:", v3);
}

- (id)fetchTaskForTaskIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DCBGSTaskController tasks](self, "tasks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "taskID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)updateTaskWithIdentifier:(id)a3 withRefreshInterval:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unint64_t v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  char v29;
  id v31;

  v6 = a3;
  -[DCBGSTaskController tasks](self, "tasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    while (1)
    {
      -[DCBGSTaskController tasks](self, "tasks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "taskID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v6);

      if (v13)
        break;

      ++v9;
      -[DCBGSTaskController tasks](self, "tasks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 <= v9)
        goto LABEL_5;
    }
    _DCLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (a4 < 300.0)
    {
      if (v18)
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.1(v17, a4, v19, v20);
      LOBYTE(self) = 0;
      goto LABEL_28;
    }
    if (v18)
      -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.6(v11);

    objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "taskID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "taskRequestForIdentifier:", v22);
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      _DCLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.2(v11);
      LOBYTE(self) = 0;
      goto LABEL_27;
    }
    -[NSObject setInterval:](v17, "setInterval:", a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRefreshInterval:", v23);

    objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v25 = objc_msgSend(v24, "updateTaskRequest:error:", v17, &v31);
    v26 = v31;

    _DCLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v26)
    {
      if (v28)
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.5(v26, v27);
    }
    else
    {
      if ((v25 & 1) != 0)
      {
        if (v28)
          -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.3(v11);

        -[DCBGSTaskController tasks](self, "tasks");
        v27 = objc_claimAutoreleasedReturnValue();
        -[NSObject replaceObjectAtIndex:withObject:](v27, "replaceObjectAtIndex:withObject:", v9, v11);
        LOBYTE(self) = 1;
        goto LABEL_26;
      }
      if (v28)
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:].cold.4(v27);
    }
    LOBYTE(self) = 0;
LABEL_26:

LABEL_27:
LABEL_28:

    v16 = 1;
    goto LABEL_29;
  }
LABEL_5:
  v16 = 0;
LABEL_29:
  v29 = v16 & self;

  return v29;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;

  v7 = a3;
  _DCAALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCBGSTaskController observeValueForKeyPath:ofObject:change:context:].cold.1();

  -[DCBGSTaskController tasks](self, "tasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      -[DCBGSTaskController tasks](self, "tasks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "observerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v7);

      if (v15)
      {
        -[DCBGSTaskController tasks](self, "tasks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[DCBGSTaskController defaultsSuite](self, "defaultsSuite");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerForKey:", v7);

        objc_msgSend(v17, "taskID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[DCBGSTaskController updateTaskWithIdentifier:withRefreshInterval:](self, "updateTaskWithIdentifier:withRefreshInterval:", v20, (double)v19);

      }
      ++v11;
      -[DCBGSTaskController tasks](self, "tasks");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v22 > v11);
  }

}

- (void)handleTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void (**v22)(_QWORD, _QWORD);
  id v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_initWeak(&location, v4);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __34__DCBGSTaskController_handleTask___block_invoke;
  v30[3] = &unk_24ED11690;
  objc_copyWeak(&v31, &location);
  v30[4] = &v33;
  objc_msgSend(v4, "setExpirationHandler:", v30);
  if (*((_BYTE *)v34 + 24))
  {
    _DCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCBGSTaskController handleTask:].cold.3(v6, (uint64_t)v39, v5);
    }

    v25 = 0;
    v7 = objc_msgSend(v4, "setTaskExpiredWithRetryAfter:error:", &v25, 300.0);
    v8 = v25;
    if ((v7 & 1) == 0)
    {
      _DCLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[DCBGSTaskController handleTask:].cold.2(v9, v10, v11);

    }
    if (v8)
    {
      _DCLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DCBGSTaskController handleTask:].cold.1(v13, buf, v12);
      }

    }
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[DCBGSTaskController tasks](self, "tasks");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v8);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v17, "taskID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v18 == v19;

          if (v20)
          {
            _DCLogSystem();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "taskID");
              v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v24 = objc_msgSend(v23, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v38 = v24;
              _os_log_debug_impl(&dword_224FB2000, v21, OS_LOG_TYPE_DEBUG, "Invoking handler for task. { taskID=%s }", buf, 0xCu);

            }
            objc_msgSend(v17, "taskHandler");
            v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id))v22)[2](v22, v4);

          }
        }
        v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v14);
    }
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

}

void __34__DCBGSTaskController_handleTask___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _DCLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __34__DCBGSTaskController_handleTask___block_invoke_cold_1(a1, v2);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (void)setTasks:(id)a3
{
  objc_storeStrong((id *)&self->_tasks, a3);
}

- (void)setDefaultsSuite:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsSuite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsSuite, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

- (void)registerForTask:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taskID");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  OUTLINED_FUNCTION_5();
  v8 = 1024;
  v9 = v5;
  OUTLINED_FUNCTION_8(&dword_224FB2000, a3, v6, "Registered task. { taskID=%s, success=%d }", v7);

  OUTLINED_FUNCTION_5_0();
}

void __39__DCBGSTaskController_registerForTask___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_224FB2000, a2, v4, "System task handler called. { task=%@ }", v5);

  OUTLINED_FUNCTION_1();
}

- (void)updateTaskWithIdentifier:(uint64_t)a3 withRefreshInterval:(uint64_t)a4 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218240;
  v5 = a2;
  v6 = 1024;
  v7 = 300;
  OUTLINED_FUNCTION_8(&dword_224FB2000, a1, a4, "Requested refresh interval must be greater than base refresh interval. { refreshInterval=%f, baseRefreshInterval=%d }", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.2(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "taskID");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_7(v2, v3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_224FB2000, v4, v5, "Cannot update to refresh interval, failed to fetch task. { taskID=%s, refreshInterval=%f }", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3_0();
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.3(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "taskID");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_7(v2, v3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_224FB2000, v4, v5, "Updated task. { taskID=%s, refreshInterval=%f }", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3_0();
}

- (void)updateTaskWithIdentifier:(os_log_t)log withRefreshInterval:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224FB2000, log, OS_LOG_TYPE_DEBUG, "Failed to update task.", v1, 2u);
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_224FB2000, a2, v4, "Failed to update task. { error=%@ }", v5);

  OUTLINED_FUNCTION_1();
}

- (void)updateTaskWithIdentifier:(void *)a1 withRefreshInterval:.cold.6(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "taskID");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_7(v2, v3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_224FB2000, v4, v5, "Attempting to update task's refresh interval. { taskID=%s, refreshInterval=%f }", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3_0();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_224FB2000, v0, v1, "Key was changed. { key=%@ }", v2);
  OUTLINED_FUNCTION_3();
}

- (void)handleTask:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = 300;
  _os_log_debug_impl(&dword_224FB2000, log, OS_LOG_TYPE_DEBUG, "Failed to set task expired. { error=%@, backOff=%lu }", buf, 0x16u);

}

- (void)handleTask:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = 300;
  OUTLINED_FUNCTION_0_1(&dword_224FB2000, a1, a3, "Failed to set task expired. { backOff=%lu }", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)handleTask:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_224FB2000, a3, (uint64_t)a3, "Task requested to exit, attempting to mark as expired. { task=%@ }", (uint8_t *)a2);

}

void __34__DCBGSTaskController_handleTask___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "identifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_224FB2000, a2, v5, "Task expiration handler invoked. { taskID=%s }", v6);

  OUTLINED_FUNCTION_5_0();
}

@end
