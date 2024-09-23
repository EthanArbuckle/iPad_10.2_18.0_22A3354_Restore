@implementation ML3RemovePlaylistsOperation

- (unint64_t)type
{
  return 6;
}

- (BOOL)_execute:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  double v17;
  NSObject *v18;
  int v20;
  int v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseOperation transaction](self, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseOperation attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  -[ML3DatabaseOperation attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109376;
    v21 = v8;
    v22 = 2048;
    v23 = COERCE_DOUBLE(objc_msgSend(v10, "count"));
    _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Beginning remove playlists operation with source %d (%lu specified playlists)", (uint8_t *)&v20, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v13 = v12;
  if (objc_msgSend(v10, "count"))
    v14 = -[ML3RemovePlaylistsOperation _removePlaylistsWithPersistentIDs:fromSource:usingTransaction:](self, "_removePlaylistsWithPersistentIDs:fromSource:usingTransaction:", v10, v8, v5);
  else
    v14 = -[ML3RemovePlaylistsOperation _removeSource:usingTransaction:](self, "_removeSource:usingTransaction:", v8, v5);
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v17 = v16;
  v18 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109376;
    v21 = v15;
    v22 = 2048;
    v23 = v17 - v13;
    _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Remove playlists operation success=%d in %.3f seconds", (uint8_t *)&v20, 0x12u);
  }

  if (a3)
    *a3 = 0;

  return v15;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ML3RemovePlaylistsOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v9, sel__verifyLibraryConnectionAndAttributesProperties_))return 0;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  if (a3 && !v6)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, CFSTR("ML3RemovePlaylistsOperation requires a track source attribute"));
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)_removeSource:(int)a3 usingTransaction:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v4 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)
  {
    ML3ContainerRulesRemovalSourceIdentityPropertyForSource(v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "databasePath");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Removing source property %{public}@ from all containers in library at path %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE container set %@=0"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v13 = objc_msgSend(v7, "executeUpdate:withParameters:error:", v12, 0, &v21);
    v14 = v21;
    if ((v13 & 1) != 0)
    {
      v15 = -[ML3RemovePlaylistsOperation _removeRemotePlaylistsWithNoSourceUsingTransation:](self, "_removeRemotePlaylistsWithNoSourceUsingTransation:", v6);
    }
    else
    {
      v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v9;
        v25 = 2114;
        v26 = v14;
        _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove source %{public}@ from containers. err=%{public}@", buf, 0x16u);
      }

      v15 = 0;
    }

LABEL_17:
    goto LABEL_18;
  }
  v16 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "databasePath");
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Removing all containers from library at path %{public}@", buf, 0xCu);

  }
  v22 = 0;
  v18 = objc_msgSend(v7, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container"), 0, &v22);
  v14 = v22;
  if ((v18 & 1) == 0)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove all containers. err=%{public}@", buf, 0xCu);
    }
    v15 = 0;
    goto LABEL_17;
  }
  v15 = 1;
LABEL_18:

  return v15;
}

- (BOOL)_removePlaylistsWithPersistentIDs:(id)a3 fromSource:(int)a4 usingTransaction:(id)a5
{
  uint64_t v6;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v6 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v6)
  {
    ML3ContainerRulesRemovalSourceIdentityPropertyForSource(v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Removing source property %{public}@ from container pids %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE container set %@=0 WHERE container_pid"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statementWithPrefix:inParameterCount:", v13, -[NSObject count](v8, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v16 = objc_msgSend(v10, "executeUpdate:withParameters:error:", v15, v8, &v24);
    v17 = v24;

    if ((v16 & 1) != 0)
    {
      v18 = -[ML3RemovePlaylistsOperation _removeRemotePlaylistsWithNoSourceUsingTransation:](self, "_removeRemotePlaylistsWithNoSourceUsingTransation:", v9);
    }
    else
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v27 = v11;
        v28 = 2114;
        v29 = v17;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove source %{public}@ from containers. err=%{public}@", buf, 0x16u);
      }

      v18 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM container WHERE container_pid"), -[NSObject count](v8, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v21 = objc_msgSend(v10, "executeUpdate:withParameters:error:", v20, v8, &v25);
  v17 = v25;

  if ((v21 & 1) == 0)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove containers. err=%{public}@", buf, 0xCu);
    }
    v18 = 0;
    goto LABEL_15;
  }
  v18 = 1;
LABEL_16:

  return v18;
}

- (BOOL)_removeRemotePlaylistsWithNoSourceUsingTransation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("is_src_remote"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("sync_id"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v7;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("cloud_global_id"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v8;
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("store_cloud_id"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3Entity unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:](ML3Container, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v5, v11, MEMORY[0x1E0C9AA60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__ML3RemovePlaylistsOperation__removeRemotePlaylistsWithNoSourceUsingTransation___block_invoke;
  v24[3] = &unk_1E5B65960;
  v14 = v13;
  v25 = v14;
  objc_msgSend(v12, "enumeratePersistentIDsUsingBlock:", v24);
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218242;
    v27 = v16;
    v28 = 2114;
    v29 = v14;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] removing %lu containers that no longer have a remote source. container_pids=%{public}@", buf, 0x16u);
  }

  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM container WHERE container_pid"), objc_msgSend(v14, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v19 = objc_msgSend(v4, "executeUpdate:withParameters:error:", v18, v14, &v23);
  v20 = v23;

  if ((v19 & 1) == 0)
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = (uint64_t)v20;
      _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove sourceless containers. err=%{public}@", buf, 0xCu);
    }

  }
  return v19;
}

void __81__ML3RemovePlaylistsOperation__removeRemotePlaylistsWithNoSourceUsingTransation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
