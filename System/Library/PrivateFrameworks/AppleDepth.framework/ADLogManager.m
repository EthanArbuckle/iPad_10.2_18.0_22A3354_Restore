@implementation ADLogManager

- (ADLogManager)init
{
  return -[ADLogManager initWithHandlers:](self, "initWithHandlers:", 0);
}

- (void)setHumanReadableFormat:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  self->_humanReadableFormat = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_handlers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHumanReadableFormat:", self->_humanReadableFormat, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)getHumanReadableFormat
{
  return self->_humanReadableFormat;
}

- (ADLogManager)initWithHandlers:(id)a3
{
  id v4;
  ADLogManager *v5;
  uint64_t v6;
  NSMutableArray *handlers;
  void *v8;
  uint64_t v9;
  NSSet *enabledLoggerOverrideSet;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ADLogManager;
  v5 = -[ADLogManager init](&v12, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_opt_new();
    }
    handlers = v5->_handlers;
    v5->_handlers = (NSMutableArray *)v6;

    v5->_activeHandlersCounter = 0;
    v5->_loggingPriority = 0;
    v5->_forceAllPriorities = 0;
    +[ADDeviceConfiguration sharedConfiguration](ADDeviceConfiguration, "sharedConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    enabledLoggerOverrideSet = v5->_enabledLoggerOverrideSet;
    v5->_enabledLoggerOverrideSet = (NSSet *)v9;

    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, kADDeviceConfigurationKeyEnabledLoggers, 7, 0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, kADDeviceConfigurationKeyLoggingHostName, 7, 0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, kADDeviceConfigurationKeyLogFolder, 7, 0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, kADDeviceConfigurationKeyLoggingPriorityForceAll, 7, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[ADDeviceConfiguration sharedConfiguration](ADDeviceConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, kADDeviceConfigurationKeyEnabledLoggers, 0);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, kADDeviceConfigurationKeyLoggingHostName, 0);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, kADDeviceConfigurationKeyLogFolder, 0);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, kADDeviceConfigurationKeyLoggingPriorityForceAll, 0);

  v4.receiver = self;
  v4.super_class = (Class)ADLogManager;
  -[ADLogManager dealloc](&v4, sel_dealloc);
}

- (int64_t)addHandler:(id)a3
{
  id v4;
  ADLogManager *v5;
  int64_t v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(v4, "setHumanReadableFormat:", v5->_humanReadableFormat);
    -[NSMutableArray addObject:](v5->_handlers, "addObject:", v4);
    -[ADLogManager applyConfigurationToNewHandler:](v5, "applyConfigurationToNewHandler:", v4);
    if (objc_msgSend(v4, "active"))
      ++v5->_activeHandlersCounter;
    objc_sync_exit(v5);

    v6 = 0;
  }
  else
  {
    v6 = -22953;
  }

  return v6;
}

- (id)visualLoggerPrefices
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_handlers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "name", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v3;
}

- (int64_t)setLogFolder:(id)a3
{
  objc_storeStrong((id *)&self->_logFolder, a3);
  return 0;
}

- (int64_t)setHostName:(id)a3
{
  objc_storeStrong((id *)&self->_hostName, a3);
  return 0;
}

- (void)toggleHandler:(id)a3 enable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSString *v8;
  NSString *logFolder;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSString *v13;
  NSString *hostName;
  void *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    if ((objc_msgSend(v6, "active") & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "name");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v8;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "enabling logger handler %@", (uint8_t *)&v16, 0xCu);

      }
      ++self->_activeHandlersCounter;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        logFolder = self->_logFolder;
        objc_msgSend(v7, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = logFolder;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "setting log folder %@ for logger handler %@", (uint8_t *)&v16, 0x16u);

      }
      if (objc_msgSend(v7, "setLogFolder:", self->_logFolder))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          v11 = MEMORY[0x24BDACB70];
          v12 = "logger handler failed assigning log folder. aborting rest of handlers";
