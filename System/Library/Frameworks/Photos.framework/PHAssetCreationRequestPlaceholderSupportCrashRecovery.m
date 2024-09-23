@implementation PHAssetCreationRequestPlaceholderSupportCrashRecovery

+ (void)restartPendingPlaceholderDownloadsForLibrary:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6458;
  v25 = __Block_byref_object_dispose__6459;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6458;
  v19[4] = __Block_byref_object_dispose__6459;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__6458;
  v17[4] = __Block_byref_object_dispose__6459;
  v18 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke;
  v12[3] = &unk_1E35DE5A8;
  v5 = v3;
  v13 = v5;
  v14 = v19;
  v15 = v17;
  v16 = &v21;
  objc_msgSend(v5, "performBlockAndWait:", v12);
  v6 = (void *)v22[5];
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_147;
  v8[3] = &unk_1E35D7140;
  v10 = v19;
  v11 = v17;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(&v21, 8);
}

void __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  _QWORD v53[5];

  v53[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPlaceholderAsset"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil && %K != nil && %K != nil"), CFSTR("master"), CFSTR("additionalAttributes.sourceAssetForDuplicationIdentifier"), CFSTR("additionalAttributes.sourceAssetForDuplicationScopeIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v9);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &v49);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v49;

  if (!v11)
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v52 = (uint64_t)v12;
    v38 = "Failed to execute placeholder assets fetch: %@";
    v39 = v15;
    v40 = 12;
LABEL_23:
    _os_log_impl(&dword_1991EC000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_24;
  }
  v13 = objc_msgSend(v11, "count");
  PLPhotoKitGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v38 = "Placeholder asset fetch returned no results";
    v39 = v15;
    v40 = 2;
    goto LABEL_23;
  }
  v41 = v12;
  v43 = v9;
  v44 = v4;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v52 = v16;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu placeholder assets that need to be recreated", buf, 0xCu);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = v11;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v25, "fetchSourceAssetForDuplicationIfExists");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26
          && (objc_msgSend(MEMORY[0x1E0D71880], "shouldPerformServerCopyOnPlaceholderAsset:photoLibrary:", v25, *(_QWORD *)(a1 + 32)) & 1) == 0)
        {
          objc_msgSend(v25, "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v27);

          objc_msgSend(v26, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v28);

          objc_msgSend(v26, "momentShare");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            v30 = &unk_1E3655090;
          else
            v30 = &unk_1E36550A8;
          objc_msgSend(v18, "addObject:", v30);
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v22);
  }

  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v17;
  v15 = v17;

  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v18;
  v35 = v18;

  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v19;

  v9 = v43;
  v4 = v44;
  v12 = v41;
  v11 = v42;
LABEL_24:

}

void __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_147(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  __int16 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = (void *)MEMORY[0x19AEBEADC]();
  PLPhotoKitGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEFAULT, "Requesting download for source asset %@ in order to finish creating placeholder asset %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D71588], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_148;
  v15[3] = &unk_1E35D7118;
  v13 = v6;
  v16 = v13;
  v14 = v5;
  v17 = v14;
  v19 = v8;
  v18 = (id)a1[4];
  objc_msgSend(v11, "requestRequiredResourcesForManagedAssetObjectUUID:library:completionHandler:", v13, v12, v15);

  objc_autoreleasePoolPop(v9);
}

void __102__PHAssetCreationRequestPlaceholderSupportCrashRecovery_restartPendingPlaceholderDownloadsForLibrary___block_invoke_148(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  PHAssetCreationRequestPlaceholderSupport *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEFAULT, "Download finished for source asset %@, going to call _updateManagedAssetAfterResourceDownload: for placeholder asset %@", (uint8_t *)&v12, 0x16u);
  }

  v5 = [PHAssetCreationRequestPlaceholderSupport alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 40));
  v7 = -[PHAssetCreationRequestPlaceholderSupport initForNewObjectWithUUID:](v5, "initForNewObjectWithUUID:", v6);

  +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDuplicateAssetIdentifier:", v8);

  objc_msgSend(v7, "_setDuplicateAssetPhotoLibraryType:", *(unsigned __int16 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newShortLivedLibraryWithName:", "+[PHAssetCreationRequestPlaceholderSupportCrashRecovery restartPendingPlaceholderDownloadsForLibrary:]_block_invoke");

  objc_msgSend(v7, "_updateManagedAssetAfterResourceDownload:", v11);
}

@end
