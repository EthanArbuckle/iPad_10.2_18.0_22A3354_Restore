@implementation DOCUserInterfaceStateStore

id __34__DOCUserInterfaceStateStore_init__block_invoke()
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
}

+ (DOCUserInterfaceStateStore)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_6);
  return (DOCUserInterfaceStateStore *)(id)sharedStore_sharedManager;
}

- (void)updateInterfaceState:(id)a3 forConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE2DFE0];
  v9 = *MEMORY[0x24BE2DFE0];
  if (!*MEMORY[0x24BE2DFE0])
  {
    DOCInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[DOCUserInterfaceStateStore updateInterfaceState:forConfiguration:].cold.1(v9, v7);
  objc_msgSend(v6, "bumpLastUpdatedDate");
  -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:](self, "_writeUserInterfaceStateToDefaultsForConfiguration:", v7);
  -[DOCUserInterfaceStateStore _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:](self, "_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:", v7);

}

- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;

  v4 = a3;
  -[DOCUserInterfaceStateStore _sortedInterfaceStateKeys](self, "_sortedInterfaceStateKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](self->_uiStateMap, "valueForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSObject **)MEMORY[0x24BE2DFE0];
  v9 = *MEMORY[0x24BE2DFE0];
  if (!*MEMORY[0x24BE2DFE0])
  {
    DOCInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[DOCUserInterfaceStateStore _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:].cold.2((uint64_t)v6, v9, v7);
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v14;
  v12 = v11;
  if (v10)
  {

    v6 = (void *)v10;
LABEL_9:
    -[DOCUserInterfaceStateStore docUserDefaults](self, "docUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doc_setObject:forRoleKey:configuation:", v6, CFSTR("DOCUserDefaultsMostRecentSceneState"), v4);
    goto LABEL_15;
  }
  v13 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v13 = *v8;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[DOCUserInterfaceStateStore _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:].cold.1();

LABEL_15:
}

- (void)_writeUserInterfaceStateToDefaultsForConfiguration:(id)a3
{
  uint64_t v4;
  NSObject **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject **v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id obj;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  -[DOCUserInterfaceStateStore _pruneOldState](self, "_pruneOldState");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NSMutableDictionary allKeys](self->_uiStateMap, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  v5 = (NSObject **)MEMORY[0x24BE2DFE0];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMutableDictionary valueForKey:](self->_uiStateMap, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v26;
        v13 = v5;
        v14 = *v5;
        if (v11)
        {
          if (!v14)
          {
            DOCInitLogging();
            v14 = *v13;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "-[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:]";
            v33 = 2112;
            v34 = v9;
            _os_log_error_impl(&dword_209052000, v14, OS_LOG_TYPE_ERROR, "%s: Encoded state to archive for id: %@", buf, 0x16u);
          }
          objc_msgSend(v24, "setValue:forKey:", v11, v9);
        }
        else
        {
          if (!v14)
          {
            DOCInitLogging();
            v14 = *v13;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v32 = "-[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:]";
            v33 = 2112;
            v34 = v9;
            v35 = 2112;
            v36 = v12;
            _os_log_error_impl(&dword_209052000, v14, OS_LOG_TYPE_ERROR, "%s: Unable to archive state for id: %@. Error: %@", buf, 0x20u);
          }
        }

        v5 = v13;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v6);
  }

  if (!objc_msgSend(v24, "count"))
  {
    v17 = 0;
    v15 = 0;
LABEL_26:
    v19 = v22;
    goto LABEL_27;
  }
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  v17 = v16;
  if (v15 && !v16)
    goto LABEL_26;
  v18 = *v5;
  if (!*v5)
  {
    DOCInitLogging();
    v18 = *v5;
  }
  v19 = v22;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:].cold.2();
LABEL_27:
  -[DOCUserInterfaceStateStore docUserDefaults](self, "docUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *v5;
  if (!*v5)
  {
    DOCInitLogging();
    v21 = *v5;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:].cold.1(v21, v24);
  objc_msgSend(v20, "doc_setObject:forRoleKey:configuation:", v15, CFSTR("DOCUserDefaultsSceneState"), v19);

}

