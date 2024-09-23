@implementation CDMBaseService

- (CDMBaseService)initWithConfig:(id)a3
{
  id v5;
  CDMBaseService *v6;
  CDMBaseService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMBaseService;
  v6 = -[CDMBaseService init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_serviceState = 0;
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  if (!-[NSHashTable containsObject:](observers, "containsObject:", v4))
    -[NSHashTable addObject:](self->_observers, "addObject:", v8);

}

- (NSSet)supportedCommands
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMSetupRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSString)serviceName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)createSetupResponseCommand
{
  CDMSetupResponseCommand *v3;
  int64_t v4;
  void *v5;
  CDMSetupResponseCommand *v6;

  v3 = [CDMSetupResponseCommand alloc];
  v4 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CDMSetupResponseCommand initWithServiceState:serviceName:](v3, "initWithServiceState:serviceName:", v4, v5);

  return v6;
}

- (int64_t)serviceState
{
  return self->_serviceState;
}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:"))
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (void)handleCommand:(id)a3 withCallback:(id)a4
{
  id v6;
  void (**v7)(id, NSObject *, _QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, NSObject *, _QWORD))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v8 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "commandName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CDMBaseService handleCommand:withCallback:]";
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Unhandled Command: %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)publish:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "commandName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v19 = "-[CDMBaseService publish:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "smService:didPublishCommand:", self, v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)request:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "commandName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v22 = "-[CDMBaseService request:withCallback:]";
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "smService:didPublishRequest:withResponseCallback:", self, v6, v7);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a4;
  -[CDMBaseService serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDD0FC8];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v8, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
