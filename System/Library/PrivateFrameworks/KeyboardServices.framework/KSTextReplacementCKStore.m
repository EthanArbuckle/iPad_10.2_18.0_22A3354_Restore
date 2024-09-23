@implementation KSTextReplacementCKStore

void __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("KSSampleShortcutWasImported_CK")) & 1) == 0)
  {
    +[_KSTextReplacementHelper sampleShortcut](_KSTextReplacementHelper, "sampleShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke_2;
    v8[3] = &unk_24E204E88;
    v9 = v4;
    objc_msgSend(v6, "addEntries:removeEntries:withCompletionHandler:", v7, 0, v8);

  }
}

void __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[_KSTextReplacementCKStore queryCloudIfFirstPullOrAccountChanged:]_block_invoke_2";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  >>> Finished pulling remote entries for the first fetch", (uint8_t *)&v3, 0xCu);
  }

  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_2);
}

void __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  _QWORD v7[5];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "coreDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "didMakeInitialPull");

  if ((queryCloudIfFirstPullOrAccountChanged__pendingSync & 1) == 0 && !v5 || *(_BYTE *)(a1 + 48))
  {
    queryCloudIfFirstPullOrAccountChanged__pendingSync = 1;
    v6 = objc_loadWeakRetained(v2);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke_2;
    v7[3] = &unk_24E204978;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "requestSync:withCompletionBlock:", 4, v7);

  }
}

void __63___KSTextReplacementCKStore_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("wasDeleted == %@ || wasDeleted == nil"), MEMORY[0x24BDBD1C0]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryEntriesWithPredicate:limit:", v6, 10000);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __46___KSTextReplacementCKStore_accountDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[_KSTextReplacementCKStore accountDidChange:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_DEFAULT, "%s  >>> User has logged out of the account, removing local entries", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllEntries");
    v3 = objc_alloc(MEMORY[0x24BDBCF50]);
    +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithSuiteName:", v4);

    objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("kDidMigrateToUUIDRecordName"));
    objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("KSSampleShortcutWasImported_CK"));
    objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("KSDidMigrateToCloudKitOnCloud"));
    objc_msgSend(*(id *)(a1 + 32), "importSampleShortcutsIfNecessary");
    objc_msgSend(*(id *)(a1 + 32), "setCkMigrationStatusOnCloud:", 0);

  }
  else if (*(_QWORD *)(a1 + 40) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryCloudIfFirstPullOrAccountChanged:", 0);
  }
}

void __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke_43()
{
  queryCloudIfFirstPullOrAccountChanged__pendingSync = 0;
}

uint64_t __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", 1, CFSTR("KSSampleShortcutWasImported_CK"));
}

void __45___KSTextReplacementCKStore_pushAllLocalData__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[_KSTextReplacementCKStore pushAllLocalData]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v0, OS_LOG_TYPE_INFO, "%s  marked all local entries to be saved to cloud", (uint8_t *)&v1, 0xCu);
  }

}

void __76___KSTextReplacementCKStore_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "markDeletesForTextReplacementEntries:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "recordTextReplacementEntries:", *(_QWORD *)(a1 + 48));

  if ((v3 & 1) == 0)
  {
    v6 = *(id *)(a1 + 40);
    if ((v5 & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = 0;
  if ((v5 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v7 = *(id *)(a1 + 48);
LABEL_6:
  v10 = v7;
  +[_KSTextReplacementHelper errorWithCode:failedAdds:failedDeletes:](_KSTextReplacementHelper, "errorWithCode:failedAdds:failedDeletes:", -2, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("_KSTRCKStoreDidReceiveChangesNotification"), 0);

}

void __45___KSTextReplacementCKStore_removeAllEntries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteTextReplacementsWithPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveCKFetchToken:", 0);

}

uint64_t __67___KSTextReplacementCKStore_removeAllEntriesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteTextReplacementsWithPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveCKFetchToken:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51___KSTextReplacementCKStore_textReplacementEntries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryEntriesWithPredicate:limit:", *(_QWORD *)(a1 + 40), 10000);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __73___KSTextReplacementCKStore_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD14C0];
  v3 = *(_QWORD *)(a1 + 40);
  v10[0] = *(_QWORD *)(a1 + 32);
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "coreDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryEntriesWithPredicate:limit:", v5, 10000);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __56___KSTextReplacementCKStore_pushMigrationStatusToCloud___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  id v6;

  v6 = a4;
  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(v6, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("!!!ERROR, failed to write migration status to cloud: %@"), v5);

  }
}

