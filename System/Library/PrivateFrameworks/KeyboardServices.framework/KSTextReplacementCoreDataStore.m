@implementation KSTextReplacementCoreDataStore

void __67___KSTextReplacementCoreDataStore_queryEntriesWithPredicate_limit___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        +[_KSTextReplacementCoreDataStore localCloudEntryFromMocObject:](_KSTextReplacementCoreDataStore, "localCloudEntryFromMocObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  +[_KSDeviceStateMonitor deviceStateMonitor](_KSDeviceStateMonitor, "deviceStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDataAvailableForClassC");

  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[4];
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = v5;
      v8 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v7;

    }
    else
    {
      objc_msgSend(v4, "persistentStoreCoordinator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "persistentStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 1);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPersistentStoreCoordinator:", v17);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMergePolicy:", *MEMORY[0x24BDBB478]);
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
  else
  {
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(*(_QWORD *)(v9 + 8) + 40);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke_2;
      v18[3] = &unk_24E205748;
      v18[4] = v9;
      objc_msgSend(v10, "performBlockAndWait:", v18);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  id v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[6];
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
    +[_KSDeviceStateMonitor deviceStateMonitor](_KSDeviceStateMonitor, "deviceStateMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDataAvailableForClassC");

    if ((v5 & 1) != 0)
      goto LABEL_7;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;
  }
  else
  {
    objc_msgSend(v2, "managedObjectModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v7);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }

LABEL_7:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "persistentStores");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "directoryPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("TextReplacements.db"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[_KSUtilities createFileIfDoesNotExist:](_KSUtilities, "createFileIfDoesNotExist:", v14);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDBB488];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, v18, v19, *MEMORY[0x24BDBB420], 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v22 = *MEMORY[0x24BDBB580];
    v57 = 0;
    objc_msgSend(v21, "addPersistentStoreWithType:configuration:URL:options:error:", v22, 0, v15, v20, &v57);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v57;
    v25 = v24;
    if (!v23)
    {
      objc_msgSend(v24, "domain");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23 == (id)*MEMORY[0x24BDBB568])
      {
        v26 = objc_msgSend(v25, "code");

        if (v26 != 11)
          goto LABEL_11;
        KSCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke_cold_1();

        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v56 = v25;
        v29 = objc_msgSend(v28, "destroyPersistentStoreAtURL:withType:options:error:", v15, v22, 0, &v56);
        v30 = v56;

        if (!v29)
        {
          v25 = v30;
          goto LABEL_11;
        }
        v46 = v20;
        v47 = v15;
        v48 = v14;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "directoryPath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v30;
        objc_msgSend(v31, "contentsOfDirectoryAtPath:error:", v32, &v55);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v55;

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v23 = v33;
        v34 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        v45 = v22;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v52;
          do
          {
            v37 = 0;
            v38 = v25;
            do
            {
              if (*(_QWORD *)v52 != v36)
                objc_enumerationMutation(v23);
              v39 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v37);
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "directoryPath");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringByAppendingPathComponent:", v39);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v38;
              objc_msgSend(v40, "removeItemAtPath:error:", v42, &v50);
              v25 = v50;

              ++v37;
              v38 = v25;
            }
            while (v35 != v37);
            v35 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
          }
          while (v35);
        }

        v14 = v48;
        +[_KSUtilities createFileIfDoesNotExist:](_KSUtilities, "createFileIfDoesNotExist:", v48);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v48, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v49 = 0;
        v20 = v46;
        v44 = (id)objc_msgSend(v43, "addPersistentStoreWithType:configuration:URL:options:error:", v45, 0, v15, v46, &v49);
      }
    }

LABEL_11:
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __71___KSTextReplacementCoreDataStore_syncStateEntryShouldSave_fetchToken___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20[7];

  v20[6] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v3 = (void *)MEMORY[0x24BDBB658];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", CFSTR("TRCloudKitSyncState"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v6);

  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20[0];
  objc_msgSend(v9, "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v14 = (void *)MEMORY[0x24BDBB658];
    v15 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("TRCloudKitSyncState"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFetchChangeToken:", *(_QWORD *)(a1 + 32));

}

void __74___KSTextReplacementCoreDataStore_queryManagedObjectsWithPredicate_limit___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v3 = (void *)MEMORY[0x24BDBB658];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", CFSTR("TextReplacementEntry"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v6);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v8);

  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setFetchLimit:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "setFetchBatchSize:", 500);
  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v2, v15);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v15[0];
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v11;

}

