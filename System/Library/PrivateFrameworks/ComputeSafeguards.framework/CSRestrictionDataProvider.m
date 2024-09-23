@implementation CSRestrictionDataProvider

- (CSRestrictionDataProvider)init
{
  CSRestrictionDataProvider *v2;
  uint64_t v3;
  OS_os_log *logger;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSRestrictionDataProvider;
  v2 = -[CSRestrictionDataProvider init](&v6, sel_init);
  if (v2)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSRestrictionDataProvider"));
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    -[CSRestrictionDataProvider loadAllRestrictionsData](v2, "loadAllRestrictionsData");
  }
  return v2;
}

- (void)loadAllRestrictionsData
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSRestrictionDataProvider _templatesByProcessWithErrors:](self, "_templatesByProcessWithErrors:", v3);

}

- (id)_processesSetWithErrors:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  __int16 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 0;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_DEFAULT, "Loading processes.plist", (uint8_t *)&v22, 2u);
  }
  getCSProcesses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _processesSetWithErrors:].cold.1();
    v11 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Processes plist failure"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v8);
    goto LABEL_17;
  }
  CSArrayForKey(v6, CFSTR("processes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _processesSetWithErrors:].cold.2();
    v14 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Processes array missing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v26;
    v18 = &v25;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _processesSetWithErrors:].cold.3();
    v14 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create processes set from plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = (void **)v28;
    v18 = &v27;
LABEL_16:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v20);
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  v10 = (void *)v9;
LABEL_18:

  return v10;
}

- (id)_exemptProcessesSetWithErrors:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  __int16 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 0;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_DEFAULT, "Loading exempt_processes.plist", (uint8_t *)&v22, 2u);
  }
  getCSExemptProcesses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:].cold.1();
    v11 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exempt Processes plist failure"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v8);
    goto LABEL_17;
  }
  CSArrayForKey(v6, CFSTR("exempt_processes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:].cold.2();
    v14 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exempt Processes array missing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v26;
    v18 = &v25;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:].cold.3();
    v14 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create exempt_processes set from plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = (void **)v28;
    v18 = &v27;
LABEL_16:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v20);
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  v10 = (void *)v9;
LABEL_18:

  return v10;
}

- (BOOL)_isAKnownScenario:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKey:](self->_scenarios, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_buildScenariosMap
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_scenarios;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_scenariosDictWithErrors:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  __int16 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 0;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_DEFAULT, "Loading scenarios.plist", (uint8_t *)&v17, 2u);
  }
  getCSScenarios();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _scenariosDictWithErrors:].cold.1();
    v9 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scenarios plist failure"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v19;
    v13 = &v18;
    goto LABEL_11;
  }
  CSDictionaryForKey(v6, CFSTR("scenarios"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
      -[CSRestrictionDataProvider _scenariosDictWithErrors:].cold.2();
    v9 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scenarios dictionary missing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = (void **)v21;
    v13 = &v20;
LABEL_11:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v15);
    v8 = 0;
  }

  return v8;
}

- (id)configureRestrictionsFromTemplateDictionary:(id)a3 errors:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *logger;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CSScenarioRestrictionsAttributesTemplate *v31;
  void *v32;
  CSRestrictionDataProvider *v33;
  id obj;
  uint64_t v35;
  char v36;
  _BYTE v37[15];
  char v38;
  _BYTE v39[15];
  char v40;
  _BYTE v41[15];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v31 = objc_alloc_init(CSScenarioRestrictionsAttributesTemplate);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    v35 = *MEMORY[0x24BDD0FD8];
    v33 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("RestrictionType"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[CSRestrictionFactory restrictionForClass:withProperties:errors:](CSRestrictionFactory, "restrictionForClass:withProperties:errors:", v13, v12, v7);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v32, "addObject:", v14);
LABEL_22:

                goto LABEL_23;
              }
              logger = self->_logger;
              if (os_log_type_enabled(logger, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v12;
                _os_log_fault_impl(&dword_2383F5000, logger, OS_LOG_TYPE_FAULT, "Could not create restriction with properties: %@", buf, 0xCu);
              }
              v25 = (void *)MEMORY[0x24BDD1540];
              v46 = v35;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create restriction with properties: %@."), v12);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v26;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 3, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "addObject:", v28);
LABEL_21:
              self = v33;
              goto LABEL_22;
            }
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
              -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:].cold.2(&v36, v37);
            v21 = (void *)MEMORY[0x24BDD1540];
            v50 = v35;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected string value type for key RestrictionType."));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v22;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 2, v23);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
              -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:].cold.1(&v38, v39);
            v18 = (void *)MEMORY[0x24BDD1540];
            v52 = v35;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RestrictionType not found in ScenarioDescription dictionary."));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v20);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v7, "addObject:", v14);
          goto LABEL_21;
        }
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_FAULT))
          -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:].cold.3(&v40, v41);
        v15 = (void *)MEMORY[0x24BDD1540];
        v54 = v35;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ScenarioDescription is not a dictionary."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 2, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v13);