uint64_t __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSyncCount:success:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "countLocalEntriesToBeSynced"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_3;
    v8[3] = &unk_24E205428;
    v8[4] = v2;
    v7 = *(_OWORD *)(a1 + 40);
    v4 = (id)v7;
    v9 = v7;
    objc_msgSend(v2, "_requestSync:completionBlock:", v3, v8);

  }
  else
  {
    KSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[_KSTextReplacementCKStore requestSync:withCompletionBlock:]_block_invoke_2";
      _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  Nothing to sync", buf, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

uint64_t __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSyncCount:success:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_69(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSyncCount:success:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _BOOL8 v8;

  v2 = (void *)MEMORY[0x2207A8B6C]();
  v3 = a1[6] != 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_2;
  v5[3] = &unk_24E2054A0;
  v4 = (void *)a1[5];
  v6 = (id)a1[4];
  v8 = v3;
  v7 = v4;
  objc_msgSend(v6, "pullRemoteDataWithPriority:completionHandler:", v3, v5);

  objc_autoreleasePoolPop(v2);
}

void __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_3;
  v5[3] = &unk_24E205478;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v3, "pushLocalChangesWithPriority:completionHandler:", v4, v5);

}

uint64_t __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (*(_BYTE *)(a1 + 40))
      a2 = a2;
    else
      a2 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  ArraySlicer *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *context;
  void *v17;
  void *v18;
  ArraySlicer *v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD *v28;
  __int128 *p_buf;
  _QWORD v30[3];
  char v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x2207A8B6C]();
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[_KSTextReplacementCKStore pushLocalChangesWithPriority:completionHandler:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  pushing local changes", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queryUpdatedLocalEntries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queryDeletedEntries");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count") || objc_msgSend(v17, "count", context))
  {
    v19 = -[ArraySlicer initWithArray:sliceSize:]([ArraySlicer alloc], "initWithArray:sliceSize:", v18, 400);
    v3 = -[ArraySlicer initWithArray:sliceSize:]([ArraySlicer alloc], "initWithArray:sliceSize:", v17, 400);
    v4 = dispatch_group_create();
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 1;
    -[ArraySlicer nextSlice](v19, "nextSlice");
    v5 = objc_claimAutoreleasedReturnValue();
    -[ArraySlicer nextSlice](v3, "nextSlice");
    v6 = objc_claimAutoreleasedReturnValue();
    while (v5 | v6)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__0;
      v35 = __Block_byref_object_dispose__0;
      v36 = (id)os_transaction_create();
      dispatch_group_enter(v4);
      objc_msgSend(*(id *)(a1 + 32), "cloudKitManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_72;
      v23[3] = &unk_24E2054C8;
      v9 = (id)v5;
      v24 = v9;
      v10 = (id)v6;
      v11 = *(_QWORD *)(a1 + 32);
      v25 = v10;
      v26 = v11;
      v28 = v30;
      v27 = v4;
      p_buf = &buf;
      objc_msgSend(v7, "updateRecords:deleteRecordIDs:withPriority:completionHandler:", v9, v10, v8, v23);

      _Block_object_dispose(&buf, 8);
      -[ArraySlicer nextSlice](v19, "nextSlice");
      v5 = objc_claimAutoreleasedReturnValue();

      -[ArraySlicer nextSlice](v3, "nextSlice");
      v6 = objc_claimAutoreleasedReturnValue();

    }
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_3;
    block[3] = &unk_24E2054F0;
    v21 = v12;
    v22 = v30;
    dispatch_group_notify(v4, v13, block);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    KSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[_KSTextReplacementCKStore pushLocalChangesWithPriority:completionHandler:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v14, OS_LOG_TYPE_INFO, "%s  no entries to push", (uint8_t *)&buf, 0xCu);
    }

    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, 1);
  }

  objc_autoreleasePoolPop(context);
}

