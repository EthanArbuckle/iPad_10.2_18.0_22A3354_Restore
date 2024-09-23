@implementation IRServiceStore

void __44__IRServiceStore_addReplayEvents_withLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v2 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__IRServiceStore_addReplayEvents_withLimit___block_invoke_2;
  v7[3] = &unk_251045178;
  v8 = v2;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v6 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(a1 + 40), "addReplayEvent:", v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore");

}

- (BOOL)addReplayEvents:(id)a3 withLimit:(unint64_t)a4
{
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  IRServiceStore *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  void *v53;
  _QWORD v54[4];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __44__IRServiceStore_addReplayEvents_withLimit___block_invoke;
    v32[3] = &unk_251045128;
    v33 = v30;
    v34 = v9;
    v35 = self;
    v36 = &v37;
    objc_msgSend(v10, "performBlockAndWait:", v32);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("replayEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRStore countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    if (*((_BYTE *)v38 + 24) && v15)
    {
      v17 = objc_msgSend(v15, "unsignedIntegerValue") - a4;
      v18 = v17 & ~(v17 >> 63);
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v44 = "#service-store, ";
        v45 = 2112;
        v46 = v19;
        v47 = 2112;
        v48 = v15;
        v49 = 2112;
        v50 = v21;
        v51 = 2112;
        v52 = v22;
        _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEBUG, "%s[%@], Commiting replay events to DB, numberOfReplayEvents: %@, limit: %@, removing: %@", buf, 0x34u);

        v18 = v17 & ~(v17 >> 63);
      }

      if (v17 < 1)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("replayEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v26, v27, v28, v18);

        v11 = (void *)v24;
      }
    }

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __32__IRServiceStore_updateService___block_invoke(uint64_t a1)
{
  uint64_t result;

  +[IRServiceMO setPropertiesOfServiceMO:withServiceDO:](IRServiceMO, "setPropertiesOfServiceMO:withServiceDO:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __35__IRServiceStore_updateStatistics___block_invoke(uint64_t a1)
{
  uint64_t result;

  +[IRStatisticsMO setPropertiesOfStatisticsMO:withStatisticsDO:](IRStatisticsMO, "setPropertiesOfStatisticsMO:withStatisticsDO:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)updateStatistics:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  IRServiceStore *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __35__IRServiceStore_updateStatistics___block_invoke;
    v13[3] = &unk_251044FC0;
    v14 = v9;
    v16 = self;
    v17 = &v18;
    v15 = v4;
    objc_msgSend(v10, "performBlockAndWait:", v13);

    v11 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)updateService:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  IRServiceStore *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __32__IRServiceStore_updateService___block_invoke;
    v13[3] = &unk_251044FC0;
    v14 = v9;
    v16 = self;
    v17 = &v18;
    v15 = v4;
    objc_msgSend(v10, "performBlockAndWait:", v13);

    v11 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)fetchService
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__IRServiceStore_addReplayEvents_withLimit___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[IRReplayEventMO replayEventMOWithReplayEventDO:replayEventsContainerMO:inManagedObjectContext:](IRReplayEventMO, "replayEventMOWithReplayEventDO:replayEventsContainerMO:inManagedObjectContext:", v5, v3, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v6);
}

- (IRServiceStore)initWithPersistenceManager:(id)a3 serviceIdentifier:(id)a4
{
  id v7;
  IRServiceStore *v8;
  IRServiceStore *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRServiceStore;
  v8 = -[IRStore initWithPersistenceManager:](&v11, sel_initWithPersistenceManager_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_serviceIdentifier, a4);

  return v9;
}

+ (id)fetchAllServicesWithPersistenceManager:(id)a3
{
  id v3;
  IRStore *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v3);

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v4, "fetchObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAllServicesForClientIdentifier:(id)a3 persistenceManager:(id)a4
{
  id v5;
  id v6;
  IRStore *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v5);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("clientIdentifier"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v7, "fetchObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v10, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)generateLogForStringNumEntitiesInDatabaseWithPersistenceManager:(id)a3
{
  id v3;
  IRStore *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v3);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v3;
  objc_msgSend(v3, "managedObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = CFSTR("Memory: Entity count in database (for all services): \n");
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "managedObjectClassName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRStore countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v4, "countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, 0, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("Entity Name: %@, Entity Count:%@\n"), v13, v14);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v10;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  else
  {
    v10 = CFSTR("Memory: Entity count in database (for all services): \n");
  }

  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v22, "persistenceStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedLongLong:", IRGetDiskUsageForPath(v18) / 0xF4240uLL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("Total Disk Size: %@M\n"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)generateLogForServicesDatabaseWithPersistenceManager:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __71__IRServiceStore_generateLogForServicesDatabaseWithPersistenceManager___block_invoke;
  v13 = &unk_251043E90;
  v14 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v10);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Services in DB: \n%@"), v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __71__IRServiceStore_generateLogForServicesDatabaseWithPersistenceManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v4, "clientIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "servicePackage");
  IRServicePackageString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastSeenDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("client:%@, service:%@, package:%@, last seen:%@"), v9, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

}

