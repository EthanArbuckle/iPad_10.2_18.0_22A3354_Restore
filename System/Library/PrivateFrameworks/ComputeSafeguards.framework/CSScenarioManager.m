@implementation CSScenarioManager

+ (CSScenarioManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (CSScenarioManager *)(id)sharedInstance__sharedInstance_0;
}

void __35__CSScenarioManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSScenarioManager _init]([CSScenarioManager alloc], "_init");
  v1 = (void *)sharedInstance__sharedInstance_0;
  sharedInstance__sharedInstance_0 = (uint64_t)v0;

}

- (id)_init
{
  CSScenarioManager *v2;
  uint64_t v3;
  OS_os_log *logger;
  uint64_t v5;
  NSMutableDictionary *allScenariosByIdentifier;
  uint64_t v7;
  NSMutableSet *activeScenarios;
  uint64_t v9;
  NSSet *activeScenariosLastEvaluation;
  uint64_t v11;
  NSSet *activeScenariosLastPublished;
  uint64_t v13;
  NSMutableDictionary *affectedScenarioByContextIdentifier;
  uint64_t v15;
  NSMutableSet *observers;
  CSScenarioManager *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSScenarioManager;
  v2 = -[CSScenarioManager init](&v19, sel_init);
  if (v2)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSScenarioManager"));
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    allScenariosByIdentifier = v2->_allScenariosByIdentifier;
    v2->_allScenariosByIdentifier = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    activeScenarios = v2->_activeScenarios;
    v2->_activeScenarios = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    activeScenariosLastEvaluation = v2->_activeScenariosLastEvaluation;
    v2->_activeScenariosLastEvaluation = (NSSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    activeScenariosLastPublished = v2->_activeScenariosLastPublished;
    v2->_activeScenariosLastPublished = (NSSet *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    affectedScenarioByContextIdentifier = v2->_affectedScenarioByContextIdentifier;
    v2->_affectedScenarioByContextIdentifier = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v15;

    v17 = v2;
  }

  return v2;
}

- (void)registerScenario:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    -[CSScenarioManager registerScenario:].cold.2(logger, v4);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_allScenariosByIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CSScenarioManager registerScenario:].cold.1(v8, v4);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_allScenariosByIdentifier, "setObject:forKeyedSubscript:", v4, v6);
  v23 = v4;
  objc_msgSend(v4, "scenarioCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[CSScenarioManager affectedScenarioByContextIdentifier](self, "affectedScenarioByContextIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          -[CSScenarioManager affectedScenarioByContextIdentifier](self, "affectedScenarioByContextIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v20, v16);

          -[CSScenarioManager _addContextStoreObserverForIdentifier:](self, "_addContextStoreObserverForIdentifier:", v16);
        }
        -[CSScenarioManager affectedScenarioByContextIdentifier](self, "affectedScenarioByContextIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v6);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

}

- (void)evaluateScenariosPostInit
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 5000000000);
  getMainQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke;
  block[3] = &unk_250A16848;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

void __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke_cold_1(v2);

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "allScenariosByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluateScenarios:", v7);

}

- (void)_addContextStoreObserverForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[CSContextStore sharedInstance](CSContextStore, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forContextIdentifier:", self, v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    -[CSScenarioManager observeValueForKeyPath:ofObject:change:context:].cold.2();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_affectedScenarioByContextIdentifier, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    -[CSScenarioManager observeValueForKeyPath:ofObject:change:context:].cold.1();
  objc_initWeak(&location, self);
  getMainQueue();
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__CSScenarioManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_250A16A28;
  objc_copyWeak(&v18, &location);
  v17 = v13;
  v15 = v13;
  dispatch_async(v14, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __68__CSScenarioManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "evaluateScenarios:", *(_QWORD *)(a1 + 32));

}