- (id)docUserDefaults
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  return (id)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x24BE2DDF8]);
}

- (void)_pruneOldState
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  OUTLINED_FUNCTION_10_0();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_4_0(&dword_209052000, v2, v4, "%s: evaluating %lu keys", (uint8_t *)v5);

  OUTLINED_FUNCTION_12();
}

- (id)_sortedInterfaceStateKeys
{
  return (id)-[NSMutableDictionary keysSortedByValueUsingComparator:](self->_uiStateMap, "keysSortedByValueUsingComparator:", &__block_literal_global_16);
}

- (id)_loadUserInterfaceStateFromDefaultsForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject **v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  id v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[DOCUserInterfaceStateStore docUserDefaults](self, "docUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  objc_msgSend(v5, "doc_roleSpecificKeyForKey:configuration:", CFSTR("DOCUserDefaultsSceneState"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSObject **)MEMORY[0x24BE2DFE0];
  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCF20]);
    v10 = objc_msgSend(MEMORY[0x24BDBCE70], "classForKeyedUnarchiver");
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    v42 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v12, v7, &v42);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v42;
    v15 = v14;
    if (v13)
    {
      v29 = v14;
      v30 = v12;
      v31 = v7;
      v32 = v6;
      v33 = v5;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v13, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0;
            objc_msgSend(MEMORY[0x24BE2DF40], "unarchivedFromData:configuration:error:", v21, v36, &v37);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v37;
            v24 = v8;
            v25 = *v8;
            if (v22)
            {
              if (!v25)
              {
                DOCInitLogging();
                v25 = *v24;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v44 = "-[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:]";
                v45 = 2112;
                v46 = v20;
                v47 = 2112;
                v48 = v23;
                _os_log_error_impl(&dword_209052000, v25, OS_LOG_TYPE_ERROR, "%s: Unarchived state for id: %@ error: %@", buf, 0x20u);
              }
              objc_msgSend(v35, "setObject:forKey:", v22, v20);
            }
            else
            {
              if (!v25)
              {
                DOCInitLogging();
                v25 = *v24;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v44 = "-[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:]";
                v45 = 2112;
                v46 = v20;
                v47 = 2112;
                v48 = v23;
                _os_log_error_impl(&dword_209052000, v25, OS_LOG_TYPE_ERROR, "%s: Unable to unarchive state for id: %@ error: %@", buf, 0x20u);
              }
            }

            v8 = v24;
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
        }
        while (v17);
      }

      v6 = v32;
      v5 = v33;
      v12 = v30;
      v7 = v31;
      v15 = v29;
    }
    else
    {
      v26 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v26 = *v8;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:].cold.2();
    }

  }
  v27 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v27 = *v8;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:].cold.1(v27, v35);

  return v35;
}

