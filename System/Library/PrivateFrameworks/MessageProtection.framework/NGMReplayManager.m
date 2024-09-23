@implementation NGMReplayManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__NGMReplayManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __33__NGMReplayManager_sharedManager__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[16];

  MessageProtectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20BABB000, v2, OS_LOG_TYPE_INFO, "Setting shared instance of the NGMReplayManager.", v5, 2u);
  }

  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v3;

}

- (id)dbNameFromProcess
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/NGMTrustStore-%@.db"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isBATS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BATS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PWD"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("/AppleInternal/XCTests/com.apple.messageprotection"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isXCTest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("XCTestBundlePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("xctest"));

  return v6;
}

- (BOOL)isRunningTests
{
  return -[NGMReplayManager isBATS](self, "isBATS") || -[NGMReplayManager isXCTest](self, "isXCTest");
}

- (id)persistentStoreDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  -[NGMReplayManager dbNameFromProcess](self, "dbNameFromProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NGMReplayManager isRunningTests](self, "isRunningTests"))
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(v4, "stringByAppendingString:", v3);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB740]), "initWithURL:", v10);
    objc_msgSend(v11, "setOption:forKey:", *MEMORY[0x24BDD0CE0], *MEMORY[0x24BDBB4F8]);
    objc_msgSend(v11, "setShouldAddStoreAsynchronously:", 0);

    goto LABEL_6;
  }
  NSHomeDirectory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v5, CFSTR("/Library/IdentityServices"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathWithComponents:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  MessageProtectionLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[NGMReplayManager persistentStoreDescription].cold.1(v9);
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)objectContextWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[NGMReplayManager persistentContainerWithError:](self, "persistentContainerWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
    objc_msgSend(v4, "persistentStoreCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersistentStoreCoordinator:", v6);

  }
  else
  {
    MessageProtectionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NGMReplayManager objectContextWithError:].cold.1(a3);

    v5 = 0;
  }

  return v5;
}

- (id)persistentContainerWithError:(id *)a3
{
  NGMReplayManager *v4;
  NSPersistentContainer *persistentContainer;
  NSPersistentContainer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  __int16 v27[8];
  _QWORD v28[6];
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  persistentContainer = v4->_persistentContainer;
  if (persistentContainer)
    goto LABEL_2;
  MessageProtectionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BABB000, v7, OS_LOG_TYPE_INFO, "Performing initial load of the replay database.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MessageProtection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    MessageProtectionLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[NGMReplayManager persistentContainerWithError:].cold.1(v18, v19, v20);

    MPLogAndAssignError(8, a3, CFSTR("Failed to lookup MessageProtection bundle."));
    goto LABEL_31;
  }
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("NGMTrustStore"), CFSTR("momd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    MessageProtectionLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[NGMReplayManager persistentContainerWithError:].cold.2(v21, v22, v23);

    MPLogAndAssignError(9, a3, CFSTR("Failed to lookup replay database model in bundle."));
    goto LABEL_31;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v10);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB700]), "initWithName:managedObjectModel:", CFSTR("NGMTrustStore"), v11);
    -[NGMReplayManager persistentStoreDescription](v4, "persistentStoreDescription");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v35[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPersistentStoreDescriptions:](v12, "setPersistentStoreDescriptions:", v15);

      *(_QWORD *)buf = 0;
      v30 = buf;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__0;
      v33 = __Block_byref_object_dispose__0;
      v34 = 0;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __49__NGMReplayManager_persistentContainerWithError___block_invoke;
      v28[3] = &unk_24C4BF018;
      v28[4] = v4;
      v28[5] = buf;
      -[NSObject loadPersistentStoresWithCompletionHandler:](v12, "loadPersistentStoresWithCompletionHandler:", v28);
      if (*((_QWORD *)v30 + 5))
      {
        MessageProtectionLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[NGMReplayManager persistentContainerWithError:].cold.4(v16);

        if (a3)
          *a3 = objc_retainAutorelease(*((id *)v30 + 5));
        v17 = 1;
      }
      else
      {
        MessageProtectionLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v27[0] = 0;
          _os_log_impl(&dword_20BABB000, v25, OS_LOG_TYPE_INFO, "Loading the persistent container worked, setting it to shared instance", (uint8_t *)v27, 2u);
        }

        objc_storeStrong((id *)&v4->_persistentContainer, v12);
        v17 = 0;
      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      MPLogAndAssignError(6, a3, CFSTR("Failed to get the persistentStoreDescription."));
      v17 = 1;
    }

  }
  else
  {
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v10, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NGMReplayManager persistentContainerWithError:].cold.3(v24, (uint64_t)buf, v12);
    }
    v17 = 1;
  }

  if (v17)
  {
LABEL_31:
    v6 = 0;
    goto LABEL_32;
  }
  persistentContainer = v4->_persistentContainer;
