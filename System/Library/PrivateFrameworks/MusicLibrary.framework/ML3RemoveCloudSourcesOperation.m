@implementation ML3RemoveCloudSourcesOperation

- (unint64_t)type
{
  return 9;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ML3RemoveCloudSourcesOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v10, sel__verifyLibraryConnectionAndAttributesProperties_))return 0;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeRemoveCloudSourcesKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = v7 != 0;
  if (a3 && !v7)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, CFSTR("ML3RemoveCloudSourcesOperation requires a track source attribute"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_execute:(id *)a3
{
  double v4;
  double v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  char v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  int v57;
  id v58;
  void *v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  double v63;
  void *v65;
  void *v66;
  int v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  ML3RemoveCloudSourcesOperation *v92;
  uint8_t v93[128];
  _BYTE buf[32];
  void (*v95)(uint64_t);
  id v96;
  _QWORD v97[5];

  v97[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeRemoveCloudSourcesKey"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v69, "containsObject:", CFSTR("MLDatabaseOperationAttributeRemoveSubscriptionContentKey"));
  v8 = objc_msgSend(v69, "containsObject:", CFSTR("MLDatabaseOperationAttributeRemovePurchaseHistoryKey"));
  v67 = objc_msgSend(v69, "containsObject:", CFSTR("MLDatabaseOperationAttributeRemovePurchaseHistoryForMediaItemsKey"));
  v9 = objc_msgSend(v69, "containsObject:", CFSTR("MLDatabaseOperationAttributeRemoveMatchKey"));
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v9;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v7;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v67;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v8;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] Beginning remove cloud sources operation - removeSourceMatch=%{BOOL}u, subscription=%{BOOL}u, purchasesForMediaItems=%{BOOL}u, removeSourcePurchaseHistory=%{BOOL}u", buf, 0x1Au);
  }

  -[ML3DatabaseOperation transaction](self, "transaction");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "connection");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "library");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("item_store.is_subscription"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Track, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v72, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIgnoreSystemFilterPredicates:", 1);
    if (objc_msgSend(v12, "hasEntities"))
      objc_msgSend(v72, "removeSource:forImportOperation:usingConnection:postNotifications:", 6, self, v71, 0);

  }
  if (objc_msgSend(v72, "sagaOnDiskDatabaseRevision"))
    v13 = 1;
  else
    v13 = v9;
  if (v13 == 1)
  {
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("is_hidden"), MEMORY[0x1E0C9AAA0], 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v72, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v72, "sagaPrefersToMergeWithCloudLibrary");
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = objc_msgSend(v66, "countOfEntities");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Clearing cloud ID for %ld visible playlists.", buf, 0x16u);
      }

      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke;
      v90[3] = &unk_1E5B63860;
      v91 = v71;
      v92 = self;
      objc_msgSend(v66, "enumeratePersistentIDsUsingBlock:", v90);
      +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("is_src_remote"), 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v72, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v19, "countOfEntities");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v21;
        _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing %ld remote playlists.", buf, 0x16u);
      }

      objc_msgSend(v19, "deleteAllEntitiesFromLibraryWithDeletionType:", 2);
    }
    else
    {
      if (v16)
      {
        v23 = objc_msgSend(v66, "countOfEntities");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing %ld visible playlists.", buf, 0x16u);
      }

      objc_msgSend(v66, "deleteAllEntitiesFromLibraryWithDeletionType:", 2);
    }
    objc_msgSend(v71, "executeQuery:", CFSTR("SELECT album_artist_pid FROM album_artist where cloud_universal_library_id !=''"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_12;
    v87[3] = &unk_1E5B639C0;
    v26 = v72;
    v88 = v26;
    v27 = v71;
    v89 = v27;
    objc_msgSend(v24, "enumerateRowsWithBlock:", v87);
    objc_msgSend(v27, "executeQuery:", CFSTR("SELECT album_pid FROM album where cloud_library_id !=''"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v84[0] = v25;
    v84[1] = 3221225472;
    v84[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_2;
    v84[3] = &unk_1E5B639C0;
    v29 = v26;
    v85 = v29;
    v30 = v27;
    v86 = v30;
    objc_msgSend(v28, "enumerateRowsWithBlock:", v84);
    v83 = 0;
    LOBYTE(v26) = objc_msgSend(v30, "executeUpdate:withParameters:error:", CFSTR("UPDATE album_artist SET cloud_universal_library_id=?, liked_state=?, liked_state_changed_date=? WHERE cloud_universal_library_id !=''"), &unk_1E5BA89D0, &v83);
    v31 = v83;
    if ((v26 & 1) == 0)
    {
      v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud id property from album artists failed with error=%{public}@.", buf, 0x16u);
      }

    }
    v82 = v31;
    v33 = objc_msgSend(v30, "executeUpdate:withParameters:error:", CFSTR("UPDATE album SET cloud_library_id=?, liked_state=?, liked_state_changed_date=? WHERE cloud_library_id !=''"), &unk_1E5BA89E8, &v82);
    v22 = v82;

    if ((v33 & 1) == 0)
    {
      v34 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud id property from albums failed with error=%{public}@.", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("(container.distinguished_kind = 32)"), v35, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v29, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v37, "countOfEntities");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing %ld genius mixes.", buf, 0x16u);
    }

    objc_msgSend(v37, "deleteAllEntitiesFromLibraryWithDeletionType:", 2);
    objc_msgSend(v29, "removeSource:forImportOperation:usingConnection:postNotifications:", 2, self, v30, 0);

  }
  else
  {
    v22 = 0;
  }
  if (v67)
  {
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("media_type"), &unk_1E5BAAB18, 10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("item_store.purchase_history_id"), &unk_1E5BAAB00, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v40;
    v97[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3Entity unrestrictedQueryWithLibrary:predicate:orderingTerms:](ML3Track, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v72, v43, MEMORY[0x1E0C9AA60]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__1319;
    v95 = __Block_byref_object_dispose__1320;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v96 = (id)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_32;
    v81[3] = &unk_1E5B5C4A8;
    v81[4] = buf;
    objc_msgSend(v44, "enumeratePersistentIDsUsingBlock:", v81);
    objc_msgSend(v72, "removeSource:fromPersistentIDS:forImportOperation:usingConnection:postNotifications:", 4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), self, v71, 0);
    _Block_object_dispose(buf, 8);

  }
  if (v8)
  {
    if (objc_msgSend(v72, "jaliscoOnDiskDatabaseRevision") >= 1)
    {
      objc_msgSend(v72, "removeSource:forImportOperation:usingConnection:postNotifications:", 4, self, v71, 0);
      objc_msgSend(v72, "setJaliscoOnDiskDatabaseRevision:", 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setJaliscoLastGeniusUpdateDate:", v45);

      if (objc_msgSend(v72, "jaliscoHasCloudGeniusData"))
      {
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v46 = objc_msgSend(&unk_1E5BA8A00, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        if (v46)
        {
          v47 = *(_QWORD *)v78;
          while (2)
          {
            v48 = 0;
            v49 = v22;
            do
            {
              if (*(_QWORD *)v78 != v47)
                objc_enumerationMutation(&unk_1E5BA8A00);
              v50 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v48);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = v49;
              v52 = objc_msgSend(v71, "executeUpdate:withParameters:error:", v51, 0, &v76);
              v22 = v76;

              if ((v52 & 1) == 0)
              {
                v53 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v50;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v22;
                  _os_log_impl(&dword_1AC149000, v53, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] failed to empty rows from table=%{public}@, error=%{public}@", buf, 0x16u);
                }

                goto LABEL_49;
              }
              ++v48;
              v49 = v22;
            }
            while (v46 != v48);
            v46 = objc_msgSend(&unk_1E5BA8A00, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
            if (v46)
              continue;
            break;
          }
        }
LABEL_49:
        +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("(container.is_container_type_active_target AND container.smart_is_genius)"), 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v72, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_44;
        v74[3] = &unk_1E5B65960;
        v56 = v72;
        v75 = v56;
        objc_msgSend(v55, "enumeratePersistentIDsUsingBlock:", v74);
        objc_msgSend(v56, "setJaliscoHasCloudGeniusData:", 0);
        objc_msgSend(v56, "setJaliscoIsMusicGeniusUserEnabled:", 0);

      }
    }
    objc_msgSend(v72, "clearAllCloudKVSData");
    objc_msgSend(v72, "clearCachedPurchaseHistoryVersionsUsingConnection:", v71);
  }
  v73 = 0;
  v57 = objc_msgSend(v71, "executeUpdate:withParameters:error:", CFSTR("UPDATE album SET liked_state=? WHERE NOT EXISTS (SELECT 1 FROM item WHERE in_my_library AND item.album_pid = album.album_pid)"), &unk_1E5BA8A18, &v73);
  v58 = v73;
  v59 = v58;
  if ((v57 & 1) != 0)
  {
    v60 = v22;
  }
  else
  {
    v60 = v58;

    v61 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v60;
      _os_log_impl(&dword_1AC149000, v61, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] failed to update liked_state on potentially orphaned albums, error=%{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v72, "clearCachedCloudLibraryVersionsUsingConnection:", v71);
  v62 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v57;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v63 - v5;
    _os_log_impl(&dword_1AC149000, v62, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] Remove cloud sources operation finished with success=%d in %.3f seconds, starting maintenance task", buf, 0x12u);
  }

  if (v57)
  {
    objc_msgSend(v72, "notifyEntitiesAddedOrRemoved");
    objc_msgSend(v72, "notifyContentsDidChange");
  }
  if (a3)
    *a3 = objc_retainAutorelease(v60);

  return v57;
}

void __43__ML3RemoveCloudSourcesOperation__execute___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("UPDATE container SET store_cloud_id=0 WHERE container_pid=?"), v5, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud id property from album artists failed with error=%{public}@.", buf, 0x16u);
    }

  }
}

BOOL __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_12(uint64_t a1, void *a2)
{
  return +[ML3Entity incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:](ML3AlbumArtist, "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", *(_QWORD *)(a1 + 32), objc_msgSend(a2, "int64ForColumnIndex:", 0), 0, 1, *(_QWORD *)(a1 + 40));
}

BOOL __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_2(uint64_t a1, void *a2)
{
  return +[ML3Entity incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:](ML3Album, "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", *(_QWORD *)(a1 + 32), objc_msgSend(a2, "int64ForColumnIndex:", 0), 0, 1, *(_QWORD *)(a1 + 40));
}

void __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_32(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_44(uint64_t a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "existsInLibrary"))
  {
    objc_msgSend(v3, "deleteFromLibrary");
    v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = a2;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] Deleted active Genius playlist with pid: %lld", (uint8_t *)&v5, 0xCu);
    }

  }
}

@end
