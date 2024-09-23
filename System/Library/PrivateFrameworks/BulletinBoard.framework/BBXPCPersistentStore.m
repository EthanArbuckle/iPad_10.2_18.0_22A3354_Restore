@implementation BBXPCPersistentStore

- (BBXPCPersistentStore)init
{
  BBXPCPersistentStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBXPCPersistentStore;
  v2 = -[BBXPCPersistentStore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.bulletinboard.BBXPCPersistentStore.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)_ensureSettingsPersistenceConnection
{
  NSObject *connectionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke;
  v5[3] = &unk_24C563008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1988]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:options:", *MEMORY[0x24BEBF508], 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BEBF498], "serverInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BEBF498], "clientInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &__block_literal_global_23);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke_3;
    v17 = &unk_24C562FE0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v11, "setInvalidationHandler:", &v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v14, v15, v16, v17);
    v12 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Created settings persistence connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20CCB9000, v0, OS_LOG_TYPE_DEFAULT, "Settings persistence connection interrupted", v1, 2u);
  }
}

void __60__BBXPCPersistentStore__ensureSettingsPersistenceConnection__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "Settings persistence connection invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetSettingsPersistenceConnection");

}

- (void)_resetSettingsPersistenceConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__BBXPCPersistentStore__resetSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __59__BBXPCPersistentStore__resetSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void)deleteSectionInfoFile
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BBLogMigration;
  if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting persisted sectionInfo", v5, 2u);
  }
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSectionInfoFile");

}

void __45__BBXPCPersistentStore_deleteSectionInfoFile__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __45__BBXPCPersistentStore_deleteSectionInfoFile__block_invoke_cold_1();

}

- (void)deleteSectionInfoLegacyFile
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BBLogMigration;
  if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting persisted legacySectionInfo", v5, 2u);
  }
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_6_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSectionInfoLegacyFile");

}

void __51__BBXPCPersistentStore_deleteSectionInfoLegacyFile__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __51__BBXPCPersistentStore_deleteSectionInfoLegacyFile__block_invoke_cold_1();

}

- (BOOL)hasSectionInfoLegacyFile
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BBLogMigration;
  if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Checking for existence of legacy sectionInfo file", buf, 2u);
  }
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_8;
  v7[3] = &unk_24C565410;
  v7[4] = &v9;
  objc_msgSend(v4, "hasSectionInfoLegacyFileWithHandler:", v7);
  v5 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_cold_1();

}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_8_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (id)readClearedSections
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Reading clearedSections from persistence", buf, 2u);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__BBXPCPersistentStore_readClearedSections__block_invoke_12;
  v10[3] = &unk_24C564670;
  v10[4] = &v11;
  objc_msgSend(v4, "readSavedClearedSectionsWithHandler:", v10);
  v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend((id)v12[5], "count");
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading clearedSections from persistence. Count: %lu", buf, 0xCu);
  }

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __43__BBXPCPersistentStore_readClearedSections__block_invoke_cold_1();

}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __43__BBXPCPersistentStore_readClearedSections__block_invoke_12_cold_1();
  +[BBUNCoreConversion toBBSectionInfoDictionary:](BBUNCoreConversion, "toBBSectionInfoDictionary:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)readSectionInfo
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Reading sectionInfo from persistence", buf, 2u);
  }
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__BBXPCPersistentStore_readSectionInfo__block_invoke_16;
  v10[3] = &unk_24C564670;
  v10[4] = &v11;
  objc_msgSend(v5, "readSectionInfoWithHandler:", v10);
  v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend((id)v12[5], "count");
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading sectionInfo from persistence. Count: %lu", buf, 0xCu);
  }

  v8 = (void *)objc_msgSend((id)v12[5], "mutableCopy");
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __39__BBXPCPersistentStore_readSectionInfo__block_invoke_cold_1();

}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __39__BBXPCPersistentStore_readSectionInfo__block_invoke_16_cold_1();
  +[BBUNCoreConversion toBBSectionInfoDictionary:](BBUNCoreConversion, "toBBSectionInfoDictionary:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)readSectionInfoLegacy
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Reading sectionInfoLegacy from persistence", buf, 2u);
  }
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_18;
  v10[3] = &unk_24C564670;
  v10[4] = &v11;
  objc_msgSend(v5, "readSectionInfoLegacyFileWithHandler:", v10);
  v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend((id)v12[5], "count");
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading sectionInfoLegacy from persistence. Count: %lu", buf, 0xCu);
  }

  v8 = (void *)objc_msgSend((id)v12[5], "mutableCopy");
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_cold_1();

}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_18_cold_1();
  +[BBUNCoreConversion toBBSectionInfoDictionary:](BBUNCoreConversion, "toBBSectionInfoDictionary:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)readSectionOrder
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Reading sectionOrder from persistence", buf, 2u);
  }
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__BBXPCPersistentStore_readSectionOrder__block_invoke_20;
  v10[3] = &unk_24C564670;
  v10[4] = &v11;
  objc_msgSend(v5, "readSavedClearedSectionsWithHandler:", v10);
  v6 = (id)BBLogPersistence;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend((id)v12[5], "count");
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Finished reading sectionOrder from persistence. Count: %lu", buf, 0xCu);
  }

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __40__BBXPCPersistentStore_readSectionOrder__block_invoke_cold_1();

}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __40__BBXPCPersistentStore_readSectionOrder__block_invoke_20_cold_1();
  +[BBUNCoreConversion toBBSectionInfoDictionary:](BBUNCoreConversion, "toBBSectionInfoDictionary:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)writeClearedSections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v10 = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Writing clearedSections to persistence. Count %lu", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBUNCoreConversion toUNCSectionInfoDictionary:](BBUNCoreConversion, "toUNCSectionInfoDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "writeClearedSections:", v9);
}