LABEL_2:
  v6 = persistentContainer;
LABEL_32:
  objc_sync_exit(v4);

  return v6;
}

void __49__NGMReplayManager_persistentContainerWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  MessageProtectionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __49__NGMReplayManager_persistentContainerWithError___block_invoke_cold_1(v6);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v6;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_20BABB000, v8, OS_LOG_TYPE_INFO, "Loaded container with description: %@", (uint8_t *)&v14, 0xCu);

    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v5, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logDatabaseCreationDate:", v11);
  }

}

- (void)logDatabaseCreationDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDD0C58]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MessageProtectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20BABB000, v9, OS_LOG_TYPE_INFO, "Loaded replay database was created at: %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)computeDestinationHashForOutgoingMessageTo:(id)a3 withLocalKey:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const void *v18;
  id v19;
  void *v20;

  v5 = (void *)MEMORY[0x24BDBCEC8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v10);

  objc_msgSend(v7, "echnidaRegistration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dhKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v13);

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", v14);
  objc_msgSend(CFSTR("Outgoing"), "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 32);
  v17 = objc_retainAutorelease(v8);
  v18 = (const void *)objc_msgSend(v17, "bytes");
  LODWORD(v12) = objc_msgSend(v17, "length");
  v19 = objc_retainAutorelease(v16);
  CC_SHA256(v18, (CC_LONG)v12, (unsigned __int8 *)objc_msgSend(v19, "bytes"));
  objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)computeDestinationHashForIncomingMessageFrom:(id)a3 toLocalKey:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const void *v18;
  id v19;
  void *v20;

  v5 = (void *)MEMORY[0x24BDBCEC8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v10);

  objc_msgSend(v7, "echnidaRegistration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dhKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v13);

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", v14);
  objc_msgSend(CFSTR("Incoming"), "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 32);
  v17 = objc_retainAutorelease(v8);
  v18 = (const void *)objc_msgSend(v17, "bytes");
  LODWORD(v12) = objc_msgSend(v17, "length");
  v19 = objc_retainAutorelease(v16);
  CC_SHA256(v18, (CC_LONG)v12, (unsigned __int8 *)objc_msgSend(v19, "bytes"));
  objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unsigned)counterForDestinationWithIdentityKey:(id)a3 sendingIdentity:(id)a4 error:(id *)a5 success:(BOOL *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint8_t *v29;
  BOOL *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v22 = a4;
  *a6 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = -1;
  -[NGMReplayManager objectContextWithError:](self, "objectContextWithError:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[SendingDestination fetchRequest](SendingDestination, "fetchRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__0;
    v45 = __Block_byref_object_dispose__0;
    objc_msgSend(v22, "deviceSigningKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NGMReplayManager computeDestinationHashForOutgoingMessageTo:withLocalKey:](self, "computeDestinationHashForOutgoingMessageTo:withLocalKey:", v10, v14);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("destinationHash == %@"), *((_QWORD *)v42 + 5));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v15);

    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke;
    v23[3] = &unk_24C4BF040;
    v24 = v11;
    v16 = v12;
    v25 = v16;
    v27 = &v31;
    v28 = &v37;
    v29 = buf;
    v30 = a6;
    v26 = v10;
    objc_msgSend(v24, "performBlockAndWait:", v23);
    if (a5)
    {
      v17 = (void *)v32[5];
      if (v17)
        *a5 = objc_retainAutorelease(v17);
    }
    v18 = *((_DWORD *)v38 + 6);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    MessageProtectionLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*a5, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NGMReplayManager counterForDestinationWithIdentityKey:sendingIdentity:error:success:].cold.1(v20, buf, v19);
    }

    v18 = *((_DWORD *)v38 + 6);
  }

  _Block_object_dispose(&v37, 8);
  return v18;
}

void __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  SendingDestination *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id obj;

  v3 = a1 + 56;
  v2 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(v3 - 16);
  v6 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 40))
  {
    MessageProtectionLog();
    v8 = (SendingDestination *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
      __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_2(v3);
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (SendingDestination *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[SendingDestination validOutgoingCounter](v8, "validOutgoingCounter");
    v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v9 == -1)
    {
      v17 = *(_QWORD *)(*(_QWORD *)v3 + 8);
      v27 = *(id *)(v17 + 40);
      MPLogAndAssignError(603, &v27, CFSTR("Replay Protection Error: Ran out of counters"));
      objc_storeStrong((id *)(v17 + 40), v27);
LABEL_15:

      goto LABEL_16;
    }
    -[SendingDestination setValidOutgoingCounter:](v8, "setValidOutgoingCounter:", (v9 + 1));
    **(_BYTE **)(a1 + 80) = 1;
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v11 + 40);
    v12 = (id *)(v11 + 40);
    v26 = v13;
    objc_msgSend(v10, "save:", &v26);
    v14 = v26;
  }
  else
  {
    if (objc_msgSend(v7, "count"))
    {
      v15 = *(_QWORD *)(*(_QWORD *)v3 + 8);
      v24 = *(id *)(v15 + 40);
      MPLogAndAssignError(600, &v24, CFSTR("It appears we have a collision in the hashes."));
      v16 = v24;
      v8 = *(SendingDestination **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v16;
      goto LABEL_12;
    }
    v8 = -[SendingDestination initWithContext:]([SendingDestination alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
    -[SendingDestination setDestinationHash:](v8, "setDestinationHash:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v18 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(*(id *)(a1 + 48), "echnidaRegistration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timestamp");
    objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SendingDestination setRegistrationDate:](v8, "setRegistrationDate:", v20);

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    -[SendingDestination setValidOutgoingCounter:](v8, "setValidOutgoingCounter:", 1);
    **(_BYTE **)(a1 + 80) = 1;
    v21 = *(void **)(a1 + 32);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    v12 = (id *)(v22 + 40);
    v25 = v23;
    objc_msgSend(v21, "save:", &v25);
    v14 = v25;
  }
  objc_storeStrong(v12, v14);
  +[FilesystemUtils syncIfNeededOnPlatform](_TtC17MessageProtection15FilesystemUtils, "syncIfNeededOnPlatform");
LABEL_12:

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 40))
  {
    **(_BYTE **)(a1 + 80) = 0;
    MessageProtectionLog();
    v8 = (SendingDestination *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
      __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_1(v3);
    goto LABEL_15;
  }
LABEL_16:

}

- (id)validateIncomingCounter:(unsigned int)a3 prekey:(id)a4 publicIdentity:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];
  id v26;
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "dhKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMReplayManager computeDestinationHashForIncomingMessageFrom:toLocalKey:](self, "computeDestinationHashForIncomingMessageFrom:toLocalKey:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  MessageProtectionLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v31 = v8;
    v32 = 2112;
    v33 = v14;
    _os_log_impl(&dword_20BABB000, v15, OS_LOG_TYPE_INFO, "Validating counter (%i) for destination hash: %@", buf, 0x12u);
  }

  v16 = -[NGMReplayManager processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:](self, "processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:", v14, v8, 0, v11, v10, a6);
  if (a6 && *a6)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*a6, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("An issue occured while validating the counter: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(6, a6, v19);

LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  MessageProtectionLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v21)
    {
      *(_DWORD *)buf = 67109120;
      v31 = v8;
      _os_log_impl(&dword_20BABB000, v20, OS_LOG_TYPE_INFO, "Counter (%i) is considered invalid.", buf, 8u);
    }

    goto LABEL_13;
  }
  if (v21)
  {
    *(_DWORD *)buf = 67109120;
    v31 = v8;
    _os_log_impl(&dword_20BABB000, v20, OS_LOG_TYPE_INFO, "Counter (%i) is considered valid.", buf, 8u);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__NGMReplayManager_validateIncomingCounter_prekey_publicIdentity_error___block_invoke;
  aBlock[3] = &unk_24C4BF068;
  aBlock[4] = self;
  v26 = v14;
  v29 = v8;
  v27 = v11;
  v28 = v10;
  v22 = _Block_copy(aBlock);
  v23 = _Block_copy(v22);

LABEL_14:
  return v23;
}