LABEL_23:

        ++v11;
      }
      while (v9 != v11);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      v9 = v29;
    }
    while (v29);
  }

  -[CSScenarioRestrictionsAttributesTemplate setRestrictions:](v31, "setRestrictions:", v32);
  return v31;
}

- (id)_templatesByScenarioForProcess:(id)a3 errors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  NSObject *logger;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v53 = v6;
  v54 = (id)objc_claimAutoreleasedReturnValue();
  getCSProcessRestrictions((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0x24BDD1000uLL;
      v13 = *(_QWORD *)v61;
      v55 = *MEMORY[0x24BDD0FD8];
      v49 = *(_QWORD *)v61;
      v50 = v9;
      do
      {
        v14 = 0;
        v51 = v11;
        do
        {
          if (*(_QWORD *)v61 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v14);
          objc_opt_class();
          v52 = v14;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v16 = v15;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v57 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[NSDictionary objectForKeyedSubscript:](self->_scenariosMap, "objectForKeyedSubscript:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    logger = self->_logger;
                    if (v22)
                    {
                      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v69 = v22;
                        v70 = 2112;
                        v71 = v53;
                        _os_log_debug_impl(&dword_2383F5000, logger, OS_LOG_TYPE_DEBUG, "Reading restrictions for scenario: %@ for process: %@", buf, 0x16u);
                      }
                      CSArrayForKeyWithErrors(v16, v22, v7);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v24)
                      {
                        -[CSRestrictionDataProvider configureRestrictionsFromTemplateDictionary:errors:](self, "configureRestrictionsFromTemplateDictionary:errors:", v24, v7);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v54, "setObject:forKeyedSubscript:", v25, v22);

                      }
                    }
                    else
                    {
                      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v69 = 0;
                        v70 = 2114;
                        v71 = v53;
                        _os_log_error_impl(&dword_2383F5000, logger, OS_LOG_TYPE_ERROR, "Unknown scenario: %{public}@ found in: %{public}@", buf, 0x16u);
                      }
                      v30 = (void *)MEMORY[0x24BDD1540];
                      v66 = v55;
                      objc_msgSend(*(id *)(v12 + 1992), "stringWithFormat:", CFSTR("Scenario %@ not known"), 0);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = v31;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 4, v32);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                      v12 = 0x24BDD1000;
                      objc_msgSend(v7, "addObject:", v24);
                    }

                  }
                  else
                  {
                    v26 = self->_logger;
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v69 = v53;
                      _os_log_fault_impl(&dword_2383F5000, v26, OS_LOG_TYPE_FAULT, "Expected string value type for scenario name for process: %@", buf, 0xCu);
                    }
                    v27 = (void *)MEMORY[0x24BDD1540];
                    v72 = v55;
                    objc_msgSend(*(id *)(v12 + 1992), "stringWithFormat:", CFSTR("Expected string value type for scenario name"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = v28;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 2, v29);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();

                    v12 = 0x24BDD1000;
                    objc_msgSend(v7, "addObject:", v22);
                  }

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
              }
              while (v18);
              v9 = v50;
              v11 = v51;
              v13 = v49;
            }
          }
          else
          {
            v33 = self->_logger;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v69 = v53;
              _os_log_fault_impl(&dword_2383F5000, v33, OS_LOG_TYPE_FAULT, "Expected dictionary value type for scenario items for process: %@", buf, 0xCu);
            }
            v34 = (void *)MEMORY[0x24BDD1540];
            v75 = v55;
            objc_msgSend(*(id *)(v12 + 1992), "stringWithFormat:", CFSTR("Expected dictionary value type for scenario items"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v35;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 2, v36);
            v16 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "addObject:", v16);
          }

          v14 = v52 + 1;
        }
        while (v52 + 1 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
      }
      while (v11);
    }
  }
  else
  {
    v37 = self->_logger;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[CSRestrictionDataProvider _templatesByScenarioForProcess:errors:].cold.1((uint64_t)v6, v37, v38, v39, v40, v41, v42, v43);
    v44 = (void *)MEMORY[0x24BDD1540];
    v64 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Restrictions plist failure for process: %@"), v6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v45;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("CSRestrictionDataProviderErrorDomain"), 1, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v47);
  }

  return v54;
}

