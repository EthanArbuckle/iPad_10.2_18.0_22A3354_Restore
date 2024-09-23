@implementation AVTCoreDataStoreMaintenance

- (AVTCoreDataStoreMaintenance)initWithEnvironment:(id)a3 managedObjectContextFactory:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  AVTEventCoalescer *v10;
  void *v11;
  AVTEventCoalescer *v12;
  void *v13;
  AVTCoreDataStoreMaintenance *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "serialQueueProvider");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v8)[2](v8, "com.apple.AvatarUI.AVTCoreDataStoreMaintenance.workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [AVTEventCoalescer alloc];
  objc_msgSend(v7, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTEventCoalescer initWithDelay:queue:logger:](v10, "initWithDelay:queue:logger:", v9, v11, 5.0);

  objc_msgSend(v7, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AVTCoreDataStoreMaintenance initWithWorkQueue:managedObjectContextFactory:eventCoalescer:logger:](self, "initWithWorkQueue:managedObjectContextFactory:eventCoalescer:logger:", v9, v6, v12, v13);
  return v14;
}

- (AVTCoreDataStoreMaintenance)initWithWorkQueue:(id)a3 managedObjectContextFactory:(id)a4 eventCoalescer:(id)a5 logger:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AVTCoreDataStoreMaintenance *v15;
  AVTCoreDataStoreMaintenance *v16;
  uint64_t v17;
  id mocFactory;
  AVTEventCoalescer *eventCoalescer;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTCoreDataStoreMaintenance;
  v15 = -[AVTCoreDataStoreMaintenance init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_logger, a6);
    objc_storeStrong((id *)&v16->_eventCoalescer, a5);
    v17 = objc_msgSend(v12, "copy");
    mocFactory = v16->_mocFactory;
    v16->_mocFactory = (id)v17;

    objc_initWeak(&location, v16);
    eventCoalescer = v16->_eventCoalescer;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __99__AVTCoreDataStoreMaintenance_initWithWorkQueue_managedObjectContextFactory_eventCoalescer_logger___block_invoke;
    v21[3] = &unk_24DD31C18;
    objc_copyWeak(&v22, &location);
    -[AVTEventCoalescer registerEventForCoalescingWithLabel:handler:](eventCoalescer, "registerEventForCoalescingWithLabel:handler:", CFSTR("StoreMaintenanceObservedChange"), v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __99__AVTCoreDataStoreMaintenance_initWithWorkQueue_managedObjectContextFactory_eventCoalescer_logger___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runMaintenanceTasks");

}

- (void)storeDidChange
{
  id v2;

  -[AVTCoreDataStoreMaintenance eventCoalescer](self, "eventCoalescer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventDidOccur:", 0);

}

- (void)runMaintenanceTasks
{
  void *v3;
  _QWORD v4[5];

  -[AVTCoreDataStoreMaintenance logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__AVTCoreDataStoreMaintenance_runMaintenanceTasks__block_invoke;
  v4[3] = &unk_24DD31C40;
  v4[4] = self;
  objc_msgSend(v3, "runningMaintenance:", v4);

}

void __50__AVTCoreDataStoreMaintenance_runMaintenanceTasks__block_invoke(uint64_t a1)
{
  void (**v2)(void);
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "mocFactory");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v3, "setQueryGenerationFromToken:error:", v4, &v14);
  v6 = v14;

  v7 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    v13 = 0;
    v8 = objc_msgSend(v7, "mitigateDuplicatesWithManagedObjectContext:error:", v3, &v13);
    v9 = v13;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logErrorMitigatingDuplicates:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMaintenanceCompleted");
  }
  else
  {
    objc_msgSend(v7, "logger");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logErrorPinningContextToCurrentQueryGenerationToken:", v12);
  }

}

- (BOOL)mitigateDuplicatesWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[AVTCoreDataStoreMaintenance duplicatedIdentifiersInManagedObjectContext:error:](self, "duplicatedIdentifiersInManagedObjectContext:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      -[AVTCoreDataStoreMaintenance fetchDuplicatedRecordsForIdentifiers:managedObjectContext:error:](self, "fetchDuplicatedRecordsForIdentifiers:managedObjectContext:error:", v8, v6, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = -[AVTCoreDataStoreMaintenance fixDuplicateRecordIdentifiers:managedObjectContext:error:](self, "fixDuplicateRecordIdentifiers:managedObjectContext:error:", v9, v6, a4);
      else
        v10 = 0;

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)fixDuplicateRecordIdentifiers:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__AVTCoreDataStoreMaintenance_fixDuplicateRecordIdentifiers_managedObjectContext_error___block_invoke;
  v9[3] = &unk_24DD31C68;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);
  LOBYTE(a5) = objc_msgSend(v7, "save:", a5);

  return (char)a5;
}

void __88__AVTCoreDataStoreMaintenance_fixDuplicateRecordIdentifiers_managedObjectContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v16 = a3;
  objc_msgSend(v16, "subarrayWithRange:", 1, objc_msgSend(v16, "count") - 1);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIdentifier:", v11);

        objc_msgSend(*(id *)(a1 + 32), "logger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logDeduplicateRecordWithIdentifier:toNewRecordWithIdentifier:", v13, v15);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (id)fetchDuplicatedRecordsForIdentifiers:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Avatar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("orderDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v12);

  v34[0] = CFSTR("identifier");
  v34[1] = CFSTR("orderDate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v13);

  objc_msgSend(v8, "executeFetchRequest:error:", v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v27 = v8;
    v28 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v14;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v24);

          }
          objc_msgSend(v23, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v18);
    }

    v8 = v27;
    v7 = v28;
    v14 = v26;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)duplicatedIdentifiersInManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v25[2];
  const __CFString *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBB678];
  v5 = a3;
  objc_msgSend(v4, "fetchRequestWithEntityName:", CFSTR("Avatar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v8, "setName:", CFSTR("count"));
  v9 = (void *)MEMORY[0x24BDD1548];
  v28[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressionForFunction:arguments:", CFSTR("count:"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExpression:", v11);

  objc_msgSend(v8, "setExpressionResultType:", 300);
  objc_msgSend(v6, "setResultType:", 2);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v13);

  v26 = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToGroupBy:", v14);

  v25[0] = CFSTR("identifier");
  v25[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v15);

  objc_msgSend(MEMORY[0x24BDD1548], "expressionForVariable:", CFSTR("count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ > 1"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHavingPredicate:", v17);

  objc_msgSend(v5, "executeFetchRequest:error:", v6, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AVTCoreDataStoreMaintenance logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logDiscoveredDuplicates:count:", v20, objc_msgSend(v18, "count"));

    objc_msgSend(v18, "avt_map:", &__block_literal_global_1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __81__AVTCoreDataStoreMaintenance_duplicatedIdentifiersInManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("identifier"));
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTEventCoalescer)eventCoalescer
{
  return self->_eventCoalescer;
}

- (id)mocFactory
{
  return self->_mocFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mocFactory, 0);
  objc_storeStrong((id *)&self->_eventCoalescer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