uint64_t __72__NGMReplayManager_validateIncomingCounter_prekey_publicIdentity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

- (BOOL)processFetchRequestAndValidate:(id)a3 counter:(unsigned int)a4 commit:(BOOL)a5 theirIdentity:(id)a6 prekey:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  NGMReplayManager *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  unsigned int v34;
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[32];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  -[NGMReplayManager objectContextWithError:](self, "objectContextWithError:", a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    +[SenderPublicIdentity fetchRequest](SenderPublicIdentity, "fetchRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("destinationHash == %@"), v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v18);

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    v45 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke;
    v25[3] = &unk_24C4BF090;
    v26 = v16;
    v19 = v17;
    v27 = v19;
    v32 = &v40;
    v28 = v14;
    v29 = v13;
    v30 = self;
    v31 = v15;
    v33 = &v36;
    v34 = a4;
    v35 = a5;
    objc_msgSend(v26, "performBlockAndWait:", v25);
    if (v41[5])
    {
      MessageProtectionLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend((id)v41[5], "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NGMReplayManager processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:].cold.2(a5, v21, (uint64_t)v46, v20);
      }

      v22 = 0;
      if (a8)
        *a8 = objc_retainAutorelease((id)v41[5]);
    }
    else
    {
      v22 = *((_BYTE *)v37 + 24) != 0;
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    MessageProtectionLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NGMReplayManager processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:].cold.1(a8);
    v22 = 0;
  }

  return v22;
}