void __45__BBXPCPersistentStore_writeClearedSections___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __45__BBXPCPersistentStore_writeClearedSections___block_invoke_cold_1();

}

- (void)writeSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v10 = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Writing sectionInfo to persistence. Count: %lu", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBUNCoreConversion toUNCSectionInfoDictionary:](BBUNCoreConversion, "toUNCSectionInfoDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "writeSectionInfo:", v9);
}

void __41__BBXPCPersistentStore_writeSectionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __41__BBXPCPersistentStore_writeSectionInfo___block_invoke_cold_1();

}

- (void)writeSectionOrder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v10 = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Writing sectionOrder to persistence. Count: %lu", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBUNCoreConversion toUNCSectionInfoDictionary:](BBUNCoreConversion, "toUNCSectionInfoDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "writeSectionOrder:", v9);
}

void __42__BBXPCPersistentStore_writeSectionOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __42__BBXPCPersistentStore_writeSectionOrder___block_invoke_cold_1();

}

- (id)readSectionInfoWithVersionNumberForMigration
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint8_t buf[16];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Reading sectionInfoWithVersionNumberForMigration", buf, 2u);
  }
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_25;
  v8[3] = &unk_24C564670;
  v8[4] = &v10;
  objc_msgSend(v5, "readSectionInfoWithVersionNumberForMigrationWithHandler:", v8);
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_cold_1();

}

void __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __39__BBXPCPersistentStore_readSectionInfo__block_invoke_16_cold_1();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_27;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalAnnounceCarPlaySettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1();

}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_27_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBAnnounceCarPlaySetting:](BBUNCoreConversion, "toBBAnnounceCarPlaySetting:", a2);

}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalAnnounceCarPlaySetting:withHandler:", +[BBUNCoreConversion toUNCAnnounceCarPlaySetting:](BBUNCoreConversion, "toUNCAnnounceCarPlaySetting:", a3), &__block_literal_global_31);

}

void __56__BBXPCPersistentStore_setGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __56__BBXPCPersistentStore_setGlobalAnnounceCarPlaySetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_33;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1();

}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_33_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBAnnounceSetting:](BBUNCoreConversion, "toBBAnnounceSetting:", a2);

}

- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalAnnounceHeadphonesSetting:withHandler:", +[BBUNCoreConversion toUNCAnnounceSetting:](BBUNCoreConversion, "toUNCAnnounceSetting:", a3), &__block_literal_global_36);

}

void __59__BBXPCPersistentStore_setGlobalAnnounceHeadphonesSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __59__BBXPCPersistentStore_setGlobalAnnounceHeadphonesSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalAnnounceSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_38;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalAnnounceSettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_cold_1();

}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_38_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBAnnounceSetting:](BBUNCoreConversion, "toBBAnnounceSetting:", a2);

}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalAnnounceSetting:withHandler:", +[BBUNCoreConversion toUNCAnnounceSetting:](BBUNCoreConversion, "toUNCAnnounceSetting:", a3), &__block_literal_global_41);

}

void __49__BBXPCPersistentStore_setGlobalAnnounceSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_cold_1();

}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_42_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_43;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalContentPreviewsSettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1();

}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_43_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBContentPreviewSetting:](BBUNCoreConversion, "toBBContentPreviewSetting:", a2);

}

- (void)setGlobalContentPreviewsSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalContentPreviewsSetting:withHandler:", +[BBUNCoreConversion toUNCContentPreviewSetting:](BBUNCoreConversion, "toUNCContentPreviewSetting:", a3), &__block_literal_global_46_0);

}

void __56__BBXPCPersistentStore_setGlobalContentPreviewsSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __56__BBXPCPersistentStore_setGlobalContentPreviewsSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_48;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1();

}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_48_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBListDisplayStyleSetting:](BBUNCoreConversion, "toBBListDisplayStyleSetting:", a2);

}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalNotificationListDisplayStyleSetting:withHandler:", +[BBUNCoreConversion toUNCListDisplayStyleSetting:](BBUNCoreConversion, "toUNCListDisplayStyleSetting:", a3), &__block_literal_global_51_0);

}