void __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_72(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  unsigned int v48;
  id v49;
  uint64_t v50;
  _QWORD block[5];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x2207A8B6C]();
  v10 = (void *)v9;
  if ((_DWORD)a2)
  {
    v46 = (void *)v9;
    v47 = v8;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v49 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v63 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "recordID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "recordName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v14);
    }
    v48 = a2;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v50 = a1;
    v20 = *(id *)(a1 + 32);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v59 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_msgSend(v25, "recordID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "recordName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v11, "containsObject:", v27);

          if ((v28 & 1) == 0)
            objc_msgSend(v19, "addObject:", v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v22);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v30 = *(id *)(v50 + 40);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v55 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          objc_msgSend(v35, "recordName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v11, "containsObject:", v36);

          if ((v37 & 1) == 0)
          {
            objc_msgSend(v35, "recordName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v38);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v32);
    }

    a1 = v50;
    objc_msgSend(*(id *)(v50 + 48), "localEntriesFromCloudEntries:", v19);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(v50 + 48);
    v41 = *(NSObject **)(v40 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_2;
    block[3] = &unk_24E204E10;
    block[4] = v40;
    v52 = v39;
    v53 = v29;
    v42 = v29;
    v43 = v39;
    dispatch_async(v41, block);
    a2 = v48;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v50 + 64) + 8) + 24) = v48;

    v7 = v49;
    v10 = v46;
    v8 = v47;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  v44 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v45 = *(void **)(v44 + 40);
  *(_QWORD *)(v44 + 40) = 0;

  +[_KSTextReplacementHelper logAggdValueForSyncIsPull:success:](_KSTextReplacementHelper, "logAggdValueForSyncIsPull:success:", 0, a2);
  objc_autoreleasePoolPop(v10);

}

void __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordTextReplacementEntries:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTextReplacementsFromLocalStoreWithNames:excludeSavesToCloud:", *(_QWORD *)(a1 + 48), 0);

}

