@implementation CSContextStore

+ (CSContextStore)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_6);
  return (CSContextStore *)(id)sharedInstance__sharedInstance_1;
}

void __32__CSContextStore_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSContextStore _init]([CSContextStore alloc], "_init");
  v1 = (void *)sharedInstance__sharedInstance_1;
  sharedInstance__sharedInstance_1 = (uint64_t)v0;

}

- (id)_init
{
  CSContextStore *v2;
  uint64_t v3;
  OS_os_log *logger;
  uint64_t v5;
  NSMutableDictionary *currentContext;
  CSContextStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSContextStore;
  v2 = -[CSContextStore init](&v9, sel_init);
  if (v2)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSContextStore"));
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    currentContext = v2->_currentContext;
    v2->_currentContext = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)satisfiesCriteriaForScenario:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "scenarioCriteria");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_currentContext, "objectForKeyedSubscript:", v9, (_QWORD)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        break;
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

      if (!v12)
      {
        LOBYTE(v10) = 0;
        break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        LOBYTE(v10) = 1;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CSContextStore: %@"), self->_currentContext);
}

- (void)updateState:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_currentContext, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG);
  if (v8 == v6)
  {
    if (v9)
      -[CSContextStore updateState:forIdentifier:].cold.1();
  }
  else
  {
    if (v9)
      -[CSContextStore updateState:forIdentifier:].cold.2();
    -[NSMutableDictionary setValue:forKey:](self->_currentContext, "setValue:forKey:", v6, v7);
  }

}

- (id)getStateForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentContext, "objectForKeyedSubscript:", a3);
}

- (void)addObserver:(id)a3 forContextIdentifier:(id)a4
{
  -[NSMutableDictionary addObserver:forKeyPath:options:context:](self->_currentContext, "addObserver:forKeyPath:options:context:", a3, a4, 1, 0);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (NSMutableDictionary)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)updateState:forIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_2383F5000, v0, v1, "Value for contextIdentifier:%@ was already set to %@");
}

- (void)updateState:forIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_2383F5000, v0, v1, "Value for contextIdentifier:%@ updated to %@");
}

@end