void __69__BBXPCPersistentStore_setGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __69__BBXPCPersistentStore_setGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_52);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_53;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalScheduledDeliverySettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1();

}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_53_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBScheduledDeliverySetting:](BBUNCoreConversion, "toBBScheduledDeliverySetting:", a2);

}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_54);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliverySetting:withHandler:", +[BBUNCoreConversion toUNCScheduledDeliverySetting:](BBUNCoreConversion, "toUNCScheduledDeliverySetting:", a3), &__block_literal_global_56);

}

void __58__BBXPCPersistentStore_setGlobalScheduledDeliverySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __58__BBXPCPersistentStore_setGlobalScheduledDeliverySetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_57_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_58;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1();

}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_58_cold_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = +[BBUNCoreConversion toBBSystemSetting:](BBUNCoreConversion, "toBBSystemSetting:", a2);

}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_59_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:withHandler:", +[BBUNCoreConversion toUNCSystemSetting:](BBUNCoreConversion, "toUNCSystemSetting:", a3), &__block_literal_global_61);

}

void __73__BBXPCPersistentStore_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __73__BBXPCPersistentStore_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1();

}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = 0;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_62);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_63;
  v6[3] = &unk_24C563AF0;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalScheduledDeliveryTimesWithHandler:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1();

}

void __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_63(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BBXPCPersistentStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_65);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectiveGlobalScheduledDeliveryTimes:withHandler:", v4, &__block_literal_global_67);

}

void __56__BBXPCPersistentStore_setGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __56__BBXPCPersistentStore_setGlobalScheduledDeliveryTimes___block_invoke_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsPersistenceConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __45__BBXPCPersistentStore_deleteSectionInfoFile__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "deleteSectionInfoFileXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BBXPCPersistentStore_deleteSectionInfoLegacyFile__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "deleteSectionInfoLegacyFileXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "hasSectionInfoLegacyFile: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__BBXPCPersistentStore_hasSectionInfoLegacyFile__block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error checking existence of legacy sectionInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "readClearedSectionsXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__BBXPCPersistentStore_readClearedSections__block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading clearedSections %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "readSectionInfoXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __39__BBXPCPersistentStore_readSectionInfo__block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading sectionInfo %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "readSectionInfoLegacyXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__BBXPCPersistentStore_readSectionInfoLegacy__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading legacy sectionInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "readSectionOrderXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BBXPCPersistentStore_readSectionOrder__block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading sectionOrder %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__BBXPCPersistentStore_writeClearedSections___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "writeClearedSectionsXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__BBXPCPersistentStore_writeSectionInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "writeSectionInfoXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __42__BBXPCPersistentStore_writeSectionOrder___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "writeSectionOrderXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__BBXPCPersistentStore_readSectionInfoWithVersionNumberForMigration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "readSectionInfoWithVersionNumberForMigrationXPC: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalAnnounceCarPlaySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBXPCPersistentStore_effectiveGlobalAnnounceCarPlaySetting__block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalAnnounceCarPlaySetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BBXPCPersistentStore_setGlobalAnnounceCarPlaySetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setEffectiveGlobalAnnounceCarPlaySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalAnnounceHeadphonesSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__BBXPCPersistentStore_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_33_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalAnnounceHeadphonesSetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__BBXPCPersistentStore_setGlobalAnnounceHeadphonesSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setEffectiveGlobalAnnounceHeadphonesSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalAnnounceSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__BBXPCPersistentStore_effectiveGlobalAnnounceSetting__block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalAnnounceSetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalContentPreviewsSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBXPCPersistentStore_effectiveGlobalContentPreviewsSetting__block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalContentPreviewsSetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BBXPCPersistentStore_setGlobalContentPreviewsSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setGlobalContentPreviewsSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalNotificationListDisplayStyleSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__BBXPCPersistentStore_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalNotificationListDisplayStyleSetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__BBXPCPersistentStore_setGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setGlobalNotificationListDisplayStyleSetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalScheduledDeliverySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BBXPCPersistentStore_effectiveGlobalScheduledDeliverySetting__block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalScheduledDeliverySetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__BBXPCPersistentStore_setGlobalScheduledDeliverySetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setGlobalScheduledDeliverySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalScheduledDeliveryShowNextSummarySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_58_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error reading effectiveGlobalScheduledDeliveryShowNextSummarySetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__BBXPCPersistentStore_setGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setGlobalScheduledDeliveryShowNextSummarySetting: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBXPCPersistentStore_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "effectiveGlobalScheduledDeliveryTimes: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BBXPCPersistentStore_setGlobalScheduledDeliveryTimes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "setGlobalScheduledDeliveryTimes: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