void __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NGMRollingBitmaskBuffer *v9;
  SenderPublicIdentity *v10;
  NGMRollingBitmaskBuffer *v11;
  void *v12;
  NGMRollingBitmaskBuffer *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id obj;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 80;
  v2 = *(_QWORD *)(a1 + 80);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(v3 - 40);
  v6 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 40))
  {
    MessageProtectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_2(v3);
    goto LABEL_4;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (SenderPublicIdentity *)objc_claimAutoreleasedReturnValue();
    v11 = [NGMRollingBitmaskBuffer alloc];
    -[SenderPublicIdentity skippedCounters](v10, "skippedCounters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NGMRollingBitmaskBuffer initWithData:upperBufferIndex:](v11, "initWithData:upperBufferIndex:", v12, -[SenderPublicIdentity upperBufferIndex](v10, "upperBufferIndex"));
  }
  else
  {
    if (objc_msgSend(v7, "count"))
    {
      v21 = *(void **)(a1 + 72);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v31 = *(id *)(v22 + 40);
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v21, "dhKey");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject description](v8, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("We have duplicate entries on the incoming validation counter for key: %@ \n,                                 destinationHash: %@."), v24, *(_QWORD *)(a1 + 56));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      MPLogAndAssignError(600, &v31, v25);
      objc_storeStrong((id *)(v22 + 40), v31);

LABEL_4:
      v9 = 0;
      v10 = 0;
LABEL_5:

      goto LABEL_6;
    }
    v10 = -[SenderPublicIdentity initWithContext:]([SenderPublicIdentity alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
    v26 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(*(id *)(a1 + 48), "echnidaRegistration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timestamp");
    objc_msgSend(v26, "dateWithTimeIntervalSince1970:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SenderPublicIdentity setDate:](v10, "setDate:", v28);

    -[SenderPublicIdentity setDestinationHash:](v10, "setDestinationHash:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "registeredPrekeyForNGMPrekey:objectContext:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      MessageProtectionLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_1((id *)(a1 + 72));
      v9 = 0;
      goto LABEL_5;
    }
    v12 = (void *)v29;
    -[SenderPublicIdentity setMessagedKey:](v10, "setMessagedKey:", v29);
    v13 = objc_alloc_init(NGMRollingBitmaskBuffer);
  }
  v9 = v13;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = -[NGMRollingBitmaskBuffer processIncomingCounter:](v9, "processIncomingCounter:", *(unsigned int *)(a1 + 96));
  -[NGMRollingBitmaskBuffer bufferData](v9, "bufferData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SenderPublicIdentity setSkippedCounters:](v10, "setSkippedCounters:", v14);

  -[SenderPublicIdentity setUpperBufferIndex:](v10, "setUpperBufferIndex:", -[NGMRollingBitmaskBuffer upper_buffer_index](v9, "upper_buffer_index"));
  MessageProtectionLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      v17 = "";
    else
      v17 = "not";
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    v35 = 2080;
    v36 = v17;
    _os_log_impl(&dword_20BABB000, v15, OS_LOG_TYPE_INFO, "Successfully fetched counters for destination (%@) and counter is %s valid.", buf, 0x16u);
  }

  if (*(_BYTE *)(a1 + 100))
  {
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v30 = *(id *)(v19 + 40);
    objc_msgSend(v18, "save:", &v30);
    v20 = v30;
    v8 = *(NSObject **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v20;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)pruneDuplicates:(id)a3 tag:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  RegisteredPreKey *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(v9, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  v14 = -[RegisteredPreKey initWithContext:]([RegisteredPreKey alloc], "initWithContext:", v9);
  -[RegisteredPreKey setTag:](v14, "setTag:", v8);

  return v14;
}

- (id)registeredPrekeyForNGMPrekey:(id)a3 objectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  RegisteredPreKey *v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  +[RegisteredPreKey fetchRequest](RegisteredPreKey, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dhKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("tag = %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);

  v23 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  if (v13)
  {
    v14 = v13;
    MessageProtectionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NGMReplayManager registeredPrekeyForNGMPrekey:objectContext:].cold.2(v14);

    v16 = 0;
  }
  else
  {
    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "count"))
      {
        v16 = -[RegisteredPreKey initWithContext:]([RegisteredPreKey alloc], "initWithContext:", v7);
        objc_msgSend(v6, "dhKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "keyIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[RegisteredPreKey setTag:](v16, "setTag:", v21);

        v22 = 0;
        objc_msgSend(v7, "save:", &v22);
        v14 = v22;
        goto LABEL_12;
      }
      MessageProtectionLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[NGMReplayManager registeredPrekeyForNGMPrekey:objectContext:].cold.1((uint64_t)v10, v18);

      -[NGMReplayManager pruneDuplicates:tag:moc:](self, "pruneDuplicates:tag:moc:", v12, v10, v7);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (RegisteredPreKey *)v17;
    v14 = 0;
  }
LABEL_12:

  return v16;
}

- (BOOL)deleteReceivingCountersForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0;
  -[NGMReplayManager objectContextWithError:](self, "objectContextWithError:", &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v5)
  {
    +[RegisteredPreKey fetchRequest](RegisteredPreKey, "fetchRequest");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v4, "dhKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("tag = %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v7, "setPredicate:", v11);

    v21 = v6;
    objc_msgSend(v5, "executeFetchRequest:error:", v7, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;

    if (v13)
    {
      MessageProtectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[NGMReplayManager deleteReceivingCountersForKey:].cold.3(v13);
    }
    else
    {
      if (objc_msgSend(v12, "count") != 1)
      {
        if (objc_msgSend(v12, "count"))
        {
          v13 = 0;
          v15 = 0;
          goto LABEL_7;
        }
        MessageProtectionLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = 1;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "dhKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v19;
          _os_log_impl(&dword_20BABB000, v14, OS_LOG_TYPE_INFO, "No counters to delete for %@, probably never received any messages to that prekey.", buf, 0xCu);

        }
        v13 = 0;
LABEL_6:

LABEL_7:
        v6 = v13;
        goto LABEL_11;
      }
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deleteObject:", v17);

      v20 = 0;
      objc_msgSend(v5, "save:", &v20);
      v13 = v20;
      if (!v13)
      {
        v15 = 1;
        goto LABEL_7;
      }
      MessageProtectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[NGMReplayManager deleteReceivingCountersForKey:].cold.2(v4, v13, v14);
    }
    v15 = 0;
    goto LABEL_6;
  }
  MessageProtectionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[NGMReplayManager deleteReceivingCountersForKey:].cold.1(v6);
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)deleteExpiredSendingDestinations
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;

  v19 = 0;
  -[NGMReplayManager objectContextWithError:](self, "objectContextWithError:", &v19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v19;
  if (v2)
  {
    +[SendingDestination fetchRequest](SendingDestination, "fetchRequest");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1758];
    +[NGMTimeBasedEvaluations oldestDateAllowedToSendTo](NGMTimeBasedEvaluations, "oldestDateAllowedToSendTo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("registrationDate < %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v4, "setPredicate:", v7);

    v18 = v3;
    objc_msgSend(v2, "executeFetchRequest:error:", v4, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    if (v9)
    {
      MessageProtectionLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[NGMReplayManager deleteExpiredSendingDestinations].cold.3(v9);
      v11 = 0;
    }
    else
    {
      if (!objc_msgSend(v8, "count"))
      {
        v9 = 0;
        v11 = 1;
LABEL_18:

        v3 = v9;
        goto LABEL_19;
      }
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __52__NGMReplayManager_deleteExpiredSendingDestinations__block_invoke;
      v16[3] = &unk_24C4BF0B8;
      v12 = v2;
      v17 = v12;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
      v15 = 0;
      -[NSObject save:](v12, "save:", &v15);
      v9 = v15;
      if (v9)
      {
        MessageProtectionLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[NGMReplayManager deleteExpiredSendingDestinations].cold.2(v9);

        v11 = 0;
      }
      else
      {
        v11 = 1;
      }
      v10 = v17;
    }

    goto LABEL_18;
  }
  MessageProtectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[NGMReplayManager deleteExpiredSendingDestinations].cold.1(v3);
  v11 = 0;
LABEL_19:

  return v11;
}