- (id)interfaceStateForConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSMutableDictionary *uiStateMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;

  v4 = a3;
  objc_msgSend(v4, "stateIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  v8 = (NSObject **)MEMORY[0x24BE2DFE0];
  if (v4 && v5)
  {
    uiStateMap = self->_uiStateMap;
    if (!uiStateMap)
    {
      -[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:](self, "_loadUserInterfaceStateFromDefaultsForConfiguration:", v4);
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v11 = self->_uiStateMap;
      self->_uiStateMap = v10;

      uiStateMap = self->_uiStateMap;
    }
    objc_msgSend(v4, "stateIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](uiStateMap, "objectForKey:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v13 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v13 = *v8;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.5(v13);
    }
    else
    {
      -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:](self, "_mostRecentInterfaceStateForConfiguration:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v14, "copy");

      if (v7)
      {
        -[NSMutableDictionary setObject:forKey:](self->_uiStateMap, "setObject:forKey:", v7, v6);
        v15 = *v8;
        if (!*v8)
        {
          DOCInitLogging();
          v15 = *v8;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.4(v15);
      }
      v16 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v16 = *v8;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.3(v16, v4);
        if (v7)
          goto LABEL_24;
      }
      else if (v7)
      {
        goto LABEL_24;
      }
      v17 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v17 = *v8;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.2(v17);
      objc_msgSend(MEMORY[0x24BE2DF40], "stateWithDefaultSettingsForConfiguration:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_uiStateMap, "setObject:forKey:", v7, v6);
    }
  }
LABEL_24:
  v18 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v18 = *v8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.1();

  return v7;
}

void __41__DOCUserInterfaceStateStore_sharedStore__block_invoke()
{
  DOCUserInterfaceStateStore *v0;
  void *v1;

  v0 = objc_alloc_init(DOCUserInterfaceStateStore);
  v1 = (void *)sharedStore_sharedManager;
  sharedStore_sharedManager = (uint64_t)v0;

}

- (DOCUserInterfaceStateStore)init
{
  DOCUserInterfaceStateStore *v2;
  DOCUserInterfaceStateStore *v3;
  NSMutableDictionary *uiStateMap;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCUserInterfaceStateStore;
  v2 = -[DOCUserInterfaceStateStore init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    uiStateMap = v2->_uiStateMap;
    v2->_uiStateMap = 0;

  }
  objc_msgSend(MEMORY[0x24BE2DF08], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAfterLaunch:", &__block_literal_global_2);

  return v3;
}

- (id)_mostRecentInterfaceStateForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  id v12;
  NSObject **v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v4 = a3;
  -[DOCUserInterfaceStateStore docUserDefaults](self, "docUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doc_roleSpecificKeyForKey:configuration:", CFSTR("DOCUserDefaultsMostRecentSceneState"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BE2DF40], "unarchivedFromData:configuration:error:", v7, v4, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    v10 = (NSObject **)MEMORY[0x24BE2DFE0];
    v11 = *MEMORY[0x24BE2DFE0];
    if (v8)
    {
      if (!v11)
      {
        DOCInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:].cold.3(v11);
      v12 = v8;
    }
    else
    {
      if (!v11)
      {
        DOCInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:].cold.2();
    }

  }
  else
  {
    v13 = (NSObject **)MEMORY[0x24BE2DFE0];
    v14 = *MEMORY[0x24BE2DFE0];
    if (!*MEMORY[0x24BE2DFE0])
    {
      DOCInitLogging();
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:].cold.1(v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (void)purgeStateForConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "stateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (NSObject **)MEMORY[0x24BE2DFE0];
    v7 = *MEMORY[0x24BE2DFE0];
    if (!*MEMORY[0x24BE2DFE0])
    {
      DOCInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[DOCUserInterfaceStateStore purgeStateForConfiguration:].cold.1();
    -[NSMutableDictionary removeObjectForKey:](self->_uiStateMap, "removeObjectForKey:", v5);
  }
  -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:](self, "_writeUserInterfaceStateToDefaultsForConfiguration:", v4);

}

- (void)purgeApplicationStateForIdentifiers:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE2DFE0];
  v9 = *MEMORY[0x24BE2DFE0];
  if (!*MEMORY[0x24BE2DFE0])
  {
    DOCInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[DOCUserInterfaceStateStore purgeApplicationStateForIdentifiers:configuration:].cold.1();
  -[NSMutableDictionary removeObjectsForKeys:](self->_uiStateMap, "removeObjectsForKeys:", v6);
  -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:](self, "_writeUserInterfaceStateToDefaultsForConfiguration:", v7);

}

- (void)purgeApplicationStateExcludingIdentifiers:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE2DFE0];
  v9 = *MEMORY[0x24BE2DFE0];
  if (!*MEMORY[0x24BE2DFE0])
  {
    DOCInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[DOCUserInterfaceStateStore purgeApplicationStateExcludingIdentifiers:configuration:].cold.2();
  v10 = (void *)MEMORY[0x24BDBCEF0];
  -[NSMutableDictionary allKeys](self->_uiStateMap, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minusSet:", v13);

  v14 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v14 = *v8;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[DOCUserInterfaceStateStore purgeApplicationStateExcludingIdentifiers:configuration:].cold.1();
  objc_msgSend(v12, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCUserInterfaceStateStore purgeApplicationStateForIdentifiers:configuration:](self, "purgeApplicationStateForIdentifiers:configuration:", v15, v7);

}

uint64_t __55__DOCUserInterfaceStateStore__sortedInterfaceStateKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastUpdatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUpdatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSMutableDictionary)uiStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUiStateMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiStateMap, 0);
}