void __53___KSTextReplacementCoreDataStore_didMakeInitialPull__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "syncStateEntryShouldSave:fetchToken:", 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchChangeToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

void __42___KSTextReplacementCoreDataStore_cleanup__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v4 = 0;
    objc_msgSend(v2, "save:", &v4);
    v3 = v4;
    objc_msgSend(*(id *)(a1 + 32), "reset");

  }
}

uint64_t __55___KSTextReplacementCoreDataStore_managedObjectContext__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "reset");
}

uint64_t __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v3 + 40);
    objc_msgSend(v2, "save:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      KSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke_cold_1(a1 + 40);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __77___KSTextReplacementCoreDataStore_fetchAndMergeTextReplacementEntry_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "fetchTextReplacementEntry:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("TextReplacementEntry"), *(_QWORD *)(a1 + 40));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    objc_msgSend(*(id *)(a1 + 32), "cloudID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setUniqueName:", v21);
LABEL_18:

    goto LABEL_19;
  }
  v5 = v4;
  objc_msgSend(v3, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (v5 != 1)
  {
    for (i = 1; i != v5; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "cloudID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(void **)(v14 + 40);
        v16 = v10;
        v17 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v16;
        v18 = v15;

        objc_msgSend(v18, "setWasDeleted:", 1);
      }
      objc_msgSend(v10, "setWasDeleted:", 1);

    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "needsSaveToCloud") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "wasDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setUniqueName:", v19);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_19;
  v21 = (void *)v20;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_18;
  v23 = (void *)v22;
  v24 = objc_msgSend(*(id *)(a1 + 32), "wasDeleted");

  if ((v24 & 1) != 0)
  {
LABEL_19:
    v35 = 1;
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeIntervalSinceDate:", v26);
  v28 = v27;

  if (objc_msgSend(*(id *)(a1 + 32), "needsSaveToCloud") && v28 < 2.0)
  {
    KSCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uniqueName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 136315650;
      v52 = "-[_KSTextReplacementCoreDataStore fetchAndMergeTextReplacementEntry:context:]_block_invoke";
      v53 = 2112;
      v54 = v30;
      v55 = 2112;
      v56 = v31;
      _os_log_impl(&dword_21DFEB000, v29, OS_LOG_TYPE_INFO, "%s  not saving as the entry is older than or same as existing record, entryToSaveID: %@, existing record: %@", (uint8_t *)&v51, 0x20u);

    }
    goto LABEL_35;
  }
  v35 = v28 > 2.0;
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "phrase");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
    objc_msgSend(*(id *)(a1 + 32), "setPhrase:", &stru_24E206F98);
  objc_msgSend(*(id *)(a1 + 32), "shortcut");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37
    || (v38 = (void *)v37,
        objc_msgSend(*(id *)(a1 + 32), "shortcut"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v40 = objc_msgSend(v39, "isEqualToString:", &stru_24E206F98),
        v39,
        v38,
        v40))
  {
    objc_msgSend(*(id *)(a1 + 32), "phrase");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setShortcut:", v41);

  }
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTimestamp:", v43);

  }
  objc_msgSend(*(id *)(a1 + 32), "shortcut");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setShortcut:", v44);

  objc_msgSend(*(id *)(a1 + 32), "phrase");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPhrase:", v45);

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTimestamp:", v46);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setNeedsSaveToCloud:", objc_msgSend(*(id *)(a1 + 32), "needsSaveToCloud"));
  if ((objc_msgSend(*(id *)(a1 + 32), "needsSaveToCloud") & 1) != 0
    || ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "wasDeleted") ^ 1 | v35) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setWasDeleted:", objc_msgSend(*(id *)(a1 + 32), "wasDeleted"));
  }
  else
  {
    KSCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v51 = 136315138;
      v52 = "-[_KSTextReplacementCoreDataStore fetchAndMergeTextReplacementEntry:context:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v47, OS_LOG_TYPE_INFO, "%s  not clearing the deleted flag", (uint8_t *)&v51, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uniqueName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cloudID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "isEqualToString:", v49);

  if (v50)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudData");
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRemoteRecordInfo:", v29);
LABEL_35:

  }
}