uint64_t __52__NGMReplayManager_deleteExpiredSendingDestinations__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

- (BOOL)duplicateTagForPrekey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  RegisteredPreKey *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;

  v14 = 0;
  v4 = a3;
  -[NGMReplayManager objectContextWithError:](self, "objectContextWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = -[RegisteredPreKey initWithContext:]([RegisteredPreKey alloc], "initWithContext:", v5);
  objc_msgSend(v4, "dhKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "keyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RegisteredPreKey setTag:](v7, "setTag:", v9);

  v13 = v6;
  objc_msgSend(v5, "save:", &v13);
  v10 = v13;

  if (v10)
  {
    MessageProtectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NGMReplayManager duplicateTagForPrekey:].cold.1(v10);

  }
  return v10 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)persistentStoreDescription
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20BABB000, log, OS_LOG_TYPE_FAULT, "Failed to get the reference to the Home Directory.", v1, 2u);
}

- (void)objectContextWithError:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failing to initialize a Managed Object Context for NGMTrustStore queries: %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)persistentContainerWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("Failed to lookup MessageProtection bundle.");
  OUTLINED_FUNCTION_3(&dword_20BABB000, a1, a3, "%@", (uint8_t *)&v3);
}

- (void)persistentContainerWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("Failed to lookup replay database model in bundle.");
  OUTLINED_FUNCTION_3(&dword_20BABB000, a1, a3, "%@", (uint8_t *)&v3);
}

