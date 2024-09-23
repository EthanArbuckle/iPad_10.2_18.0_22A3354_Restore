@implementation IRReplayDatabaseHandler

- (IRReplayDatabaseHandler)initWithStoreDirectory:(id)a3
{
  id v4;
  IRReplayDatabaseHandler *v5;
  IRPersistenceManager *v6;
  void *v7;
  uint64_t v8;
  IRPersistenceManager *persistanceManager;
  IRReplayDatabaseHandler *v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IRReplayDatabaseHandler;
  v5 = -[IRReplayDatabaseHandler init](&v14, sel_init);
  if (!v5)
    goto LABEL_3;
  v6 = [IRPersistenceManager alloc];
  +[IRPersistenceManager defaultModelsDirectory](IRPersistenceManager, "defaultModelsDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IRPersistenceManager initWithModelsDirectory:storesDirectory:](v6, "initWithModelsDirectory:storesDirectory:", v7, v4);
  persistanceManager = v5->_persistanceManager;
  v5->_persistanceManager = (IRPersistenceManager *)v8;

  if (!-[IRPersistenceManager connectToStore](v5->_persistanceManager, "connectToStore"))
  {
    v11 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_DEFAULT, "#appDBHandler, Could not connect to store", v13, 2u);
    }
    v10 = 0;
  }
  else
  {
LABEL_3:
    v10 = v5;
  }

  return v10;
}

- (IRReplayDatabaseHandler)initWithPeristenceManager:(id)a3
{
  id v5;
  IRReplayDatabaseHandler *v6;
  id *p_isa;
  IRReplayDatabaseHandler *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IRReplayDatabaseHandler;
  v6 = -[IRReplayDatabaseHandler init](&v12, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6 && (objc_storeStrong((id *)&v6->_persistanceManager, a3), (objc_msgSend(p_isa[1], "connectToStore") & 1) == 0))
  {
    v9 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEFAULT, "#appDBHandler, Could not connect to store", v11, 2u);
    }
    v8 = 0;
  }
  else
  {
    v8 = p_isa;
  }

  return v8;
}

+ (id)exportDatabaseToPath:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12;
  v31 = __Block_byref_object_dispose__12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  v26 = 0;
  v5 = (void *)MEMORY[0x24BE5B310];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke;
  v16 = &unk_251045A28;
  v6 = v4;
  v17 = v6;
  v19 = &v27;
  v7 = v3;
  v18 = v7;
  v20 = &v21;
  objc_msgSend(v5, "databaseExportwithReply:", &v13);
  v8 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v6, v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0, v13, v14, v15, v16);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v28[5];
  v28[5] = v9;

  v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id obj;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_6((uint64_t)v6, v7, v8);
LABEL_4:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_34;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "BOOLValue") & 1) != 0)
  {
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_1();
      goto LABEL_4;
    }
    v49 = *MEMORY[0x24BDD0CC8];
    v50[0] = &unk_25105EE10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", *(_QWORD *)(a1 + 40));

    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_3();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v47 = 0;
      v14 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, v9, &v47);
      v15 = v47;

      if ((v14 & 1) == 0)
      {
        v37 = *MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
          __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_4((uint64_t)v15, v37, v38);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

LABEL_33:
        goto LABEL_34;
      }

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v40 = v5;
    obj = v5;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      v39 = v9;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

          if ((v23 & 1) == 0)
          {
            v36 = (void *)*MEMORY[0x24BE5B270];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
              __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_2(v36, v20);
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

            v6 = 0;
            v5 = v40;
            v9 = v39;
            goto LABEL_33;
          }
          v24 = (void *)MEMORY[0x24BDBCF48];
          v25 = (void *)MEMORY[0x24BDD17C8];
          v26 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v20, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@/%@"), v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fileURLWithPath:isDirectory:", v28, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "copyItemAtURL:toURL:error:", v20, v29, 0);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        v9 = v39;
        if (v17)
          continue;
        break;
      }
    }

    objc_msgSend(obj, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLByDeletingLastPathComponent");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    v35 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23FFBA000, v35, OS_LOG_TYPE_DEFAULT, "#appDBHandler, database export reply finished", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v6 = 0;
    v5 = v40;
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_5();
LABEL_34:

}

- (id)getAllServices
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", self->_persistanceManager);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__12;
    v10 = __Block_byref_object_dispose__12;
    v11 = (id)objc_opt_new();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __41__IRReplayDatabaseHandler_getAllServices__block_invoke;
    v5[3] = &unk_251045A50;
    v5[4] = &v6;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
    v3 = (void *)objc_msgSend((id)v7[5], "copy");
    _Block_object_dispose(&v6, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRReplayDatabaseHandler getAllServices].cold.1();
    v3 = 0;
  }

  return v3;
}

void __41__IRReplayDatabaseHandler_getAllServices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "clientIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v3, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

