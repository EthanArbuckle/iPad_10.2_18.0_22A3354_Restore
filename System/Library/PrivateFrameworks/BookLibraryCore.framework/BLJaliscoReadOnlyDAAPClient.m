@implementation BLJaliscoReadOnlyDAAPClient

+ (id)sharedClient
{
  BLJaliscoReadOnlyDAAPClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_253DB1F58);
  if (!qword_253DB1FC0)
  {
    v2 = [BLJaliscoReadOnlyDAAPClient alloc];
    +[BLJaliscoVersion defaultIdentifier](BLJaliscoVersion, "defaultIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeStoreAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BLJaliscoReadOnlyDAAPClient initWithIdentifier:databaseContainerPath:accountDSID:](v2, "initWithIdentifier:databaseContainerPath:accountDSID:", v3, 0, v6);
    v8 = (void *)qword_253DB1FC0;
    qword_253DB1FC0 = v7;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253DB1F58);
  return (id)qword_253DB1FC0;
}

- (BLJaliscoReadOnlyDAAPClient)initWithIdentifier:(id)a3 databaseContainerPath:(id)a4 accountDSID:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLJaliscoReadOnlyDAAPClient *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *databaseContainerPath;
  void *v16;
  BLJaliscoReadOnlyDAAPClient *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BLJaliscoReadOnlyDAAPClient;
  v11 = -[BLJaliscoReadOnlyDAAPClient init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    databaseContainerPath = v11->_databaseContainerPath;
    v11->_databaseContainerPath = (NSString *)v14;

    objc_storeStrong((id *)&v11->_currentAccountDSID, a5);
    if (!-[BLJaliscoReadOnlyDAAPClient _setupCoreDataStack](v11, "_setupCoreDataStack"))
    {
      v17 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:accountTypes:", v11, 1);

  }
  v17 = v11;
LABEL_6:

  return v17;
}

- (void)dealloc
{
  void *v3;
  NSManagedObjectModel *model;
  NSPersistentStoreCoordinator *psc;
  NSManagedObjectContext *moc;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:accountTypes:", self, 1);

  model = self->_model;
  self->_model = 0;

  psc = self->_psc;
  self->_psc = 0;

  moc = self->_moc;
  self->_moc = 0;

  v7.receiver = self;
  v7.super_class = (Class)BLJaliscoReadOnlyDAAPClient;
  -[BLJaliscoReadOnlyDAAPClient dealloc](&v7, sel_dealloc);
}

- (id)fetchAllServerItemsForDSIDs:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *moc;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  moc = self->_moc;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CC5350;
  v12[3] = &unk_24CE8BD18;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)searchAllServerItemsForDSIDs:(id)a3 matchingSearchString:(id)a4 isExplicitRestricted:(BOOL)a5
{
  id v8;
  id v9;
  NSManagedObjectContext *moc;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_212CC55A8;
  v24 = sub_212CC55B8;
  v25 = (id)objc_opt_new();
  moc = self->_moc;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_212CC55C0;
  v15[3] = &unk_24CE8CAC8;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v19 = a5;
  v17 = v12;
  v18 = &v20;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)fetchAllServerItemsWithPredicate:(id)a3 sortDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSManagedObjectContext *moc;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  BLJaliscoReadOnlyDAAPClient *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  moc = self->_moc;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_212CC57B8;
  v16[3] = &unk_24CE8A538;
  v17 = v6;
  v18 = v7;
  v19 = self;
  v10 = v8;
  v20 = v10;
  v11 = v7;
  v12 = v6;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v16);
  v13 = v20;
  v14 = v10;

  return v14;
}

- (id)fetchServerItemsForStoreIDs:(id)a3 andDSIDS:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSManagedObjectContext *moc;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  moc = self->_moc;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_212CC59EC;
  v16[3] = &unk_24CE8A538;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)fetchItemsForStoreIDs:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *moc;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  moc = self->_moc;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CC5BC0;
  v12[3] = &unk_24CE8BD18;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)fetchItemsForDSIDs:(id)a3 excludeStoreIDs:(id)a4 isExplicitRestricted:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  NSManagedObjectContext *moc;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  moc = self->_moc;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_212CC5DD0;
  v18[3] = &unk_24CE8CAF0;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v22 = a5;
  v12 = v10;
  v21 = v12;
  v13 = v9;
  v14 = v8;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

