@implementation AMUILastSelectedPosterStore

- (AMUILastSelectedPosterStore)initWithAmbientDefaults:(id)a3
{
  id v5;
  AMUILastSelectedPosterStore *v6;
  AMUILastSelectedPosterStore *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *cachedLastSelectedConfigurations;
  void *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *persistenceQueue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMUILastSelectedPosterStore;
  v6 = -[AMUILastSelectedPosterStore init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientDefaults, a3);
    -[AMAmbientDefaults lastSelectedConfigurations](v7->_ambientDefaults, "lastSelectedConfigurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v8 = (void *)MEMORY[0x24BDBD1B8];
    v10 = objc_msgSend(v8, "mutableCopy");
    cachedLastSelectedConfigurations = v7->_cachedLastSelectedConfigurations;
    v7->_cachedLastSelectedConfigurations = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceClass:", 17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSDispatchQueueCreate();
    persistenceQueue = v7->_persistenceQueue;
    v7->_persistenceQueue = (OS_dispatch_queue *)v14;

  }
  return v7;
}

- (AMUILastSelectedPosterStore)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  AMUILastSelectedPosterStore *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  AMUILastSelectedPosterStore *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-init not implemented"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("AMUILastSelectedPosterStore.m");
    v17 = 1024;
    v18 = 46;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_23600A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (AMUILastSelectedPosterStore *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+new not implemented"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("AMUILastSelectedPosterStore.m");
    v17 = 1024;
    v18 = 51;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_23600A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)lastSelectedConfigurationUUIDForChargerIdentifier:(id)a3 providerBundleIdentifier:(id)a4
{
  id v6;
  id v7;
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

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __106__AMUILastSelectedPosterStore_lastSelectedConfigurationUUIDForChargerIdentifier_providerBundleIdentifier___block_invoke;
  v11[3] = &unk_250763BB0;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  -[AMUILastSelectedPosterStore _performWithSelectedConfigurationsForChargerIdentifier:onlyIfPresent:block:](self, "_performWithSelectedConfigurationsForChargerIdentifier:onlyIfPresent:block:", v6, 1, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __106__AMUILastSelectedPosterStore_lastSelectedConfigurationUUIDForChargerIdentifier_providerBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "lastSelectedConfigurationUUIDForProviderBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setLastSelectedConfigurationUUID:(id)a3 forChargerIdentifier:(id)a4 providerBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __110__AMUILastSelectedPosterStore_setLastSelectedConfigurationUUID_forChargerIdentifier_providerBundleIdentifier___block_invoke;
  v12[3] = &unk_250763BD8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AMUILastSelectedPosterStore _performWithSelectedConfigurationsForChargerIdentifier:block:](self, "_performWithSelectedConfigurationsForChargerIdentifier:block:", a4, v12);

}

uint64_t __110__AMUILastSelectedPosterStore_setLastSelectedConfigurationUUID_forChargerIdentifier_providerBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLastSelectedConfigurationUUID:forProviderBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_performWithSelectedConfigurationsForChargerIdentifier:(id)a3 block:(id)a4
{
  -[AMUILastSelectedPosterStore _performWithSelectedConfigurationsForChargerIdentifier:onlyIfPresent:block:](self, "_performWithSelectedConfigurationsForChargerIdentifier:onlyIfPresent:block:", a3, 0, a4);
}

- (void)_performWithSelectedConfigurationsForChargerIdentifier:(id)a3 onlyIfPresent:(BOOL)a4 block:(id)a5
{
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  AMUISelectedConfigurations *v11;
  AMUISelectedConfigurations *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  NSMutableDictionary *cachedLastSelectedConfigurations;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *persistenceQueue;
  id v24;
  id v25;
  void (**v26)(id, AMUISelectedConfigurations *);
  _QWORD block[5];
  id v28;
  _QWORD v29[6];
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  _QWORD v36[3];

  *(_QWORD *)((char *)&v36[1] + 4) = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v26 = (void (**)(id, AMUISelectedConfigurations *))a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedLastSelectedConfigurations, "objectForKeyedSubscript:", v25);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = (void *)MEMORY[0x24BDBD1B8];
  v11 = -[AMUISelectedConfigurations initWithDictionaryRepresentation:]([AMUISelectedConfigurations alloc], "initWithDictionaryRepresentation:", v10);
  if (!v11)
  {
    v12 = objc_alloc_init(AMUISelectedConfigurations);
LABEL_8:
    if (a4)
      goto LABEL_16;
    goto LABEL_9;
  }
  v12 = v11;
  if (v9)
    goto LABEL_8;
