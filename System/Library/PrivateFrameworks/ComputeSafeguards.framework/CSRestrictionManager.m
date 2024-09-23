@implementation CSRestrictionManager

+ (id)sharedInstanceWithDataProvider:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CSRestrictionManager_sharedInstanceWithDataProvider___block_invoke;
  block[3] = &unk_250A16848;
  v9 = v3;
  v4 = sharedInstanceWithDataProvider__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceWithDataProvider__onceToken, block);
  v6 = (id)sharedInstanceWithDataProvider___sharedInstance;

  return v6;
}

void __55__CSRestrictionManager_sharedInstanceWithDataProvider___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = -[CSRestrictionManager _initWithDataProvider:]([CSRestrictionManager alloc], "_initWithDataProvider:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedInstanceWithDataProvider___sharedInstance;
  sharedInstanceWithDataProvider___sharedInstance = (uint64_t)v1;

}

- (id)_initWithDataProvider:(id)a3
{
  id v5;
  CSRestrictionManager *v6;
  uint64_t v7;
  OS_os_log *logger;
  uint64_t v9;
  CSScenarioManager *scenarioManager;
  void *v11;
  void *v12;
  uint64_t v13;
  CSProcessManager *processManager;
  uint64_t v15;
  NSDictionary *restrictionsByProcessPerScenario;
  uint64_t v17;
  NSMutableDictionary *processesAffectedByScenarioMap;
  uint64_t v19;
  NSMutableSet *monitors;
  uint64_t v21;
  NSMutableDictionary *currentRestrictionsByProcess;
  uint64_t v23;
  NSSet *currentActiveScenarios;
  void *v25;
  uint64_t v26;
  CSRestriction *defaultRestriction;
  CSRestrictionManager *v28;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSRestrictionManager;
  v6 = -[CSRestrictionManager init](&v30, sel_init);
  if (v6)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionManager"));
    v7 = objc_claimAutoreleasedReturnValue();
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_dataProvider, a3);
    +[CSScenarioManager sharedInstance](CSScenarioManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    scenarioManager = v6->_scenarioManager;
    v6->_scenarioManager = (CSScenarioManager *)v9;

    -[CSRestrictionDataProviding processesSet](v6->_dataProvider, "processesSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSRestrictionDataProviding exemptProcessesSet](v6->_dataProvider, "exemptProcessesSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSProcessManager sharedInstanceWithEnrolledProcesses:andExemptions:](CSProcessManager, "sharedInstanceWithEnrolledProcesses:andExemptions:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    processManager = v6->_processManager;
    v6->_processManager = (CSProcessManager *)v13;

    -[CSRestrictionDataProviding restrictionsByProcessPerScenario](v6->_dataProvider, "restrictionsByProcessPerScenario");
    v15 = objc_claimAutoreleasedReturnValue();
    restrictionsByProcessPerScenario = v6->_restrictionsByProcessPerScenario;
    v6->_restrictionsByProcessPerScenario = (NSDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    processesAffectedByScenarioMap = v6->_processesAffectedByScenarioMap;
    v6->_processesAffectedByScenarioMap = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    monitors = v6->_monitors;
    v6->_monitors = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    currentRestrictionsByProcess = v6->_currentRestrictionsByProcess;
    v6->_currentRestrictionsByProcess = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    currentActiveScenarios = v6->_currentActiveScenarios;
    v6->_currentActiveScenarios = (NSSet *)v23;

    -[CSRestrictionManager populateScenarios](v6, "populateScenarios");
    -[CSRestrictionManager observeProcessChanges](v6, "observeProcessChanges");
    -[CSRestrictionManager traverseRestrictionsData](v6, "traverseRestrictionsData");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSRestrictionFactory restrictionForClass:withProperties:errors:](CSRestrictionFactory, "restrictionForClass:withProperties:errors:", CFSTR("CPUTimeRestrictionBand"), &unk_250A1F230, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    defaultRestriction = v6->_defaultRestriction;
    v6->_defaultRestriction = (CSRestriction *)v26;

    v28 = v6;
  }

  return v6;
}

- (void)traverseRestrictionsData
{
  uint64_t i;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_restrictionsByProcessPerScenario;
  v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[NSDictionary objectForKeyedSubscript:](self->_restrictionsByProcessPerScenario, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
              -[NSMutableDictionary objectForKey:](self->_processesAffectedByScenarioMap, "objectForKey:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v11)
              {
                objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processesAffectedByScenarioMap, "setObject:forKeyedSubscript:", v12, v10);

              }
              -[NSMutableDictionary objectForKeyedSubscript:](self->_processesAffectedByScenarioMap, "objectForKeyedSubscript:", v10);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v4);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v7);
        }

      }
      v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (void)populateScenarios
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *logger;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[CSRestrictionDataProviding scenariosDictionary](self->_dataProvider, "scenariosDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9, v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[CSScenarioFactory scenarioForIdentifier:withProperties:](CSScenarioFactory, "scenarioForIdentifier:withProperties:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSScenarioManager registerScenario:](self->_scenarioManager, "registerScenario:", v11);

        }
        else
        {
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v9;
            _os_log_fault_impl(&dword_2383F5000, logger, OS_LOG_TYPE_FAULT, "Encountered nil scenarioDescription for scenarioIdentifier:%@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }
  -[CSScenarioManager addObserver:](self->_scenarioManager, "addObserver:", self);
  -[CSScenarioManager evaluateScenariosPostInit](self->_scenarioManager, "evaluateScenariosPostInit");

}

- (void)observeProcessChanges
{
  -[CSProcessManager addObserver:](self->_processManager, "addObserver:", self);
}

- (BOOL)applyRestrictionsToProcess:(id)a3 forScenario:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *logger;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t i;
  NSMutableDictionary *currentRestrictionsByProcess;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  char v34;
  NSObject *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CSProcessManager processForIdentifier:](self->_processManager, "processForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v9)
      -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.7();
    -[NSDictionary objectForKey:](self->_restrictionsByProcessPerScenario, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_restrictionsByProcessPerScenario, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_restrictionsByProcessPerScenario, "objectForKeyedSubscript:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "restrictions");
        v15 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)v15;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_currentRestrictionsByProcess, "objectForKey:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v16;
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "isEqualToSet:", v17))
          {
            logger = self->_logger;
            v19 = 1;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v53 = v6;
              v54 = 2112;
              v55 = v7;
              _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_INFO, "Restrictions are unchanged for process:%@ for scenario:%@", buf, 0x16u);
            }
