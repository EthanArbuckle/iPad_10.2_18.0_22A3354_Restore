@implementation NSManagedObject(IC)

+ (id)ic_existingObjectWithID:()IC context:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[NSManagedObject(IC) ic_existingObjectWithID:context:].cold.1(v13);
    v10 = 0;
    v9 = v13;
    goto LABEL_11;
  }
  v7 = objc_opt_class();
  v16 = 0;
  objc_msgSend(v6, "existingObjectWithID:error:", v5, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  ICDynamicCast(v7, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = -[NSObject code](v9, "code");
    v12 = os_log_create("com.apple.notes", "CoreData");
    v13 = v12;
    if (v11 == 133000)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[NSManagedObject(IC) ic_existingObjectWithID:context:].cold.2((uint64_t)v5, v13, v14);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1DDAA5000, v13, OS_LOG_TYPE_DEFAULT, "Error finding object from objectID: %@, %@", buf, 0x16u);
    }
LABEL_11:

  }
  return v10;
}

+ (void)ic_existingObjectWithID:()IC context:.cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v2;
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, a1, v3, "Trying to get an object from a nil object ID: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_13();
}

+ (uint64_t)ic_objectsMatchingPredicate:()IC sortDescriptors:context:
{
  return objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:", a3, a4, 0, 0, a5);
}

+ (uint64_t)ic_objectsMatchingPredicate:()IC sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:", a3, a4, 0, a5, a6, a7);
}

- (uint64_t)ic_isTransitioning
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(a1, "_isDeallocating") & 1) != 0 || (objc_msgSend(a1, "faultingState") & 2) != 0)
    return 1;
  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "_isDeallocating") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentStores");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "count") == 0;

  }
  return v3;
}

+ (uint64_t)ic_objectsMatchingPredicate:()IC context:
{
  return objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", a3, 0, a4);
}

+ (id)ic_resultsMatchingPredicate:()IC sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = a6;
  objc_msgSend(a1, "fetchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v14);
  objc_msgSend(v18, "setResultType:", a5);
  objc_msgSend(v18, "setSortDescriptors:", v15);
  objc_msgSend(v18, "setRelationshipKeyPathsForPrefetching:", v17);

  objc_msgSend(v18, "setFetchLimit:", a7);
  v26 = 0;
  objc_msgSend(v16, "executeFetchRequest:error:", v18, &v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v26;
  if (v20)
  {
    v21 = os_log_create("com.apple.notes", "CoreData");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v25 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v28 = v25;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    v33 = 2112;
    v34 = v20;
    v24 = v25;
    _os_log_error_impl(&dword_1DDAA5000, v21, OS_LOG_TYPE_ERROR, "Error fetching %@ (predicate=%@ sortDescriptors=%@): %@", buf, 0x2Au);
LABEL_9:

    goto LABEL_3;
  }
  if (v19)
    goto LABEL_5;
  v21 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v28 = v23;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    v24 = v23;
    _os_log_impl(&dword_1DDAA5000, v21, OS_LOG_TYPE_INFO, "Nil objects array fetching %@ (predicate=%@ sortDescriptors=%@ context=%@)", buf, 0x2Au);
    goto LABEL_9;
  }
LABEL_3:

LABEL_5:
  return v19;
}

- (uint64_t)ic_permanentObjectID
{
  objc_msgSend(a1, "ic_obtainPermanentObjectIDIfNecessary");
  return objc_msgSend(a1, "objectID");
}

- (uint64_t)ic_obtainPermanentObjectIDIfNecessary
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTemporaryID");

  if (!v3)
    return 1;
  objc_msgSend(a1, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v4, "obtainPermanentIDsForObjects:error:", v5, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NSManagedObject(IC) ic_obtainPermanentObjectIDIfNecessary].cold.1();

  }
  return v6;
}

+ (void)ic_existingObjectWithID:()IC context:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, a2, a3, "Unable to find object from objectID: %@", (uint8_t *)&v3);
}

+ (uint64_t)ic_containsFaultingManagedObjects:()IC
{
  return objc_msgSend(a3, "ic_containsObjectPassingTest:", &__block_literal_global_24);
}

+ (id)ic_objectsFromObjectIDs:()IC relationshipKeyPathsForPrefetching:context:
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C97B48];
  v10 = a5;
  v11 = a4;
  objc_msgSend(a1, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIncludesSubentities:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);

  objc_msgSend(v14, "setRelationshipKeyPathsForPrefetching:", v11);
  v20 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v14, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v20;
  if (v17)
  {
    v18 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[NSManagedObject(IC) ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:].cold.1(v8);

  }
  return v16;
}

+ (uint64_t)ic_objectsFromObjectIDs:()IC context:
{
  return objc_msgSend(a1, "ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:", a3, 0, a4);
}

