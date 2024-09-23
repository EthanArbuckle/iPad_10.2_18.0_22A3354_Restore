@implementation BMBehaviorStorage

+ (NSURL)defaultURL
{
  return (NSURL *)BMStorageURLForDomain(CFSTR("BehaviorMiner"));
}

- (BMBehaviorStorage)init
{
  void *v3;
  BMBehaviorStorage *v4;

  BMStorageURLForDomain(CFSTR("BehaviorMiner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BMBehaviorStorage initWithURL:readOnly:](self, "initWithURL:readOnly:", v3, 0);

  return v4;
}

- (BMBehaviorStorage)initWithURL:(id)a3 readOnly:(BOOL)a4
{
  return -[BMBehaviorStorage initWithURL:readOnly:error:](self, "initWithURL:readOnly:error:", a3, a4, 0);
}

- (BMBehaviorStorage)initWithURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BMBehaviorStorage *v9;
  BMBehaviorStorage *v10;
  NSURL *v11;
  void *URL;
  void *v13;
  uint64_t v14;
  NSURL *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  NSPersistentContainer *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  NSPersistentContainer *container;
  BMBehaviorStorage *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  BMBehaviorDatabaseMetadata *v67;
  BMBehaviorDatabaseMetadata *metadata;
  NSObject *v69;
  BMBehaviorDatabaseMetadata *v70;
  BMManagedObjectConverter *v71;
  BMManagedObjectConverter *converter;
  uint64_t v73;
  NSManagedObjectContext *context;
  objc_super v76;
  id v77;
  _QWORD v78[5];
  __int128 buf;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[3];

  v6 = a4;
  v86[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BMBehaviorStorage;
  v9 = -[BMBehaviorStorage init](&v76, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_47:
    v61 = v10;
    goto LABEL_48;
  }
  v9->_readOnly = v6;
  if (objc_msgSend(v8, "isFileURL"))
  {
    v11 = (NSURL *)v8;
    URL = v10->_URL;
    v10->_URL = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "path");
    URL = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:", URL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v10->_URL;
    v10->_URL = (NSURL *)v14;

  }
  v16 = v8;
  BMLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[BMBehaviorStorage initWithURL:readOnly:error:].cold.8();

  if (v6)
  {
    v18 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
    if (access(v18, 0))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File does not exist %s"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD1540];
      v85 = *MEMORY[0x24BDD0FC8];
      v86[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 2, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      BMLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_2147C2000, v23, OS_LOG_TYPE_DEFAULT, "Can't initialize CoreBehavior storage: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (!access(v18, 4))
        goto LABEL_16;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No permission to read %s"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDD1540];
      v85 = *MEMORY[0x24BDD0FC8];
      v86[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 257, v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      BMLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BMBehaviorStorage initWithURL:readOnly:error:].cold.7();
    }

    if (v22)
    {
      v26 = objc_retainAutorelease(v22);
LABEL_28:
      v36 = v26;
      v47 = 0;
      v46 = v26;
      goto LABEL_38;
    }
  }
LABEL_16:
  if (BMLoadBehaviorStoragePersistentContainer_onceToken != -1)
    dispatch_once(&BMLoadBehaviorStoragePersistentContainer_onceToken, &__block_literal_global_14);
  if (!BMLoadBehaviorStoragePersistentContainer_model)
  {
    v48 = (void *)MEMORY[0x24BDD1540];
    v78[0] = *MEMORY[0x24BDD0FC8];
    *(_QWORD *)&buf = CFSTR("Error loading BehaviorMiner.momd from BehaviorMiner.framework resources");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v78, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], -1100, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutorelease(v50);
    goto LABEL_28;
  }
  BMLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[BMBehaviorStorage initWithURL:readOnly:error:].cold.6(v27, v28, v29, v30, v31, v32, v33, v34);

  v35 = objc_alloc(MEMORY[0x24BDBB700]);
  v36 = (void *)objc_msgSend(v35, "initWithName:managedObjectModel:", CFSTR("BehaviorMiner"), BMLoadBehaviorStoragePersistentContainer_model);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB740]), "initWithURL:", v16);
  objc_msgSend(v37, "setType:", *MEMORY[0x24BDBB580]);
  objc_msgSend(v37, "setReadOnly:", v6);
  v84 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setPersistentStoreDescriptions:", v38);

  objc_msgSend(v16, "path");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringByDeletingLastPathComponent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  BMLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[BMBehaviorStorage initWithURL:readOnly:error:].cold.5();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v42, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v40, 1, 0, &v77);
  v43 = v77;

  BMLog();
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v43)
  {
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[BMBehaviorStorage initWithURL:readOnly:error:].cold.4();

    v46 = objc_retainAutorelease(v43);
    v47 = 0;
  }
  else
  {
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[BMBehaviorStorage initWithURL:readOnly:error:].cold.3(v45, v51, v52, v53, v54, v55, v56, v57);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__2;
    v82 = __Block_byref_object_dispose__2;
    v83 = 0;
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __BMLoadBehaviorStoragePersistentContainer_block_invoke_178;
    v78[3] = &unk_24D21ED80;
    v78[4] = &buf;
    objc_msgSend(v36, "loadPersistentStoresWithCompletionHandler:", v78);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      BMLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[BMBehaviorStorage initWithURL:readOnly:error:].cold.2((uint64_t)&buf + 8, v58);

      v46 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v47 = 0;
    }
    else
    {
      v47 = v36;
      v46 = 0;
    }
    _Block_object_dispose(&buf, 8);

  }