- (void)persistentContainerWithError:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_20BABB000, a3, (uint64_t)a3, "Failed to initialize NSManagedObjectModel with URL: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_8();
}

- (void)persistentContainerWithError:(os_log_t)log .cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BABB000, log, OS_LOG_TYPE_ERROR, "The loading of the persistent contained failed, returning nil.", v1, 2u);
}

void __49__NGMReplayManager_persistentContainerWithError___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_2(&dword_20BABB000, v2, v3, "Failed to load persistent store: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)counterForDestinationWithIdentityKey:(os_log_t)log sendingIdentity:error:success:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20BABB000, log, OS_LOG_TYPE_ERROR, "Failed to obtain the managed object context required to do the outgoing replay counter query: %@.", buf, 0xCu);

  OUTLINED_FUNCTION_8();
}

void __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "An issue occured persisting the managed object context: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Database query failed while obtaining sending counter: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)processFetchRequestAndValidate:(id *)a1 counter:commit:theirIdentity:prekey:error:.cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to obtain the managed object context required to validate the incoming replay counter query: %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)processFetchRequestAndValidate:(uint64_t)a3 counter:(NSObject *)a4 commit:theirIdentity:prekey:error:.cold.2(char a1, void *a2, uint64_t a3, NSObject *a4)
{
  const __CFString *v5;

  v5 = CFSTR("validating");
  if ((a1 & 1) != 0)
    v5 = CFSTR("committing");
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_7(&dword_20BABB000, a4, a3, "An error happened while %@ the counter: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_8();
}

void __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "dhKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v3, v4, "There was an issue obtaining the registered prekey: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_2();
}

void __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_2(&dword_20BABB000, v2, v3, "Database Query Failure while obtaining incoming counter: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)registeredPrekeyForNGMPrekey:(uint64_t)a1 objectContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(0, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_7(&dword_20BABB000, a2, v5, "We have duplicate entries on registered prekey. {tag = %@, error = %@}", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_2();
}

- (void)registeredPrekeyForNGMPrekey:(void *)a1 objectContext:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Database query failed while obtaining sending counter: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)deleteReceivingCountersForKey:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to obtain the managed object context required to validate delete the receiving counters: %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)deleteReceivingCountersForKey:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dhKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_7(&dword_20BABB000, a3, v8, "Failed to delete the counters associated with %@: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_1_2();
}

- (void)deleteReceivingCountersForKey:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_2(&dword_20BABB000, v2, v3, "Database query failed while cleaning up old counters: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)deleteExpiredSendingDestinations
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_2(&dword_20BABB000, v2, v3, "Database query failure while deleting old keys: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)duplicateTagForPrekey:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to create a duplicate for the prekey. {error = %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