- (void)interfaceStateForConfiguration:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_3_0(&dword_209052000, v0, (uint64_t)v0, "%s: interfaceStateForConfiguration: identifier: %@ state: %@", (uint8_t *)v1);
}

- (void)interfaceStateForConfiguration:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "stateIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_209052000, v1, v3, "%s: No saved state for id: %@ or recently used state. Creating new state", (uint8_t *)v4);

  OUTLINED_FUNCTION_12();
}

- (void)interfaceStateForConfiguration:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[10];

  v3 = OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend(a2, "stateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_209052000, v3, v5, "%s: No saved state for id: %@ grabbing last saved state: %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)interfaceStateForConfiguration:(os_log_t)log .cold.4(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[DOCUserInterfaceStateStore interfaceStateForConfiguration:]";
  _os_log_debug_impl(&dword_209052000, log, OS_LOG_TYPE_DEBUG, "%s: interfaceStateForConfiguration: Falling Back to Most Recent", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)interfaceStateForConfiguration:(void *)a1 .cold.5(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "stateIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_209052000, v1, v3, "%s: interfaceStateForConfiguration: found state object for stateIdentifier: %@", (uint8_t *)v4);

  OUTLINED_FUNCTION_12();
}

- (void)_mostRecentInterfaceStateForConfiguration:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:]";
  v5 = 2112;
  v6 = 0;
  OUTLINED_FUNCTION_4_0(&dword_209052000, a1, a3, "%s: User defaults contained no state data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

- (void)_mostRecentInterfaceStateForConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_209052000, v0, v1, "%s: Unable to unarchive most recent interface state. Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_mostRecentInterfaceStateForConfiguration:(void *)a1 .cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3[6];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "lastUpdatedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_209052000, v1, OS_LOG_TYPE_ERROR, "%s: unarchived most recent interface state with last updated date of: %@ ", (uint8_t *)v3, 0x16u);

  OUTLINED_FUNCTION_12();
}

- (void)updateInterfaceState:(void *)a1 forConfiguration:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[10];

  v3 = OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend(a2, "stateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_209052000, v3, v5, "%s: Updating interface state for identifier: %@ state: %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)purgeStateForConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_209052000, v0, v1, "%s: Removing saved state for identifier: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

- (void)purgeApplicationStateForIdentifiers:configuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_209052000, v0, v1, "%s: Removing saved state for identifiers: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

- (void)purgeApplicationStateExcludingIdentifiers:configuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_209052000, v0, v1, "%s: Removing saved state for identifiers: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)purgeApplicationStateExcludingIdentifiers:configuration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_209052000, v0, v1, "%s: Removing saved state for all identifiers excluding: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_loadUserInterfaceStateFromDefaultsForConfiguration:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7[10];

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_209052000, v2, v6, "%s: Decoded saved state for %ld identifiers %@ from defaults", (uint8_t *)v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_loadUserInterfaceStateFromDefaultsForConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_209052000, v0, v1, "%s: Unable to unarchive all stored state. Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_writeUserInterfaceStateToDefaultsForConfiguration:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7[10];

  OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_209052000, v2, v6, "%s: Writing saved state for %ld identifiers %@", (uint8_t *)v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeUserInterfaceStateToDefaultsForConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_209052000, v0, v1, "%s: Unable to archive all state. Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_209052000, v0, (uint64_t)v0, "%s: Unable to archive state for id: %@. Error: %@", (uint8_t *)v1);
}

- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "lastUpdatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[DOCUserInterfaceStateStore _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:]";
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16_0(&dword_209052000, v4, v6, "%s: writing most recent UI state with state from archive state from id: %@ lastUpdatedDate: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_0();
}

@end