LABEL_20:
          _os_log_error_impl(&dword_20B62B000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 2u);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          hostName = self->_hostName;
          objc_msgSend(v7, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = hostName;
          v18 = 2112;
          v19 = v15;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "setting host name %@ for logger handler %@", (uint8_t *)&v16, 0x16u);

        }
        if (!objc_msgSend(v7, "setHostName:", self->_hostName))
        {
          objc_msgSend(v7, "preEnable");
          objc_msgSend(v7, "setActive:", 1);
          goto LABEL_14;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          v11 = MEMORY[0x24BDACB70];
          v12 = "logger handler failed assigning host name. aborting rest of handlers";
          goto LABEL_20;
        }
      }
    }
  }
  else if (objc_msgSend(v6, "active"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "name");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "disabling logger handler %@", (uint8_t *)&v16, 0xCu);

    }
    --self->_activeHandlersCounter;
    objc_msgSend(v7, "setActive:", 0);
    objc_msgSend(v7, "postDisable");
  }
LABEL_14:

}

- (void)toggleByClass:(Class)a3 enable:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_handlers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[ADLogManager toggleHandler:enable:](self, "toggleHandler:enable:", v10, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)enableAll
{
  ADLogManager *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = v2->_handlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[ADLogManager toggleHandler:enable:](v2, "toggleHandler:enable:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)disableAll
{
  ADLogManager *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = v2->_handlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[ADLogManager toggleHandler:enable:](v2, "toggleHandler:enable:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)enable:(id)a3
{
  id v4;
  ADLogManager *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5->_handlers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "name", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          -[ADLogManager toggleHandler:enable:](v5, "toggleHandler:enable:", v10, 1);
        }
        else
        {
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "hasPrefix:", v13);

        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)disable:(id)a3
{
  id v4;
  ADLogManager *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5->_handlers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "name", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
          -[ADLogManager toggleHandler:enable:](v5, "toggleHandler:enable:", v10, 0);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)enableFileLogging
{
  -[ADLogManager toggleByClass:enable:](self, "toggleByClass:enable:", objc_opt_class(), 1);
}

- (void)disableFileLogging
{
  -[ADLogManager toggleByClass:enable:](self, "toggleByClass:enable:", objc_opt_class(), 0);
}

- (void)enableVisualLogging
{
  -[ADLogManager toggleByClass:enable:](self, "toggleByClass:enable:", objc_opt_class(), 1);
}

- (void)disableVisualLogging
{
  -[ADLogManager toggleByClass:enable:](self, "toggleByClass:enable:", objc_opt_class(), 0);
}

- (BOOL)enabled
{
  return self->_activeHandlersCounter > 0;
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  void *v9;
  double v10;
  double v11;

  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    v11 = v10;

    -[ADLogManager logPixelBuffer:name:priority:timestamp:](self, "logPixelBuffer:name:priority:timestamp:", a3, a4, a5, v11);
  }
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5
{
  -[ADLogManager logPixelBuffer:name:priority:timestamp:](self, "logPixelBuffer:name:priority:timestamp:", a3, a4, 0, a5);
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_handlers;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v13, "active", (_QWORD)v14))
            objc_msgSend(v13, "logPixelBuffer:name:timestamp:", a3, a4, a6);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    v10 = v9;

    -[ADLogManager logPointCloud:name:priority:timestamp:](self, "logPointCloud:name:priority:timestamp:", v11, a4, a5, v10);
  }

}

- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  -[ADLogManager logPointCloud:name:priority:timestamp:](self, "logPointCloud:name:priority:timestamp:", a3, a4, 0, a5);
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_handlers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (_QWORD)v16))
            objc_msgSend(v15, "logPointCloud:name:timestamp:", v10, a4, a6);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)logString:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    v10 = v9;

    -[ADLogManager logString:name:priority:timestamp:](self, "logString:name:priority:timestamp:", v11, a4, a5, v10);
  }

}

- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  -[ADLogManager logString:name:priority:timestamp:](self, "logString:name:priority:timestamp:", a3, a4, 0, a5);
}

