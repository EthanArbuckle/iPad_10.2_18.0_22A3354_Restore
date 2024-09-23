@implementation ULStore

+ (Class)MOClass
{
  return 0;
}

+ (unsigned)maxEntriesInTable
{
  return 0;
}

+ (id)defaultSortProperty
{
  return 0;
}

- (ULStore)initWithDb:(ULDatabase *)a3
{
  ULStore *v4;
  ULStore *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ULStore;
  v4 = -[ULStore init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ULStore setDb:](v4, "setDb:", a3);
    objc_msgSend((id)-[ULStore db](v5, "db")[8], "createManagedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULStore setManagedObjectContext:](v5, "setManagedObjectContext:", v6);

  }
  return v5;
}

- (BOOL)commitChangesToStore
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __31__ULStore_commitChangesToStore__block_invoke;
  v14[3] = &unk_2511D3EC8;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v3, "performBlockAndWait:", v14);

  if (v16[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v4 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = v16[5];
      v6 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2114;
      v26 = v5;
      v27 = 2113;
      v28 = v7;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not save changes to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@}", buf, 0x26u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v8 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v8))
    {
      v9 = v16[5];
      v10 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2114;
      v26 = v9;
      v27 = 2113;
      v28 = v11;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not save changes to store", "{\"msg%{public}.0s\":\"Could not save changes to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@}", buf, 0x26u);

    }
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v16[5]);
    v12 = v16[5] == 0;
  }
  else
  {
    v12 = 1;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __31__ULStore_commitChangesToStore__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v5 + 40);
    objc_msgSend(v4, "save:", &obj);
    objc_storeStrong((id *)(v5 + 40), obj);

  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

}

- (id)fetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  ULStore *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t buf;
  __int16 v57;
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__4;
  v54 = __Block_byref_object_dispose__4;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__4;
  v48 = __Block_byref_object_dispose__4;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4;
  v42 = __Block_byref_object_dispose__4;
  v43 = 0;
  v28 = a5;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __86__ULStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v29[3] = &unk_2511D3EF0;
  v34 = &v38;
  v13 = v10;
  v30 = v13;
  v14 = v11;
  v31 = v14;
  v15 = v28;
  v36 = &v50;
  v37 = a6;
  v32 = v15;
  v33 = self;
  v35 = &v44;
  objc_msgSend(v12, "performBlockAndWait:", v29);

  if (v51[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v16 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17 = v51[5];
      v18 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v39[5];
      buf = 68289795;
      v57 = 2082;
      v58 = "";
      v59 = 2114;
      v60 = v17;
      v61 = 2113;
      v62 = v19;
      v63 = 2113;
      v64 = v20;
      _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v21 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v21))
    {
      v22 = v51[5];
      v23 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v39[5];
      buf = 68289795;
      v57 = 2082;
      v58 = "";
      v59 = 2114;
      v60 = v22;
      v61 = 2113;
      v62 = v24;
      v63 = 2113;
      v64 = v25;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform fetch request to store", "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v51[5]);
  }
  v26 = (id)v45[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v26;
}