+ (id)fetchLatestServiceWithPersistenceManager:(id)a3 forClientIdentifier:(id)a4
{
  id v5;
  id v6;
  IRStore *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v6);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("clientIdentifier"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("lastSeenDate"), 0);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v7, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v11, v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)idendifyAndDeleteDuplicateServicesWithWithPersistenceManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  IRStore *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id obj;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  IRStore *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v11, "serviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "serviceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v8);
  }
  v27 = v6;

  v14 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v3);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenDate"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v15)
  {
    v16 = v15;
    v29 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceIdentifier"), v18, v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v30;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v14, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v21, v22, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[IRStore managedObjectContext](v14, "managedObjectContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke;
        v31[3] = &unk_251045088;
        v32 = v24;
        v33 = v18;
        v34 = v14;
        v26 = v24;
        objc_msgSend(v25, "performBlockAndWait:", v31);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v16);
  }

}

void __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke(uint64_t a1)
{
  void **v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void **)(a1 + 32);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
  {
    v3 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_cold_1(a1, v2, v3);
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_29;
    v5[3] = &unk_251045060;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
    objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore");

  }
}

void __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "managedObjectContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteObject:", v4);

  }
}

+ (void)adjustDBToStaticTokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  IRStore *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id obj;
  void *v29;
  _QWORD v30[4];
  id v31;
  IRStore *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v11, "clientIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "clientIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v8);
  }
  v27 = v6;

  v14 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v3);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenDate"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("clientIdentifier"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v29;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v14, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v21, v22, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[IRStore managedObjectContext](v14, "managedObjectContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __41__IRServiceStore_adjustDBToStaticTokens___block_invoke;
        v30[3] = &unk_2510450D8;
        v31 = v24;
        v32 = v14;
        v26 = v24;
        objc_msgSend(v25, "performBlockAndWait:", v30);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v16);
  }

}

void __41__IRServiceStore_adjustDBToStaticTokens___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__IRServiceStore_adjustDBToStaticTokens___block_invoke_2;
  v3[3] = &unk_2510450B0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);
  objc_msgSend(*(id *)(a1 + 40), "commitChangesToStore");

}

void __41__IRServiceStore_adjustDBToStaticTokens___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v4, "managedObjectContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteObject:", v5);
  }
  else
  {
    v6 = a2;
    objc_msgSend(v6, "clientIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServiceIdentifier:");
  }

}

+ (void)adjustFirstSeenDateOfCandidates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  IRStore *v8;
  objc_class *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("firstSeenDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("firstSeenDate");
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IRStore initWithPersistenceManager:]([IRStore alloc], "initWithPersistenceManager:", v4);
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:](v8, "batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:", v10, v5, v7);

}

- (id)fetchCandidatesContainer
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchReplayEventsContainer
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchHistoryEventsContainerWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  IRHistoryEventsContainerDO *v14;
  IRHistoryEventsContainerDO *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("historyEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v8, v9, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = (id)objc_opt_new();
  -[IRStore managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__IRServiceStore_fetchHistoryEventsContainerWithLimit___block_invoke;
  v17[3] = &unk_251044F70;
  v13 = v11;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v17);

  v14 = [IRHistoryEventsContainerDO alloc];
  v15 = -[IRHistoryEventsContainerDO initWithHistoryEvents:](v14, "initWithHistoryEvents:", v21[5]);

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __55__IRServiceStore_fetchHistoryEventsContainerWithLimit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v3, "convert");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      objc_msgSend(v7, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    while (v6);
  }

}