- (void)_templatesByProcessWithErrors:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSObject *logger;
  NSSet *v7;
  NSSet *processes;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  NSSet *exemptProcesses;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSDictionary *v25;
  NSDictionary *scenarios;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *v34;
  NSDictionary *scenariosMap;
  NSSet *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  NSDictionary *restrictionsByProcessForScenario;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[8];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_DEFAULT, "Loading Processes, ExemptProcesses, Scenarios and Restrictions", buf, 2u);
  }
  -[CSRestrictionDataProvider _processesSetWithErrors:](self, "_processesSetWithErrors:", v4);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  processes = self->_processes;
  self->_processes = v7;

  v9 = self->_logger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CSRestrictionDataProvider _templatesByProcessWithErrors:].cold.3((uint64_t)&self->_processes, v9, v10, v11, v12, v13, v14, v15);
  -[CSRestrictionDataProvider _exemptProcessesSetWithErrors:](self, "_exemptProcessesSetWithErrors:", v4);
  v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
  exemptProcesses = self->_exemptProcesses;
  self->_exemptProcesses = v16;

  v18 = self->_logger;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[CSRestrictionDataProvider _templatesByProcessWithErrors:].cold.2((uint64_t)&self->_exemptProcesses, v18, v19, v20, v21, v22, v23, v24);
  -[CSRestrictionDataProvider _scenariosDictWithErrors:](self, "_scenariosDictWithErrors:", v4);
  v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  scenarios = self->_scenarios;
  self->_scenarios = v25;

  v27 = self->_logger;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[CSRestrictionDataProvider _templatesByProcessWithErrors:].cold.1((uint64_t)&self->_scenarios, v27, v28, v29, v30, v31, v32, v33);
  -[CSRestrictionDataProvider _buildScenariosMap](self, "_buildScenariosMap");
  v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  scenariosMap = self->_scenariosMap;
  self->_scenariosMap = v34;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v36 = self->_processes;
  v37 = -[NSSet countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[CSRestrictionDataProvider _templatesByScenarioForProcess:errors:](self, "_templatesByScenarioForProcess:errors:", v41, v4, (_QWORD)v44);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v42, v41);

      }
      v38 = -[NSSet countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v38);
  }

  restrictionsByProcessForScenario = self->_restrictionsByProcessForScenario;
  self->_restrictionsByProcessForScenario = v5;

}

- (id)exemptProcessesSet
{
  return self->_exemptProcesses;
}

- (id)processesSet
{
  return self->_processes;
}

- (id)scenariosDictionary
{
  return self->_scenarios;
}

- (id)restrictionsByProcessPerScenario
{
  return self->_restrictionsByProcessForScenario;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)processes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProcesses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)exemptProcesses
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExemptProcesses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)scenariosMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScenariosMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)scenarios
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScenarios:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)restrictionsByProcessForScenario
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRestrictionsByProcessForScenario:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionsByProcessForScenario, 0);
  objc_storeStrong((id *)&self->_scenarios, 0);
  objc_storeStrong((id *)&self->_scenariosMap, 0);
  objc_storeStrong((id *)&self->_exemptProcesses, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)_processesSetWithErrors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Processes plist failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processesSetWithErrors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Processes array missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processesSetWithErrors:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Could not create processes set from plist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_exemptProcessesSetWithErrors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Exempt Processes plist failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_exemptProcessesSetWithErrors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Exempt Processes array missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_exemptProcessesSetWithErrors:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Could not create exempt_processes set from plist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scenariosDictWithErrors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "Scenarios plist failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scenariosDictWithErrors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_2383F5000, v0, v1, "scenarios dictionary missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)configureRestrictionsFromTemplateDictionary:(_BYTE *)a1 errors:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_2383F5000, v2, (uint64_t)v2, "RestrictionType not found in ScenarioDescription dictionary", v3);
}

- (void)configureRestrictionsFromTemplateDictionary:(_BYTE *)a1 errors:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_2383F5000, v2, (uint64_t)v2, "Expected string value type for key RestrictionType", v3);
}

- (void)configureRestrictionsFromTemplateDictionary:(_BYTE *)a1 errors:(_BYTE *)a2 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_2383F5000, v2, (uint64_t)v2, "ScenarioDescription array does not contains elements of type dictionary", v3);
}

- (void)_templatesByScenarioForProcess:(uint64_t)a3 errors:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, a2, a3, "Restrictions plist failure for process: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_templatesByProcessWithErrors:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, a2, a3, "scenariosSet: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_templatesByProcessWithErrors:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, a2, a3, "exemptProcessesSet: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_templatesByProcessWithErrors:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2383F5000, a2, a3, "processesSet: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
