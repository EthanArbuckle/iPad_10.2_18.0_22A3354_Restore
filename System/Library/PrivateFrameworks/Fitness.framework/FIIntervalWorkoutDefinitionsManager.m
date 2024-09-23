@implementation FIIntervalWorkoutDefinitionsManager

- (FIIntervalWorkoutDefinitionsManager)init
{
  FIIntervalWorkoutDefinitionsManager *v2;
  NPSManager *v3;
  NPSManager *syncManager;
  uint64_t v5;
  NPSDomainAccessor *domainAccessor;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FIIntervalWorkoutDefinitionsManager;
  v2 = -[FIIntervalWorkoutDefinitionsManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp.intervals"));
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = (NPSDomainAccessor *)v5;

    v7 = (id)-[NPSDomainAccessor synchronize](v2->_domainAccessor, "synchronize");
    -[FIIntervalWorkoutDefinitionsManager _checkVersion](v2, "_checkVersion");
    -[FIIntervalWorkoutDefinitionsManager loadIntervalWorkoutDefinitions](v2, "loadIntervalWorkoutDefinitions");
  }
  return v2;
}

- (void)_checkVersion
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v2 = 2048;
  v3 = 1;
  v4 = 2048;
  v5 = 1;
  _os_log_error_impl(&dword_21168F000, v0, OS_LOG_TYPE_ERROR, "Unsupported interval definitions version. Default interval workouts have been created with current version. User version:%lx Minimum supported version:%lx Current version:%lx", v1, 0x20u);
}

- (void)loadIntervalWorkoutDefinitions
{
  NSMutableDictionary *v3;
  NSMutableDictionary *rootIntervalWorkoutDefinitions;
  id v5;

  -[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:", CFSTR("IntervalWorkoutDefinitions"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinitionsManager _deserializeIntervalWorkoutDefinitions:](self, "_deserializeIntervalWorkoutDefinitions:", v5);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  self->_rootIntervalWorkoutDefinitions = v3;

}

- (id)_deserializeIntervalWorkoutDefinitions:(id)a3
{
  id v3;
  os_log_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v3;
    obj = v3;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v21)
    {
      v19 = *(_QWORD *)v31;
      v4 = (os_log_t *)MEMORY[0x24BDD3078];
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(obj);
          v24 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v5);
          v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v23 = v6;
          objc_msgSend(obj, "objectForKeyedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v27 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
                v25 = 0;
                +[FIIntervalWorkoutDefinition definitionFromDictionary:error:](FIIntervalWorkoutDefinition, "definitionFromDictionary:error:", v13, &v25);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v25;
                if (v15)
                {
                  _HKInitializeLogging();
                  v16 = *v4;
                  if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v35 = v15;
                    _os_log_error_impl(&dword_21168F000, v16, OS_LOG_TYPE_ERROR, "Error deserializing workout definition. Error: %@", buf, 0xCu);
                  }
                }
                else
                {
                  objc_msgSend(v7, "addObject:", v14);
                }

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
            }
            while (v10);
          }

          objc_msgSend(v20, "setObject:forKey:", v7, v23);
          v5 = v24 + 1;
        }
        while (v24 + 1 != v21);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v21);
    }

    v3 = v18;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_serializeRootIntervalWorkoutDefinitions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8, v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "dictionaryRepresentation");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v13);
        }

        v17 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v21, "setObject:forKey:", v17, v8);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return v18;
}

- (void)_saveRootIntervalWorkoutDefinitions:(id)a3
{
  id v4;
  NPSManager *syncManager;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[NPSDomainAccessor setObject:forKey:](self->_domainAccessor, "setObject:forKey:", a3, CFSTR("IntervalWorkoutDefinitions"));
  -[NPSDomainAccessor setInteger:forKey:](self->_domainAccessor, "setInteger:forKey:", 1, CFSTR("IntervalWorkoutDefinitionsVersion"));
  v4 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
  syncManager = self->_syncManager;
  -[NPSDomainAccessor domain](self->_domainAccessor, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v10[0] = CFSTR("IntervalWorkoutDefinitions");
  v10[1] = CFSTR("IntervalWorkoutDefinitionsVersion");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSManager synchronizeNanoDomain:keys:](syncManager, "synchronizeNanoDomain:keys:", v6, v9);

}

- (void)_serializeAndSaveRootIntervalWorkoutDefinitions:(id)a3
{
  id v4;

  -[FIIntervalWorkoutDefinitionsManager _serializeRootIntervalWorkoutDefinitions:](self, "_serializeRootIntervalWorkoutDefinitions:", self->_rootIntervalWorkoutDefinitions);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIIntervalWorkoutDefinitionsManager _saveRootIntervalWorkoutDefinitions:](self, "_saveRootIntervalWorkoutDefinitions:", v4);

}