void __86__ULStore_fetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPredicate:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setSortDescriptors:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFetchLimit:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setResultType:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (BOOL)batchTransferManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 limit:(unint64_t)a7 intoTargetStore:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __117__ULStore_batchTransferManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_intoTargetStore___block_invoke;
  v25[3] = &unk_2511D3F18;
  v25[4] = self;
  v19 = v14;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  v21 = v16;
  v31 = a6;
  v32 = a7;
  v28 = v21;
  v30 = &v33;
  v22 = v17;
  v29 = v22;
  objc_msgSend(v18, "performBlockAndWait:", v25);

  v23 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __117__ULStore_batchTransferManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_intoTargetStore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v10 = 0;
  objc_msgSend(v2, "_batchFetchManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:batchSize:limit:error:", v3, v4, v5, v6, v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v9 == 0;
  if (!v9 && objc_msgSend(v8, "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "_insertFetchedBatchedObjects:usingBatchSize:", v8, *(_QWORD *)(a1 + 80));

}

- (id)fetchManagedObjectsForEntityName:(id)a3 propertiesToFetch:(id)a4 propertiesToGroupBy:(id)a5 byAndPredicates:(id)a6 sortDescriptors:(id)a7 andLimit:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v26;
  _QWORD v27[4];
  id v28;
  ULStore *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__4;
  v26 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __123__ULStore_fetchManagedObjectsForEntityName_propertiesToFetch_propertiesToGroupBy_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v27[3] = &unk_2511D3F40;
  v19 = v15;
  v28 = v19;
  v29 = self;
  v20 = v14;
  v30 = v20;
  v21 = v16;
  v31 = v21;
  v22 = v17;
  v32 = v22;
  v23 = v26;
  v33 = v23;
  v34 = &v36;
  v35 = a8;
  objc_msgSend(v18, "performBlockAndWait:", v27);

  v24 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v24;
}

void __123__ULStore_fetchManagedObjectsForEntityName_propertiesToFetch_propertiesToGroupBy_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  if ((objc_msgSend(v13, "containsObject:", CFSTR("objectID")) & 1) == 0)
    objc_msgSend(v13, "addObject:", CFSTR("objectID"));
  LOBYTE(v12) = 0;
  objc_msgSend(*(id *)(a1 + 40), "fetchPropertiesForEntityName:propertiesToFetch:propertiesToGroupBy:distinctResults:byAndPredicates:sortDescriptors:andLimit:resetContext:", *(_QWORD *)(a1 + 48), v13, *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), v12);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v2)
  {
    v3 = 0;
    v4 = *(_QWORD *)v17;
    while (2)
    {
      v5 = 0;
      v6 = v3;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("objectID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v6;
        objc_msgSend(v8, "existingObjectWithID:error:", v9, &v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v15;

        if (v10)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v10);
        }
        else if (v3)
        {
          if (onceToken_MicroLocation_Default != -1)
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
          v11 = logObject_MicroLocation_Default;
          if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v3;
            _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_ERROR, "Conversion of ojbectID to managed object failed with error: %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeAllObjects");
          goto LABEL_19;
        }

        ++v5;
        v6 = v3;
      }
      while (v2 != v5);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v2)
        continue;
      break;
    }
LABEL_19:

  }
}

- (id)fetchPropertiesForEntityName:(id)a3 propertiesToFetch:(id)a4 propertiesToGroupBy:(id)a5 distinctResults:(BOOL)a6 byAndPredicates:(id)a7 sortDescriptors:(id)a8 andLimit:(unint64_t)a9 resetContext:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v37;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  ULStore *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  unint64_t v49;
  BOOL v50;
  BOOL v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t buf;
  __int16 v71;
  const char *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__4;
  v68 = __Block_byref_object_dispose__4;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__4;
  v62 = __Block_byref_object_dispose__4;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__4;
  v57 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext", v17, v16, v15, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __148__ULStore_fetchPropertiesForEntityName_propertiesToFetch_propertiesToGroupBy_distinctResults_byAndPredicates_sortDescriptors_andLimit_resetContext___block_invoke;
  v39[3] = &unk_2511D3F68;
  v46 = &v52;
  v37 = v15;
  v40 = v37;
  v21 = v18;
  v41 = v21;
  v22 = v19;
  v42 = v22;
  v49 = a9;
  v23 = v16;
  v43 = v23;
  v24 = v17;
  v50 = a6;
  v44 = v24;
  v45 = self;
  v47 = &v58;
  v48 = &v64;
  v51 = a10;
  objc_msgSend(v20, "performBlockAndWait:", v39);

  if (v65[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v25 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = v65[5];
      v27 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v53[5];
      buf = 68289795;
      v71 = 2082;
      v72 = "";
      v73 = 2114;
      v74 = v26;
      v75 = 2113;
      v76 = v28;
      v77 = 2113;
      v78 = v29;
      _os_log_impl(&dword_2419D9000, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v30 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v30))
    {
      v31 = v65[5];
      v32 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v53[5];
      buf = 68289795;
      v71 = 2082;
      v72 = "";
      v73 = 2114;
      v74 = v31;
      v75 = 2113;
      v76 = v33;
      v77 = 2113;
      v78 = v34;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform fetch request to store", "{\"msg%{public}.0s\":\"Could not perform fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v65[5]);
  }
  v35 = (id)v59[5];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v35;
}

void __148__ULStore_fetchPropertiesForEntityName_propertiesToFetch_propertiesToGroupBy_distinctResults_byAndPredicates_sortDescriptors_andLimit_resetContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setPredicate:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSortDescriptors:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setFetchLimit:", *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setResultType:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setPropertiesToFetch:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setPropertiesToGroupBy:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setReturnsDistinctResults:", *(unsigned __int8 *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 72), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (*(_BYTE *)(a1 + 113))
  {
    objc_msgSend(*(id *)(a1 + 72), "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reset");

  }
}