LABEL_38:

  v59 = v46;
  container = v10->_container;
  v10->_container = v47;

  if (a5)
    *a5 = objc_retainAutorelease(v59);
  if (!v59)
  {
    -[NSPersistentContainer persistentStoreCoordinator](v10->_container, "persistentStoreCoordinator");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "persistentStores");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "firstObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "metadata");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    BMLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      -[BMBehaviorStorage initWithURL:readOnly:error:].cold.1();

    v67 = -[BMBehaviorDatabaseMetadata initWithDictionary:]([BMBehaviorDatabaseMetadata alloc], "initWithDictionary:", v65);
    metadata = v10->_metadata;
    v10->_metadata = v67;

    BMLog();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      v70 = v10->_metadata;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v70;
      _os_log_impl(&dword_2147C2000, v69, OS_LOG_TYPE_INFO, "Initialized behavior storage with metadata %@", (uint8_t *)&buf, 0xCu);
    }

    v71 = objc_alloc_init(BMManagedObjectConverter);
    converter = v10->_converter;
    v10->_converter = v71;

    v73 = -[NSPersistentContainer newBackgroundContext](v10->_container, "newBackgroundContext");
    context = v10->_context;
    v10->_context = (NSManagedObjectContext *)v73;

    -[NSManagedObjectContext setMergePolicy:](v10->_context, "setMergePolicy:", *MEMORY[0x24BDBB478]);
    goto LABEL_47;
  }

  v61 = 0;
LABEL_48:

  return v61;
}

- (id)fetchRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 error:(id *)a6
{
  return -[BMBehaviorStorage fetchRulesWithSupport:confidence:filters:limit:error:](self, "fetchRulesWithSupport:confidence:filters:limit:error:", a5, 0, a6, a3, a4);
}

- (id)fetchRulesWithSupport:(double)a3 confidence:(double)a4 filters:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  return -[BMBehaviorStorage fetchRulesWithAbsoluteSupport:support:confidence:conviction:lift:rulePowerFactor:uniqueDaysLastWeek:uniqueDaysTotal:filters:limit:error:](self, "fetchRulesWithAbsoluteSupport:support:confidence:conviction:lift:rulePowerFactor:uniqueDaysLastWeek:uniqueDaysTotal:filters:limit:error:", 0, 0, 0, a5, a6, a7, a3, a4, 0.0, 0.0, 0.0);
}

