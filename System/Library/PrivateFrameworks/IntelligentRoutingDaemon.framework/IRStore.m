@implementation IRStore

- (id)countManagedObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSManagedObjectContext *managedObjectContext;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  IRStore *v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  managedObjectContext = self->_managedObjectContext;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__IRStore_countManagedObjectWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v19[3] = &unk_251044FE8;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v25 = &v31;
  v26 = a6;
  v22 = v16;
  v23 = self;
  v24 = &v27;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v19);
  if (v32[5] && os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    -[IRStore countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:].cold.1();
  if (v28[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSString *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = *(NSString **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("managedObject of class %@ must respond to convert selector"), NSClassFromString(v4));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSelector:", sel_convert);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

}

void __85__IRStore_countManagedObjectWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setSortDescriptors:", a1[6]);
  objc_msgSend(v2, "setFetchLimit:", a1[10]);
  v4 = *(void **)(a1[7] + 8);
  v5 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "countForFetchRequest:error:", v2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v6;
  objc_msgSend(*(id *)(a1[7] + 8), "reset");

}

void __86__IRStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setSortDescriptors:", a1[6]);
  objc_msgSend(v2, "setFetchLimit:", a1[10]);
  v4 = *(void **)(a1[7] + 8);
  v5 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[8] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
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
  v7 = __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke_2;
  v8 = &unk_251044F98;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v9 = v3;
  v10 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "reset", v5, v6, v7, v8);

}

uint64_t __31__IRStore_commitChangesToStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasChanges"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v3 + 40);
    objc_msgSend(v2, "save:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reset");
}

- (BOOL)commitChangesToStore
{
  NSManagedObjectContext *managedObjectContext;
  BOOL v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  managedObjectContext = self->_managedObjectContext;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__IRStore_commitChangesToStore__block_invoke;
  v5[3] = &unk_251044F70;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v5);
  if (v7[5])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRStore commitChangesToStore].cold.1();
    v3 = v7[5] == 0;
  }
  else
  {
    v3 = 1;
  }
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (id)fetchManagedObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  void *v6;
  void *v7;

  -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSManagedObjectContext *managedObjectContext;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  IRStore *v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  managedObjectContext = self->_managedObjectContext;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__IRStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v19[3] = &unk_251044FE8;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v25 = &v33;
  v26 = a6;
  v22 = v16;
  v23 = self;
  v24 = &v27;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v19);
  if (v34[5] && os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:].cold.1();
  v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)fetchObjectWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  void *v6;
  void *v7;

  -[IRStore fetchObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fetchObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSManagedObjectContext *managedObjectContext;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  IRStore *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[IRStore fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v10, v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__5;
    v29 = __Block_byref_object_dispose__5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    managedObjectContext = self->_managedObjectContext;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __79__IRStore_fetchObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
    v20 = &unk_251044FC0;
    v21 = v13;
    v23 = self;
    v24 = &v25;
    v22 = v10;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", &v17);
    v15 = (void *)objc_msgSend((id)v26[5], "copy", v17, v18, v19, v20);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (IRStore)initWithPersistenceManager:(id)a3
{
  id v5;
  IRStore *v6;
  IRStore *v7;
  uint64_t v8;
  NSManagedObjectContext *managedObjectContext;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRStore;
  v6 = -[IRStore init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceManager, a3);
    -[IRPersistenceManager createManagedObjectContext](v7->_persistenceManager, "createManagedObjectContext");
    v8 = objc_claimAutoreleasedReturnValue();
    managedObjectContext = v7->_managedObjectContext;
    v7->_managedObjectContext = (NSManagedObjectContext *)v8;

  }
  return v7;
}

- (BOOL)batchDeleteObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSManagedObjectContext *managedObjectContext;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  IRStore *v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  v31 = 0;
  managedObjectContext = self->_managedObjectContext;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__IRStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v19[3] = &unk_251045010;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v23 = self;
  v24 = &v26;
  v25 = a6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v19);
  if (v27[5])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:].cold.1();
    v17 = v27[5] == 0;
  }
  else
  {
    v17 = 1;
  }

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __85__IRStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setSortDescriptors:", a1[6]);
  objc_msgSend(v2, "setFetchLimit:", a1[9]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v2);
  v5 = *(void **)(a1[7] + 8);
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = (id)objc_msgSend(v5, "executeRequest:error:", v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_msgSend(*(id *)(a1[7] + 8), "reset");

}

- (BOOL)batchUpdateObjectsWithEntityName:(id)a3 predicate:(id)a4 propertiesToUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSManagedObjectContext *managedObjectContext;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  IRStore *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  managedObjectContext = self->_managedObjectContext;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__IRStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke;
  v17[3] = &unk_251045038;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  v21 = self;
  v22 = &v23;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v17);
  v15 = v24[5];
  if (v15 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    -[IRStore batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:].cold.1();

  _Block_object_dispose(&v23, 8);
  return v15 == 0;
}

void __73__IRStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB5F8], "batchUpdateRequestWithEntityName:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", a1[5]);
  objc_msgSend(v2, "setPropertiesToUpdate:", a1[6]);
  v3 = *(void **)(a1[7] + 8);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  v5 = (id)objc_msgSend(v3, "executeRequest:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_msgSend(*(id *)(a1[7] + 8), "reset");

}

- (IRPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (void)commitChangesToStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#store, [ErrorId - Commit changes error] Could not save changes to store with error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)fetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#store, [ErrorId - Fetch MOs error] Could not perform fetch request to store with error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)countManagedObjectWithEntityName:byAndPredicates:sortDescriptors:andLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#store, [ErrorId - Count MOs error] Could not perform fetch request to store with error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#store, [ErrorId - Batch delete MOs error] Could not perform batch delete request to store with error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)batchUpdateObjectsWithEntityName:predicate:propertiesToUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#store, [ErrorId - Batch update MOs error] Could not perform batch update request to store with error = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