- (id)fetchPropertyForEntityName:(id)a3 propertyToFetch:(id)a4 distinctResults:(BOOL)a5 byAndPredicates:(id)a6 sortDescriptors:(id)a7 andLimit:(unint64_t)a8
{
  _BOOL8 v11;
  id v14;
  NSArray *v15;
  id v16;
  id v17;
  void *v18;
  ULDBUtils *v19;
  NSString *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v11 = a5;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (NSArray *)a4;
  v16 = a6;
  v17 = a7;
  v24[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 1;
  -[ULStore fetchPropertiesForEntityName:propertiesToFetch:propertiesToGroupBy:distinctResults:byAndPredicates:sortDescriptors:andLimit:resetContext:](self, "fetchPropertiesForEntityName:propertiesToFetch:propertiesToGroupBy:distinctResults:byAndPredicates:sortDescriptors:andLimit:resetContext:", v14, v18, 0, v11, v16, v17, a8, v23);
  v19 = (ULDBUtils *)objc_claimAutoreleasedReturnValue();

  ULDBUtils::getPropertyAsArray(v19, v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)countManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  ULStore *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t buf;
  __int16 v55;
  const char *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v27 = a4;
  v28 = a5;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __86__ULStore_countManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v29[3] = &unk_2511D3EF0;
  v34 = &v42;
  v12 = v10;
  v30 = v12;
  v13 = v27;
  v31 = v13;
  v14 = v28;
  v36 = &v48;
  v37 = a6;
  v32 = v14;
  v33 = self;
  v35 = &v38;
  objc_msgSend(v11, "performBlockAndWait:", v29);

  if (v49[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v15 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = v49[5];
      v17 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v43[5];
      buf = 68289795;
      v55 = 2082;
      v56 = "";
      v57 = 2114;
      v58 = v16;
      v59 = 2113;
      v60 = v18;
      v61 = 2113;
      v62 = v19;
      _os_log_impl(&dword_2419D9000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform count fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v20 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v20))
    {
      v21 = v49[5];
      v22 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v43[5];
      buf = 68289795;
      v55 = 2082;
      v56 = "";
      v57 = 2114;
      v58 = v21;
      v59 = 2113;
      v60 = v23;
      v61 = 2113;
      v62 = v24;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform count fetch request to store", "{\"msg%{public}.0s\":\"Could not perform count fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v49[5]);
  }
  if (v39[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v25;
}

void __86__ULStore_countManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPredicate:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setSortDescriptors:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFetchLimit:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v6, "countForFetchRequest:error:", v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v9;

  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reset");

}

- (BOOL)batchDeleteObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 andLimit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  ULStore *v33;
  uint64_t *v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t buf;
  __int16 v50;
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4;
  v47 = __Block_byref_object_dispose__4;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  v42 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __85__ULStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke;
  v29[3] = &unk_2511D3F90;
  v14 = v10;
  v30 = v14;
  v15 = v11;
  v31 = v15;
  v16 = v12;
  v35 = &v43;
  v36 = a6;
  v32 = v16;
  v33 = self;
  v34 = &v37;
  objc_msgSend(v13, "performBlockAndWait:", v29);

  if (v44[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v17 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v18 = v44[5];
      v19 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v38[5];
      buf = 68289795;
      v50 = 2082;
      v51 = "";
      v52 = 2114;
      v53 = v18;
      v54 = 2113;
      v55 = v20;
      v56 = 2113;
      v57 = v21;
      _os_log_impl(&dword_2419D9000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform batch delete request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"batchDeleteRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v22 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v22))
    {
      v23 = v44[5];
      v24 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v38[5];
      buf = 68289795;
      v50 = 2082;
      v51 = "";
      v52 = 2114;
      v53 = v23;
      v54 = 2113;
      v55 = v25;
      v56 = 2113;
      v57 = v26;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform batch delete request to store", "{\"msg%{public}.0s\":\"Could not perform batch delete request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"batchDeleteRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v44[5]);
    v27 = v44[5] == 0;
  }
  else
  {
    v27 = 1;
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v27;
}

void __85__ULStore_batchDeleteObjectsWithEntityName_byAndPredicates_sortDescriptors_andLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setSortDescriptors:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setFetchLimit:", *(_QWORD *)(a1 + 80));
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v9 + 40);
  v10 = (id)objc_msgSend(v7, "executeRequest:error:", v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);

  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reset");

}

- (id)countAllRecordsForEntityName:(id)a3
{
  -[ULStore countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "countManagedObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)deleteAllRecordsForEntityName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  BOOL v20;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
  v5 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315138;
    v24 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Deleting all records for entity: %s", (uint8_t *)&v23, 0xCu);
  }

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULBatchDeleteEntriesIterationLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = objc_msgSend(v9, "unsignedIntValue");
  else
    v10 = objc_msgSend(&unk_2511ED5D0, "unsignedIntValue");
  v11 = v10;

  if (v11)
  {
    -[ULStore countAllRecordsForEntityName:](self, "countAllRecordsForEntityName:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "integerValue") < 1
        || ((v14 = objc_msgSend(v13, "integerValue"),
             v15 = v11,
             v16 = objc_msgSend(v13, "integerValue") / v11,
             v14 % v11 <= 0)
          ? (v17 = v16)
          : (v17 = v16 + 1),
            v17 < 1))
      {
        v20 = 1;
      }
      else
      {
        v18 = 1;
        do
        {
          v19 = (void *)MEMORY[0x2426A0894]();
          v20 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v4, 0, 0, v15);
          objc_autoreleasePoolPop(v19);
        }
        while (v18++ < v17 && v20);
      }
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v4, 0, 0, 0);
  }

  return v20;
}

- (BOOL)deleteOldestRecordsForEntityName:(id)a3 sortProperty:(id)a4 maxRecordsToKeep:(unsigned int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  BOOL v18;
  float v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[ULStore countAllRecordsForEntityName:](self, "countAllRecordsForEntityName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "unsignedIntValue") - a5;
    if (v12 < 0)
    {
      v18 = 1;
    }
    else
    {
      +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "defaultsDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDatabaseFreeSpacePercentage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(v16, "floatValue");
      else
        objc_msgSend(&unk_2511ECDA8, "floatValue");
      v19 = v17;

      v20 = (float)(v19 * (float)a5);
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
      v21 = v12 + v20;
      v22 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v29 = 1024;
        v30 = v21;
        _os_log_impl(&dword_2419D9000, v22, OS_LOG_TYPE_DEFAULT, "Freeing up database space for entity: %s, Num Records to delete: %d", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v9, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v8, 0, v24, v21);

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)deleteRecordsForEntityName:(id)a3 sortProperty:(id)a4 olderThan:(double)a5 orNewerThan:(double)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
  v12 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _os_log_impl(&dword_2419D9000, v12, OS_LOG_TYPE_DEFAULT, "Deleting old records for entity: %s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K < %@ || %K > %@"), v11, v15, v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v17);

  v18 = -[ULStore batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:](self, "batchDeleteObjectsWithEntityName:byAndPredicates:sortDescriptors:andLimit:", v10, v13, 0, 0);
  return v18;
}

- (BOOL)deleteAllRecords
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore deleteAllRecordsForEntityName:](self, "deleteAllRecordsForEntityName:", v4);

  return (char)self;
}

- (BOOL)deleteOldestRecordsIfFull
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultSortProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore deleteOldestRecordsForEntityName:sortProperty:maxRecordsToKeep:](self, "deleteOldestRecordsForEntityName:sortProperty:maxRecordsToKeep:", v4, v5, objc_msgSend((id)objc_opt_class(), "maxEntriesInTable"));

  return (char)self;
}

