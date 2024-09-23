@implementation CALNNotificationServer

- (CALNNotificationServer)initWithUserNotificationCenter:(id)a3 storage:(id)a4 analyticsHandler:(id)a5 deviceLockObserver:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNNotificationServer *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *workQueue;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *notificationSourceMap;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CALNNotificationServer;
  v15 = -[CALNNotificationServer init](&v25, sel_init);
  if (v15)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v17, v18);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v15->_userNotificationCenter, a3);
    -[CALNNotificationServer userNotificationCenter](v15, "userNotificationCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v15);

    objc_storeStrong((id *)&v15->_storage, a4);
    objc_storeStrong((id *)&v15->_analyticsHandler, a5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    notificationSourceMap = v15->_notificationSourceMap;
    v15->_notificationSourceMap = (NSMutableDictionary *)v22;

    v15->_isProtectedDataAvailable = objc_msgSend(v14, "hasBeenUnlockedSinceBoot");
  }

  return v15;
}

- (id)_notificationSourceMapWithNotificationSources:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "sourceIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (void)activate
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Requesting activation.", buf, 2u);
  }

  -[CALNNotificationServer workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CALNNotificationServer_activate__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v4, block);

}

uint64_t __34__CALNNotificationServer_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  __int16 v10;
  uint8_t buf[16];
  __int16 v12;

  -[CALNNotificationServer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[CALNNotificationServer isActive](self, "isActive");
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v12 = 0;
      v7 = "Cannot activate server since it is already active.";
      v8 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Activating.", buf, 2u);
    }

    -[CALNNotificationServer userNotificationCenter](self, "userNotificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activate");

    -[CALNNotificationServer setActive:](self, "setActive:", 1);
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v7 = "Activated.";
      v8 = (uint8_t *)&v10;
      goto LABEL_8;
    }
  }

}

- (void)deactivate
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Requesting deactivation.", buf, 2u);
  }

  -[CALNNotificationServer workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CALNNotificationServer_deactivate__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v4, block);

}

uint64_t __36__CALNNotificationServer_deactivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

- (void)_deactivate
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[16];
  uint8_t v12[2];

  -[CALNNotificationServer workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[CALNNotificationServer isActive](self, "isActive");
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Deactivating.", buf, 2u);
    }

    -[CALNNotificationServer userNotificationCenter](self, "userNotificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivate");

    -[CALNNotificationServer setActive:](self, "setActive:", 0);
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "Deactivated.";
      v9 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)v12 = 0;
    v8 = "Cannot deactivate server since it is already inactive.";
    v9 = v12;
    goto LABEL_8;
  }

}

- (void)setNotificationSources:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Setting notification sources: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[CALNNotificationServer _notificationSourceMapWithNotificationSources:](self, "_notificationSourceMapWithNotificationSources:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[CALNNotificationServer setNotificationSourceMap:](self, "setNotificationSourceMap:", v7);

  -[CALNNotificationServer _didSetNotificationSources:](self, "_didSetNotificationSources:", v4);
}

- (void)_didSetNotificationSources:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Did set notification sources: %{public}@", buf, 0xCu);
  }

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Getting notification categories from notification sources: %{public}@.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__CALNNotificationServer__didSetNotificationSources___block_invoke;
  v11[3] = &unk_24D484788;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServer userNotificationCenter](self, "userNotificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationCategories:", v9);

}

void __53__CALNNotificationServer__didSetNotificationSources___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "categories");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (NSArray)notificationSources
{
  void *v2;
  void *v3;

  -[CALNNotificationServer notificationSourceMap](self, "notificationSourceMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)notificationSourceForSourceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CALNNotificationServer notificationSourceMap](self, "notificationSourceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)protectedDataDidBecomeAvailable
{
  -[CALNNotificationServer setIsProtectedDataAvailable:](self, "setIsProtectedDataAvailable:", 1);
}

- (id)fetchRecordsWithSourceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting fetching records with source identifier: %@.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[CALNNotificationServer workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CALNNotificationServer_fetchRecordsWithSourceIdentifier___block_invoke;
  block[3] = &unk_24D4847B0;
  v11 = v4;
  p_buf = &buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v8;
}

void __59__CALNNotificationServer_fetchRecordsWithSourceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_fetchRecordsWithSourceIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_fetchRecordsWithSourceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNNotificationServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Fetching records with source identifier: %@.", buf, 0xCu);
  }

  -[CALNNotificationServer storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__CALNNotificationServer__fetchRecordsWithSourceIdentifier___block_invoke;
  v14[3] = &unk_24D4847D8;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "Fetched records with source identifier: %{public}@. Fetched records: %@.", buf, 0x16u);
  }

  return v11;
}