- (id)getSortedEventsForServiceIdentifier:(id)a3
{
  id v4;
  IRServiceStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", self->_persistanceManager, v4);

  -[IRServiceStore fetchReplayEventsContainer](v5, "fetchReplayEventsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
    objc_msgSend(v6, "replayEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getEventsForServiceIdentifier:(id)a3
{
  id v4;
  IRServiceStore *v5;
  void *v6;

  v4 = a3;
  v5 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", self->_persistanceManager, v4);

  -[IRServiceStore getReplayEventDescriptors](v5, "getReplayEventDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getSortedHistoryEventsForServiceIdentifier:(id)a3
{
  id v4;
  IRServiceStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", self->_persistanceManager, v4);

  +[IRPreferences shared](IRPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberOfEventsToSaveInDisk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRServiceStore fetchHistoryEventsContainerWithLimit:](v5, "fetchHistoryEventsContainerWithLimit:", objc_msgSend(v7, "unsignedIntValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
    objc_msgSend(v8, "historyEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRReplayDatabaseHandler getSortedHistoryEventsForServiceIdentifier:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (id)inspectEventByDate:(id)a3 andServiceIdentifier:(id)a4 historyEvents:(id)a5
{
  id v8;
  id v9;
  id v10;
  IRServiceStore *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  IRHistoryEventsContainerDO *v21;
  void *v22;
  IRHistoryEventsContainerDO *v23;
  IRReplayEventRunner *v24;
  void *v25;
  void *v27;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", self->_persistanceManager, v10);

  -[IRServiceStore fetchReplayEventAtDate:](v11, "fetchReplayEventAtDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[IRServiceStore fetchService](v11, "fetchService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K<=%@"), CFSTR("date"), v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredArrayUsingPredicate:", v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRPreferences shared](IRPreferences, "shared");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberOfHistoryEventsInCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      v18 = objc_msgSend(v14, "count");
      v19 = (v18 - v17) & ~((uint64_t)(v18 - v17) >> 63);
      if (v18 >= v17)
        v20 = v17;
      else
        v20 = v18;
      v21 = [IRHistoryEventsContainerDO alloc];
      objc_msgSend(v14, "subarrayWithRange:", v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[IRHistoryEventsContainerDO initWithHistoryEvents:](v21, "initWithHistoryEvents:", v22);

      v24 = -[IRReplayEventRunner initWithServicePackage:]([IRReplayEventRunner alloc], "initWithServicePackage:", objc_msgSend(v13, "servicePackage"));
      -[IRReplayEventRunner runSingleReplayEvent:withHistoryEventsContainer:](v24, "runSingleReplayEvent:withHistoryEventsContainer:", v12, v23);
      -[IRReplayEventRunner contextsInspection](v24, "contextsInspection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        -[IRReplayDatabaseHandler inspectEventByDate:andServiceIdentifier:historyEvents:].cold.2();
      v25 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRReplayDatabaseHandler inspectEventByDate:andServiceIdentifier:historyEvents:].cold.1();
    v25 = 0;
  }

  return v25;
}

- (id)deviceAttributesFromCandidateIdentifier:(id)a3 withServiceIdentifier:(id)a4
{
  id v6;
  id v7;
  IRServiceStore *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint8_t buf[16];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v8 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", self->_persistanceManager, v7);
  -[IRServiceStore fetchCandidatesContainer](v8, "fetchCandidatesContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "candidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __89__IRReplayDatabaseHandler_deviceAttributesFromCandidateIdentifier_withServiceIdentifier___block_invoke;
    v14[3] = &unk_251045A78;
    v15 = v6;
    v16 = &v18;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

    v12 = (id)v19[5];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23FFBA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "error in fetchCandidatesContainer", buf, 2u);
    }
    v12 = (id)v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __89__IRReplayDatabaseHandler_deviceAttributesFromCandidateIdentifier_withServiceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  v5 = v19;
  if (v4)
  {
    objc_msgSend(v19, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "avOutputDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v7, "avOutputDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deviceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeviceId:", v11);

      objc_msgSend(v7, "avOutputDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeviceName:", v13);
    }
    else
    {
      objc_msgSend(v7, "rapportDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_7:

        v5 = v19;
        goto LABEL_8;
      }
      v9 = (void *)objc_opt_new();
      objc_msgSend(v7, "rapportDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeviceName:", v16);

      objc_msgSend(v7, "rapportDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rapportEffectiveID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeviceId:", v13);
    }

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v9;

    goto LABEL_7;
  }
LABEL_8:

}

- (id)deviceAttributesSetFromCandidateIdentifier:(id)a3 withServiceIdentifier:(id)a4
{
  id v6;
  id v7;
  IRServiceStore *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = (id)objc_opt_new();
  v8 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", self->_persistanceManager, v7);
  -[IRServiceStore fetchCandidatesContainer](v8, "fetchCandidatesContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke;
  v14[3] = &unk_251045A78;
  v11 = v6;
  v15 = v11;
  v16 = &v17;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = a2;
  objc_msgSend(v6, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(v6, "nodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke_2;
    v7[3] = &unk_2510453E0;
    v7[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  }
}

void __92__IRReplayDatabaseHandler_deviceAttributesSetFromCandidateIdentifier_withServiceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v12, "avOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v12, "avOutputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceId:", v6);

    objc_msgSend(v12, "avOutputDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceName:", v8);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v12, "rapportDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "rapportDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceName:", v11);

    objc_msgSend(v12, "rapportDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rapportEffectiveID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceId:", v8);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistanceManager, 0);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Export DB missing URLs] export didn't give any urls", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, v3, v5, "#appDBHandler, [ErrorId - Export DB non existing file] got a non-existing file from exportDatabase! This should never happen. path: %@", (uint8_t *)&v6);

}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Export DB directory non empty path] Export data destination path not empty, inconsistency might occur", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, a2, a3, "#appDBHandler, [ErrorId - Export DB directory create error] failed to create directory, error: %@", (uint8_t *)&v3);
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Export DB timeout] export timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__IRReplayDatabaseHandler_exportDatabaseToPath___block_invoke_cold_6(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, a2, a3, "#appDBHandler, [ErrorId - Export DB exception] get exception %@", (uint8_t *)&v3);
}

- (void)getAllServices
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get services error] error in fetchManagedObjectsWithEntityName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getSortedHistoryEventsForServiceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get History Container error] error fetching HistoryEventsContainer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)inspectEventByDate:andServiceIdentifier:historyEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get Replay Container error] error in fetchReplayEventsContainer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)inspectEventByDate:andServiceIdentifier:historyEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#appDBHandler, [ErrorId - Replay / Get services error during inspect] error in fetchService", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
