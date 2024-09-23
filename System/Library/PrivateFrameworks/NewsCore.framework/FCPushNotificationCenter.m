@implementation FCPushNotificationCenter

- (_QWORD)initWithPrivateDatabase:(void *)a3 storeDirectory:
{
  id v6;
  id v7;
  id v8;
  FCMapTable *v9;
  void *v10;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDatabase != nil");
      *(_DWORD *)buf = 136315906;
      v15 = "-[FCPushNotificationCenter initWithPrivateDatabase:storeDirectory:]";
      v16 = 2080;
      v17 = "FCPushNotificationCenter.m";
      v18 = 1024;
      v19 = 66;
      v20 = 2114;
      v21 = v12;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v13.receiver = a1;
    v13.super_class = (Class)FCPushNotificationCenter;
    v8 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 2, a2);
      v9 = -[FCMapTable initWithKeyOptions:valueOptions:capacity:]([FCMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
      v10 = (void *)a1[3];
      a1[3] = v9;

    }
  }

  return a1;
}

- (void)disableSyncing
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    *(_BYTE *)(a1 + 8) = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPushNotificationCenter serverChangeTokenKey]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectForKey:", v3);

    if (*(_BYTE *)(a1 + 8))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("syncing should be disabled"));
        v5 = 136315906;
        v6 = "-[FCPushNotificationCenter(Setup) disableSyncing]";
        v7 = 2080;
        v8 = "FCPushNotificationCenter.m";
        v9 = 1024;
        v10 = 260;
        v11 = 2114;
        v12 = v4;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      }
    }
  }
}

- (id)serverChangeTokenKey
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu-%lu"), CFSTR("server-change-token"), 2, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FCPushNotificationCenter)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPushNotificationCenter init]";
    v9 = 2080;
    v10 = "FCPushNotificationCenter.m";
    v11 = 1024;
    v12 = 61;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPushNotificationCenter init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)addObserver:(void *)a3 forChangesToRecordZoneID:(void *)a4 usingBlock:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]";
    v17 = 2080;
    v18 = "FCPushNotificationCenter.m";
    v19 = 1024;
    v20 = 82;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordZoneID != nil");
        *(_DWORD *)buf = 136315906;
        v16 = "-[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]";
        v17 = 2080;
        v18 = "FCPushNotificationCenter.m";
        v19 = 1024;
        v20 = 83;
        v21 = 2114;
        v22 = v13;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (v9)
  {
    if (v7 && v8)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v11, v7);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]";
    v17 = 2080;
    v18 = "FCPushNotificationCenter.m";
    v19 = 1024;
    v20 = 84;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_13:

}

- (void)removeRecordZoneObserver:(uint64_t)a1
{
  id v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v3);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
      *(_DWORD *)buf = 136315906;
      v6 = "-[FCPushNotificationCenter removeRecordZoneObserver:]";
      v7 = 2080;
      v8 = "FCPushNotificationCenter.m";
      v9 = 1024;
      v10 = 96;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }

}

- (void)handleRemoteNotification:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  FCCKPrivateDatabase *privateDatabase;
  FCCKPrivateDatabase *v22;
  void *v23;
  __int128 buf;
  void (*v25)(uint64_t, char, void *, void *, void *);
  void *v26;
  FCPushNotificationCenter *v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = FCCloudKitLog;
  if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "handling notification userInfo:%@", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C94F40], "notificationFromRemoteNotificationDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscriptionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "notificationType") == 4
    && objc_msgSend(v10, "isEqualToString:", CFSTR("private-db-sub")))
  {
    v11 = v7;
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPushNotificationCenter serverChangeTokenKey]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v14;
      v16 = v11;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v15, v14, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      if (v17)
        v20 = 17;
      else
        v20 = 25;
      privateDatabase = self->_privateDatabase;
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = __81__FCPushNotificationCenter__handlePrivateDatabaseNotification_completionHandler___block_invoke;
      v26 = &unk_1E4640A58;
      v27 = self;
      v28 = v16;
      v22 = privateDatabase;
      v11 = v16;
      -[FCCKPrivateDatabase fetchAllDatabaseChangesWithServerChangeToken:qualityOfService:completionQueue:completionHandler:](v22, "fetchAllDatabaseChangesWithServerChangeToken:qualityOfService:completionQueue:completionHandler:", v17, v20, MEMORY[0x1E0C80D38], &buf);

    }
  }
  else
  {
    v18 = objc_opt_new();
    v19 = (void *)v18;
    if (v18)
      *(_BYTE *)(v18 + 8) = 0;
    if (v7)
      (*((void (**)(id, uint64_t))v7 + 2))(v7, v18);

  }
}