- (id)fetchRulesWithAbsoluteSupport:(unint64_t)a3 support:(double)a4 confidence:(double)a5 conviction:(double)a6 lift:(double)a7 rulePowerFactor:(double)a8 uniqueDaysLastWeek:(unint64_t)a9 uniqueDaysTotal:(unint64_t)a10 filters:(id)a11 limit:(unint64_t)a12 error:(id *)a13
{
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  BMBehaviorStorage *v31;
  uint64_t *v32;
  uint64_t *v33;
  unint64_t v34;
  double v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v24 = a11;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2;
  v53 = __Block_byref_object_dispose__2;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2;
  v47 = __Block_byref_object_dispose__2;
  v48 = 0;
  -[BMBehaviorStorage context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __157__BMBehaviorStorage_fetchRulesWithAbsoluteSupport_support_confidence_conviction_lift_rulePowerFactor_uniqueDaysLastWeek_uniqueDaysTotal_filters_limit_error___block_invoke;
  v29[3] = &unk_24D21ECC0;
  v34 = a12;
  v35 = a4;
  v36 = a5;
  v26 = v24;
  v30 = v26;
  v31 = self;
  v37 = a3;
  v38 = a6;
  v39 = a7;
  v40 = a8;
  v41 = a9;
  v42 = a10;
  v32 = &v49;
  v33 = &v43;
  objc_msgSend(v25, "performBlockAndWait:", v29);

  if (a13)
    *a13 = objc_retainAutorelease((id)v44[5]);
  v27 = (id)v50[5];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v27;
}

void __157__BMBehaviorStorage_fetchRulesWithAbsoluteSupport_support_confidence_conviction_lift_rulePowerFactor_uniqueDaysLastWeek_uniqueDaysTotal_filters_limit_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  +[BMRuleMO fetchRequest](BMRuleMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", &unk_24D2236A0);
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v2, "setFetchLimit:");
    v3 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("support"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithObjects:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setSortDescriptors:", v6);
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("support >= %f AND confidence >= %f"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v14, "rulePredicate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "rulePredicate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v17);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v18, "executeFetchRequest:error:", v2, &v40);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v40;

  if (v20)
    goto LABEL_14;
  v37 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 96));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 104));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 112));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 128));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringWithFormat:", CFSTR("absoluteSupport >= %@ && conviction >= %@ && lift >= %@ && rulePowerFactor >= %@ && uniqueDaysLastWeek >= %@ && uniqueDaysTotal >= %@"), v21, v22, v23, v24, v25, v26);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "converter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v27, "convertRuleMOs:basketCount:error:", v19, objc_msgSend(v28, "numberOfBaskets"), &v39);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v39;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v38);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v30);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = v31;

  if (v20)
  {
LABEL_14:
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v20;
    v36 = v20;

  }
}

- (void)saveRules:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[BMBehaviorStorage context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__BMBehaviorStorage_saveRules_error___block_invoke;
  v9[3] = &unk_24D21ECE8;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "performBlockAndWait:", v9);

  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __37__BMBehaviorStorage_saveRules_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "converter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "insertRules:inManagedObjectContext:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "hasChanges");

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "save:", &v11);
    v8 = v11;

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)resetStorageWithMetadata:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  BMLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_2147C2000, v7, OS_LOG_TYPE_INFO, "Resetting behavior storage and applying new metadata %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  -[BMBehaviorStorage context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke;
  v17[3] = &unk_24D21ED10;
  v17[4] = self;
  v17[5] = &buf;
  objc_msgSend(v8, "performBlockAndWait:", v17);

  -[BMBehaviorStorage context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke_2;
  v16[3] = &unk_24D21ED38;
  v16[4] = self;
  objc_msgSend(v10, "performBlockAndWait:", v16);

  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    -[BMBehaviorStorage container](self, "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistentStoreCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistentStores");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dictionaryRepresntation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMetadata:", v15);
    -[BMBehaviorStorage setMetadata:](self, "setMetadata:", v6);

  }
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

}

void __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = objc_alloc(MEMORY[0x24BDBB5E8]);
  +[BMRuleMO fetchRequest](BMRuleMO, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFetchRequest:", v3);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v6 = (id)objc_msgSend(v5, "executeRequest:error:", v4, &v17);
  v7 = v17;

  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v7;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BDBB5E8]);
    +[BMItemMO fetchRequest](BMItemMO, "fetchRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithFetchRequest:", v12);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v14 = (id)objc_msgSend(v13, "executeRequest:error:", v10, &v16);
    v15 = v16;
    v9 = v16;

    if (v9)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v15);
  }

}

void __52__BMBehaviorStorage_resetStorageWithMetadata_error___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BMBehaviorStorage container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBehaviorStorage URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBehaviorStorage metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> container: %@, URL: %@, metadata: %@"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BMBehaviorDatabaseMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BMManagedObjectConverter)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
  objc_storeStrong((id *)&self->_converter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)initWithURL:readOnly:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_2147C2000, v0, v1, "Loaded persistent metadata dictionary for behavior storage: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithURL:(uint64_t)a1 readOnly:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2147C2000, a2, OS_LOG_TYPE_ERROR, "Error loading persistent store %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithURL:(uint64_t)a3 readOnly:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_2147C2000, a1, a3, "Loading persistent persistent store", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)initWithURL:readOnly:error:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_2147C2000, v0, OS_LOG_TYPE_ERROR, "Error creating directory at path %@, %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithURL:readOnly:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_2147C2000, v0, v1, "Creating directory for persistent store at path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithURL:(uint64_t)a3 readOnly:(uint64_t)a4 error:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_2147C2000, a1, a3, "Creating persistent container and persistent store", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)initWithURL:readOnly:error:.cold.7()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_2147C2000, v0, OS_LOG_TYPE_FAULT, "Error initializing CoreBehavior storage: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithURL:readOnly:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_2147C2000, v0, v1, "Checking access level for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
