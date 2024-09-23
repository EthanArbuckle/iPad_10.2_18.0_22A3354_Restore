@implementation NPTMetadataCollector

+ (id)fetch
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int has_internal_content;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "fetchDeviceData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchCellularData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("metadata"));
  objc_msgSend(MEMORY[0x24BEC2A70], "sharedClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v7, "queryStatusForPeer:error:", 0, &v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v36;
  v10 = objc_alloc_init(MEMORY[0x24BE29F18]);
  objc_msgSend(v10, "activate");
  objc_msgSend(v10, "currentKnownNetworkProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "CCA");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("wifi_cwf_cca"));

  }
  objc_msgSend(v10, "invalidate");
  if (v11)
  {
    objc_msgSend(v11, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v14);

  }
  if (v9)
  {
    +[NPTLogger wifiVelocity](NPTLogger, "wifiVelocity");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[NPTMetadataCollector fetch].cold.1(v9, v15);

    v16 = v3;
  }
  else
  {
    v35 = v5;
    objc_msgSend(v8, "wifi");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v8, "wifi");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v19);

    }
    objc_msgSend(v8, "bluetooth");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v8, "bluetooth");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v22);

    }
    objc_msgSend(v8, "awdl");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      has_internal_content = os_variant_has_internal_content();

      if (has_internal_content)
      {
        objc_msgSend(v8, "awdl");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addEntriesFromDictionary:", v27);

      }
    }
    objc_msgSend(v8, "network");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v8, "network");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dictionary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v30);

    }
    objc_msgSend(v8, "power");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v8, "power");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v33);

    }
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("metadata"));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v35;
  }

  return v16;
}

- (NPTMetadataCollector)init
{
  void *v3;
  NPTMetadataCollector *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NPTMetadataCollector initWithCollectorTypes:](self, "initWithCollectorTypes:", v3);

  return v4;
}

- (NPTMetadataCollector)initWithCollectorTypes:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  objc_class *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTMetadataCollector setCollectors:](self, "setCollectors:", v5);

  v6 = dispatch_queue_create("NPTMetadataCollector.backgroundQueue", 0);
  -[NPTMetadataCollector setBackgroundQueue:](self, "setBackgroundQueue:", v6);

  -[NPTMetadataCollector setIsCollectingMetadata:](self, "setIsCollectingMetadata:", 1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(objc_class **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[NPTMetadataCollector knownCollectionType:](self, "knownCollectionType:", v12, (_QWORD)v16))
        {
          -[NPTMetadataCollector collectors](self, "collectors");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(v12);
          objc_msgSend(v13, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return self;
}

- (BOOL)knownCollectionType:(Class)a3
{
  uint64_t v4;

  v4 = objc_opt_class();
  if (v4)
    LOBYTE(v4) = -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_254A41758);
  return v4;
}

- (void)startCollectingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NPTMetadataCollector setIsCollectingMetadata:](self, "setIsCollectingMetadata:", 1);
  -[NPTMetadataCollector backgroundQueue](self, "backgroundQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke;
  v7[3] = &unk_24C990DF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  void *v27;
  _QWORD block[5];
  id v30;
  _QWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[6];
  id v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id location;
  _QWORD v50[5];
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", v1);

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "setCachedMetadata:", v2);

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "cachedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("device_states"));

  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__0;
  v50[4] = __Block_byref_object_dispose__0;
  v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_84;
  v47[3] = &unk_24C9917A8;
  objc_copyWeak(&v48, &location);
  objc_msgSend(*(id *)(a1 + 32), "setMetadataDidChangeHandlerForCollectors:", v47);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_254A41758))
        {
          objc_msgSend(*(id *)(a1 + 32), "metadataDidChangeHandlerForCollectors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setMetadataDidChangeHandler:", v11);

          v12 = dispatch_semaphore_create(0);
          objc_msgSend((id)objc_opt_class(), "collectorName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v7);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collectors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_254A41758))
        {
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_88;
          v36[3] = &unk_24C9917D0;
          v19 = *(_QWORD *)(a1 + 32);
          v36[4] = v18;
          v36[5] = v19;
          v38 = v50;
          v37 = v5;
          objc_msgSend(v18, "startCollectingWithCompletion:", v36);

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v20);
        v24 = *(NSObject **)(*((_QWORD *)&v32 + 1) + 8 * k);
        v25 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v24, v25);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)(a1 + 32), "backgroundQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_2;
  block[3] = &unk_24C9917F8;
  v27 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v30 = v27;
  v31 = v50;
  dispatch_async(v26, block);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

  _Block_object_dispose(v50, 8);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "asDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("collector_type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  objc_msgSend(v5, "setTimeSinceStart:", -v11);

  if ((objc_msgSend(WeakRetained, "isCollectingMetadata") & 1) == 0)
  {
    +[NPTLogger metadata](NPTLogger, "metadata");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_84_cold_2((os_log_t)v26);
    goto LABEL_13;
  }
  if (v6 || !v9)
  {
    +[NPTLogger metadata](NPTLogger, "metadata");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_84_cold_1((uint64_t)v5, (uint64_t)v6, v16);
  }
  else
  {
    objc_msgSend(WeakRetained, "cachedMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("device_states"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("events"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_11;
    v16 = WeakRetained;
    objc_sync_enter(v16);
    -[NSObject cachedMetadata](v16, "cachedMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("device_states"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("events"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "asDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v20, "addObject:", v22);

    -[NSObject cachedMetadata](v16, "cachedMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("device_states"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, CFSTR("events"));

    objc_sync_exit(v16);
  }

LABEL_11:
  objc_msgSend(WeakRetained, "metadataDidChangeHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(WeakRetained, "metadataDidChangeHandler");
    v26 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v26 + 16))(v26, v5, v6);
LABEL_13:

  }
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "collectorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)(a1 + 40);
  objc_sync_enter(v8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v6);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 40), "cachedMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("device_states"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v7);

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "localizedDescription", (_QWORD)v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(*(id *)(a1 + 40), "cachedMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("device_states"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("errors"));

  objc_msgSend(*(id *)(a1 + 40), "cachedMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("device_states"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v5, CFSTR("initial_state"));

  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 40), "cachedMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("device_states"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("events"));

  objc_sync_exit(v8);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
  v29 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v29);

}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = (void *)MEMORY[0x24BDBCE70];
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "cachedMetadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictionaryWithDictionary:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);

    }
  }
  objc_sync_exit(obj);

}