- (void)logString:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_handlers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (_QWORD)v16))
            objc_msgSend(v15, "logString:name:timestamp:", v10, a4, a6);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 priority:(unint64_t)a6
{
  void *v11;
  double v12;
  double v13;

  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a6 || self->_forceAllPriorities))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemUptime");
    v13 = v12;

    -[ADLogManager logRawBuffer:size:name:priority:timestamp:](self, "logRawBuffer:size:name:priority:timestamp:", a3, a4, a5, a6, v13);
  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6
{
  -[ADLogManager logRawBuffer:size:name:priority:timestamp:](self, "logRawBuffer:size:name:priority:timestamp:", a3, a4, a5, 0, a6);
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 priority:(unint64_t)a6 timestamp:(double)a7
{
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a6 || self->_forceAllPriorities))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_handlers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (_QWORD)v16))
            objc_msgSend(v15, "logRawBuffer:size:name:timestamp:", a3, a4, a5, a7);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)logCalibration:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    v10 = v9;

    -[ADLogManager logCalibration:name:priority:timestamp:](self, "logCalibration:name:priority:timestamp:", v11, a4, a5, v10);
  }

}

- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  -[ADLogManager logCalibration:name:priority:timestamp:](self, "logCalibration:name:priority:timestamp:", a3, a4, 0, a5);
}

- (void)logCalibration:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_handlers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (_QWORD)v16))
            objc_msgSend(v15, "logCalibration:name:timestamp:", v10, a4, a6);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)logDictionary:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    v10 = v9;

    -[ADLogManager logDictionary:name:priority:timestamp:](self, "logDictionary:name:priority:timestamp:", v11, a4, a5, v10);
  }

}

- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  -[ADLogManager logDictionary:name:priority:timestamp:](self, "logDictionary:name:priority:timestamp:", a3, a4, 0, a5);
}

- (void)logDictionary:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_handlers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (_QWORD)v16))
            objc_msgSend(v15, "logDictionary:name:timestamp:", v10, a4, a6);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (uint64_t)logMatrix4x4:(__n128)a3 name:(__n128)a4 priority:(__n128)a5
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (*(int *)(result + 8) >= 1)
  {
    v10 = (void *)result;
    if (*(_QWORD *)(result + 56) >= a8 || *(_BYTE *)(result + 48))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemUptime");
      v13 = v12;

      return objc_msgSend(v10, "logMatrix4x4:name:priority:timestamp:", a7, a8, v14, v15, v16, v17, v13);
    }
  }
  return result;
}

- (uint64_t)logMatrix4x3:(__n128)a3 name:(__n128)a4 priority:(__n128)a5
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (*(int *)(result + 8) >= 1)
  {
    v10 = (void *)result;
    if (*(_QWORD *)(result + 56) >= a8 || *(_BYTE *)(result + 48))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemUptime");
      v13 = v12;

      return objc_msgSend(v10, "logMatrix4x3:name:priority:timestamp:", a7, a8, v14, v15, v16, v17, v13);
    }
  }
  return result;
}

- (uint64_t)logMatrix4x3:(void *)a1 name:(const char *)a2 timestamp:(uint64_t)a3
{
  return objc_msgSend(a1, "logMatrix4x3:name:priority:timestamp:", a3, 0);
}

- (void)logMatrix4x3:(double)a3 name:(double)a4 priority:(double)a5 timestamp:(double)a6
{
  if (*((int *)a1 + 2) >= 1 && (*((_QWORD *)a1 + 7) >= a8 || *((_BYTE *)a1 + 48)))
    return (void *)objc_msgSend(a1, "logMatrix4x4:name:priority:timestamp:", a3, a4, a5, a6);
  return a1;
}

- (uint64_t)logMatrix4x4:(void *)a1 name:(const char *)a2 timestamp:(uint64_t)a3
{
  return objc_msgSend(a1, "logMatrix4x4:name:priority:timestamp:", a3, 0);
}