LABEL_52:

            goto LABEL_53;
          }
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v39 = v17;
          v20 = v17;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v21)
          {
            v22 = v21;
            v23 = v7;
            v24 = *(_QWORD *)v47;
            while (2)
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v47 != v24)
                  objc_enumerationMutation(v20);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "releaseForProcess:", v8) & 1) == 0)
                {
                  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
                    -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.6();
                  v19 = 0;
                  goto LABEL_31;
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
              if (v22)
                continue;
              break;
            }
            v19 = 1;
LABEL_31:
            v7 = v23;
            v16 = v41;
          }
          else
          {
            v19 = 1;
          }

        }
        else
        {
          v39 = 0;
          v19 = 1;
        }
        currentRestrictionsByProcess = self->_currentRestrictionsByProcess;
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](currentRestrictionsByProcess, "setObject:forKey:", v27, v6);

        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
          -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.5();
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v28 = v16;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v29)
        {
          v30 = v29;
          v38 = v7;
          v31 = *(_QWORD *)v43;
          while (2)
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v43 != v31)
                objc_enumerationMutation(v28);
              v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              v34 = objc_msgSend(v33, "applyToProcess:", v8, v38);
              v35 = self->_logger;
              if ((v34 & 1) == 0)
              {
                if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
                  -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.4();
                v19 = 0;
                goto LABEL_50;
              }
              if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v53 = v33;
                v54 = 2112;
                v55 = v6;
                _os_log_impl(&dword_2383F5000, v35, OS_LOG_TYPE_INFO, "Successfully applied restriction: %@ to process: %@", buf, 0x16u);
              }
              -[NSMutableDictionary objectForKeyedSubscript:](self->_currentRestrictionsByProcess, "objectForKeyedSubscript:", v6);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObject:", v33);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v30)
              continue;
            break;
          }
          v19 = 1;
LABEL_50:
          v7 = v38;
        }

        v16 = v41;
        v17 = v39;
        goto LABEL_52;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.3();
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.2();
    }
  }
  else if (v9)
  {
    -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.1();
  }
  v19 = 0;
LABEL_53:

  return v19;
}

- (BOOL)applyDefaultRestrictionsToProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSMutableDictionary *currentRestrictionsByProcess;
  void *v10;
  NSObject *logger;
  void *v12;

  v4 = a3;
  -[CSProcessManager processForIdentifier:](self->_processManager, "processForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    -[CSRestrictionManager applyDefaultRestrictionsToProcess:].cold.4();
  -[NSMutableDictionary objectForKey:](self->_currentRestrictionsByProcess, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        -[CSRestrictionManager applyDefaultRestrictionsToProcess:].cold.3();
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    currentRestrictionsByProcess = self->_currentRestrictionsByProcess;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](currentRestrictionsByProcess, "setObject:forKey:", v10, v4);

  }
  v8 = -[CSRestriction applyToProcess:](self->_defaultRestriction, "applyToProcess:", v5);
  logger = self->_logger;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      -[CSRestrictionManager applyDefaultRestrictionsToProcess:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    -[CSRestrictionManager applyDefaultRestrictionsToProcess:].cold.2(&self->_defaultRestriction, (uint64_t)v4, logger);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentRestrictionsByProcess, "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", self->_defaultRestriction);

LABEL_15:
  return v8;
}

- (void)queueChangeForActivatedScenarios:(id)a3 deactivatedScenarios:(id)a4
{
  id v6;
  id v7;
  NSObject *logger;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CSRestrictionManager *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_INFO, "Queueing change for activated scenarios:%@ to be re-revaluated after some debounce", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v9 = dispatch_time(0, 20000000000);
  getMainQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke;
  v13[3] = &unk_250A16870;
  v14 = v6;
  v11 = v6;
  objc_copyWeak(&v17, (id *)buf);
  v15 = v7;
  v16 = self;
  v12 = v7;
  dispatch_after(v9, v10, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t v50;
  void *v51;
  __int128 v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v67;
    *(_QWORD *)&v4 = 138412290;
    v52 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v67 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(WeakRetained, "currentActiveScenarios");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v8);

        v12 = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(v12, "logger");
        v13 = objc_claimAutoreleasedReturnValue();

        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v11)
        {
          if (v14)
          {
            *(_DWORD *)buf = v52;
            v74 = v8;
            _os_log_debug_impl(&dword_2383F5000, v13, OS_LOG_TYPE_DEBUG, "Scenario %@ is still active.", buf, 0xCu);
          }

          objc_msgSend(v53, "addObject:", v8);
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = v52;
            v74 = v8;
            _os_log_debug_impl(&dword_2383F5000, v13, OS_LOG_TYPE_DEBUG, "Scenario %@ no longer active, ignoring.", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v5);
  }

  v15 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v15, "logger");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_4();

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v17 = a1[5];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v63;
    *(_QWORD *)&v19 = 138412290;
    v52 = v19;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v63 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        v24 = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(v24, "currentActiveScenarios");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsObject:", v23);

        v27 = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(v27, "logger");
        v28 = objc_claimAutoreleasedReturnValue();

        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        if ((v26 & 1) != 0)
        {
          if (v29)
          {
            *(_DWORD *)buf = v52;
            v74 = v23;
            _os_log_debug_impl(&dword_2383F5000, v28, OS_LOG_TYPE_DEBUG, "Scenario %@ no longer deactive, ignoring.", buf, 0xCu);
          }

        }
        else
        {
          if (v29)
          {
            *(_DWORD *)buf = v52;
            v74 = v23;
            _os_log_debug_impl(&dword_2383F5000, v28, OS_LOG_TYPE_DEBUG, "Scenario %@ is still inactive.", buf, 0xCu);
          }

          objc_msgSend(v53, "addObject:", v23);
        }
      }
      v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v20);
  }

  v30 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v30, "logger");
  v31 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_3();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v33 = v53;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v59 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
        objc_msgSend(a1[6], "processesAffectedByScenarioMap", v52);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "unionSet:", v40);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v35);
  }

  v41 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v41, "logger");
  v42 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_2();

  v43 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v43, "logger");
  v44 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_1(v44);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v45 = v32;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v55;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v55 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * m);
        objc_msgSend(a1[6], "determineScenarioForProcess:", v50, v52);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
          objc_msgSend(a1[6], "applyRestrictionsToProcess:forScenario:", v50, v51);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    }
    while (v47);
  }

}

- (id)determineScenarioForProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEF0];
  -[NSDictionary objectForKeyedSubscript:](self->_restrictionsByProcessPerScenario, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "intersectSet:", self->_currentActiveScenarios);
  if (objc_msgSend(v8, "count") == 1)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      -[CSRestrictionManager determineScenarioForProcess:].cold.1();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      -[CSRestrictionManager determineScenarioForProcess:].cold.2();
  }

  return v9;
}