void __81__FCPushNotificationCenter__handlePrivateDatabaseNotification_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  _BYTE *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  _BYTE *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void (**v24)(void);
  uint64_t v25;
  _BYTE *v26;
  NSObject *v27;
  uint64_t v28;
  _BYTE *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BYTE *v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  _BYTE *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  _BYTE *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = FCCloudKitLog;
  v13 = os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412546;
      v63 = v9;
      v64 = 2112;
      v65 = v10;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "fetched database changes changedRecordZoneIDs: %@ deletedRecordZoneIDs: %@", buf, 0x16u);
    }
    v14 = *(_QWORD *)(a1 + 32);
    v50 = v9;
    v15 = v9;
    v51 = v11;
    v52 = v10;
    if (v14)
    {
      v16 = FCCloudKitLog;
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v15;
        _os_log_debug_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEBUG, "Zones changed: %@", buf, 0xCu);
      }
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v17 = *(id *)(v14 + 24);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v58 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(v14 + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "first");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "containsObject:", v23))
            {
              objc_msgSend(v22, "second");
              v24 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v24[2]();

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
        }
        while (v19);
      }

      v11 = v51;
      v10 = v52;
    }

    v25 = *(_QWORD *)(a1 + 32);
    v26 = v10;
    if (v25)
    {
      v27 = FCCloudKitLog;
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v26;
        _os_log_debug_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEBUG, "Zones deleted: %@", buf, 0xCu);
      }
    }

    v28 = *(_QWORD *)(a1 + 32);
    v29 = v11;
    if (v28)
    {
      v30 = FCCloudKitLog;
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v29;
        _os_log_debug_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEBUG, "Database change token updated: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v29, 1, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPushNotificationCenter serverChangeTokenKey]();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v31, v33);

    }
    v34 = (_BYTE *)objc_opt_new();
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v36 = *(_QWORD **)(a1 + 32);
      if (v36)
        v36 = (_QWORD *)v36[3];
      v37 = v36;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v54;
        do
        {
          v41 = 0;
          do
          {
            if (*(_QWORD *)v54 != v40)
              objc_enumerationMutation(v37);
            v42 = *(_QWORD *)(a1 + 32);
            if (v42)
              v43 = *(void **)(v42 + 24);
            else
              v43 = 0;
            objc_msgSend(v43, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v41));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "first");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "containsObject:", v45))
              objc_msgSend(v35, "addObject:", v45);

            ++v41;
          }
          while (v39 != v41);
          v46 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          v39 = v46;
        }
        while (v46);
      }

      if (v34)
        v34[8] = 1;
      v47 = (void *)objc_msgSend(v35, "copy");
      -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v34, v47);

      v11 = v51;
      v10 = v52;
    }
    v48 = FCCloudKitLog;
    v9 = v50;
    if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v34;
      _os_log_impl(&dword_1A1B90000, v48, OS_LOG_TYPE_DEFAULT, "fetched database changes will return pushNotificationResult: %@", buf, 0xCu);
    }
    v49 = *(_QWORD *)(a1 + 40);
    if (v49)
      (*(void (**)(uint64_t, _BYTE *))(v49 + 16))(v49, v34);

  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "failed to fetch database changes", buf, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneObservers, 0);
  objc_storeStrong((id *)&self->_privateDatabase, 0);
}

- (void)enableSyncing
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    a1[8] = 1;
    objc_msgSend(a1, "prepareForUse");
    if (!a1[8] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("syncing should be enabled"));
      v3 = 136315906;
      v4 = "-[FCPushNotificationCenter(Setup) enableSyncing]";
      v5 = 2080;
      v6 = "FCPushNotificationCenter.m";
      v7 = 1024;
      v8 = 250;
      v9 = 2114;
      v10 = v2;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

    }
  }
}

- (void)prepareForUse
{
  void *v3;
  char v4;
  FCCKPrivateDeleteAllZoneSubscriptionsOperation *v5;
  FCCKPrivateDatabase *privateDatabase;
  void *v7;
  id v8;
  FCCKPrivateDatabase *v9;
  FCCKPrivateSaveDatabaseSubscriptionOperation *v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("record-zone-subs-deleted"));

  if ((v4 & 1) == 0)
  {
    v5 = objc_alloc_init(FCCKPrivateDeleteAllZoneSubscriptionsOperation);
    -[FCOperation setQualityOfService:](v5, "setQualityOfService:", 17);
    -[FCOperation setRelativePriority:](v5, "setRelativePriority:", 0);
    if (self)
      privateDatabase = self->_privateDatabase;
    else
      privateDatabase = 0;
    -[FCCKPrivateDatabase addOperation:]((uint64_t)privateDatabase, v5);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", 1, CFSTR("record-zone-subs-deleted"));

  }
  v10 = objc_alloc_init(FCCKPrivateSaveDatabaseSubscriptionOperation);
  -[FCOperation setQualityOfService:](v10, "setQualityOfService:", 17);
  -[FCOperation setRelativePriority:](v10, "setRelativePriority:", 0);
  -[FCCKPrivateSaveDatabaseSubscriptionOperation setSubscriptionID:](v10, "setSubscriptionID:", CFSTR("private-db-sub"));
  v8 = objc_alloc_init(MEMORY[0x1E0C94F50]);
  objc_msgSend(v8, "setShouldSendContentAvailable:", 1);
  -[FCCKPrivateSaveDatabaseSubscriptionOperation setNotificationInfo:](v10, "setNotificationInfo:", v8);
  if (self)
    v9 = self->_privateDatabase;
  else
    v9 = 0;
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v9, v10);

}

@end
