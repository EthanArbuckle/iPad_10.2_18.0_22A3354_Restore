@implementation NDAnalyticsEnvelopeStore

- (NDAnalyticsEnvelopeStore)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsEnvelopeStore init]";
    v9 = 2080;
    v10 = "NDAnalyticsEnvelopeStore.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NDAnalyticsEnvelopeStore init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NDAnalyticsEnvelopeStore)initWithStoreDirectoryFileURL:(id)a3
{
  id v4;
  NDAnalyticsEnvelopeStore *v5;
  void *v6;
  id v7;
  void *v8;
  FCAssetStore *v9;
  FCAssetStore *assetStore;
  FCAssetStore *v11;
  void *v12;
  void *v13;
  FCCacheCoordinator *cacheCoordinator;
  objc_super v16;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStore initWithStoreDirectoryFileURL:].cold.1();
  v16.receiver = self;
  v16.super_class = (Class)NDAnalyticsEnvelopeStore;
  v5 = -[NDAnalyticsEnvelopeStore init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("envelope-store"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BE6CAC0]);
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (FCAssetStore *)objc_msgSend(v7, "initWithDirectoryAtPath:preferredAssetPathExtension:", v8, CFSTR("env"));

    assetStore = v5->_assetStore;
    v5->_assetStore = v9;
    v11 = v9;

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setDelegate:", v5);
    -[FCAssetStore allKeys](v11, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setupWithInitialKeys:", v13);

    cacheCoordinator = v5->_cacheCoordinator;
    v5->_cacheCoordinator = (FCCacheCoordinator *)v12;

  }
  return v5;
}

- (void)copyEnvelopes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStore copyEnvelopes:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke;
  v20[3] = &unk_24D1DECD8;
  v21 = v5;
  v7 = v5;
  objc_msgSend(v4, "fc_dictionaryWithKeyBlock:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDAnalyticsEnvelopeStore assetStore](self, "assetStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v13 = v6;
  v14 = 3221225472;
  v15 = __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_2;
  v16 = &unk_24D1DEC60;
  v17 = v8;
  v18 = v9;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performCacheWrite:", &v13);
  -[NDAnalyticsEnvelopeStore _reportEnvelopesToNewsAutomationIfNeeded:](self, "_reportEnvelopesToNewsAutomationIfNeeded:", v4, v13, v14, v15, v16);

}

id __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnvelopeIdentifier:", v6);

  v7 = objc_msgSend(v3, "contentType");
  objc_msgSend(v4, "setEnvelopeContentType:", v7);
  objc_msgSend(v4, "setEnvelopeSubmissionDate:", *(_QWORD *)(a1 + 32));
  return v4;
}

void __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_3;
  v3[3] = &unk_24D1DED00;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __42__NDAnalyticsEnvelopeStore_copyEnvelopes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(a2, "stringRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "didInsertKeyIntoCache:withLifetimeHint:", v8, 1);
}

- (void)deleteEnvelopesForEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NDAnalyticsEnvelopeStore *v10;
  id v11;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStore deleteEnvelopesForEntries:].cold.1();
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__NDAnalyticsEnvelopeStore_deleteEnvelopesForEntries___block_invoke;
  v8[3] = &unk_24D1DEC60;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performCacheWrite:", v8);

}

void __54__NDAnalyticsEnvelopeStore_deleteEnvelopesForEntries___block_invoke(void **a1)
{
  id v2;

  NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries(a1[4]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_deleteEnvelopesForKeysFromStore:", v2);
  objc_msgSend(a1[6], "didRemoveKeysFromCache:", v2);

}

- (void)enableFlushing
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE6CB00]), "initWithLowWaterMark:highWaterMark:alwaysFlushKeysWithZeroInterest:", 5000000, 10000000, 0);
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableFlushingWithPolicy:", v4);

}

- (void)setObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__NDAnalyticsEnvelopeStore_setObserver___block_invoke;
  v7[3] = &unk_24D1DEBB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performCacheWrite:", v7);

}

id __40__NDAnalyticsEnvelopeStore_setObserver___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (NDAnalyticsEnvelopeStoreObserver)observer
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__NDAnalyticsEnvelopeStore_observer__block_invoke;
  v6[3] = &unk_24D1DED28;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performCacheWrite:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NDAnalyticsEnvelopeStoreObserver *)v4;
}