+ (id)predicateForNonExplicitItems
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL)"), CFSTR("isExplicit"), CFSTR("isExplicit"));
}

+ (id)sortByTitleDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
}

- (id)predicateToExcludeStoreIDs:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (storeID IN %@)"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_setupCoreDataStack
{
  void *v3;
  void *v4;
  void *v5;
  NSManagedObjectModel *v6;
  NSManagedObjectModel *model;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSPersistentStoreCoordinator *v14;
  NSPersistentStoreCoordinator *psc;
  NSPersistentStoreCoordinator *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSManagedObjectContext *v20;
  NSManagedObjectContext *moc;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32[6];
  uint64_t v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("BKPurchases"), CFSTR("momd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("[BLJaliscoServerSource managedObjectModel]"), CFSTR("[[NSBundle bundleForClass:[self class]] pathForResource:@'BKPurchases' ofType:@'momd'] failed"));
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSManagedObjectModel *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v5);
  model = self->_model;
  self->_model = v6;

  if (!self->_model)
  {
    v23 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load model %@"), v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v23, "initWithName:reason:userInfo:", CFSTR("Nil jalisco model"), v24, 0);

    objc_exception_throw(v25);
  }
  v8 = *MEMORY[0x24BDBB4F8];
  v35[0] = *MEMORY[0x24BDBB550];
  v35[1] = v8;
  v9 = *MEMORY[0x24BDD0CF8];
  v36[0] = MEMORY[0x24BDBD1C8];
  v36[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF48];
  -[BLJaliscoReadOnlyDAAPClient p_persistentStoreFullPathAtSharediBooksLocation](self, "p_persistentStoreFullPathAtSharediBooksLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", self->_model);
  psc = self->_psc;
  self->_psc = v14;

  v16 = self->_psc;
  v17 = *MEMORY[0x24BDBB580];
  v32[0] = 0;
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v16, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v13, v10, v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v32[0];
  if (!v18)
  {
    v26 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create a moc for the persistent store %@"), v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x24BDD1398];
    v28 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v26, "initWithName:reason:userInfo:", CFSTR("Nil jalisco persistentStore"), v27, v29);

    if (!v19)
LABEL_13:

    objc_exception_throw(v30);
  }
  v20 = (NSManagedObjectContext *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
  moc = self->_moc;
  self->_moc = v20;

  -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_moc, "setPersistentStoreCoordinator:", self->_psc);
  -[NSManagedObjectContext setUndoManager:](self->_moc, "setUndoManager:", 0);
  -[NSManagedObjectContext setMergePolicy:](self->_moc, "setMergePolicy:", *MEMORY[0x24BDBB480]);
  if (!self->_moc)
  {
    v31 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create a moc for the persistent store %@"), v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v31, "initWithName:reason:userInfo:", CFSTR("Nil jalisco moc"), v27, 0);
    goto LABEL_13;
  }

  return 1;
}

- (id)p_allItemsFetchRequestForDSIDs:(id)a3
{
  return -[BLJaliscoReadOnlyDAAPClient p_itemsFetchRequestIncludingHiddenItems:dsids:](self, "p_itemsFetchRequestIncludingHiddenItems:dsids:", 1, a3);
}

- (id)p_allItemsFetchRequestForDSIDs:(id)a3 matchingSearchString:(id)a4 isExplicitRestricted:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDBB678];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoReadOnlyDAAPClient currentAccountDSID](self, "currentAccountDSID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14 && (v15 = (void *)v14, v16 = objc_msgSend(v9, "length"), v15, v16))
  {
    v31 = v8;
    objc_msgSend(v8, "valueForKey:", CFSTR("stringValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR(".*\\b%@.*"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("database.server.userUID IN %@"), v17);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL)"), CFSTR("isHidden"), CFSTR("isHidden"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K MATCHES[cd] %@ OR %K MATCHES[cd] %@)"), CFSTR("title"), v20, CFSTR("artist"), v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v21;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v21, v22, v23, 0);
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "predicateForNonExplicitItems");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v25);

    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v24);
    objc_msgSend(v13, "setPredicate:", v26);

    v27 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortedTitle"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayWithObject:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSortDescriptors:", v29);

    v8 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v17);
  }

  return v13;
}