LABEL_9:
  v26[2](v26, v12);
  -[AMUISelectedConfigurations dictionaryRepresentation](v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedLastSelectedConfigurations, "setObject:forKeyedSubscript:", v13, v25);

  v14 = -[NSMutableDictionary count](self->_cachedLastSelectedConfigurations, "count");
  v15 = MEMORY[0x24BDAC760];
  if (v14 >= 0x33)
  {
    do
    {
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__0;
      v33[4] = __Block_byref_object_dispose__0;
      v34 = 0;
      v30 = 0;
      v31[0] = &v30;
      v31[1] = 0x3032000000;
      v31[2] = __Block_byref_object_copy__0;
      v31[3] = __Block_byref_object_dispose__0;
      v32 = 0;
      cachedLastSelectedConfigurations = self->_cachedLastSelectedConfigurations;
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke;
      v29[3] = &unk_250763C00;
      v29[4] = v33;
      v29[5] = &v30;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedLastSelectedConfigurations, "enumerateKeysAndObjectsUsingBlock:", v29);
      v17 = *(_QWORD *)(v31[0] + 40);
      if (!v17)
      {
        -[NSMutableDictionary allKeys](self->_cachedLastSelectedConfigurations, "allKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastObject");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(v31[0] + 40);
        *(_QWORD *)(v31[0] + 40) = v19;

        AMUILogSwitcher();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[AMUILastSelectedPosterStore _performWithSelectedConfigurationsForChargerIdentifier:onlyIfPresent:block:].cold.1(buf, (uint64_t)v31, v36, v21);

        v17 = *(_QWORD *)(v31[0] + 40);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_cachedLastSelectedConfigurations, "removeObjectForKey:", v17);
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(v33, 8);
    }
    while ((unint64_t)-[NSMutableDictionary count](self->_cachedLastSelectedConfigurations, "count") > 0x32);
  }
  v22 = (void *)-[NSMutableDictionary copy](self->_cachedLastSelectedConfigurations, "copy");
  persistenceQueue = self->_persistenceQueue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke_12;
  block[3] = &unk_250763400;
  block[4] = self;
  v28 = v22;
  v24 = v22;
  dispatch_async(persistenceQueue, block);

LABEL_16:
}

void __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  v15 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v15;
    else
      v7 = 0;
  }
  v8 = v7;

  v9 = objc_opt_class();
  v10 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  +[AMUISelectedConfigurations lastUsedDateFromDictionaryRepresentation:](AMUISelectedConfigurations, "lastUsedDateFromDictionaryRepresentation:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v14 + 40))
    goto LABEL_13;
  if (objc_msgSend(v13, "compare:") == -1)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_13:
    objc_storeStrong((id *)(v14 + 40), v13);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  }

}

uint64_t __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setLastSelectedConfigurations:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_cachedLastSelectedConfigurations, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
}

- (void)_synchronize
{
  NSObject *persistenceQueue;
  _QWORD block[5];

  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AMUILastSelectedPosterStore_Testing___synchronize__block_invoke;
  block[3] = &unk_250763388;
  block[4] = self;
  dispatch_sync(persistenceQueue, block);
}

void __52__AMUILastSelectedPosterStore_Testing___synchronize__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastSelectedConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

}

- (unint64_t)_maximumChargerIds
{
  return 50;
}

- (unint64_t)_currentChargerIds
{
  return -[NSMutableDictionary count](self->_cachedLastSelectedConfigurations, "count");
}

- (void)_performWithSelectedConfigurationsForChargerIdentifier:(_QWORD *)a3 onlyIfPresent:(os_log_t)log block:.cold.1(uint8_t *buf, uint64_t a2, _QWORD *a3, os_log_t log)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_error_impl(&dword_23600A000, log, OS_LOG_TYPE_ERROR, "Error pruning selected representations by charger ID - no oldest entry found, evicting %@ at semi-random", buf, 0xCu);
}

@end
