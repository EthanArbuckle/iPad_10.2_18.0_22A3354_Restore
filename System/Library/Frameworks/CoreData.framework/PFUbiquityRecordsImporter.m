@implementation PFUbiquityRecordsImporter

id __84___PFUbiquityRecordsImporter_createSortedOperationsArrayWithMetadata_isFirstImport___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(*(_QWORD *)(a1 + 32) + 72));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void __56___PFUbiquityRecordsImporter_schedulePendingLogs_error___block_invoke(uint64_t a1)
{
  NSSaveChangesRequest *v2;
  id v3;

  v3 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "metadata"), "mutableCopy");
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupCheckForFork"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setMetadata:", v3);
  v2 = objc_alloc_init(NSSaveChangesRequest);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "executeRequest:withContext:error:", v2, 0, 0);

}

void __56___PFUbiquityRecordsImporter_schedulePendingLogs_error___block_invoke_2(uint64_t a1)
{
  NSSaveChangesRequest *v2;
  id v3;

  v3 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "metadata"), "mutableCopy");
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupDoFork"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setMetadata:", v3);
  v2 = objc_alloc_init(NSSaveChangesRequest);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "executeRequest:withContext:error:", v2, 0, 0);

}

uint64_t __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __70___PFUbiquityRecordsImporter_discoverAndImportAllAvailableLogs_error___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *global_queue;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = *(_QWORD *)(v4 + 40);
    if (v5 && *(_BYTE *)(v5 + 88))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v3);
            v10 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
            objc_msgSend(v6, "addObject:", v10);

          }
          v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }
      global_queue = dispatch_get_global_queue(0, 0);
      +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v6, global_queue, (uint64_t)&__block_literal_global_125);
    }
    else
    {
      v6 = 0;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Initiated download for urls: %@"), "-[_PFUbiquityRecordsImporter batchDownloadTransactionLogsAtLocations:error:]", 854, v6);

    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Started download for logs: %@"), "-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]_block_invoke_2", 780, v3);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80);
    if (v13)
      v13 = *(_QWORD *)(v13 + 16);
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error while starting download for logs: %@\nLogs: %@"), "-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]_block_invoke_2", 782, 0, v13);
  }

  return objc_msgSend(v2, "drain");
}

void __76___PFUbiquityRecordsImporter_batchDownloadTransactionLogsAtLocations_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Librian returned a serious error for starting downloads %@ with userInfo %@"), "-[_PFUbiquityRecordsImporter batchDownloadTransactionLogsAtLocations:error:]_block_invoke", 844, a2, objc_msgSend(a2, "userInfo"));
  }
}

uint64_t __93___PFUbiquityRecordsImporter_postImportNotificationForStoreName_andLocalPeerID_withUserInfo___block_invoke(uint64_t a1)
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Posting import notification: %@\nFor coordinator: %p\n"), "-[_PFUbiquityRecordsImporter postImportNotificationForStoreName:andLocalPeerID:withUserInfo:]_block_invoke", 964, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", *(_QWORD *)(a1 + 32));
}

void __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Restart timer fired for importer: %@"), "-[_PFUbiquityRecordsImporter scheduleRecoveryTimer]_block_invoke", 1125, v2);
    objc_msgSend(*((id *)v2 + 1), "cancelAllOperations");
    objc_msgSend(*((id *)v2 + 1), "setSuspended:", 0);
    -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:]((uint64_t *)v2, 0, 0);
    dispatch_source_cancel(*((dispatch_source_t *)v2 + 12));
    WeakRetained = v2;
    *((_QWORD *)v2 + 12) = 0;
  }

}

void __51___PFUbiquityRecordsImporter_scheduleRecoveryTimer__block_invoke_2(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __58___PFUbiquityRecordsImporter_requestBaselineRollForStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  PFUbiquityBaselineRollOperation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 104);
  else
    v3 = 0;
  objc_msgSend(v3, "lock");
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v5 = 0;
LABEL_25:
    v16 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)(v4 + 128) & 1) != 0)
  {
    v5 = -[PFUbiquityBaselineOperation initWithPersistentStore:localPeerID:andUbiquityRootLocation:]([PFUbiquityBaselineRollOperation alloc], "initWithPersistentStore:localPeerID:andUbiquityRootLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    -[PFUbiquityBaselineRollOperation setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 8);
    else
      v7 = 0;
    v8 = (void *)objc_msgSend(v7, "operations");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
LABEL_10:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (objc_msgSend(v12, "isEqual:", v5))
        {
          if ((objc_msgSend(v12, "isExecuting") & 1) == 0)
            break;
        }
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            goto LABEL_10;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        v14 = *(void **)(v13 + 8);
      else
        v14 = 0;
      objc_msgSend(v14, "addOperation:", v5);
    }
  }
  else
  {
    v5 = 0;
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (!v15)
    goto LABEL_25;
  v16 = *(void **)(v15 + 104);
LABEL_22:
  objc_msgSend(v16, "unlock");

}

void __68___PFUbiquityRecordsImporter_metadataInconsistencyDetectedForStore___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  PFUbiquityStoreMetadataMedic *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = 0;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  objc_opt_self();
  v2 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v3 = -[PFUbiquityStoreMetadataMedic initWithStore:localPeerID:andUbiquityRootLocation:]([PFUbiquityStoreMetadataMedic alloc], "initWithStore:localPeerID:andUbiquityRootLocation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  if (-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]((void **)&v3->super.isa, &v9))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully recovered metadata for store: %@"), "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1399, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError during metadata recovery for store: %@\nError: %@\nUser Info: %@"), "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1401, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v9, objc_msgSend(v9, "userInfo"));
  }
  if (v2 && (v4 = v2[11]) != 0)
  {
    v5 = *(_QWORD *)(v4 + 88);
    if (v5)
    {
      v6 = 0;
      v7 = *(_QWORD *)(v5 + 56);
      goto LABEL_10;
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = 0;
  v6 = 1;
LABEL_10:
  if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v7, 0))
  {
    if ((v6 & 1) != 0)
      v8 = 0;
    else
      v8 = *(_QWORD *)(v5 + 56);
    if (-[PFUbiquityTransactionHistoryCache cacheTransactionHistory:](v8, &v9))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully recached transaction history"), "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1410, *(_QWORD *)(a1 + 40));
      if (-[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:](*(uint64_t **)(a1 + 40), 0, &v9))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setSuspended:", 0);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError scheduling root scan after metadata recovery: %@"), "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1424, *(_QWORD *)(a1 + 40), v9);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to recache transaction history: %@\nUser Info: %@"), "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1412, *(_QWORD *)(a1 + 40), v9, objc_msgSend(v9, "userInfo"));
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to drop the transaction history cache: %@"), "-[_PFUbiquityRecordsImporter metadataInconsistencyDetectedForStore:]_block_invoke", 1415, *(_QWORD *)(a1 + 40), v9);
  }

}

uint64_t __57___PFUbiquityRecordsImporter_executeBlockOnPrivateQueue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v2, "drain");
}

uint64_t __54___PFUbiquityRecordsImporter_executeBlockOnRootQueue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v2, "drain");
}

uint64_t __65___PFUbiquityRecordsImporter_afterDelay_executeBlockOnRootQueue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(v2, "drain");
}

@end
