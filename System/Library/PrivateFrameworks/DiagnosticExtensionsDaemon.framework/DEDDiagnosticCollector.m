@implementation DEDDiagnosticCollector

- (DEDDiagnosticCollector)init
{
  DEDDiagnosticCollector *v2;
  void *v3;
  os_log_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DEDDiagnosticCollector;
  v2 = -[DEDDiagnosticCollector init](&v7, sel_init);
  if (v2)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create((const char *)objc_msgSend(v3, "loggingSubsystem"), "de-collector");
    -[DEDDiagnosticCollector setLog:](v2, "setLog:", v4);

    -[DEDDiagnosticCollector extensionManager](v2, "extensionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadExtensions");

    -[DEDDiagnosticCollector setCollectionTimeout:](v2, "setCollectionTimeout:", 2100);
  }
  return v2;
}

- (id)collectItemsWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  DEDDiagnosticCollector *v30;
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v7 = a4;
  -[DEDDiagnosticCollector log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDDiagnosticCollector collectItemsWithIdentifier:parameters:].cold.3();

  -[DEDDiagnosticCollector extensionManager](self, "extensionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionForIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = (void *)MEMORY[0x24BDBD1B8];
    if (v7)
      v12 = v7;
    v13 = v12;

    objc_msgSend(v11, "addEntriesFromDictionary:", v13);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DEExtensionHostAppKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DEExtensionHostAppKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("DEExtensionHostAppKey"));
    }
    else
    {
      +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("DEExtensionHostAppKey"));

    }
    objc_msgSend(v10, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose")) & 1) != 0)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("coSysdiagnose"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("coSysdiagnose"));
    }
    else
    {

    }
    -[DEDDiagnosticCollector log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[DEDDiagnosticCollector collectItemsWithIdentifier:parameters:].cold.2();

    v22 = dispatch_group_create();
    dispatch_group_enter(v22);
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__2;
    v38 = __Block_byref_object_dispose__2;
    v39 = 0;
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke;
    v29 = &unk_24D1E53D0;
    v30 = self;
    v31 = v6;
    v33 = &v34;
    v23 = v22;
    v32 = v23;
    objc_msgSend(v10, "attachmentsForParameters:andHandler:", v11, &v26);
    v24 = dispatch_time(0, 1000000000 * -[DEDDiagnosticCollector collectionTimeout](self, "collectionTimeout", v26, v27, v28, v29, v30));
    dispatch_group_wait(v23, v24);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v35[5]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v34, 8);
    v7 = v13;
  }
  else
  {
    -[DEDDiagnosticCollector log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DEDDiagnosticCollector collectItemsWithIdentifier:parameters:].cold.1();

    +[DEDAnalytics extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:](DEDAnalytics, "extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:", v6, 0, 0, 0, 2);
    v17 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v17;
}

void __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_INFO, "finished collecting attachments for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke_cold_1();

  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)prepareItemsWithDeferredExtensionInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[DEDDiagnosticCollector log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDDiagnosticCollector prepareItemsWithDeferredExtensionInfo:].cold.1();

  objc_msgSend(v4, "dedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDDiagnosticCollector extensionManager](self, "extensionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bugSessionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupWithParameters:session:expirationDate:", v10, v11, v12);

}

- (void)prepareItemsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDDiagnosticCollector log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315906;
    v15 = "-[DEDDiagnosticCollector prepareItemsWithIdentifier:parameters:session:]";
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v14, 0x2Au);
  }

  -[DEDDiagnosticCollector extensionManager](self, "extensionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionForIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setupWithParameters:session:", v9, v10);
}

- (void)cleanupItemsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDDiagnosticCollector log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315906;
    v15 = "-[DEDDiagnosticCollector cleanupItemsWithIdentifier:parameters:session:]";
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v14, 0x2Au);
  }

  -[DEDDiagnosticCollector extensionManager](self, "extensionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionForIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "teardownWithParameters:session:", v9, v10);
}

- (BOOL)isDiagnosticExtensionAvailable
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)MEMORY[0x24BDD1550];
  v15 = *MEMORY[0x24BDD0C48];
  v16[0] = CFSTR("com.apple.diagnosticextensions-service");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke;
  v8[3] = &unk_24D1E53F8;
  v8[4] = self;
  v10 = &v11;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "extensionsWithMatchingAttributes:completion:", v5, v8);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((_BYTE *)v12 + 24) != 0;

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)extensionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDDiagnosticCollector cachedExtensions](self, "cachedExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v6 = -[DEDDiagnosticCollector availableDiagnosticExtensions](self, "availableDiagnosticExtensions");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DEDDiagnosticCollector cachedExtensions](self, "cachedExtensions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

- (id)availableDiagnosticExtensions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[DEDDiagnosticCollector extensionManager](self, "extensionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionsWithFilter:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        +[DEDExtension extensionWithDEExtension:](DEDExtension, "extensionWithDEExtension:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x24BDBD1A8];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  -[DEDDiagnosticCollector setCachedExtensions:](self, "setCachedExtensions:", v15);
  return v15;
}

- (void)loadExtensionTextDataInExtension:(id)a3 localization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[DEDDiagnosticCollector extensionManager](self, "extensionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionForIdentifier:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localizedConsentTextWithLocalization:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedConsentText:", v10);

  objc_msgSend(v13, "localizedDataCollectedSummaryWithLocalization:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedDataCollectedSummary:", v11);

  objc_msgSend(v13, "localizedDataCollectedExplanationWithLocalization:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setLocalizedDataCollectedExplanation:", v12);
}

- (id)extensionManager
{
  return (id)objc_msgSend(MEMORY[0x24BE2C990], "sharedInstance");
}

- (unint64_t)collectionTimeout
{
  return self->_collectionTimeout;
}

- (void)setCollectionTimeout:(unint64_t)a3
{
  self->_collectionTimeout = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)cachedExtensions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedExtensions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)collectItemsWithIdentifier:parameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not find extension with identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)collectItemsWithIdentifier:parameters:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_13(&dword_21469E000, v1, (uint64_t)v1, "Combined parameters for %@: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)collectItemsWithIdentifier:parameters:.cold.3()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_3_1();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEBUG, "%s %@ %@", (uint8_t *)v3, 0x20u);
}

void __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEBUG, "collected attachments %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)prepareItemsWithDeferredExtensionInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_13(&dword_21469E000, v0, v1, "%s %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Error finding diagnostic extension [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
