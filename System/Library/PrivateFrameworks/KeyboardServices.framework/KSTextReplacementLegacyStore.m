@implementation KSTextReplacementLegacyStore

void __49___KSTextReplacementLegacyStore_initWithBaseURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.keyboardServices.legacyStore.workQueue", v2);
  v4 = (void *)initWithBaseURL__cdWorkQueueShared;
  initWithBaseURL__cdWorkQueueShared = (uint64_t)v3;

  v5 = objc_alloc(MEMORY[0x24BDBB6B0]);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "initWithContentsOfURL:", v6);

  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v9);
  v8 = (void *)initWithBaseURL__pscShared;
  initWithBaseURL__pscShared = v7;

}

void __55___KSTextReplacementLegacyStore_minimumUptimeRemaining__block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreDidLoadTime");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 180.0 - fabs(v2);

}

void __40___KSTextReplacementLegacyStore_cleanup__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40___KSTextReplacementLegacyStore_cleanup__block_invoke_2;
  v6[3] = &unk_24E204790;
  v3 = v2;
  v7 = v3;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  objc_msgSend(*(id *)(a1 + 32), "endMinimumUptime");
  objc_msgSend(*(id *)(a1 + 32), "unloadPersistentStore");
  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    KSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[_KSTextReplacementLegacyStore cleanup]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  Invalidaitng bird connection", buf, 0xCu);
    }

    softLinkBRDaemonConnectionInvalidate();
  }

}

void __40___KSTextReplacementLegacyStore_cleanup__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = 0;
    objc_msgSend(v2, "save:", &v3);

  }
}

uint64_t __63___KSTextReplacementLegacyStore_loadPersistentStoreIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanup");
}

uint64_t __53___KSTextReplacementLegacyStore_requestMinimumUptime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endMinimumUptime");
}

uint64_t __65___KSTextReplacementLegacyStore_importSampleShortcutsIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id WeakRetained;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[_KSTextReplacementLegacyStore importSampleShortcutsIfNecessary]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  >>> finished importing sample shortcut", (uint8_t *)&v7, 0xCu);
  }

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectAndCleanDuplicatesWithContext:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPendingSampleShortcutImport:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("kDidInsertSampleShortcutForPeer"));
}

intptr_t __52___KSTextReplacementLegacyStore_prepareForMigration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "loadPersistentStoreIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "runMaintenanceIncludeLocalVariations:", 1);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __80___KSTextReplacementLegacyStore_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id *location;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    location = v2;
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "loadPersistentStoreIfNecessary");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          +[_KSTextReplacementHelper transactionFromTextReplacementEntry:forDelete:](_KSTextReplacementHelper, "transactionFromTextReplacementEntry:forDelete:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), 0, location);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(a1 + 48);
          objc_msgSend(v12, "valueToInsert");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "insertEntryWithValue:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = *(id *)(a1 + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          +[_KSTextReplacementHelper transactionFromTextReplacementEntry:forDelete:](_KSTextReplacementHelper, "transactionFromTextReplacementEntry:forDelete:", v20, 1, location);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "_deleteTransaction:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            +[_KSTextReplacementHelper errorWithCode:forEntry:](_KSTextReplacementHelper, "errorWithCode:forEntry:", -2, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v23);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v17);
    }

    v24 = objc_loadWeakRetained(location);
    objc_msgSend(v24, "setShouldUpdateTheCache:", 1);

    v25 = objc_loadWeakRetained(location);
    LOBYTE(v24) = objc_msgSend(v25, "save");

    if ((v24 & 1) != 0)
    {
      v26 = (void *)v32;
      +[_KSTextReplacementHelper multipleAddErrors:removeErrors:](_KSTextReplacementHelper, "multipleAddErrors:removeErrors:", v32, v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_KSTextReplacementHelper errorWithCode:failedAdds:failedDeletes:](_KSTextReplacementHelper, "errorWithCode:failedAdds:failedDeletes:", -2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      KSCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v32;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[_KSTextReplacementLegacyStore addEntries:removeEntries:withCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_21DFEB000, v29, OS_LOG_TYPE_INFO, "%s  Failed to save to coredata store", buf, 0xCu);
      }

    }
  }
  else
  {
    KSCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[_KSTextReplacementLegacyStore addEntries:removeEntries:withCompletionHandler:]_block_invoke";
      v45 = 1024;
      v46 = -2;
      _os_log_impl(&dword_21DFEB000, v28, OS_LOG_TYPE_INFO, "%s  Replying with error = %i", buf, 0x12u);
    }

    +[_KSTextReplacementHelper errorWithCode:failedAdds:failedDeletes:](_KSTextReplacementHelper, "errorWithCode:failedAdds:failedDeletes:", -2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", location);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __65___KSTextReplacementLegacyStore_requestSync_withCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((*(_QWORD *)(a1 + 48) | 4) == 4)
  {
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[_KSTextReplacementLegacyStore requestSync:withCompletionBlock:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  sync request due to maintainence / client, loading ubiquity", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "loadPersistentStoreIfNecessary");
    if (*(_QWORD *)(a1 + 48) == 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "runLegacyMigration");
      objc_msgSend(*(id *)(a1 + 32), "runMaintenanceIncludeLocalVariations:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateTheCache:", 1);
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "loadPersistentStoreIfNecessary");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "removeEntriesWithPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke_2;
  v7[3] = &unk_24E204790;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateTheCache:", 1);

}

uint64_t __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v8 = *(_QWORD *)(a1 + 48);
  v7 = a1 + 48;
  v9 = *(void **)(v7 - 8);
  v10 = *(_QWORD *)(v8 + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "save:", &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 40))
  {
    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke_cold_1(v7, v11);

  }
}