void __36__NDAnalyticsEnvelopeStore_observer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (id)allEntriesWithHoldToken:(id *)a3
{
  void *v5;
  void *v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__NDAnalyticsEnvelopeStore_allEntriesWithHoldToken___block_invoke;
  v8[3] = &unk_24D1DED50;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = a3;
  objc_msgSend(v5, "performCacheRead:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations((void *)v16[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __52__NDAnalyticsEnvelopeStore_allEntriesWithHoldToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "assetStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheCoordinator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "holdTokenForKeys:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)sizesOfEnvelopesWithEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStore sizesOfEnvelopesWithEntries:].cold.1();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke;
  v9[3] = &unk_24D1DEDA0;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performCacheRead:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "assetStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke_2;
  v8[3] = &unk_24D1DED78;
  v9 = v2;
  v4 = v2;
  objc_msgSend(v3, "fc_dictionaryWithValueBlock:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __56__NDAnalyticsEnvelopeStore_sizesOfEnvelopesWithEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  FCDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "sizeOfFileForKey:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)envelopesForEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStore envelopesForEntries:].cold.1();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[NDAnalyticsEnvelopeStore cacheCoordinator](self, "cacheCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke;
  v9[3] = &unk_24D1DEDA0;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performCacheRead:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "assetStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke_2;
  v8[3] = &unk_24D1DEDC8;
  v9 = v2;
  v4 = v2;
  objc_msgSend(v3, "fc_dictionaryWithValueBlock:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __48__NDAnalyticsEnvelopeStore_envelopesForEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_opt_class();
  FCDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileURLForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6D230]), "initWithData:", v7);

  return v8;
}

- (unint64_t)cacheCoordinatorCurrentSizeWithReadLock:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NDAnalyticsEnvelopeStore assetStore](self, "assetStore", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "storeSize");

  return v4;
}

- (void)cacheCoordinator:(id)a3 flushKeysWithWriteLock:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  objc_msgSend(a4, "allObjects", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NDAnalyticsEnvelopeStore _deleteEnvelopesForKeysFromStore:](self, "_deleteEnvelopesForKeysFromStore:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "envelopeStore:didFlushEnvelopesForEntries:", self, v6);

}

- (void)_deleteEnvelopesForKeysFromStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStore _deleteEnvelopesForKeysFromStore:].cold.1();
  -[NDAnalyticsEnvelopeStore assetStore](self, "assetStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "removeFileWithKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_reportEnvelopesToNewsAutomationIfNeeded:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BE6CA18]);

    if (v5)
    {
      FCURLForFeldsparUserAccountHomeDirectory();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("envelopes"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v23 = v3;
      obj = v3;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v27)
      {
        v25 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v32 != v25)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentType-%d"), objc_msgSend(v8, "contentType"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "URLByAppendingPathComponent:isDirectory:", v9, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 0;
            objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v30);
            v28 = v30;

            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "path");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v13, &v29);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v29;
            v16 = objc_msgSend(v14, "count");

            if (v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "error2");
              *(_DWORD *)buf = 136315906;
              v36 = "-[NDAnalyticsEnvelopeStore _reportEnvelopesToNewsAutomationIfNeeded:]";
              v37 = 2080;
              v38 = "NDAnalyticsEnvelopeStore.m";
              v39 = 1024;
              v40 = 250;
              v41 = 2114;
              v42 = v22;
              _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            v17 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "URLByAppendingPathComponent:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "data");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "writeToURL:atomically:", v20, 1);

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        }
        while (v27);
      }

      v3 = v23;
    }
  }

}

- (FCAssetStore)assetStore
{
  return self->_assetStore;
}

- (void)setAssetStore:(id)a3
{
  objc_storeStrong((id *)&self->_assetStore, a3);
}

- (FCCacheCoordinator)cacheCoordinator
{
  return self->_cacheCoordinator;
}

- (void)setCacheCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_cacheCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
  objc_storeStrong((id *)&self->_assetStore, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithStoreDirectoryFileURL:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storeDirectoryFileURL", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)copyEnvelopes:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopes", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)deleteEnvelopesForEntries:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)sizesOfEnvelopesWithEntries:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)envelopesForEntries:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_deleteEnvelopesForKeysFromStore:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"keys", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