uint64_t __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 136315138;
      v4 = "-[_KSTextReplacementCKStore pushLocalChangesWithPriority:completionHandler:]_block_invoke_3";
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  completed uploading local changes", (uint8_t *)&v3, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "setNumPullRequests:", objc_msgSend(*(id *)(a1 + 32), "numPullRequests") + 1);
  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCKFetchToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_2;
  v8[3] = &unk_24E204D98;
  v8[1] = 3221225472;
  v11 = *(_QWORD *)(a1 + 48);
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, v8);

}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  Pulling remote data", buf, 0xCu);
  }

  v3 = (void *)MEMORY[0x2207A8B6C]();
  objc_msgSend(*(id *)(a1 + 32), "cloudKitManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_75;
  v8[3] = &unk_24E205588;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v9 = v6;
  objc_msgSend(v4, "fetchRecordsWithPriority:changeToken:completionHandler:", v7, v5, v8);

  objc_autoreleasePoolPop(v3);
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_75(uint64_t a1, void *a2, void *a3, void *a4, char a5, char a6, char a7)
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v26 = a3;
  v13 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__0;
  v40[4] = __Block_byref_object_dispose__0;
  v41 = (id)os_transaction_create();
  v14 = (void *)objc_msgSend(v27, "copy");
  v15 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(*(id *)(a1 + 32), "localEntriesFromCloudEntries:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  KSCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke";
    v44 = 2112;
    v45 = v16;
    v46 = 2112;
    v47 = v15;
    _os_log_impl(&dword_21DFEB000, v17, OS_LOG_TYPE_INFO, "%s  >>> storing pulled records locally; added entries: %@, deleted: %@",
      buf,
      0x20u);
  }

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(a1 + 40);
  v20 = *(NSObject **)(v18 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_77;
  block[3] = &unk_24E205560;
  block[1] = 3221225472;
  v29 = v16;
  v30 = v18;
  v31 = v15;
  v32 = v13;
  v37 = a6;
  v38 = a5;
  v21 = *(_QWORD *)(a1 + 48);
  v33 = v14;
  v36 = v21;
  v39 = a7;
  v34 = v19;
  v35 = v40;
  v22 = v14;
  v23 = v13;
  v24 = v15;
  v25 = v16;
  dispatch_async(v20, block);

  _Block_object_dispose(v40, 8);
}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_77(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  __int16 v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "coreDataStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "recordTextReplacementEntries:", *(_QWORD *)(a1 + 32));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "coreDataStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteTextReplacementsFromLocalStoreWithNames:excludeSavesToCloud:", *(_QWORD *)(a1 + 48), 1);

  }
  objc_msgSend(*(id *)(a1 + 40), "coreDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveCKFetchToken:", *(_QWORD *)(a1 + 56));

  if (objc_msgSend(*(id *)(a1 + 64), "count") || objc_msgSend(*(id *)(a1 + 48), "count"))
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_79);
  KSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  completed saving pulled records", buf, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v6 + 8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_80;
  v11[3] = &unk_24E205538;
  v14 = *(_WORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 88);
  v11[4] = v6;
  v13 = v8;
  v12 = *(id *)(a1 + 72);
  v15 = *(_BYTE *)(a1 + 98);
  dispatch_async(v7, v11);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_2_78()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_KSTRCKStoreDidReceiveChangesNotification"), 0);

}

uint64_t __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke_80(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(result + 56))
  {
    v1 = result;
    if (*(_BYTE *)(result + 57))
    {
      KSCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = 136315138;
        v4 = "-[_KSTextReplacementCKStore pullRemoteDataWithPriority:completionHandler:]_block_invoke";
        _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  morecoming from cloudkit, pulling again", (uint8_t *)&v3, 0xCu);
      }

      return objc_msgSend(*(id *)(v1 + 32), "pullRemoteDataWithPriority:completionHandler:", *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 40));
    }
    else
    {
      +[_KSTextReplacementHelper logAggdValueForSyncIsPull:success:](_KSTextReplacementHelper, "logAggdValueForSyncIsPull:success:", 1, *(unsigned __int8 *)(result + 58));
      result = *(_QWORD *)(v1 + 40);
      if (result)
        return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(v1 + 58));
    }
  }
  return result;
}

void __45___KSTextReplacementCKStore_recordSyncStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v1 = objc_msgSend(*(id *)(a1 + 32), "countLocalEntriesToBeSynced");
  v2 = (void *)MEMORY[0x24BDD17C8];
  +[_KSTextReplacementHelper aggdPrefix](_KSTextReplacementHelper, "aggdPrefix");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v1)
    v3 = CFSTR("%@.failedSyncDailyStatus");
  else
    v3 = CFSTR("%@.successfulSyncDailyStatus");
  objc_msgSend(v2, "stringWithFormat:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_KSAggdLogger addValue:forScalarKey:](_KSAggdLogger, "addValue:forScalarKey:", 1, v4);

}

void __53___KSTextReplacementCKStore_queryUpdatedLocalEntries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("needsSaveToCloud == TRUE AND (wasDeleted == %@ || wasDeleted == nil)"), MEMORY[0x24BDBD1C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryEntriesWithPredicate:limit:", v2, 10000);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __48___KSTextReplacementCKStore_queryDeletedEntries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "coreDataStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("wasDeleted == TRUE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryEntriesWithPredicate:limit:", v2, 10000);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