- (id)fetchMiLoServiceUuid
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchReplayEventAtDate:(id)a3
{
  void *v4;
  NSString *serviceIdentifier;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1758];
  serviceIdentifier = self->_serviceIdentifier;
  v6 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("replayEventsContainer.service.serviceIdentifier"), serviceIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("date"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v10, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchStatistics
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)addService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  IRServiceStore *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[IRStore managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__IRServiceStore_addService___block_invoke;
  v8[3] = &unk_251045100;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

uint64_t __29__IRServiceStore_addService___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IRServiceMO MOService:inManagedObjectContext:](IRServiceMO, "MOService:inManagedObjectContext:", v2, v3);

  result = objc_msgSend(*(id *)(a1 + 40), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)addCandidates:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  IRServiceStore *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __32__IRServiceStore_addCandidates___block_invoke;
    v13[3] = &unk_251045128;
    v14 = v4;
    v15 = v9;
    v16 = self;
    v17 = &v18;
    objc_msgSend(v10, "performBlockAndWait:", v13);

    v11 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __32__IRServiceStore_addCandidates___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  uint64_t v10;

  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __32__IRServiceStore_addCandidates___block_invoke_2;
  v8 = &unk_2510449F0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v10 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore", v5, v6, v7, v8);

}

void __32__IRServiceStore_addCandidates___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[IRCandidateMO MOCandidate:candidatesContainerMO:inManagedObjectContext:](IRCandidateMO, "MOCandidate:candidatesContainerMO:inManagedObjectContext:", v4, v2, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addCandidatesObject:", v5);
}

- (BOOL)addHistoryEvent:(id)a3 withLimit:(unint64_t)a4
{
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  IRServiceStore *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  void *v53;
  _QWORD v54[4];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __44__IRServiceStore_addHistoryEvent_withLimit___block_invoke;
    v32[3] = &unk_251045128;
    v33 = v9;
    v34 = v30;
    v35 = self;
    v36 = &v37;
    objc_msgSend(v10, "performBlockAndWait:", v32);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("historyEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRStore countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    if (*((_BYTE *)v38 + 24) && v15)
    {
      v17 = objc_msgSend(v15, "unsignedIntegerValue") - a4;
      v18 = v17 & ~(v17 >> 63);
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v44 = "#service-store, ";
        v45 = 2112;
        v46 = v19;
        v47 = 2112;
        v48 = v15;
        v49 = 2112;
        v50 = v21;
        v51 = 2112;
        v52 = v22;
        _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_INFO, "%s[%@], Commiting history event to DB, numberOfHistoryEvents: %@, limit: %@, removing: %@", buf, 0x34u);

        v18 = v17 & ~(v17 >> 63);
      }

      if (v17 < 1)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("historyEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v26, v27, v28, v18);

        v11 = (void *)v24;
      }
    }

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __44__IRServiceStore_addHistoryEvent_withLimit___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRHistoryEventMO historyEventMOWithhistoryEventDO:historyEventsContainerMO:inManagedObjectContext:](IRHistoryEventMO, "historyEventMOWithhistoryEventDO:historyEventsContainerMO:inManagedObjectContext:", v3, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addHistoryEventsObject:", v5);

  result = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)updateCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  id v18;
  IRServiceStore *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("candidatesContainer.service.serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v4, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("candidateIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v10, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __34__IRServiceStore_updateCandidate___block_invoke;
    v16[3] = &unk_251045128;
    v17 = v12;
    v18 = v4;
    v19 = self;
    v20 = &v21;
    objc_msgSend(v13, "performBlockAndWait:", v16);

    v14 = *((_BYTE *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __34__IRServiceStore_updateCandidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidateMO setPropertiesOfCandidateMO:withCandidate:managedObjectContext:](IRCandidateMO, "setPropertiesOfCandidateMO:withCandidate:managedObjectContext:", v2, v3, v4);

  result = objc_msgSend(*(id *)(a1 + 48), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)updateMiloServiceWithMiloUuidString:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  IRServiceStore *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v22[5])
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__IRServiceStore_updateMiloServiceWithMiloUuidString___block_invoke;
    v12[3] = &unk_251045150;
    v15 = &v21;
    v16 = &v17;
    v13 = v4;
    v14 = self;
    objc_msgSend(v9, "performBlockAndWait:", v12);

    v10 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v10;
}