- (BOOL)deleteRecordsOlderThan:(double)a3 orNewerThan:(double)a4
{
  objc_class *v7;
  void *v8;
  void *v9;

  v7 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultSortProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ULStore deleteRecordsForEntityName:sortProperty:olderThan:orNewerThan:](self, "deleteRecordsForEntityName:sortProperty:olderThan:orNewerThan:", v8, v9, a3, a4);

  return (char)self;
}

- (unsigned)count
{
  objc_class *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULStore countAllRecordsForEntityName:](self, "countAllRecordsForEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = 0;

  return v6;
}

- (id)_batchFetchManagedObjectsWithEntityName:(id)a3 byAndPredicates:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 limit:(unint64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  ULStore *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
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
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t buf;
  __int16 v62;
  const char *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__4;
  v59 = __Block_byref_object_dispose__4;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__4;
  v53 = __Block_byref_object_dispose__4;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4;
  v47 = __Block_byref_object_dispose__4;
  v48 = 0;
  v31 = a5;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __105__ULStore__batchFetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_error___block_invoke;
  v33[3] = &unk_2511D3FB8;
  v38 = &v43;
  v16 = v13;
  v34 = v16;
  v17 = v14;
  v35 = v17;
  v18 = v31;
  v41 = a7;
  v42 = a6;
  v36 = v18;
  v37 = self;
  v39 = &v49;
  v40 = &v55;
  objc_msgSend(v15, "performBlockAndWait:", v33);

  if (v56[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v19 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v20 = v56[5];
      v21 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v44[5];
      buf = 68289795;
      v62 = 2082;
      v63 = "";
      v64 = 2114;
      v65 = v20;
      v66 = 2113;
      v67 = v22;
      v68 = 2113;
      v69 = v23;
      _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform batch fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v24 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v24))
    {
      v25 = v56[5];
      v26 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v44[5];
      buf = 68289795;
      v62 = 2082;
      v63 = "";
      v64 = 2114;
      v65 = v25;
      v66 = 2113;
      v67 = v27;
      v68 = 2113;
      v69 = v28;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform batch fetch request to store", "{\"msg%{public}.0s\":\"Could not perform batch fetch request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"fetchRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (a8)
      *a8 = objc_retainAutorelease((id)v56[5]);
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v56[5]);
  }
  v29 = (id)v50[5];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v29;
}