void __55___KSTextReplacementLegacyStore_textReplacementEntries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("timestamp"), 1, sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entriesUsingSortDescriptors:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __67___KSTextReplacementLegacyStore_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77___KSTextReplacementLegacyStore_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "ubiquityStoreLoaded") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "shouldUpdateTheCache") & 1) != 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "predicateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("TRUEPREDICATE")) & 1) == 0)
    goto LABEL_7;
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldDisableCaching");

  if ((v3 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "loadPersistentStoreIfNecessary");
    v7 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "entriesMatchingPredicate:sortDescriptors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textReplacementEntriesFromManagedObjects:", v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    KSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[_KSTextReplacementLegacyStore queryTextReplacementsWithPredicate:callback:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, "%s  read entries from ubiquity store", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "shouldUpdateTheCache"))
      objc_msgSend(*(id *)(a1 + 32), "scheduleCacheUpdate:", v2);
    goto LABEL_12;
  }
  v4 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v4, "entriesFromCache:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateTheCache:", 1);

LABEL_7:
    goto LABEL_8;
  }
  KSCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[_KSTextReplacementLegacyStore queryTextReplacementsWithPredicate:callback:]_block_invoke";
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_21DFEB000, v10, OS_LOG_TYPE_INFO, "%s  read entries from cache: \n %@", buf, 0x16u);

  }
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __53___KSTextReplacementLegacyStore_scheduleCacheUpdate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "writeEntriesToCache:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateTheCache:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDidScheduleCacheUpdate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "save");
    return objc_msgSend(*(id *)(a1 + 32), "unloadPersistentStore");
  }
  return result;
}

void __56___KSTextReplacementLegacyStore_iCloudAccountDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[_KSTextReplacementLegacyStore iCloudAccountDidChange:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  received icloud account change notif", buf, 0xCu);
  }

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("UserDictionaryUbiquityIdentityTokenCurrent"), CFSTR("com.apple.Preferences"));
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ubiquityIdentityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[_KSTextReplacementLegacyStore iCloudAccountDidChange:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v7, OS_LOG_TYPE_INFO, "%s  detected account change, invalidating cache", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cacheFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v8, "removeItemAtPath:error:", v9, &v11);
    v10 = v11;

  }
}

void __54___KSTextReplacementLegacyStore_insertEntryWithValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("UserDictionaryEntry"), *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "phrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v2, CFSTR("phrase"));

  objc_msgSend(*(id *)(a1 + 40), "shortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v3, CFSTR("shortcut"));

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("timestamp"));
}

void __37___KSTextReplacementLegacyStore_save__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v6 = 0;
    v3 = objc_msgSend(v2, "save:", &v6);
    v4 = v6;
    v5 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "reset");
    }
    else
    {
      NSLog(CFSTR("Error writing to user dictionary: %@"), v4);
      objc_msgSend(*(id *)(a1 + 32), "rollback");
    }

  }
}

void __74___KSTextReplacementLegacyStore_entriesMatchingPredicate_sortDescriptors___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = objc_alloc(MEMORY[0x24BDBB678]);
  objc_msgSend(*(id *)(a1 + 32), "entityDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntityName:", v4);

  objc_msgSend(v5, "setFetchLimit:", 10000);
  objc_msgSend(v5, "setFetchBatchSize:", 1000);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v5, "setPredicate:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v5, "setSortDescriptors:");
  v6 = *(void **)(a1 + 56);
  v11 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v5, &v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

}