uint64_t __54__IRServiceStore_updateMiloServiceWithMiloUuidString___block_invoke(uint64_t a1)
{
  uint64_t result;

  +[IRMiLoServiceMO setPropertiesOfMiLoServiceMO:withMiLoServiceUuidString:](IRMiLoServiceMO, "setPropertiesOfMiLoServiceMO:withMiLoServiceUuidString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 40), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)injectStatisticsRelationship
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceIdentifier"), self->_serviceIdentifier);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v11, v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      -[IRStore managedObjectContext](self, "managedObjectContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __46__IRServiceStore_injectStatisticsRelationship__block_invoke;
      v16[3] = &unk_251045100;
      v16[4] = self;
      v17 = v13;
      v18 = &v19;
      objc_msgSend(v14, "performBlockAndWait:", v16);

      v8 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      v8 = 0;
    }

    v3 = (void *)v9;
  }

  return v8;
}

void __46__IRServiceStore_injectStatisticsRelationship__block_invoke(uint64_t a1)
{
  IRStatisticsMO *v2;
  void *v3;
  IRStatisticsMO *v4;

  v2 = [IRStatisticsMO alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IRStatisticsMO initWithContext:](v2, "initWithContext:", v3);

  -[IRStatisticsMO setService:](v4, "setService:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setStatistics:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "commitChangesToStore");

}

- (BOOL)deleteService
{
  IRServiceStore *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v2 = self;
  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v2, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v5, v6, 0, 0);

  return (char)v2;
}

- (BOOL)deleteCandidates:(id)a3
{
  IRServiceStore *v3;
  void *v4;
  NSString *serviceIdentifier;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v3 = self;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1758];
  serviceIdentifier = self->_serviceIdentifier;
  v6 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("candidatesContainer.service.serviceIdentifier"), serviceIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v6, "compactMap:", &__block_literal_global_16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("candidateIdentifier"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v3, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v14, 0, 0);

  return (char)v3;
}

uint64_t __35__IRServiceStore_deleteCandidates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "candidateIdentifier");
}

- (BOOL)cleanupWithDate:(id)a3 dateIntervalOfMiLoPredictionsToDiscard:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[IRServiceStore _cleanupCandidatesWithDate:](self, "_cleanupCandidatesWithDate:", v6)
    && -[IRServiceStore _cleanupHistoryEventsWithDate:](self, "_cleanupHistoryEventsWithDate:", v6)
    && -[IRServiceStore _cleanupReplayEventsWithDate:](self, "_cleanupReplayEventsWithDate:", v6)
    && -[IRServiceStore _cleanupTrashedHistoryEvents](self, "_cleanupTrashedHistoryEvents")
    && -[IRServiceStore _cleanupNotAirplayCandidates](self, "_cleanupNotAirplayCandidates")
    && (!v7
     || -[IRServiceStore _cleanupPredictionEventsInDateInterval:](self, "_cleanupPredictionEventsInDateInterval:", v7));

  return v8;
}

- (BOOL)_cleanupCandidatesWithDate:(id)a3
{
  IRServiceStore *v3;
  void *v4;
  NSString *serviceIdentifier;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v3 = self;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1758];
  serviceIdentifier = self->_serviceIdentifier;
  v6 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("candidatesContainer.service.serviceIdentifier"), serviceIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  +[IRPreferences shared](IRPreferences, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dbCleanupXPCActivityDeleteCandidatesThreshold");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("(%@ - %K) > %@"), v6, CFSTR("lastSeenDate"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v3, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v14, 0, 0);

  return (char)v3;
}