uint64_t __60__CALNNotificationServer__fetchRecordsWithSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)addRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNNotificationServer aboutToPostNotification:](self, "aboutToPostNotification:", v4);
  -[CALNNotificationServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CALNNotificationServer_addRecord___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __36__CALNNotificationServer_addRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRecord:", *(_QWORD *)(a1 + 40));
}

- (void)_addRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNNotificationServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceClientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Adding record with source identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);

  }
  +[CALNNotificationMapper notificationRequestFromNotificationRecord:](CALNNotificationMapper, "notificationRequestFromNotificationRecord:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServer analyticsHandler](self, "analyticsHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServer userNotificationCenter](self, "userNotificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = objc_msgSend(v11, "addNotificationRequest:error:", v9, &v19);
  v13 = v19;

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "Added notification request, identifier = %{public}@, request = %@.", buf, 0x16u);

    }
    objc_msgSend(v10, "recordPostedNotification:", v4);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "sourceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceClientIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v17;
      v22 = 2114;
      v23 = v18;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_215D9B000, v15, OS_LOG_TYPE_ERROR, "Error adding notification request. Source identifier = %{public}@, Source client identifier = %{public}@, error = %@, request = %@.", buf, 0x2Au);

    }
  }

}

- (void)updateRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNNotificationServer aboutToPostNotification:](self, "aboutToPostNotification:", v4);
  -[CALNNotificationServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CALNNotificationServer_updateRecord___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __39__CALNNotificationServer_updateRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecord:", *(_QWORD *)(a1 + 40));
}

- (void)_updateRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNNotificationServer workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceClientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Updating record with source identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);

  }
  +[CALNNotificationMapper notificationRequestFromNotificationRecord:](CALNNotificationMapper, "notificationRequestFromNotificationRecord:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServer userNotificationCenter](self, "userNotificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = objc_msgSend(v10, "replaceNotificationRequest:error:", v9, &v17);
  v12 = v17;

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v11 & 1) == 0)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    objc_msgSend(v4, "sourceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceClientIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v9;
    _os_log_error_impl(&dword_215D9B000, v14, OS_LOG_TYPE_ERROR, "Error replacing notification request. Source identifier = %{public}@, Source client identifier = %{public}@, error = %@, request = %@.", buf, 0x2Au);

    goto LABEL_6;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Replaced notification request, identifier = %{public}@, request = %@.", buf, 0x16u);
LABEL_6:

  }
LABEL_8:

}

- (void)aboutToPostNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServer notificationSourceForSourceIdentifier:](self, "notificationSourceForSourceIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "willPostNotification:", v6);

}

- (void)removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CALNNotificationServer workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CALNNotificationServer_removeRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke;
  block[3] = &unk_24D484800;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __82__CALNNotificationServer_removeRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRecordWithSourceIdentifier:sourceClientIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CALNNotificationIdentifier *v9;
  CALNNotificationIdentifier *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNNotificationServer workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:]([CALNNotificationIdentifier alloc], "initWithSourceIdentifier:sourceClientIdentifier:", v6, v7);
  v10 = v9;
  if (v9)
  {
    -[CALNNotificationIdentifier stringRepresentation](v9, "stringRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "Removing record with source identifier = %{public}@, source client identifier = %{public}@", buf, 0x16u);
    }

    -[CALNNotificationServer userNotificationCenter](self, "userNotificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeDeliveredNotificationsWithIdentifiers:", v14);

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNNotificationServer _removeRecordWithSourceIdentifier:sourceClientIdentifier:].cold.1((uint64_t)v6, (uint64_t)v7, v11);
  }

}

- (id)_notificationRecordWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNNotificationServer storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __89__CALNNotificationServer__notificationRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke;
  v20 = &unk_24D484828;
  v10 = v6;
  v21 = v10;
  v11 = v7;
  v22 = v11;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v12, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2112;
      v28 = v13;
      _os_log_error_impl(&dword_215D9B000, v14, OS_LOG_TYPE_ERROR, "Error: Expected storage to contain only one record that has the same source identifier and source client identifier. Source identifier: %{public}@. Source client identifier: %{public}@. Fetched records: %@.", buf, 0x20u);
    }

    v15 = 0;
  }

  return v15;
}