- (void)logMatrix4x4:(__n128)a3 name:(__n128)a4 priority:(__n128)a5 timestamp:(double)a6
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v18 = a4;
  v19 = a5;
  v16 = a2;
  v17 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  if (*(int *)(a1 + 8) >= 1 && (*(_QWORD *)(a1 + 56) >= a9 || *(_BYTE *)(a1 + 48)))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *(id *)(a1 + 16);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", *(_OWORD *)&v16, *(_OWORD *)&v17, *(_OWORD *)&v18, *(_OWORD *)&v19, (_QWORD)v20))objc_msgSend(v15, "logMatrix4x4:name:timestamp:", a8, v16.n128_f64[0], v17.n128_f64[0], v18.n128_f64[0], v19.n128_f64[0], a6);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  ADLogManager *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NSSet *enabledLoggerOverrideSet;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend(v7, "isEqualToString:", kADDeviceConfigurationKeyLoggingHostName))
  {
    +[ADDeviceConfiguration stringForKey:](ADDeviceConfiguration, "stringForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADLogManager setHostName:](v8, "setHostName:", v9);

  }
  if (objc_msgSend(v7, "isEqualToString:", kADDeviceConfigurationKeyLogFolder))
  {
    +[ADDeviceConfiguration stringForKey:](ADDeviceConfiguration, "stringForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADLogManager setLogFolder:](v8, "setLogFolder:", v10);

  }
  if (objc_msgSend(v7, "isEqualToString:", kADDeviceConfigurationKeyLoggingPriorityForceAll))
    v8->_forceAllPriorities = +[ADDeviceConfiguration BOOLForKey:](ADDeviceConfiguration, "BOOLForKey:", kADDeviceConfigurationKeyLoggingPriorityForceAll);
  if (objc_msgSend(v7, "isEqualToString:", kADDeviceConfigurationKeyEnabledLoggers))
  {
    +[ADDeviceConfiguration listForKey:](ADDeviceConfiguration, "listForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)-[NSSet mutableCopy](v8->_enabledLoggerOverrideSet, "mutableCopy");
    objc_msgSend(v13, "minusSet:", v12);
    if (objc_msgSend(v13, "containsObject:", CFSTR("vz")))
      -[ADLogManager disableVisualLogging](v8, "disableVisualLogging");
    if (objc_msgSend(v13, "containsObject:", CFSTR("fl")))
    {
      -[ADLogManager disableFileLogging](v8, "disableFileLogging");
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v14);
            -[ADLogManager disable:](v8, "disable:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v15);
      }

    }
    v18 = (void *)-[NSSet mutableCopy](v12, "mutableCopy");
    objc_msgSend(v18, "minusSet:", v8->_enabledLoggerOverrideSet);
    if (objc_msgSend(v18, "containsObject:", CFSTR("vz")))
      -[ADLogManager enableVisualLogging](v8, "enableVisualLogging");
    if (objc_msgSend(v18, "containsObject:", CFSTR("fl")))
    {
      -[ADLogManager enableFileLogging](v8, "enableFileLogging");
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v19);
            -[ADLogManager enable:](v8, "enable:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v20);
      }

    }
    enabledLoggerOverrideSet = v8->_enabledLoggerOverrideSet;
    v8->_enabledLoggerOverrideSet = v12;

  }
  objc_sync_exit(v8);

}

- (void)applyConfigurationToNewHandler:(id)a3
{
  NSSet *enabledLoggerOverrideSet;
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSSet containsObject:](self->_enabledLoggerOverrideSet, "containsObject:", CFSTR("vz"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || -[NSSet containsObject:](self->_enabledLoggerOverrideSet, "containsObject:", CFSTR("fl"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (enabledLoggerOverrideSet = self->_enabledLoggerOverrideSet,
        objc_msgSend(v6, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(enabledLoggerOverrideSet) = -[NSSet containsObject:](enabledLoggerOverrideSet, "containsObject:", v5),
        v5,
        (_DWORD)enabledLoggerOverrideSet))
  {
    -[ADLogManager toggleHandler:enable:](self, "toggleHandler:enable:", v6, 1);
  }

}

- (unint64_t)loggingPriority
{
  return self->_loggingPriority;
}

- (void)setLoggingPriority:(unint64_t)a3
{
  self->_loggingPriority = a3;
}

- (BOOL)humanReadableFormat
{
  return self->_humanReadableFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledLoggerOverrideSet, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_logFolder, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

+ (id)defaultLoggerWithName:(id)a3
{
  id v3;
  void *v4;
  ADVisualLoggerHandler *v5;
  ADFileLoggerHandler *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = -[ADVisualLoggerHandler initWithName:]([ADVisualLoggerHandler alloc], "initWithName:", v3);
  objc_msgSend(v4, "addHandler:", v5);

  v6 = -[ADFileLoggerHandler initWithName:]([ADFileLoggerHandler alloc], "initWithName:", v3);
  objc_msgSend(v4, "addHandler:", v6);

  return v4;
}

@end