- (id)p_fetchRequestForStoreIDs:(id)a3 dsids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[BLJaliscoReadOnlyDAAPClient p_allItemsFetchRequestForDSIDs:](self, "p_allItemsFetchRequestForDSIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v8, "setFetchLimit:", objc_msgSend(v7, "count") * objc_msgSend(v6, "count"));
  v9 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("storeID IN %@"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v12);
  objc_msgSend(v8, "setPredicate:", v13);

  return v8;
}

- (id)predicateForItems:(BOOL)a3 dsids:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[BLJaliscoReadOnlyDAAPClient currentAccountDSID](self, "currentAccountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("stringValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("database.server.userUID IN %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL)"), CFSTR("isHidden"), CFSTR("isHidden"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)p_itemsFetchRequestIncludingHiddenItems:(BOOL)a3 dsids:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDBB678];
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoReadOnlyDAAPClient predicateForItems:dsids:](self, "predicateForItems:dsids:", v4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  -[BLJaliscoReadOnlyDAAPClient currentAccountDSID](self, "currentAccountDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("artist"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v15);

  }
  return v10;
}

- (id)_itemsFetchRequestForDSIDs:(id)a3 excludeStoreIDs:(id)a4 isExplicitRestricted:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[BLJaliscoReadOnlyDAAPClient p_itemsFetchRequestIncludingHiddenItems:dsids:](self, "p_itemsFetchRequestIncludingHiddenItems:dsids:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "count");

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v10, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[BLJaliscoReadOnlyDAAPClient predicateToExcludeStoreIDs:](self, "predicateToExcludeStoreIDs:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v14, "addObject:", v15);
    if (v5)
    {
      +[BLJaliscoReadOnlyDAAPClient predicateForNonExplicitItems](BLJaliscoReadOnlyDAAPClient, "predicateForNonExplicitItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

    }
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v17);

    v18 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortedTitle"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v14);
  }

  return v10;
}

- (id)p_persistentStoreDirectory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[BLJaliscoReadOnlyDAAPClient databaseContainerPath](self, "databaseContainerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksGroupContainerDocumentsURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BKJaliscoServerSource"));
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

- (BOOL)p_createPersistentDirectoryIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[BLJaliscoReadOnlyDAAPClient p_persistentStoreDirectory](self, "p_persistentStoreDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relativePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v10);
  v7 = v10;

  if (v7)
  {
    BLJaliscoLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "BLJaliscoReadOnlyDAAPClient: Failed to create a persistent store directory at URL %@. Error: %@", buf, 0x16u);
    }

  }
  return v6;
}

- (id)p_persistentStoreFullPathAtSharediBooksLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[BLJaliscoReadOnlyDAAPClient p_persistentStoreDirectory](self, "p_persistentStoreDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLJaliscoVersion persistentStoreFileName](BLJaliscoVersion, "persistentStoreFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  void *v5;
  NSNumber *v6;
  NSNumber *currentAccountDSID;
  id v8;

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeStoreAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_DSID");
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    currentAccountDSID = self->_currentAccountDSID;
    self->_currentAccountDSID = v6;

  }
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSPersistentStoreCoordinator)psc
{
  return self->_psc;
}

- (void)setPsc:(id)a3
{
  objc_storeStrong((id *)&self->_psc, a3);
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)databaseContainerPath
{
  return self->_databaseContainerPath;
}

- (void)setDatabaseContainerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)currentAccountDSID
{
  return self->_currentAccountDSID;
}

- (void)setCurrentAccountDSID:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccountDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAccountDSID, 0);
  objc_storeStrong((id *)&self->_databaseContainerPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_psc, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