+ (id)ic_objectIDsFromObjects:()IC
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)ic_permanentObjectIDsFromObjects:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v7, "obtainPermanentIDsForObjects:error:", v6, &v13);
    v9 = v13;

    if ((v8 & 1) == 0)
    {
      v10 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[NSManagedObject(IC) ic_permanentObjectIDsFromObjects:].cold.1((uint64_t)v9, v10);

    }
  }
  objc_msgSend(a1, "ic_objectIDsFromObjects:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)ic_postNotificationOnMainThreadWithName:()IC
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke;
  v10[3] = &unk_1EA824F08;
  objc_copyWeak(&v11, &location);
  v10[4] = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v10);

  if (v13[5])
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke_2;
    block[3] = &unk_1EA824F30;
    v8 = v4;
    v9 = &v12;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_destroyWeak(&v11);
  _Block_object_dispose(&v12, 8);

  objc_destroyWeak(&location);
}

- (id)ic_postNotificationOnMainThreadAfterSaveWithName:()IC
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v16 = 0;
  v17 = (id *)&v16;
  v18 = 0x3042000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C978A8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke;
  v12[3] = &unk_1EA824F58;
  objc_copyWeak(&v15, &location);
  v8 = v4;
  v13 = v8;
  v14 = &v16;
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v7, v6, 0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v17 + 5, v9);

  WeakRetained = objc_loadWeakRetained(v17 + 5);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return WeakRetained;
}

+ (uint64_t)ic_objectIDsMatchingPredicate:()IC sortDescriptors:context:
{
  return objc_msgSend(a1, "ic_objectIDsMatchingPredicate:sortDescriptors:fetchLimit:context:", a3, a4, 0, a5);
}

+ (uint64_t)ic_objectIDsMatchingPredicate:()IC sortDescriptors:fetchLimit:context:
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:", a3, a4, 1, 0, a5, a6);
}

+ (uint64_t)ic_objectIDsMatchingPredicate:()IC context:
{
  return objc_msgSend(a1, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", a3, 0, a4);
}

+ (void)ic_enumerateObjectsMatchingPredicate:()IC sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, unsigned __int8 *);
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  unsigned __int8 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  objc_msgSend(a1, "fetchRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v14;
  objc_msgSend(v19, "setPredicate:", v14);
  objc_msgSend(v19, "setResultType:", 0);
  v44 = v15;
  objc_msgSend(v19, "setSortDescriptors:", v15);
  v43 = v16;
  objc_msgSend(v19, "setRelationshipKeyPathsForPrefetching:", v16);
  objc_msgSend(v19, "setReturnsObjectsAsFaults:", 1);
  objc_msgSend(v19, "setFetchBatchSize:", a7);
  v56 = 0;
  v55 = 0;
  v42 = v19;
  objc_msgSend(v17, "executeFetchRequest:error:", v19, &v55);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v55;
  v21 = objc_msgSend(v20, "count");
  v49 = v21;
  if (a7)
    v22 = a7;
  else
    v22 = v21;
  v41 = v20;
  objc_msgSend(v20, "objectEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  if (v22 <= 1)
    v25 = 1;
  else
    v25 = v22;
  v46 = v25;
  v47 = v22;
  do
  {
    if (v24 >= v49)
      break;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v47);
    v27 = v46;
    v50 = v46 + v24;
    while (1)
    {
      v28 = (void *)MEMORY[0x1DF0E07C8]();
      objc_msgSend(v23, "nextObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        break;
      v30 = objc_opt_class();
      ICCheckedDynamicCast(v30, (uint64_t)v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        if (v18)
          v18[2](v18, v31, &v56);
        objc_msgSend(v26, "addObject:", v31);
      }
      v32 = v56;

      if (v32)
        goto LABEL_19;
      ++v24;

      objc_autoreleasePoolPop(v28);
      if (!--v27)
      {
        v24 = v50;
        goto LABEL_20;
      }
    }
    v56 = 1;
LABEL_19:

    objc_autoreleasePoolPop(v28);
LABEL_20:
    if (a8)
      objc_msgSend(v17, "ic_save");
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v33 = v26;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if ((objc_msgSend(v38, "hasChanges") & 1) == 0)
            objc_msgSend(v17, "refreshObject:mergeChanges:", v38, 0);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v35);
    }

    objc_msgSend(v33, "removeAllObjects");
    v39 = v56;

  }
  while (!v39);

}

+ (void)ic_objectsFromObjectIDs:()IC relationshipKeyPathsForPrefetching:context:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_6(&dword_1DDAA5000, v1, v2, "Error fetching objects from (%ld) object IDs: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

+ (void)ic_permanentObjectIDsFromObjects:()IC .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "Error obtaining permanent object ID for objects with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)ic_obtainPermanentObjectIDIfNecessary
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_opt_class();
  OUTLINED_FUNCTION_6();
  v1 = v0;
  OUTLINED_FUNCTION_0_6(&dword_1DDAA5000, v2, v3, "Error obtaining permanent object ID for %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

@end