- (void)_updateIntervalWorkoutDefinition:(id)a3 activityTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_rootIntervalWorkoutDefinitions, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "identifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {
            objc_msgSend(v9, "replaceObjectAtIndex:withObject:", objc_msgSend(v9, "indexOfObject:", v14), v6);

            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "addObject:", v6);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v9, "addObject:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_rootIntervalWorkoutDefinitions, "setObject:forKey:", v9, v7);
  }
LABEL_13:

}

- (void)saveIntervalWorkoutDefinition:(id)a3 activityTypeIdentifier:(id)a4
{
  -[FIIntervalWorkoutDefinitionsManager _updateIntervalWorkoutDefinition:activityTypeIdentifier:](self, "_updateIntervalWorkoutDefinition:activityTypeIdentifier:", a3, a4);
  -[FIIntervalWorkoutDefinitionsManager _serializeAndSaveRootIntervalWorkoutDefinitions:](self, "_serializeAndSaveRootIntervalWorkoutDefinitions:", self->_rootIntervalWorkoutDefinitions);
}

- (void)removeIntervalWorkoutDefinitionAtIndex:(int64_t)a3 activityTypeIdentifier:(id)a4
{
  NSMutableDictionary *rootIntervalWorkoutDefinitions;
  id v7;
  id v8;

  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](rootIntervalWorkoutDefinitions, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rootIntervalWorkoutDefinitions, "setObject:forKeyedSubscript:", v8, v7);

  -[FIIntervalWorkoutDefinitionsManager _trimRootIntervalWorkoutDefinitions:](self, "_trimRootIntervalWorkoutDefinitions:", self->_rootIntervalWorkoutDefinitions);
  -[FIIntervalWorkoutDefinitionsManager _serializeAndSaveRootIntervalWorkoutDefinitions:](self, "_serializeAndSaveRootIntervalWorkoutDefinitions:", self->_rootIntervalWorkoutDefinitions);

}

- (void)_trimRootIntervalWorkoutDefinitions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "count"))
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (id)intervalWorkoutDefinitionsForActivityTypeIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rootIntervalWorkoutDefinitions, "objectForKeyedSubscript:", a3);
}

- (void)_saveDefaultIntervalWorkouts
{
  NSMutableDictionary *v3;
  NSMutableDictionary *rootIntervalWorkoutDefinitions;
  NSObject *v5;
  uint8_t v6[16];

  -[FIIntervalWorkoutDefinitionsManager _defaultUserIntervalWorkouts](self, "_defaultUserIntervalWorkouts");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  rootIntervalWorkoutDefinitions = self->_rootIntervalWorkoutDefinitions;
  self->_rootIntervalWorkoutDefinitions = v3;

  -[FIIntervalWorkoutDefinitionsManager _serializeAndSaveRootIntervalWorkoutDefinitions:](self, "_serializeAndSaveRootIntervalWorkoutDefinitions:", self->_rootIntervalWorkoutDefinitions);
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "Default interval workout definitions have been saved.", v6, 2u);
  }
}

- (id)_defaultUserIntervalWorkouts
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FIIntervalWorkoutDefinitionsManager _mockQuarterMileSprints](self, "_mockQuarterMileSprints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[FIIntervalWorkoutDefinitionsManager _mockVariedSpeed](self, "_mockVariedSpeed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("37"));
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FIIntervalWorkoutDefinitionsManager _mockHIIT3010](self, "_mockHIIT3010");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("63"));
  return v3;
}

- (id)_mockHIIT3010
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("HIIT 30/10");
  v9[0] = CFSTR("name");
  v9[1] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("sets");
  v10[1] = v3;
  v10[2] = &unk_24CC5A210;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  +[FIIntervalWorkoutDefinition definitionFromDictionary:error:](FIIntervalWorkoutDefinition, "definitionFromDictionary:error:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      -[FIIntervalWorkoutDefinitionsManager _mockHIIT3010].cold.1();
  }

  return v5;
}

- (id)_mockQuarterMileSprints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("Quarter Mile Sprints");
  v9[0] = CFSTR("name");
  v9[1] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("sets");
  v10[1] = v3;
  v10[2] = &unk_24CC5A258;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  +[FIIntervalWorkoutDefinition definitionFromDictionary:error:](FIIntervalWorkoutDefinition, "definitionFromDictionary:error:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      -[FIIntervalWorkoutDefinitionsManager _mockQuarterMileSprints].cold.1();
  }

  return v5;
}

- (id)_mockVariedSpeed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("Varied Speed");
  v9[0] = CFSTR("name");
  v9[1] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("sets");
  v10[1] = v3;
  v10[2] = &unk_24CC5A348;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  +[FIIntervalWorkoutDefinition definitionFromDictionary:error:](FIIntervalWorkoutDefinition, "definitionFromDictionary:error:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      -[FIIntervalWorkoutDefinitionsManager _mockQuarterMileSprints].cold.1();
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIntervalWorkoutDefinitions, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

- (void)_mockHIIT3010
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "Error deserializing workout definition. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_mockQuarterMileSprints
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "Error deserializing workout definition. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
