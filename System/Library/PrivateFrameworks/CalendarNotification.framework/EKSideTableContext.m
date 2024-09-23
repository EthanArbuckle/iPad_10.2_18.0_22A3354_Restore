@implementation EKSideTableContext

+ (id)sideTableContext
{
  EKSideTableContext *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  EKSideTableContext *v8;
  void *v9;

  v2 = -[EKSideTableContext initWithConcurrencyType:]([EKSideTableContext alloc], "initWithConcurrencyType:", 1);
  -[EKSideTableContext persistentStoreCoordinator](v2, "persistentStoreCoordinator");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[EKSideTableContext persistentStoreCoordinator](v2, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = v2;
  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[EKSideTableContext sideTableContext]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ - Failed to create a valid persistent coordinator or store; context will be nil!"), v9);

    v8 = 0;
  }

  return v8;
}

- (EKSideTableContext)initWithConcurrencyType:(unint64_t)a3
{
  EKSideTableContext *v3;
  EKSideTableContext *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKSideTableContext;
  v3 = -[EKSideTableContext initWithConcurrencyType:](&v7, sel_initWithConcurrencyType_, a3);
  v4 = v3;
  if (v3)
  {
    -[EKSideTableContext _persistentStoreCoordinator](v3, "_persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[EKSideTableContext setPersistentStoreCoordinator:](v4, "setPersistentStoreCoordinator:", v5);
    -[EKSideTableContext setUndoManager:](v4, "setUndoManager:", 0);
    -[EKSideTableContext setMergePolicy:](v4, "setMergePolicy:", *MEMORY[0x24BDBB480]);

  }
  return v4;
}

- (id)_alarmsMatchingPredicate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("Alarm"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(v7, "setEntity:", v6);
  objc_msgSend(v7, "setPredicate:", v5);

  objc_msgSend(v7, "setIncludesPendingChanges:", 0);
  v10 = 0;
  -[EKSideTableContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)deleteAllAlarms
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[EKSideTableContext _alarmsMatchingPredicate:](self, "_alarmsMatchingPredicate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[EKSideTableContext deleteObject:](self, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)insertNewAlarm
{
  return (id)objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Alarm"), self);
}

- (id)nextAlarmFireTime
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("Alarm"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntity:", v4);

  v5 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("fireTime > %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v7);

  objc_msgSend(v3, "setIncludesPendingChanges:", 0);
  objc_msgSend(v3, "setFetchLimit:", 1);
  v8 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("fireTime"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v10);

  v15 = 0;
  -[EKSideTableContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v3, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fireTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)alarmsBetweenStartDate:(id)a3 endDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v6 = (objc_class *)MEMORY[0x24BDBB678];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("Alarm"), self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntity:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("fireTime >= %@ and fireTime <= %@"), v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v11);
  objc_msgSend(v9, "setIncludesPendingChanges:", 0);
  v12 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("fireTime"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v14);

  v17 = 0;
  -[EKSideTableContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v9, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_settingForKey:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = (objc_class *)MEMORY[0x24BDBB678];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("Setting"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntity:", v7);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("key = %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v8);
  objc_msgSend(v6, "setIncludesPendingChanges:", 1);
  objc_msgSend(v6, "setFetchLimit:", 1);
  v12 = 0;
  -[EKSideTableContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v6, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)settingForKey:(id)a3
{
  void *v3;
  void *v4;

  -[EKSideTableContext _settingForKey:](self, "_settingForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EKSideTableContext _settingForKey:](self, "_settingForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Setting"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("key"));
  }
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("value"));

}

- (id)rootDirectory
{
  NSString *path;

  path = self->_path;
  if (path)
    return path;
  CALNDefaultCalendarDirectory();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pathForPersistentStore
{
  void *v2;
  void *v3;

  -[EKSideTableContext rootDirectory](self, "rootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Extras.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_urlForPersistentStore
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[EKSideTableContext _pathForPersistentStore](self, "_pathForPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_removeSqliteFiles
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  id v12;

  -[EKSideTableContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBB738]);
    -[EKSideTableContext _managedObjectModel](self, "_managedObjectModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithManagedObjectModel:", v5);

  }
  -[EKSideTableContext _urlForPersistentStore](self, "_urlForPersistentStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBB580];
  v12 = 0;
  v8 = objc_msgSend(v3, "_destroyPersistentStoreAtURL:withType:options:error:", v6, v7, 0, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to recover by deleting old database! %@, %@\n\n"), v9, v10);

  }
  return v8;
}

- (id)_managedObjectModel
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id result;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SideTables"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BDBB6B0]);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContentsOfURL:", v5);

  if (v6)
  {

    return v6;
  }
  else
  {
    NSLog(CFSTR("Failed to load schema at %@"), v3);
    __break(1u);
  }
  return result;
}

- (id)_persistentStoreCoordinator
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;

  -[EKSideTableContext _urlForPersistentStore](self, "_urlForPersistentStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDBB738]);
  -[EKSideTableContext _managedObjectModel](self, "_managedObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithManagedObjectModel:", v5);

  v7 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBB488];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x24BDBB420], *MEMORY[0x24BDD0CF8], *MEMORY[0x24BDBB4F8], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BDBB580];
  v21 = 0;
  objc_msgSend(v6, "addPersistentStoreWithType:configuration:URL:options:error:", v12, 0, v3, v11, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (v13)
    goto LABEL_2;
  objc_msgSend(v14, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Error while importing %@, %@\n\nCreating new database..."), v14, v16);

  if (!-[EKSideTableContext _removeSqliteFiles](self, "_removeSqliteFiles"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[EKSideTableContext _persistentStoreCoordinator]");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ - Unable to remove sqlite files"), v14);
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  v20 = 0;
  objc_msgSend(v6, "addPersistentStoreWithType:configuration:URL:options:error:", v12, 0, v3, v11, &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;

  if (!v17)
  {
    objc_msgSend(v14, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Second Error while creating new database %@, %@\n\n"), v14, v18);

    goto LABEL_8;
  }
  NSLog(CFSTR("Created new database successfully."));
LABEL_2:
  v15 = v6;
LABEL_9:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