uint64_t __89__CALNNotificationServer__notificationRecordWithSourceIdentifier_sourceClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v5);

  if ((_DWORD)v4)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "sourceClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Received user notification center delegate will present notification message. User notification center: %@. Notification: %@.", (uint8_t *)&v13, 0x16u);
  }

  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Invoking callback with options: %{public}@.", (uint8_t *)&v13, 0xCu);

  }
  v9[2](v9, 6);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[CALNNotificationServer _notificationRecordResponseFromNotificationResponse:](self, "_notificationRecordResponseFromNotificationResponse:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CALNNotificationServer analyticsHandler](self, "analyticsHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordNotificationResponse:", v9);

    objc_msgSend(v9, "notificationRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationServer notificationSourceForSourceIdentifier:](self, "notificationSourceForSourceIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didReceiveResponse:", v9);
    objc_msgSend(v11, "sourceClientIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationServer removeRecordWithSourceIdentifier:sourceClientIdentifier:](self, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v12, v14);

    v8[2](v8);
  }
  else
  {
    objc_msgSend(v7, "notification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CALNNotificationServer userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();

  }
}

- (id)_notificationRecordResponseFromNotificationResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CALNNotificationIdentifier *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[4];
  CALNNotificationIdentifier *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "notification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Transforming notification response to notification record response. request identifier = %{public}@, response = %@.", buf, 0x16u);

  }
  objc_msgSend(v4, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CALNNotificationIdentifier initWithStringRepresentation:]([CALNNotificationIdentifier alloc], "initWithStringRepresentation:", v11);
  if (v12)
  {
    -[CALNNotificationServer storage](self, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notificationRecords");
    v14 = objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __78__CALNNotificationServer__notificationRecordResponseFromNotificationResponse___block_invoke;
    v24[3] = &unk_24D4847D8;
    v25 = v12;
    v15 = -[NSObject indexOfObjectPassingTest:](v14, "indexOfObjectPassingTest:", v24);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CALNNotificationServer _notificationRecordResponseFromNotificationResponse:].cold.2();
      v17 = 0;
    }
    else
    {
      v23 = v9;
      -[NSObject objectAtIndex:](v14, "objectAtIndex:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetConnectionEndpoint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNNotificationRecordResponse responseWithNotificationRecord:actionIdentifier:originIdentifier:targetConnectionEndpoint:](CALNNotificationRecordResponse, "responseWithNotificationRecord:actionIdentifier:originIdentifier:targetConnectionEndpoint:", v16, v18, v19, v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v4;
        v28 = 2112;
        v29 = v17;
        _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Transformed notification response to notification record response. Notification response: %@. Notification record response: %@.", buf, 0x16u);
      }

      v9 = v23;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNNotificationServer _notificationRecordResponseFromNotificationResponse:].cold.1((uint64_t)v11, v14);
    v17 = 0;
  }

  return v17;
}

uint64_t __78__CALNNotificationServer__notificationRecordResponseFromNotificationResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v3, "sourceClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sourceClientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CALNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)notificationSourceMap
{
  return self->_notificationSourceMap;
}

- (void)setNotificationSourceMap:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSourceMap, a3);
}

- (CALNNotificationStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (CALNAnalyticsHandler)analyticsHandler
{
  return self->_analyticsHandler;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isProtectedDataAvailable
{
  return self->_isProtectedDataAvailable;
}

- (void)setIsProtectedDataAvailable:(BOOL)a3
{
  self->_isProtectedDataAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsHandler, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_notificationSourceMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

- (void)_removeRecordWithSourceIdentifier:(NSObject *)a3 sourceClientIdentifier:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, a2, a3, "Could not remove record because could not get notification identifier for source identifier = %{public}@, source client identifier = %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Could not get record response from response. request identifier = %{public}@, response = %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_notificationRecordResponseFromNotificationResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Could not get notification identifier from request identifier = %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notificationRecordResponseFromNotificationResponse:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Could not find notification record with notification identifier = %{public}@, records = %@");
  OUTLINED_FUNCTION_1_0();
}

@end