void __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    NSLog(CFSTR("Persistent store imported ubiquitous content changes"));
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBB430]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setImportedSinceMaintenance:", objc_msgSend(*(id *)(a1 + 32), "importedSinceMaintenance") + objc_msgSend(v4, "count"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "importedSinceMaintenance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(CFSTR("UserDictionaryImportedSinceMaintenance"), v5, CFSTR("com.apple.Preferences"));

      CFPreferencesAppSynchronize(CFSTR("com.apple.Preferences"));
    }
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke_2;
    v15[3] = &unk_24E204790;
    v7 = v6;
    v16 = v7;
    objc_msgSend(v7, "performBlockAndWait:", v15);
    objc_msgSend(*(id *)(a1 + 32), "performMaintenanceIfNecessary");
    objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateTheCache:", 1);
    KSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "ubiquityStoreLoadStartTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceNow");
      objc_msgSend(v9, "numberWithDouble:", -v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[_KSTextReplacementLegacyStore persistentStoreDidImportUbiquitousContentChanges:]_block_invoke";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_21DFEB000, v8, OS_LOG_TYPE_INFO, "%s  time to import changes since PS load request: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportUbiquitousChanges"), 0);

  }
}

uint64_t __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id obj;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v22 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", CFSTR("shortcut"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", CFSTR("phrase"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_3;
        v14[3] = &unk_24E205B00;
        objc_copyWeak(&v20, (id *)(a1 + 64));
        v9 = v6;
        v15 = v9;
        v10 = v7;
        v16 = v10;
        v17 = *(id *)(a1 + 32);
        v11 = *(id *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 56);
        v18 = v11;
        v19 = v12;
        objc_msgSend(v8, "performBlockAndWait:", v14);

        objc_destroyWeak(&v20);
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v2);
  }

}

void __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  int v6;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = objc_msgSend(WeakRetained, "_shouldMergeShortcut:phrase:intoContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    v6 = objc_msgSend(v5, "_mergeShortcut:phrase:fromContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    if (v6)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
}

uint64_t __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v3 + 40);
    v4 = objc_msgSend(v2, "save:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
  }
  else
  {
    v4 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "reset");
  NSLog(CFSTR("Error saving after shortcut migration: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "rollback");
}

uint64_t __90___KSTextReplacementLegacyStore_mergeEntriesForUbiquityIdentityChangeFromURL_firstDelete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rollback");
}

uint64_t __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __69___KSTextReplacementLegacyStore_detectAndCleanDuplicatesWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id WeakRetained;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id obj;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v18);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", CFSTR("count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if (v14 >= 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          objc_msgSend(v12, "objectForKey:", CFSTR("shortcut"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("phrase"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
          objc_msgSend(WeakRetained, "_deleteDuplicatesOfShortcut:phrase:count:withContext:", v15, v16, v14, *(_QWORD *)(a1 + 32));

          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        }
      }
      v9 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v9);
  }

  NSLog(CFSTR("Deduplication completed (number of duplicated shortcuts = %ld)"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
}

void __55___KSTextReplacementLegacyStore_basePersistentStoreURL__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDBCF48];
  +[_KSUtilities keyboardDirectory](_KSUtilities, "keyboardDirectory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("CloudUserDictionary.sqlite"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)basePersistentStoreURL_baseURL;
  basePersistentStoreURL_baseURL = v2;

}

void __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresWillChange:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  Suspending user dictionary due to impending account change.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke_284;
  v6[3] = &unk_24E204790;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v6);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v5);

}

uint64_t __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke_284(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __75___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setForceMaintenance:", 1);
  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "runMaintenanceIncludeLocalVariations:", 0);
  else
    objc_msgSend(v6, "loadPersistentStoreIfNecessary");
  KSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]_block_invoke";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_21DFEB000, v7, OS_LOG_TYPE_INFO, "%s  >>> current legacy store: %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("_KSTRLegacyStoreDidImportChangesNotification"), 0);

  KSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "ubiquityStoreLoadStartTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceNow");
    objc_msgSend(v10, "numberWithDouble:", -v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]_block_invoke";
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, "%s  time since PS load request: %@", (uint8_t *)&v14, 0x16u);

  }
}

void __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = 136315394;
  v4 = "-[_KSTextReplacementLegacyStore removeEntriesWithPredicate:]_block_invoke";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_21DFEB000, a2, OS_LOG_TYPE_ERROR, "%s  ERROR!!! Failed to remove entrtries with error: %@", (uint8_t *)&v3, 0x16u);
}

@end