- (void)currentActiveScenarios:(id)a3 previousActiveScenarios:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_currentActiveScenarios, a3);
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v8);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v7);
  -[CSRestrictionManager queueChangeForActivatedScenarios:deactivatedScenarios:](self, "queueChangeForActivatedScenarios:deactivatedScenarios:", v10, v9);

}

- (void)observeNewRunningProcesses:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 138412290;
    v13 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CSRestrictionManager determineScenarioForProcess:](self, "determineScenarioForProcess:", v10, v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[CSRestrictionManager applyRestrictionsToProcess:forScenario:](self, "applyRestrictionsToProcess:forScenario:", v10, v11);
        }
        else
        {
          -[CSRestrictionManager logger](self, "logger");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v13;
            v19 = v10;
            _os_log_impl(&dword_2383F5000, v12, OS_LOG_TYPE_INFO, "No scenarios available for process: %@. Proceeding to apply default policy.", buf, 0xCu);
          }

          -[CSRestrictionManager applyDefaultRestrictionsToProcess:](self, "applyDefaultRestrictionsToProcess:", v10);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CSRestrictionDataProviding)dataProvider
{
  return (CSRestrictionDataProviding *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CSScenarioManager)scenarioManager
{
  return (CSScenarioManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScenarioManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CSProcessManager)processManager
{
  return (CSProcessManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)restrictionsByProcessPerScenario
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRestrictionsByProcessPerScenario:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)processesAffectedByScenarioMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessesAffectedByScenarioMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)currentRestrictionsByProcess
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentRestrictionsByProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)currentActiveScenarios
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentActiveScenarios:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableSet)monitors
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMonitors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CSRestriction)defaultRestriction
{
  return (CSRestriction *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaultRestriction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultRestriction, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_currentActiveScenarios, 0);
  objc_storeStrong((id *)&self->_currentRestrictionsByProcess, 0);
  objc_storeStrong((id *)&self->_processesAffectedByScenarioMap, 0);
  objc_storeStrong((id *)&self->_restrictionsByProcessPerScenario, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
  objc_storeStrong((id *)&self->_scenarioManager, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)applyRestrictionsToProcess:forScenario:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Could not locate object corresponding to processName:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyRestrictionsToProcess:forScenario:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2383F5000, v0, v1, "Could not locate Process: %@ in _restrictionsByProcessPerScenario", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyRestrictionsToProcess:forScenario:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2383F5000, v0, v1, "Could not locate Scenario:%@ for Process:%@ in _restrictionsByProcessPerScenario");
  OUTLINED_FUNCTION_2();
}

- (void)applyRestrictionsToProcess:forScenario:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2383F5000, v0, v1, "Failed to apply restriction:%@ to process:%@, skipping any further restrictions");
  OUTLINED_FUNCTION_2();
}

- (void)applyRestrictionsToProcess:forScenario:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_2383F5000, v0, v1, "Applying restrictions:%@ to process:%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyRestrictionsToProcess:forScenario:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2383F5000, v0, v1, "Failed to release restriction:%@ for process:%@, skipping any further restrictions");
  OUTLINED_FUNCTION_2();
}

- (void)applyRestrictionsToProcess:forScenario:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_2383F5000, v0, v1, "Determining restrictions for process:%@ in scenario:%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyDefaultRestrictionsToProcess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Successfully applied default restriction to process: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyDefaultRestrictionsToProcess:(NSObject *)a3 .cold.2(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_2383F5000, a2, a3, "Failed to apply default restriction:%@ to process:%@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)applyDefaultRestrictionsToProcess:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2383F5000, v0, v1, "Failed to apply default restrictions to process:%@ (restrictions already exists)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyDefaultRestrictionsToProcess:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Applying default restrictions for process:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2383F5000, log, OS_LOG_TYPE_DEBUG, "Determining prevailing active scenarios for affected processes", v1, 2u);
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Scenario changes may affect processes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Scenarios that remain changed after deounce: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__CSRestrictionManager_queueChangeForActivatedScenarios_deactivatedScenarios___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Scenarios that remain active after deounce: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)determineScenarioForProcess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, v0, v1, "Picking only available active scenario for process:%@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)determineScenarioForProcess:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2383F5000, v0, v1, "Picking scenario for process:%@ at random from multiple options.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