- (BOOL)_cleanupHistoryEventsWithDate:(id)a3
{
  IRServiceStore *v3;
  void *v4;
  NSString *serviceIdentifier;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v3 = self;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1758];
  serviceIdentifier = self->_serviceIdentifier;
  v6 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("historyEventsContainer.service.serviceIdentifier"), serviceIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  +[IRPreferences shared](IRPreferences, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dbCleanupXPCActivityDeleteHistoryEventsThreshold");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("(%@ - %K) > %@"), v6, CFSTR("date"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v3, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v14, 0, 0);

  return (char)v3;
}

- (BOOL)_cleanupReplayEventsWithDate:(id)a3
{
  IRServiceStore *v3;
  void *v4;
  NSString *serviceIdentifier;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v3 = self;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1758];
  serviceIdentifier = self->_serviceIdentifier;
  v6 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("replayEventsContainer.service.serviceIdentifier"), serviceIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  +[IRPreferences shared](IRPreferences, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dbCleanupXPCActivityDeleteReplayEventsThreshold");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("(%@ - %K) > %@"), v6, CFSTR("date"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v3, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v13, v14, 0, 0);

  return (char)v3;
}

- (BOOL)_cleanupTrashedHistoryEvents
{
  IRServiceStore *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v2 = self;
  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("historyEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("candidateIdenfifier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](v2, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v6, v7, 0, 0);

  return (char)v2;
}

- (BOOL)_cleanupNotAirplayCandidates
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[IRServiceStore fetchCandidatesContainer](self, "fetchCandidatesContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allWhere:", &__block_literal_global_70);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
    v6 = -[IRServiceStore deleteCandidates:](self, "deleteCandidates:", v5);
  else
    v6 = 1;

  return v6;
}

uint64_t __46__IRServiceStore__cleanupNotAirplayCandidates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsNonAirplayTarget");
}

- (BOOL)_cleanupPredictionEventsInDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[4];
  id v23;
  IRServiceStore *v24;
  _BYTE *v25;
  _BYTE buf[24];
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("historyEvent.historyEventsContainer.service.serviceIdentifier"), self->_serviceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("historyEvent.date"), v7, CFSTR("historyEvent.date"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v28[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v11, v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = v15;
    objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "#service-store, ";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v27 = v18;
    _os_log_impl(&dword_23FFBA000, v17, OS_LOG_TYPE_INFO, "%s[%@], Found %@ events to mark as discarded events", buf, 0x20u);

  }
  if (v13 && objc_msgSend(v13, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v27) = 0;
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __57__IRServiceStore__cleanupPredictionEventsInDateInterval___block_invoke;
    v22[3] = &unk_2510451E0;
    v24 = self;
    v25 = buf;
    v23 = v13;
    objc_msgSend(v19, "performBlockAndWait:", v22);

    v20 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

uint64_t __57__IRServiceStore__cleanupPredictionEventsInDateInterval___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t result;
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
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(v7, "setLabel:", 0, (_QWORD)v9);
        objc_msgSend(v7, "setPredictionId:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  result = objc_msgSend(*(id *)(a1 + 40), "commitChangesToStore");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (id)getReplayEventDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1758];
  -[IRServiceStore serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("service.serviceIdentifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRStore fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v24 = (id)objc_opt_new();
    -[IRStore managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke;
    v16[3] = &unk_251044F70;
    v17 = v9;
    v18 = &v19;
    objc_msgSend(v10, "performBlockAndWait:", v16);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
    v12 = (void *)v20[5];
    v25 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortUsingDescriptors:", v13);

    v14 = (void *)objc_msgSend((id)v20[5], "copy");
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "replayEvent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke_2;
  v3[3] = &unk_251045208;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __51__IRServiceStore_Replay__getReplayEventDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  IRReplayEventDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IRReplayEventDescriptor *v9;

  v3 = a2;
  v4 = [IRReplayEventDescriptor alloc];
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextChangeReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IRReplayEventDescriptor initWithDate:withContextChangeReason:withSystemState:](v4, "initWithDate:withContextChangeReason:withSystemState:", v5, v6, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v9);
}

void __79__IRServiceStore_idendifyAndDeleteDuplicateServicesWithWithPersistenceManager___block_invoke_cold_1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = *a2;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v3;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_ERROR, "#service-store, [ErrorId - Duplicate Services] Identified multiple service with service identifier:%@, num services identified: %@", (uint8_t *)&v8, 0x16u);

}

@end