- (void)evaluateScenarios:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableSet *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *logger;
  NSObject *v17;
  NSObject *v18;
  NSMutableSet *activeScenarios;
  __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  NSMutableSet *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSMutableSet copy](self->_activeScenarios, "copy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138412290;
    v20 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(NSMutableSet **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allScenariosByIdentifier, "objectForKeyedSubscript:", v11, v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSContextStore sharedInstance](CSContextStore, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "satisfiesCriteriaForScenario:", v12);

        v15 = objc_msgSend(v5, "containsObject:", v11);
        if (v14)
        {
          if ((v15 & 1) == 0)
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v20;
              v27 = v11;
              _os_log_debug_impl(&dword_2383F5000, logger, OS_LOG_TYPE_DEBUG, "Scenario:%@ is now active, was previously inactive", buf, 0xCu);
            }
            -[NSMutableSet addObject:](self->_activeScenarios, "addObject:", v11);
          }
        }
        else if (v15)
        {
          v17 = self->_logger;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v27 = v11;
            _os_log_debug_impl(&dword_2383F5000, v17, OS_LOG_TYPE_DEBUG, "Scenario:%@ is now inactive, was previously active", buf, 0xCu);
          }
          -[NSMutableSet removeObject:](self->_activeScenarios, "removeObject:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

  v18 = self->_logger;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    activeScenarios = self->_activeScenarios;
    *(_DWORD *)buf = 138412546;
    v27 = activeScenarios;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_2383F5000, v18, OS_LOG_TYPE_INFO, "Active Scenarios: %@, Previous Scenarios: %@", buf, 0x16u);
  }
  -[CSScenarioManager notifyObserversOfActiveScenarios:previousScenarios:](self, "notifyObserversOfActiveScenarios:previousScenarios:", self->_activeScenarios, v5);

}

- (void)notifyObserversOfActiveScenarios:(id)a3 previousScenarios:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "currentActiveScenarios:previousActiveScenarios:", v6, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CSScenarioManager: ActiveScenarios: %@ AllScenarios: %@"), self->_activeScenarios, self->_allScenariosByIdentifier);
}

- (void)addObserver:(id)a3
{
  -[NSMutableSet addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", a3);
}

- (id)scenarioForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_allScenariosByIdentifier, "objectForKeyedSubscript:", a3);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (NSMutableDictionary)allScenariosByIdentifier
{
  return self->_allScenariosByIdentifier;
}

- (void)setAllScenariosByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_allScenariosByIdentifier, a3);
}

- (NSMutableSet)activeScenarios
{
  return self->_activeScenarios;
}

- (void)setActiveScenarios:(id)a3
{
  objc_storeStrong((id *)&self->_activeScenarios, a3);
}

- (NSMutableDictionary)affectedScenarioByContextIdentifier
{
  return self->_affectedScenarioByContextIdentifier;
}

- (void)setAffectedScenarioByContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_affectedScenarioByContextIdentifier, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSSet)activeScenariosLastEvaluation
{
  return self->_activeScenariosLastEvaluation;
}

- (void)setActiveScenariosLastEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_activeScenariosLastEvaluation, a3);
}

- (NSSet)activeScenariosLastPublished
{
  return self->_activeScenariosLastPublished;
}

- (void)setActiveScenariosLastPublished:(id)a3
{
  objc_storeStrong((id *)&self->_activeScenariosLastPublished, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScenariosLastPublished, 0);
  objc_storeStrong((id *)&self->_activeScenariosLastEvaluation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_affectedScenarioByContextIdentifier, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_allScenariosByIdentifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)registerScenario:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_2383F5000, v3, OS_LOG_TYPE_ERROR, "Scenario: %@ already exists in allScenarios. Replacing.", v5, 0xCu);

  OUTLINED_FUNCTION_0_2();
}

- (void)registerScenario:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_2383F5000, v3, v5, "Registering Scenario: %@", v6);

  OUTLINED_FUNCTION_0_2();
}

void __46__CSScenarioManager_evaluateScenariosPostInit__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2383F5000, log, OS_LOG_TYPE_DEBUG, "Evaluating all scenarios after initial registration of scenarios.", v1, 2u);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_2383F5000, v1, OS_LOG_TYPE_DEBUG, "Scenarios:%@ need to be re-evaluated as they are affected by changed to ContextKey: %@", v2, 0x16u);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_2383F5000, v0, v1, "State for ContextKey: %@ has changed", v2);
}

@end