void __105__ULStore__batchFetchManagedObjectsWithEntityName_byAndPredicates_sortDescriptors_batchSize_limit_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPredicate:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setSortDescriptors:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFetchLimit:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setResultType:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFetchBatchSize:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (BOOL)_insertFetchedBatchedObjects:(id)a3 usingBatchSize:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  ULStore *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__ULStore__insertFetchedBatchedObjects_usingBatchSize___block_invoke;
  v10[3] = &unk_2511D3FE0;
  v8 = v6;
  v13 = &v15;
  v14 = a4;
  v11 = v8;
  v12 = self;
  objc_msgSend(v7, "performBlockAndWait:", v10);

  LOBYTE(v6) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v6;
}

void __55__ULStore__insertFetchedBatchedObjects_usingBatchSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *context;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "entity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v4)
    {
      v5 = 0;
      v20 = v4;
      do
      {
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          break;
        v22 = v5;
        v6 = *(_QWORD *)(a1 + 56) + v5;
        if (v6 >= v4)
          v6 = v4;
        v24 = v6;
        context = (void *)MEMORY[0x2426A0894]();
        v7 = v22;
        if (v22 < v24)
        {
          do
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)MEMORY[0x24BDBB658];
            objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "insertNewObjectForEntityForName:inManagedObjectContext:", v23, v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "entity");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "attributesByName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v14 = v13;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v26;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v26 != v16)
                    objc_enumerationMutation(v14);
                  v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
                  objc_msgSend(v8, "valueForKey:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "setValue:forKey:", v19, v18);

                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
              }
              while (v15);
            }

            ++v7;
          }
          while (v7 != v24);
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "commitChangesToStore");
        objc_autoreleasePoolPop(context);
        v5 = *(_QWORD *)(a1 + 56) + v22;
        v4 = v20;
      }
      while (v5 < v20);
    }

  }
}

