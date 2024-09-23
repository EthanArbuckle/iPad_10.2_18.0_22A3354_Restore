@implementation BBXPCSectionInfoStore

- (BBXPCSectionInfoStore)init
{
  BBXPCSectionInfoStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBXPCSectionInfoStore;
  v2 = -[BBXPCSectionInfoStore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.bulletinboard.BBXPCSectionInfoStore.connectionQueue", 0);
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke;
  v5[3] = &unk_24C563008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke(uint64_t a1)
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
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &__block_literal_global_9);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke_3;
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

void __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke_2()
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

void __61__BBXPCSectionInfoStore__ensureSettingsPersistenceConnection__block_invoke_3(uint64_t a1)
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
  block[2] = __60__BBXPCSectionInfoStore__resetSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __60__BBXPCSectionInfoStore__resetSettingsPersistenceConnection__block_invoke(uint64_t a1)
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

- (id)serverProxyObject
{
  void *v2;
  void *v3;

  -[BBXPCSectionInfoStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __42__BBXPCSectionInfoStore_serverProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __42__BBXPCSectionInfoStore_serverProxyObject__block_invoke_cold_1();

}

- (id)asyncServerProxyObject
{
  void *v2;
  void *v3;

  -[BBXPCSectionInfoStore _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __47__BBXPCSectionInfoStore_asyncServerProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __47__BBXPCSectionInfoStore_asyncServerProxyObject__block_invoke_cold_1();

}

- (void)removeSectionWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[BBXPCSectionInfoStore asyncServerProxyObject](self, "asyncServerProxyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__BBXPCSectionInfoStore_removeSectionWithID___block_invoke;
  v7[3] = &unk_24C562E28;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeSectionWithID:withHandler:", v6, v7);

}

void __45__BBXPCSectionInfoStore_removeSectionWithID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "Removed section with ID %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)sectionInfoByID
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke;
  v7[3] = &unk_24C564590;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "allSectionInfosByIDWithHandler:", v7);

  return v5;
}

void __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_cold_1();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_8;
  v7[3] = &unk_24C564568;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "bs_each:", v7);

}

void __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke;
  v11[3] = &unk_24C5645B8;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "sectionInfoForSectionID:effective:withHandler:", v8, v4, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
      __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }
  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", v5, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)addActiveSectionID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBXPCSectionInfoStore asyncServerProxyObject](self, "asyncServerProxyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addActiveSectionID:withHandler:", v4, &__block_literal_global_13);

}

- (id)allUnsortedSectionInfoIDs
{
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
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke;
  v6[3] = &unk_24C563AF0;
  v6[4] = &v7;
  objc_msgSend(v3, "allSectionIDsWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke_cold_1();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[BBXPCSectionInfoStore asyncServerProxyObject](self, "asyncServerProxyObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[BBUNCoreConversion toUNCSectionInfo:parentSection:](BBUNCoreConversion, "toUNCSectionInfo:parentSection:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSectionInfo:forSectionID:withHandler:", v8, v6, &__block_literal_global_16);
}

- (void)setSectionInfoByID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__BBXPCSectionInfoStore_setSectionInfoByID___block_invoke;
  v9[3] = &unk_24C564600;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v5, "bs_each:", v9);

  -[BBXPCSectionInfoStore asyncServerProxyObject](self, "asyncServerProxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllSectionInfoByID:withHandler:", v8, &__block_literal_global_18);

}

void __44__BBXPCSectionInfoStore_setSectionInfoByID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[BBUNCoreConversion toUNCSectionInfo:parentSection:](BBUNCoreConversion, "toUNCSectionInfo:parentSection:", a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)activeSectionIDs
{
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
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke;
  v6[3] = &unk_24C563FE0;
  v6[4] = &v7;
  objc_msgSend(v3, "activeSectionIDsWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke_cold_1();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (id)sortedSectionIDs
{
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
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke;
  v6[3] = &unk_24C563AF0;
  v6[4] = &v7;
  objc_msgSend(v3, "sortedSectionIDsWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a4;
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__BBXPCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke;
  v10[3] = &unk_24C563AF0;
  v10[4] = &v11;
  objc_msgSend(v7, "sectionInfosForSectionIDs:effective:withHandler:", v6, v4, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __66__BBXPCSectionInfoStore_sortedSectionInfoForSectionIDs_effective___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)allSortedSectionInfo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__BBXPCSectionInfoStore_allSortedSectionInfo___block_invoke;
  v8[3] = &unk_24C563AF0;
  v8[4] = &v9;
  objc_msgSend(v5, "allSortedSectionInfos:withHandler:", v3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__BBXPCSectionInfoStore_allSortedSectionInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "sectionID"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBXPCSectionInfoStore sectionInfoForSectionID:effective:](self, "sectionInfoForSectionID:effective:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)allSortedActiveSections:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__BBXPCSectionInfoStore_allSortedActiveSections___block_invoke;
  v8[3] = &unk_24C563AF0;
  v8[4] = &v9;
  objc_msgSend(v5, "allSortedActiveSections:withHandler:", v3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__BBXPCSectionInfoStore_allSortedActiveSections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1();
  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[BBXPCSectionInfoStore sortedSectionInfoForSectionIDs:effective:](self, "sortedSectionInfoForSectionIDs:effective:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "sectionID", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)clearedInfoForSectionID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke;
  v8[3] = &unk_24C564648;
  v8[4] = &v9;
  objc_msgSend(v5, "clearedInfoForSectionID:withHandler:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke_cold_1();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (id)clearedSectionsByID
{
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
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BBXPCSectionInfoStore serverProxyObject](self, "serverProxyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke;
  v6[3] = &unk_24C564670;
  v6[4] = &v7;
  objc_msgSend(v3, "clearedSectionsByIDWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
    __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke_cold_1();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[BBXPCSectionInfoStore asyncServerProxyObject](self, "asyncServerProxyObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClearedInfo:forSectionID:withHandler:", v7, v6, &__block_literal_global_23);

}

- (void)setClearedSectionsByID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBXPCSectionInfoStore asyncServerProxyObject](self, "asyncServerProxyObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClearedSectionsByID:withHandler:", v4, &__block_literal_global_24);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsPersistenceConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __42__BBXPCSectionInfoStore_serverProxyObject__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "BBXPCSectionInfoStore: Error getting remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__BBXPCSectionInfoStore_asyncServerProxyObject__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "BBXPCSectionInfoStore: Error getting async remote proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BBXPCSectionInfoStore_sectionInfoByID__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting sectionInfoByID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__BBXPCSectionInfoStore_sectionInfoForSectionID_effective___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20CCB9000, log, OS_LOG_TYPE_ERROR, "Error getting sectionInfoForID: %@ %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __50__BBXPCSectionInfoStore_allUnsortedSectionInfoIDs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting sectionInfoIDs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__BBXPCSectionInfoStore_activeSectionIDs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting activeSectionIDs %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__BBXPCSectionInfoStore_sortedSectionIDs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting sortedSectionIDs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__BBXPCSectionInfoStore_clearedInfoForSectionID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting clearedInfoForSectionID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__BBXPCSectionInfoStore_clearedSectionsByID__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting clearedSectionsByID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