- (void)stopCollecting
{
  NSObject *v3;
  _QWORD block[5];

  -[NPTMetadataCollector setIsCollectingMetadata:](self, "setIsCollectingMetadata:", 0);
  -[NPTMetadataCollector backgroundQueue](self, "backgroundQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__NPTMetadataCollector_stopCollecting__block_invoke;
  block[3] = &unk_24C990F78;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __38__NPTMetadataCollector_stopCollecting__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collectors", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_254A41758))
          objc_msgSend(v7, "stopCollecting");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setCollectors:", 0);
}

+ (id)collectorName
{
  return CFSTR("metadata");
}

+ (id)fetchWRMMetrics
{
  id v2;
  NPTCellularCollector *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = objc_alloc_init(NPTCellularCollector);
  -[NPTCellularCollector wrmBasebandMetrics](v3, "wrmBasebandMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchDeviceData
{
  id v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;

  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = objc_alloc_init(MEMORY[0x24BDD1760]);
  MGCopyAnswer();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Unknown Version");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  MGCopyAnswer();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("Unknown Model");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  MGCopyAnswer();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("Unknown System");
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  MGCopyAnswer();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  MGCopyAnswer();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  IOPSGetPercentRemaining();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IOPSDrawingUnlimitedPower());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = CFSTR("Unknown");
  else
    v18 = CFSTR("Unplugged");
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v6, CFSTR("system_version"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("system_battery_level"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, CFSTR("system_device_model"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("system_name"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "activeProcessorCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("system_active_processor_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "isLowPowerModeEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("system_low_power_mode_enabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "processorCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("system_processor_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v2, "physicalMemory"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("system_physical_memory"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("system_battery_state"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("system_os_variant"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("system_device_class"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("system_powersource_connected"));
  objc_msgSend(v26, "addEntriesFromDictionary:", v19);

  return v26;
}

+ (id)fetchCellularData
{
  id v2;
  dispatch_semaphore_t v3;
  NPTCellularCollector *v4;
  NSObject *v5;
  id v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  intptr_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  dispatch_semaphore_t v16;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = dispatch_semaphore_create(0);
  v4 = objc_alloc_init(NPTCellularCollector);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __41__NPTMetadataCollector_fetchCellularData__block_invoke;
  v14 = &unk_24C991820;
  v15 = v2;
  v16 = v3;
  v5 = v3;
  v6 = v2;
  -[NPTCellularCollector startCollectingWithCompletion:](v4, "startCollectingWithCompletion:", &v11);
  v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v7);
  -[NPTCellularCollector stopCollecting](v4, "stopCollecting", v11, v12, v13, v14);
  -[NPTCellularCollector fetchCellularTPutEstimates](v4, "fetchCellularTPutEstimates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

intptr_t __41__NPTMetadataCollector_fetchCellularData__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (NSMutableArray)collectors
{
  return self->_collectors;
}

- (void)setCollectors:(id)a3
{
  objc_storeStrong((id *)&self->_collectors, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (BOOL)isCollectingMetadata
{
  return self->_isCollectingMetadata;
}

- (void)setIsCollectingMetadata:(BOOL)a3
{
  self->_isCollectingMetadata = a3;
}

- (id)metadataDidChangeHandlerForCollectors
{
  return self->_metadataDidChangeHandlerForCollectors;
}

- (void)setMetadataDidChangeHandlerForCollectors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataDidChangeHandlerForCollectors, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_collectors, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

+ (void)fetch
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_20E71B000, a2, OS_LOG_TYPE_ERROR, "Failed to create W5Status: %{public}@", (uint8_t *)&v4, 0xCu);

}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_84_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20E71B000, log, OS_LOG_TYPE_ERROR, "Failure: %@, Error %@", (uint8_t *)&v3, 0x16u);
}

void __54__NPTMetadataCollector_startCollectingWithCompletion___block_invoke_84_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E71B000, log, OS_LOG_TYPE_ERROR, "NPTMetadataCollector has been stopped", v1, 2u);
}

@end