- (BOOL)batchUpdateObjectsWithEntityName:(id)a3 predicate:(id)a4 propertiesToUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  ULStore *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t buf;
  __int16 v47;
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  -[ULStore managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __73__ULStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke;
  v27[3] = &unk_2511D4008;
  v32 = &v34;
  v12 = v8;
  v28 = v12;
  v13 = v9;
  v29 = v13;
  v14 = v10;
  v30 = v14;
  v31 = self;
  v33 = &v40;
  objc_msgSend(v11, "performBlockAndWait:", v27);

  if (v41[5])
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v15 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = v41[5];
      v17 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35[5];
      buf = 68289795;
      v47 = 2082;
      v48 = "";
      v49 = 2114;
      v50 = v16;
      v51 = 2113;
      v52 = v18;
      v53 = 2113;
      v54 = v19;
      _os_log_impl(&dword_2419D9000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Could not perform batch update request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"updateRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_25);
    v20 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v20))
    {
      v21 = v41[5];
      v22 = (objc_class *)objc_msgSend((id)objc_opt_class(), "MOClass");
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v35[5];
      buf = 68289795;
      v47 = 2082;
      v48 = "";
      v49 = 2114;
      v50 = v21;
      v51 = 2113;
      v52 = v23;
      v53 = 2113;
      v54 = v24;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not perform batch update request to store", "{\"msg%{public}.0s\":\"Could not perform batch update request to store\", \"error\":%{public, location:escape_only}@, \"Store MO\":%{private, location:escape_only}@, \"updateRequest\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);

    }
    -[ULStore _handleDatabaseError:](self, "_handleDatabaseError:", v41[5]);
    v25 = v41[5] == 0;
  }
  else
  {
    v25 = 1;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

void __73__ULStore_batchUpdateObjectsWithEntityName_predicate_propertiesToUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB5F8], "batchUpdateRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPropertiesToUpdate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v7 + 40);
  v8 = (id)objc_msgSend(v5, "executeRequest:error:", v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);

  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reset");

}

- (void)_handleDatabaseError:(id)a3
{
  id v4;

  v4 = a3;
  if ((ULDatabase::isMainDatabase(-[ULStore db](self, "db")) & 1) != 0)
    objc_msgSend((id)-[ULStore db](self, "db")[8], "handleDatabaseError:", v4);

}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