void __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v3 = (void *)MEMORY[0x24BDBB658];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", CFSTR("TextReplacementEntry"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v7);

  objc_msgSend(v2, "setIncludesSubentities:", 0);
  objc_msgSend(v2, "setIncludesPendingChanges:", 1);
  objc_msgSend(v2, "setIncludesPropertyValues:", 0);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (needsSaveToCloud == TRUE AND wasDeleted == FALSE)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("uniqueName == %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD14C0];
    v21[0] = v9;
    v21[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPredicate:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("uniqueName == %@"), *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPredicate:", v13);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v2);
  objc_msgSend(v14, "setResultType:", 2);
  v15 = objc_loadWeakRetained(v4);
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v16, "executeRequest:error:", v14, &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v20;

  if (v18)
  {
    KSCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_cold_1(v18);

  }
}

void __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_55(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

void __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;

  v2 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v3 = (void *)MEMORY[0x24BDBB658];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v8);

  objc_msgSend(v2, "setIncludesSubentities:", 1);
  objc_msgSend(v2, "setIncludesPendingChanges:", 1);
  objc_msgSend(v2, "setIncludesPropertyValues:", 0);
  objc_msgSend(v2, "setFetchOffset:", *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "setPredicate:");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v2);
  objc_msgSend(v9, "setResultType:", 2);
  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = (id)objc_msgSend(v11, "executeRequest:error:", v9, &v17);
  v13 = v17;

  if (v13)
  {
    KSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke_cold_1(v13);

  }
  v15 = objc_loadWeakRetained(v5);
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reset");

}

void __67___KSTextReplacementCoreDataStore_textReplacementEntriesWithLimit___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v3 = (void *)MEMORY[0x24BDBB658];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", CFSTR("TextReplacementEntry"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v5);

  objc_msgSend(v2, "setFetchLimit:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v2, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(a1 + 40);
        +[_KSTextReplacementCoreDataStore localCloudEntryFromMocObject:](_KSTextReplacementCoreDataStore, "localCloudEntryFromMocObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v13);
  }

}

void __61___KSTextReplacementCoreDataStore_countEntriesWithPredicate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBB678]);
  v3 = (void *)MEMORY[0x24BDBB658];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", CFSTR("TextReplacementEntry"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v6);

  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  v9 = objc_msgSend(v8, "countForFetchRequest:error:", v2, v11);
  v10 = v11[0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

}

void __50___KSTextReplacementCoreDataStore_getCKFetchToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "syncStateEntryShouldSave:fetchToken:", 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchChangeToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61___KSTextReplacementCoreDataStore_persistentStoreCoordinator__block_invoke_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21DFEB000, v0, OS_LOG_TYPE_ERROR, "%s  ERROR! Could not access coredata store, %@", (uint8_t *)v1, 0x16u);
}

void __64___KSTextReplacementCoreDataStore_recordTextReplacementEntries___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21DFEB000, v2, v3, "%s  >>> !!!ERROR: failed to save records with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __101___KSTextReplacementCoreDataStore_deleteTextReplacementsFromLocalStoreWithNames_excludeSavesToCloud___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21DFEB000, v2, v3, "%s  ERROR! Failed to delete: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __71___KSTextReplacementCoreDataStore_deleteTextReplacementsWithPredicate___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21DFEB000, v2, v3, "%s  ERROR! Failed to delete: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

void __74___KSTextReplacementCoreDataStore_queryManagedObjectsWithPredicate_limit___block_invoke_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  uint8_t *v4;
  NSObject *v5;

  *a3 = 136315650;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_2(&dword_21DFEB000, "%s  Querying records failed with error : %@, exception %@", v4, v5);

}

void __71___KSTextReplacementCoreDataStore_syncStateEntryShouldSave_fetchToken___block_invoke_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  uint8_t *v4;
  NSObject *v5;

  *a3 = 136315650;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_2(&dword_21DFEB000, "%s  Querying records failed with error : %@, exception %@", v4, v5);

}

@end
